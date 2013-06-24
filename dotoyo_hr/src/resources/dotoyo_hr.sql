/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : dotoyo_hr

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-06-24 09:45:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_applyjobctr_applyjobinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_applyjobctr_applyjobinfo`;
CREATE TABLE `t_applyjobctr_applyjobinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `functionCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '职能编码',
  `expectedPosition` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '期望职位',
  `provinceCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `jobTypeCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '工作类型（全职、兼职）',
  `isAdvisor` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否顾问（Y:是、N:不是）',
  `submitDate` datetime NOT NULL COMMENT '发布日期',
  `lastEditDate` datetime NOT NULL COMMENT '最后修改日期',
  `expectedSalaryCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '期望月薪编码',
  `actStatus` char(1) COLLATE utf8_bin NOT NULL COMMENT '活动状态（A:有效、I:无效）',
  PRIMARY KEY (`id`),
  KEY `FK_t_applyjobctr_applyjobinfo` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='在线求职信息表';

-- ----------------------------
-- Records of t_applyjobctr_applyjobinfo
-- ----------------------------
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('253', '301', '002-1001', '测试屏蔽功能', '210000', '211300', '211324', '005-1001', 'Y', '2011-04-08 14:56:31', '2011-04-08 14:56:31', '013-1001', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('251', '301', '002-1001', '建筑师', '440000', '440300', '', '005-1002', 'Y', '2011-04-08 09:19:39', '2011-04-08 09:19:39', '013-1001', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('252', '316', '002-1005', '工程监理', '440000', '440300', '', '005-1002', 'Y', '2011-04-08 09:33:57', '2011-04-08 09:33:57', '013-1001', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('259', '323', '002-1001', '意向职位', '110000', '110100', '', '005-1001', 'Y', '2011-04-14 11:09:51', '2011-04-14 11:09:51', '013-1008', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('258', '301', '002-1005', '测试岩土工程师', '210000', '211300', '', '005-1002', 'Y', '2011-04-11 09:21:29', '2011-04-11 09:21:29', '013-1013', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('249', '308', '002-1020', '工作', '450000', '450100', '', '005-1002', 'N', '2011-04-07 10:38:21', '2011-04-07 10:38:21', '013-1008', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('250', '310', '002-1019', '土建工程师/装饰工程师2', '450000', '450100', '450126', '005-1002', 'N', '2011-04-07 10:40:33', '2011-04-07 10:40:33', '013-1012', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('263', '307', '002-1001', '111', '110000', '110100', '', '005-1001', 'Y', '2011-04-14 12:21:50', '2011-07-20 16:53:17', '013-1005', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('264', '329', '002-1001', '意向职位', '420000', '421300', '', '005-1001', 'Y', '2011-04-14 17:39:56', '2011-04-14 17:39:56', '013-1006', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('260', '324', '002-1004', 'sfsfsfsdfsdf', '210000', '211100', '', '005-1001', 'Y', '2011-04-14 11:25:46', '2011-04-14 11:25:46', '013-1003', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('261', '324', '002-1008', 'ssfs', '210000', '210700', '', '005-1001', 'Y', '2011-04-14 11:26:01', '2011-04-14 11:26:01', '013-1001', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('262', '327', '002-1003', '111', '110000', '110100', '', '005-1001', 'Y', '2011-04-14 12:01:31', '2011-04-14 12:01:31', '013-1003', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('265', '301', '002-1021', 'CFO', '120000', '120200', '', '005-1002', 'Y', '2011-04-18 09:43:17', '2011-04-18 09:43:17', '013-1001', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('266', '329', '002-1006', '人才中心个人意向职位', '110000', '110100', '', '005-1001', 'Y', '2011-04-18 11:05:48', '2011-04-18 11:05:48', '013-1008', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('267', '333', '002-1002', '个人意向职位', '440000', '440300', '', '005-1001', 'Y', '2011-04-18 11:30:30', '2011-04-18 11:30:30', '013-1007', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('268', '333', '002-1004', '个人意向职位2', '440000', '440300', '', '005-1002', 'N', '2011-04-18 11:31:44', '2011-04-18 11:31:44', '013-1007', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('269', '333', '002-1003', '个人意向职位3', '110000', '110100', '', '005-1002', 'N', '2011-04-18 11:32:33', '2011-04-18 11:32:33', '013-1008', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('270', '334', '002-1001', '意向职位', '110000', '110200', '', '005-1001', 'Y', '2011-04-20 19:07:50', '2011-04-20 19:07:50', '013-1005', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('271', '307', '002-1001', '20110720意向职位', '220000', '220600', '', '005-1001', 'Y', '2011-07-20 16:56:54', '2011-07-20 16:56:54', '013-1008', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('272', '343', '002-1001', '20110720意向职位', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:10:06', '2011-07-20 17:10:06', '013-1012', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('273', '343', '002-1005', '20110720意向职位2', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:18:24', '2011-07-20 17:18:24', '013-1013', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('274', '351', '002-1001', '20110720意向职位3', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:22:01', '2011-07-20 17:22:01', '013-1013', 'A');
INSERT INTO `t_applyjobctr_applyjobinfo` VALUES ('275', '352', '002-1006', '20110720意向职位申请名称', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:29:05', '2011-07-20 17:29:05', '013-1011', 'A');

-- ----------------------------
-- Table structure for `t_applyjobctr_recommendation`
-- ----------------------------
DROP TABLE IF EXISTS `t_applyjobctr_recommendation`;
CREATE TABLE `t_applyjobctr_recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `functionCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '职能编码',
  `expectedPosition` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '期望职位',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `jobTypeCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '工作类型（全职、兼职）编码',
  `isAdvisor` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否顾问（Y:是，N：不是）',
  `submitDate` datetime NOT NULL COMMENT '发布日期',
  `lastEditDate` datetime NOT NULL COMMENT '最后修改日期',
  `expectedSalaryCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '期望月薪编码',
  `recommendationType` char(1) COLLATE utf8_bin NOT NULL COMMENT '类型（线上申请、管理员手工录入）',
  `verifyStatus` char(1) COLLATE utf8_bin NOT NULL COMMENT '审核状态（0：待审核，1：正在审核，2：审核通过，3：审核失败）',
  `interviewStatus` char(1) COLLATE utf8_bin NOT NULL COMMENT '面试情况（0：未面试，1：面试通过，2：面试失败）',
  PRIMARY KEY (`id`),
  KEY `FK_t_applyjobctr_recommendation` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='线下推荐对象信息表';

-- ----------------------------
-- Records of t_applyjobctr_recommendation
-- ----------------------------
INSERT INTO `t_applyjobctr_recommendation` VALUES ('144', '303', '002-1001', '建筑师/建筑设计师设计师', '110000', '110100', '', '005-1001', 'Y', '2011-04-07 10:19:42', '2011-04-08 15:36:36', '013-1008', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('151', '323', '002-1001', '意向职位', '110000', '110100', '', '005-1001', 'Y', '2011-04-14 11:09:51', '2011-04-14 11:55:21', '013-1008', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('146', '308', '002-1020', '工作', '450000', '450100', '', '005-1002', 'N', '2011-04-07 10:38:21', '2011-04-08 15:36:19', '013-1008', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('147', '310', '002-1019', '土建工程师/装饰工程师2', '450000', '450100', '450126', '005-1002', 'N', '2011-04-07 10:40:33', '2011-04-08 15:36:36', '013-1012', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('148', '301', '002-1001', '建筑师', '440000', '440300', '', '005-1002', 'Y', '2011-04-08 09:19:39', '2011-04-08 10:19:32', '013-1001', '0', '2', '2');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('149', '316', '002-1005', '工程监理', '440000', '440300', '', '005-1002', 'Y', '2011-04-08 09:33:57', '2011-04-08 10:41:00', '013-1001', '0', '2', '2');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('150', '315', '002-1001', '测试线下推荐', '440000', '440300', '', '005-1001', 'Y', '2011-04-08 16:23:17', '2011-04-08 17:04:18', '013-1001', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('152', '324', '002-1004', 'sfsfsfsdfsdf', '210000', '211100', '', '005-1001', 'Y', '2011-04-14 11:25:46', '2011-04-23 13:49:47', '013-1003', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('153', '307', '002-1001', '111', '110000', '110100', '', '005-1001', 'Y', '2011-04-14 12:21:50', '2011-07-20 17:08:14', '013-1005', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('154', '329', '002-1001', '意向职位', '420000', '421300', '', '005-1001', 'Y', '2011-04-14 17:39:56', '2011-04-14 19:45:04', '013-1006', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('155', '333', '002-1002', '个人意向职位', '440000', '440300', '', '005-1001', 'Y', '2011-04-18 11:30:30', '2011-04-23 13:49:11', '013-1007', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('156', '334', '002-1001', '意向职位', '110000', '110200', '', '005-1001', 'Y', '2011-04-20 19:07:50', '2011-04-20 19:08:28', '013-1005', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('157', '343', '002-1001', '20110720意向职位', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:10:06', '2011-07-20 17:10:20', '013-1012', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('158', '351', '002-1001', '20110720意向职位3', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:22:01', '2011-07-20 17:26:00', '013-1013', '0', '2', '1');
INSERT INTO `t_applyjobctr_recommendation` VALUES ('159', '352', '002-1006', '20110720意向职位申请名称', '110000', '110100', '', '005-1001', 'Y', '2011-07-20 17:29:05', '2011-07-20 17:35:51', '013-1011', '0', '2', '1');

-- ----------------------------
-- Table structure for `t_certctr_certaccesshistory`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_certaccesshistory`;
CREATE TABLE `t_certctr_certaccesshistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personalCertId` int(11) NOT NULL COMMENT '个人证书ID',
  `companyId` int(11) NOT NULL COMMENT '企业ID',
  `accessDate` datetime NOT NULL COMMENT '访问日期',
  PRIMARY KEY (`id`),
  KEY `FK_t_certctr_certaccesshistory` (`personalCertId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_certctr_certaccesshistory
-- ----------------------------
INSERT INTO `t_certctr_certaccesshistory` VALUES ('19', '117', '314', '2011-04-12 09:24:35');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('20', '120', '309', '2011-04-14 10:49:48');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('21', '120', '322', '2011-04-14 10:54:53');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('22', '120', '322', '2011-04-14 10:55:00');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('23', '120', '322', '2011-04-14 10:55:02');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('24', '120', '322', '2011-04-14 10:55:04');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('25', '120', '322', '2011-04-14 10:55:05');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('26', '120', '322', '2011-04-14 10:55:07');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('27', '120', '322', '2011-04-14 10:55:08');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('28', '120', '322', '2011-04-14 10:55:10');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('29', '120', '322', '2011-04-14 10:55:11');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('30', '120', '322', '2011-04-14 10:55:13');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('31', '122', '314', '2011-04-18 11:24:24');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('32', '125', '302', '2011-04-21 10:22:40');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('33', '125', '302', '2011-04-21 10:24:02');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('34', '125', '331', '2011-05-03 20:23:07');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('35', '120', '331', '2011-05-03 20:25:00');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('36', '125', '336', '2011-05-04 16:15:11');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('37', '123', '336', '2011-05-04 16:15:24');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('38', '122', '336', '2011-05-04 16:15:49');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('39', '123', '336', '2011-05-04 16:16:04');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('40', '123', '336', '2011-05-04 16:23:18');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('41', '125', '331', '2011-07-20 17:48:56');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('42', '125', '354', '2011-07-20 17:54:02');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('43', '125', '354', '2011-07-20 17:54:54');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('44', '125', '354', '2011-07-20 17:54:58');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('45', '125', '354', '2011-07-20 17:55:04');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('46', '125', '354', '2011-07-20 17:55:09');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('47', '125', '354', '2011-07-20 17:55:38');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('48', '125', '354', '2011-07-20 17:55:42');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('49', '125', '354', '2011-07-20 17:55:45');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('50', '125', '354', '2011-07-20 17:55:49');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('51', '125', '354', '2011-07-20 17:55:53');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('52', '125', '354', '2011-07-20 17:55:57');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('53', '125', '354', '2011-07-20 17:56:01');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('54', '125', '354', '2011-07-20 17:56:05');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('55', '125', '354', '2011-07-20 17:56:08');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('56', '125', '354', '2011-07-20 17:56:50');
INSERT INTO `t_certctr_certaccesshistory` VALUES ('57', '125', '331', '2011-07-20 18:44:41');

-- ----------------------------
-- Table structure for `t_certctr_certneeds`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_certneeds`;
CREATE TABLE `t_certctr_certneeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certTypeCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书类型编码',
  `certCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书编码',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `registerStatusCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书注册状况（已注册、未注册）编码',
  `specialFieldCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专业编码',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `certNeedsAmount` int(11) NOT NULL COMMENT '证书需求数量',
  `effDate` datetime NOT NULL COMMENT '生效日期',
  `expDate` datetime NOT NULL COMMENT '过期日期',
  `descp` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '其他要求',
  `contact` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '联系人',
  `telephone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `cellPhone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '电子邮件',
  `fax` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '传真号码',
  `isIndeed` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否急需证书',
  `submitDate` datetime NOT NULL COMMENT '发布日期',
  `lastEditDate` datetime NOT NULL COMMENT '修改日期',
  `certNeedsStatus` char(1) COLLATE utf8_bin NOT NULL COMMENT '证书需求挂靠状态（0：未猎证、1：已猎证、2：暂停猎证）',
  `companySizeCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '单位规模编码',
  PRIMARY KEY (`id`),
  KEY `FK_t_certctr_certneeds` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='证书需求信息';

-- ----------------------------
-- Records of t_certctr_certneeds
-- ----------------------------
INSERT INTO `t_certctr_certneeds` VALUES ('159', '004-1001', '004-1001-1001', '309', '012-1001', '003-1001-1001', '430000', '430600', '', '5', '2011-04-07 00:00:00', '2011-04-29 00:00:00', '', '易生', '0755-33333333', '', '', '', 'Y', '2011-04-07 10:41:00', '2011-04-14 09:58:33', '2', '014-1002');
INSERT INTO `t_certctr_certneeds` VALUES ('160', '004-1002', '004-1002-1001', '314', '012-1001', '003-1001-1013', '440000', '440300', '', '10', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '让他华容回到酒店房间的条件的途径探讨今日推荐明天', '是否更好', '010-88888888', '', '', '', 'Y', '2011-04-08 12:08:54', '2011-04-08 15:14:13', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('161', '004-1001', '004-1001-1013', '314', '012-1002', '003-1001-1006', '440000', '440300', '', '20', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '的vfgegfwegwe 我二哥全文共分为虽然噶个', '是他给', '020-55555555', '', '', '', 'Y', '2011-04-08 12:10:33', '2011-04-14 10:43:56', '0', '014-1005');
INSERT INTO `t_certctr_certneeds` VALUES ('162', '004-1002', '004-1002-1010', '314', '012-1002', '003-1001-1016', '440000', '440300', '', '34', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '', 'qq', '0755-33396388', '', '', '', 'Y', '2011-04-08 15:04:12', '2011-04-08 15:04:12', '0', '014-1002');
INSERT INTO `t_certctr_certneeds` VALUES ('163', '004-1002', '004-1002-1007', '314', '012-1001', '003-1001-1006', '440000', '440300', '', '5', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '', 'carl', '0755-33396388', '', '', '', 'Y', '2011-04-08 15:10:52', '2011-04-08 15:10:52', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('164', '004-1001', '004-1001-1008', '314', '012-1002', '003-1001-1004', '120000', '120100', '', '10', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '体育人突然突然太阴人体育体育贱人突然体育u恶如突然退让体验日', '阿斯顿', '010-22222222', '', '', '', 'Y', '2011-04-12 09:37:14', '2011-04-14 10:43:56', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('165', '004-1001', '004-1001-1002', '309', '012-1002', '003-1001-1003', '210000', '210600', '', '3', '2011-04-14 00:00:00', '2011-04-15 00:00:00', '', '测试', '0755-36899563', '', '', '', 'Y', '2011-04-14 09:57:37', '2011-04-14 09:57:37', '0', '014-1001');
INSERT INTO `t_certctr_certneeds` VALUES ('166', '004-1001', '004-1001-1005', '309', '012-1001', '003-1001-1014', '110000', '110200', '', '30', '2011-04-14 00:00:00', '2011-04-15 00:00:00', '', '我是', '0732-58696341', '', '', '', 'Y', '2011-04-14 10:03:03', '2011-04-14 10:03:03', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('167', '004-1002', '004-1002-1002', '314', '012-1002', '003-1001-1005', '210000', '211000', '', '1000', '2011-07-21 00:00:00', '2011-07-28 00:00:00', '基本上堆放物品服务器配额符合巍峨沃尔夫帮我额日本巍峨日晚而趣味额日本趣味额日为而为人王二报温热iwqer', '你上心', '0755-33396388', '', '', '', 'Y', '2011-04-14 10:38:39', '2011-04-14 10:43:56', '0', '014-1006');
INSERT INTO `t_certctr_certneeds` VALUES ('168', '004-1001', '004-1001-1001', '330', '012-1002', '003-1001-1001', '440000', '440300', '', '10000', '2011-04-18 00:00:00', '2011-04-20 00:00:00', '我们有庞大的人才资源库，我们希望和更多的企业合作，也希望为更多的优秀人才服务，我们是企业和人才交流的平台，是有识之士和优秀企业的桥梁 有意者联系江苏常州信奇信息咨询有限公司↓ 贺工电话：159-6147-5225 QQ：627-099-623 Email：627099623@qq.com 公司电话：0519-89892360 公司地址：常州市天宁区盛世名门4栋甲402#（常州汽车站、火车站附近）', '庞某', '0755-5656655', '13632637083', '', '', 'Y', '2011-04-18 00:00:00', '2011-04-18 17:09:04', '0', '014-1004');
INSERT INTO `t_certctr_certneeds` VALUES ('169', '004-1001', '004-1001-1004', '330', '012-1002', '003-1001-1004', '350000', '350800', '', '10', '2011-04-19 00:00:00', '2011-04-22 00:00:00', '您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755－98898989或联系您你的客户服务专员。\r\n为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。', '庞某', '0755-5656565', '', '', '', 'Y', '2011-04-18 00:00:00', '2011-04-18 16:57:58', '0', '014-1001');
INSERT INTO `t_certctr_certneeds` VALUES ('170', '004-1001', '004-1001-1002', '330', '012-1002', '003-1001-1004', '230000', '230600', '', '10', '2011-04-18 00:00:00', '2011-04-19 00:00:00', '1', 'ccc', '0222-5555222', '', '', '', 'Y', '2011-04-18 12:13:05', '2011-04-18 12:13:05', '0', '014-1002');
INSERT INTO `t_certctr_certneeds` VALUES ('171', '004-1002', '004-1002-1005', '330', '012-1001', '003-1001-1006', '110000', '110100', '', '100', '2011-04-18 00:00:00', '2011-04-21 00:00:00', '', 'c', '0255-2200000', '', '', '', 'Y', '2011-04-18 12:22:38', '2011-04-18 12:22:38', '0', '014-1006');
INSERT INTO `t_certctr_certneeds` VALUES ('172', '004-1002', '004-1002-1006', '331', '012-1002', '003-1001-1006', '110000', '110100', '', '23', '2011-07-15 00:00:00', '2011-07-30 00:00:00', '1', 'pgh', '0210-3333222', '', '', '', 'Y', '2011-04-18 15:00:33', '2011-07-19 15:58:44', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('173', '004-1002', '004-1002-1001', '331', '012-1002', '003-1001-1003', '110000', '110100', '', '10', '2011-07-15 00:00:00', '2011-07-30 00:00:00', '111', 'cc', '0555-2999898', '', '', '', 'Y', '2011-04-18 15:06:39', '2011-07-19 15:58:44', '0', '014-1002');
INSERT INTO `t_certctr_certneeds` VALUES ('174', '004-1001', '004-1001-1002', '331', '012-1002', '003-1001-1004', '110000', '110100', '', '111', '2011-07-15 00:00:00', '2011-07-30 00:00:00', '1', 'cc', '0755-6661666', '', '', '', 'Y', '2011-04-18 15:08:48', '2011-07-15 18:20:08', '0', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('175', '004-1001', '004-1001-1003', '331', '012-1002', '003-1001-1021', '360000', '360900', '', '10', '2011-07-15 00:00:00', '2011-07-30 00:00:00', '11', 'cc', '0755-8510162', '', '', '', 'Y', '2011-04-18 15:11:08', '2011-07-15 17:37:40', '0', '014-1002');
INSERT INTO `t_certctr_certneeds` VALUES ('176', '004-1002', '004-1002-1001', '330', '012-1002', '003-1001-1004', '120000', '120100', '', '11', '2011-04-18 00:00:00', '2011-04-23 00:00:00', '1', 'c', '0755-98918981', '', '', '', 'Y', '2011-04-18 16:53:00', '2011-04-18 16:53:00', '0', '014-1004');
INSERT INTO `t_certctr_certneeds` VALUES ('177', '004-1001', '004-1001-1001', '302', '012-1002', '003-1001-1001', '110000', '110100', '', '10', '2011-05-04 00:00:00', '2011-05-04 00:00:00', '11', 'cc', '010-29299992', '', '', '', 'Y', '2011-04-22 00:00:00', '2011-05-04 15:41:11', '2', '014-1005');
INSERT INTO `t_certctr_certneeds` VALUES ('178', '004-1002', '004-1002-1004', '302', '012-1002', '003-1001-1004', '120000', '120100', '', '10', '2011-05-04 00:00:00', '2011-05-04 00:00:00', '', 'cc', '0755-8989891', '', '', '', 'Y', '2011-04-26 00:00:00', '2011-05-04 15:38:56', '0', '014-1005');
INSERT INTO `t_certctr_certneeds` VALUES ('179', '004-1002', '004-1002-1001', '302', '012-1001', '003-1001-1003', '110000', '110100', '', '10', '2011-05-04 00:00:00', '2011-05-04 00:00:00', '', 'cc', '0785-6151541', '', '', '', 'Y', '2011-04-26 00:00:00', '2011-05-04 15:38:37', '0', '014-1001');
INSERT INTO `t_certctr_certneeds` VALUES ('180', '004-1002', '004-1002-1007', '336', '012-1002', '003-1001-1011', '440000', '440300', '', '32', '2011-05-04 00:00:00', '2011-05-26 00:00:00', 'ansfi jnpjsdnfvjnegipne 今年送噢乖哦我恶搞哦哦给哦工哦呢个 恶搞今年哦鞥哦仍哦哦个噢乖哦而过额外如果浓色如果；哦网而过哦巍峨网而过巍峨哦国内巍峨哦给我哦哦个噢乖哦哦给法国功能么个噢二个更为恶搞巍峨各个巍峨公开万恶', '的发', '0755-33396388', '', '', '', 'Y', '2011-05-04 10:38:00', '2011-05-04 10:48:07', '0', '014-1005');
INSERT INTO `t_certctr_certneeds` VALUES ('181', '004-1001', '004-1001-1001', '336', '012-1001', '003-1001-1010', '440000', '440300', '', '20', '2011-05-04 00:00:00', '2011-05-23 00:00:00', '我ifbowifoibwfbwfoi 无法vjwefiwqifnwf而房价能否能克服恶搞空间分隔空间千万无法抗拒妇女请问恶法请问恶法；今年房价你请问恶法却无法抗拒你无法抗拒你请问恶法王府井你无法几年前忘记烦恼请问恶法科技网房间内请问恶法你请问恶法几年前物品俄方你期望呢父亲却无法接纳我父亲乳房fb请问份额科技网配额符号沃尔夫', '是师的', '010-88314545', '', '', '', 'Y', '2011-05-04 00:00:00', '2011-05-04 10:47:44', '2', '014-1003');
INSERT INTO `t_certctr_certneeds` VALUES ('182', '004-1001', '004-1001-1018', '336', '012-1001', '003-1001-1012', '420000', '420900', '', '200', '2011-05-04 00:00:00', '2011-05-31 00:00:00', '', '师的', '020-55553521', '', '', '', 'Y', '2011-05-04 10:47:09', '2011-05-04 10:47:09', '0', '014-1004');
INSERT INTO `t_certctr_certneeds` VALUES ('183', '004-1001', '004-1001-1011', '336', '012-1002', '003-1001-1019', '430000', '430600', '', '23', '2011-05-04 00:00:00', '2011-05-06 00:00:00', '如果尽可能巍峨譬如个人过呢说如果色如果今年泡网而；恋物癖二个ijegpwer色弱赶集网而色如果离开的变频器维尔刘科目微软恶搞平均比啊歌迷不是刚开始庞高华我哦吧', '是发给v', '0730-4530146', '', '', '', 'Y', '2011-05-04 10:50:27', '2011-05-04 10:50:27', '0', '014-1005');
INSERT INTO `t_certctr_certneeds` VALUES ('184', '004-1001', '004-1001-1001', '331', '012-1001', '003-1001-1001', '120000', '120100', '', '11', '2011-07-20 00:00:00', '2011-07-27 00:00:00', '', 'cc', '0755-3326565', '', '', '', 'Y', '2011-05-06 12:23:32', '2011-07-20 11:11:54', '0', '014-1005');

-- ----------------------------
-- Table structure for `t_certctr_certneedsaccesshistory`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_certneedsaccesshistory`;
CREATE TABLE `t_certctr_certneedsaccesshistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certNeedsId` int(11) NOT NULL COMMENT '证书需求ID',
  `accessUserId` int(11) NOT NULL COMMENT '访问用户ID',
  `accessDate` datetime NOT NULL COMMENT '访问日期',
  PRIMARY KEY (`id`),
  KEY `FK_t_certctr_certneedsaccesshistory` (`certNeedsId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='证书需求浏览记录';

-- ----------------------------
-- Records of t_certctr_certneedsaccesshistory
-- ----------------------------
INSERT INTO `t_certctr_certneedsaccesshistory` VALUES ('17', '162', '301', '2011-04-14 09:36:32');
INSERT INTO `t_certctr_certneedsaccesshistory` VALUES ('18', '165', '301', '2011-04-14 10:48:23');
INSERT INTO `t_certctr_certneedsaccesshistory` VALUES ('19', '177', '329', '2011-04-26 17:49:07');

-- ----------------------------
-- Table structure for `t_certctr_hotcert`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_hotcert`;
CREATE TABLE `t_certctr_hotcert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书编码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='热门证书';

-- ----------------------------
-- Records of t_certctr_hotcert
-- ----------------------------
INSERT INTO `t_certctr_hotcert` VALUES ('1', '004-1001-1001');
INSERT INTO `t_certctr_hotcert` VALUES ('2', '004-1001-1002');
INSERT INTO `t_certctr_hotcert` VALUES ('3', '004-1001-1003');
INSERT INTO `t_certctr_hotcert` VALUES ('4', '004-1001-1004');
INSERT INTO `t_certctr_hotcert` VALUES ('5', '004-1001-1005');
INSERT INTO `t_certctr_hotcert` VALUES ('6', '004-1001-1006');
INSERT INTO `t_certctr_hotcert` VALUES ('7', '004-1001-1007');
INSERT INTO `t_certctr_hotcert` VALUES ('8', '004-1001-1008');
INSERT INTO `t_certctr_hotcert` VALUES ('9', '004-1001-1009');
INSERT INTO `t_certctr_hotcert` VALUES ('10', '004-1002-1001');
INSERT INTO `t_certctr_hotcert` VALUES ('11', '004-1002-1002');
INSERT INTO `t_certctr_hotcert` VALUES ('12', '004-1002-1003');
INSERT INTO `t_certctr_hotcert` VALUES ('13', '004-1002-1004');
INSERT INTO `t_certctr_hotcert` VALUES ('14', '004-1002-1005');
INSERT INTO `t_certctr_hotcert` VALUES ('15', '004-1002-1006');
INSERT INTO `t_certctr_hotcert` VALUES ('16', '004-1002-1007');

-- ----------------------------
-- Table structure for `t_certctr_personalcert`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_personalcert`;
CREATE TABLE `t_certctr_personalcert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certTypeCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书类型编码',
  `certCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书编码',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `registerStatusCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '证书注册状况（已注册、未注册）编码',
  `specialFieldCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专业编码',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `descp` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '补充说明',
  `certStatus` char(1) COLLATE utf8_bin NOT NULL COMMENT '证书状况（0：未挂靠、1：已挂靠、2：暂停挂靠）',
  `submitDate` datetime NOT NULL COMMENT '发布日期',
  `lastEditDate` datetime NOT NULL COMMENT '最后修改日期',
  `contact` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '联系人',
  `telephone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `cellPhone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '电子邮件',
  `fax` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '传真号码',
  PRIMARY KEY (`id`),
  KEY `FK_t_certctr_personalcert` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='个人证书信息';

-- ----------------------------
-- Records of t_certctr_personalcert
-- ----------------------------
INSERT INTO `t_certctr_personalcert` VALUES ('102', '004-1001', '004-1001-1001', '301', '012-1001', '003-1001-1005', '430000', '430600', '', '我说江泽民和胡锦涛', '1', '2011-04-07 10:30:58', '2011-04-07 10:55:50', '易生', '0755-33333333333333', '13988888888', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('104', '004-1001', '004-1001-1003', '301', '012-1002', '003-1001-1004', '210000', '210500', '', '', '1', '2011-04-07 14:41:22', '2011-04-14 09:49:41', 'ewerwer', '010-22222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('105', '004-1002', '004-1002-1005', '301', '012-1001', '003-1001-1006', '220000', '220400', '', '', '0', '2011-04-07 14:41:48', '2011-04-07 14:41:48', 'sfss', '020-22331133', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('121', '004-1001', '004-1001-1004', '324', '012-1001', '003-1001-1003', '210000', '210500', '', '', '0', '2011-04-14 11:13:47', '2011-04-14 11:13:47', 'sfas', '0755-23567561', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('122', '004-1002', '004-1002-1010', '324', '012-1002', '003-1001-1005', '410000', '411000', '', '', '0', '2011-04-14 11:14:07', '2011-04-14 11:14:07', 'sfas', '0755-23567561', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('108', '004-1001', '004-1001-1018', '301', '012-1002', '003-1001-1005', '330000', '330800', '', '', '0', '2011-04-07 14:44:43', '2011-04-07 14:44:43', '大法师地方都是', '0730-2222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('109', '004-1001', '004-1001-1016', '301', '012-1002', '003-1001-1011', '330000', '330100', '', '', '0', '2011-04-07 14:45:23', '2011-04-07 14:45:23', '打发打发', '0755-33333333', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('110', '004-1002', '004-1002-1012', '301', '012-1002', '003-1001-1021', '500000', '500200', '', '', '0', '2011-04-07 14:45:58', '2011-04-07 14:45:58', '梵蒂冈地方官', '028-33353335', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('111', '004-1001', '004-1001-1028', '301', '012-1001', '003-1001-1004', '410000', '410400', '', '', '0', '2011-04-07 14:48:17', '2011-04-07 14:48:17', '收复失地', '0730-2222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('112', '004-1002', '004-1002-1007', '301', '012-1002', '003-1001-1005', '220000', '220800', '', '', '0', '2011-04-07 14:48:55', '2011-04-07 14:48:55', '收复失地', '0730-2222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('113', '004-1002', '004-1002-1007', '315', '012-1002', '003-1001-1005', '220000', '220800', '', '', '0', '2011-04-07 14:56:35', '2011-04-07 14:56:35', '收复失地', '0730-2222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('114', '004-1002', '004-1002-1001', '301', '012-1002', '003-1001-1006', '350000', '350600', '', '', '0', '2011-04-07 14:57:39', '2011-04-07 14:57:39', 'sasasd', '020-22222222', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('115', '004-1002', '004-1002-1003', '301', '012-1001', '003-1001-1006', '220000', '220600', '', '', '0', '2011-04-07 14:58:01', '2011-04-07 14:58:01', 'sdafsf', '010-33333333', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('116', '004-1002', '004-1002-1015', '301', '012-1001', '003-1001-1008', '520000', '520200', '', '', '0', '2011-04-07 14:58:47', '2011-04-07 14:58:47', 'sadfsadf', '010-23568942', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('117', '004-1002', '004-1002-1010', '301', '012-1002', '003-1001-1005', '210000', '210500', '', '', '0', '2011-04-08 18:47:58', '2011-04-08 18:47:58', 'sfsdf', '010-33333333', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('118', '004-1001', '004-1001-1008', '316', '012-1001', '003-1001-1004', '340000', '340700', '', '俄服务器俄方邓奇文', '1', '2011-04-12 09:44:06', '2011-04-12 10:09:23', '波波', '010-77775555', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('119', '004-1002', '004-1002-1001', '316', '012-1002', '003-1001-1013', '440000', '440300', '', '我需要重新挂靠我的证书，有需要的请联系我，我的手机13728881234', '1', '2011-04-12 10:06:41', '2011-04-12 10:09:23', '李高嵩', '0755-33396388', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('120', '004-1001', '004-1001-1008', '301', '012-1001', '003-1001-1006', '330000', '330600', '', '', '0', '2011-04-14 09:32:36', '2011-04-14 09:32:36', '斯蒂芬速度', '010-22213164', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('123', '004-1001', '004-1001-1001', '333', '012-1002', '003-1001-1010', '440000', '440300', '', '其他要求', '0', '2011-04-18 11:51:27', '2011-04-18 11:51:27', '庞某', '0755-2637081', '13632637083', '1@126.com', '0755-2637081');
INSERT INTO `t_certctr_personalcert` VALUES ('125', '004-1001', '004-1001-1002', '329', '012-1002', '003-1001-1004', '120000', '120100', '', '1', '0', '2011-04-18 17:45:36', '2011-04-18 17:45:36', 'c', '0755-3939911', '', '', '');
INSERT INTO `t_certctr_personalcert` VALUES ('126', '004-1002', '004-1002-1003', '303', '012-1001', '003-1001-1002', '230000', '230100', '', '21321', '0', '2011-07-20 18:48:08', '2011-07-20 18:48:08', 'aaa', '010-29898988', '', '', '');

-- ----------------------------
-- Table structure for `t_certctr_verifyinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_certctr_verifyinfo`;
CREATE TABLE `t_certctr_verifyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证书编码',
  `verifySite` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '验证网站',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='证书查询验证信息';

-- ----------------------------
-- Records of t_certctr_verifyinfo
-- ----------------------------
INSERT INTO `t_certctr_verifyinfo` VALUES ('1', '004-1001-1001', 'http://jzsgl.coc.gov.cn/archisearch/cszcindex.aspx');
INSERT INTO `t_certctr_verifyinfo` VALUES ('2', '004-1001-1002', 'http://jzsgl.coc.gov.cn/archisearch/second/cszcindex.aspx');
INSERT INTO `t_certctr_verifyinfo` VALUES ('3', '004-1001-1003', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('4', '004-1001-1004', 'http://www.chinasafety.ac.cn/RegSafeEngineer/EngineerSearch.aspx');
INSERT INTO `t_certctr_verifyinfo` VALUES ('5', '004-1001-1005', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('6', '004-1001-1006', 'http://jzsgl.coc.gov.cn/archisearch/First_index.html');
INSERT INTO `t_certctr_verifyinfo` VALUES ('7', '004-1001-1007', 'http://jzsgl.coc.gov.cn/archisearch/Second_index.html');
INSERT INTO `t_certctr_verifyinfo` VALUES ('8', '004-1001-1008', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('9', '004-1001-1009', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('10', '004-1001-1010', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('11', '004-1001-1011', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('12', '004-1001-1012', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('13', '004-1001-1013', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('14', '004-1001-1014', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('15', '004-1001-1015', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('16', '004-1001-1016', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('17', '004-1001-1017', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('18', '004-1001-1018', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('19', '004-1001-1019', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('20', '004-1001-1020', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('21', '004-1001-1021', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('22', '004-1001-1022', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('23', '004-1001-1023', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('24', '004-1001-1024', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('25', '004-1001-1025', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('26', '004-1001-1026', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('27', '004-1001-1027', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('28', '004-1001-1028', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('29', '004-1001-1029', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('30', '004-1002-1001', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('31', '004-1002-1002', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('32', '004-1002-1003', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('33', '004-1002-1004', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('34', '004-1002-1005', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('35', '004-1002-1006', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('36', '004-1002-1007', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('37', '004-1002-1008', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('38', '004-1002-1009', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('39', '004-1002-1010', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('40', '004-1002-1011', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('41', '004-1002-1012', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('42', '004-1002-1013', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('43', '004-1002-1014', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('44', '004-1002-1015', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('45', '004-1002-1016', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('46', '004-1002-1017', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('47', '004-1002-1018', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('48', '004-1002-1019', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('49', '004-1002-1020', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('50', '004-1002-1021', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('51', '004-1002-1022', null);
INSERT INTO `t_certctr_verifyinfo` VALUES ('52', '004-1002-1023', null);

-- ----------------------------
-- Table structure for `t_comm_ad`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_ad`;
CREATE TABLE `t_comm_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `adType` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型(图片:1;文字:2;Flash:3)',
  `ttitleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片--图片文件名url，文字--要显示的文字内容',
  `company` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '投放广告人名称',
  `position` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告放的位置',
  `URL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '点击的链接',
  `width` int(11) DEFAULT NULL COMMENT '长',
  `height` int(11) DEFAULT NULL COMMENT '宽',
  `startDate` datetime DEFAULT NULL COMMENT '显示开始时间',
  `endDate` datetime DEFAULT NULL COMMENT '显示结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理表';

-- ----------------------------
-- Records of t_comm_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comm_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_area`;
CREATE TABLE `t_comm_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '城市编码',
  `CODE` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区';

-- ----------------------------
-- Records of t_comm_area
-- ----------------------------
INSERT INTO `t_comm_area` VALUES ('150', '130200', '130207', '丰南区');
INSERT INTO `t_comm_area` VALUES ('151', '130200', '130208', '丰润区');
INSERT INTO `t_comm_area` VALUES ('152', '131100', '131102', '桃城区');
INSERT INTO `t_comm_area` VALUES ('153', '141100', '141101', '市辖区');
INSERT INTO `t_comm_area` VALUES ('154', '141100', '141102', '离石市');
INSERT INTO `t_comm_area` VALUES ('155', '141100', '141121', '文水县');
INSERT INTO `t_comm_area` VALUES ('156', '141100', '141122', '交城县');
INSERT INTO `t_comm_area` VALUES ('157', '141100', '141123', '兴县');
INSERT INTO `t_comm_area` VALUES ('158', '141100', '141124', '临县');
INSERT INTO `t_comm_area` VALUES ('159', '141100', '141125', '柳林县');
INSERT INTO `t_comm_area` VALUES ('160', '141100', '141126', '石楼县');
INSERT INTO `t_comm_area` VALUES ('161', '141100', '141127', '岚县');
INSERT INTO `t_comm_area` VALUES ('162', '141100', '141128', '方山县');
INSERT INTO `t_comm_area` VALUES ('163', '141100', '141129', '中阳县');
INSERT INTO `t_comm_area` VALUES ('164', '141100', '141130', '交口县');
INSERT INTO `t_comm_area` VALUES ('165', '141100', '141181', '孝义市');
INSERT INTO `t_comm_area` VALUES ('166', '141100', '141182', '汾阳市');
INSERT INTO `t_comm_area` VALUES ('167', '150400', '150429', '宁城县');
INSERT INTO `t_comm_area` VALUES ('168', '150800', '150802', '临河区');
INSERT INTO `t_comm_area` VALUES ('169', '150800', '150821', '五原县');
INSERT INTO `t_comm_area` VALUES ('170', '150800', '150822', '磴口县');
INSERT INTO `t_comm_area` VALUES ('171', '150800', '150823', '乌拉特前旗');
INSERT INTO `t_comm_area` VALUES ('172', '150800', '150824', '乌拉特中旗');
INSERT INTO `t_comm_area` VALUES ('173', '150800', '150825', '乌拉特后旗');
INSERT INTO `t_comm_area` VALUES ('174', '150800', '150826', '杭锦后旗');
INSERT INTO `t_comm_area` VALUES ('175', '150900', '150901', '市辖区');
INSERT INTO `t_comm_area` VALUES ('176', '150900', '150902', '集宁区');
INSERT INTO `t_comm_area` VALUES ('177', '150900', '150921', '卓资县');
INSERT INTO `t_comm_area` VALUES ('178', '150900', '150922', '化德县');
INSERT INTO `t_comm_area` VALUES ('179', '150900', '150923', '商都县');
INSERT INTO `t_comm_area` VALUES ('180', '150900', '150924', '兴和县');
INSERT INTO `t_comm_area` VALUES ('181', '150900', '150925', '凉城县');
INSERT INTO `t_comm_area` VALUES ('182', '150900', '150926', '察哈尔右翼前旗');
INSERT INTO `t_comm_area` VALUES ('183', '150900', '150927', '察哈尔右翼中旗');
INSERT INTO `t_comm_area` VALUES ('184', '150900', '150928', '察哈尔右翼后旗');
INSERT INTO `t_comm_area` VALUES ('185', '150900', '150929', '四子王旗');
INSERT INTO `t_comm_area` VALUES ('186', '150900', '150981', '丰镇市');
INSERT INTO `t_comm_area` VALUES ('187', '211300', '211324', '喀喇沁左翼蒙古族自治县');
INSERT INTO `t_comm_area` VALUES ('188', '220600', '220604', '江源区');
INSERT INTO `t_comm_area` VALUES ('189', '220600', '220623', '长白朝鲜族自治县');
INSERT INTO `t_comm_area` VALUES ('190', '220700', '220721', '前郭尔罗斯蒙古族自治县');
INSERT INTO `t_comm_area` VALUES ('191', '230100', '230109', '松北区');
INSERT INTO `t_comm_area` VALUES ('192', '230100', '230110', '香坊区');
INSERT INTO `t_comm_area` VALUES ('193', '230100', '230111', '呼兰区');
INSERT INTO `t_comm_area` VALUES ('194', '230100', '230112', '阿城区');
INSERT INTO `t_comm_area` VALUES ('195', '232700', '232701', '加格达奇区');
INSERT INTO `t_comm_area` VALUES ('196', '232700', '232702', '松岭区');
INSERT INTO `t_comm_area` VALUES ('197', '232700', '232703', '新林区');
INSERT INTO `t_comm_area` VALUES ('198', '232700', '232704', '呼中区');
INSERT INTO `t_comm_area` VALUES ('199', '320100', '320116', '六合县');
INSERT INTO `t_comm_area` VALUES ('200', '320400', '320412', '武进区');
INSERT INTO `t_comm_area` VALUES ('201', '320900', '320903', '盐都区');
INSERT INTO `t_comm_area` VALUES ('202', '321100', '321112', '丹徒区');
INSERT INTO `t_comm_area` VALUES ('203', '321300', '321311', '宿豫区');
INSERT INTO `t_comm_area` VALUES ('204', '330200', '330212', '鄞州区');
INSERT INTO `t_comm_area` VALUES ('205', '330500', '330502', '吴兴区');
INSERT INTO `t_comm_area` VALUES ('206', '330500', '330503', '南浔区');
INSERT INTO `t_comm_area` VALUES ('207', '340200', '340208', '三山区');
INSERT INTO `t_comm_area` VALUES ('208', '350200', '350213', '翔安区');
INSERT INTO `t_comm_area` VALUES ('209', '350300', '350304', '荔城区');
INSERT INTO `t_comm_area` VALUES ('210', '350300', '350305', '秀屿区');
INSERT INTO `t_comm_area` VALUES ('211', '370900', '370903', '岱岳区');
INSERT INTO `t_comm_area` VALUES ('212', '371100', '371103', '岚山区');
INSERT INTO `t_comm_area` VALUES ('213', '410300', '410307', '洛龙区');
INSERT INTO `t_comm_area` VALUES ('214', '410500', '410505', '殷都区');
INSERT INTO `t_comm_area` VALUES ('215', '410500', '410506', '龙安区');
INSERT INTO `t_comm_area` VALUES ('216', '411100', '411103', '郾城区');
INSERT INTO `t_comm_area` VALUES ('217', '411100', '411104', '召陵区');
INSERT INTO `t_comm_area` VALUES ('218', '420800', '420804', '掇刀区');
INSERT INTO `t_comm_area` VALUES ('219', '431200', '431229', '靖州苗族侗族自治县');
INSERT INTO `t_comm_area` VALUES ('220', '440100', '440115', '南沙区');
INSERT INTO `t_comm_area` VALUES ('221', '440100', '440116', '萝岗区');
INSERT INTO `t_comm_area` VALUES ('222', '440200', '440205', '曲江区');
INSERT INTO `t_comm_area` VALUES ('223', '440500', '440511', '金平区');
INSERT INTO `t_comm_area` VALUES ('224', '440500', '440512', '濠江区');
INSERT INTO `t_comm_area` VALUES ('225', '440500', '440513', '潮阳区');
INSERT INTO `t_comm_area` VALUES ('226', '440500', '440514', '潮南区');
INSERT INTO `t_comm_area` VALUES ('227', '440500', '440515', '澄海区');
INSERT INTO `t_comm_area` VALUES ('228', '440600', '440604', '禅城区');
INSERT INTO `t_comm_area` VALUES ('229', '440600', '440605', '南海区');
INSERT INTO `t_comm_area` VALUES ('230', '440600', '440606', '顺德区');
INSERT INTO `t_comm_area` VALUES ('231', '440600', '440607', '三水区');
INSERT INTO `t_comm_area` VALUES ('232', '440600', '440608', '高明区');
INSERT INTO `t_comm_area` VALUES ('233', '440700', '440705', '新会区');
INSERT INTO `t_comm_area` VALUES ('234', '441300', '441303', '惠阳区');
INSERT INTO `t_comm_area` VALUES ('235', '441800', '441825', '连山壮族瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('236', '450100', '450107', '西乡塘区');
INSERT INTO `t_comm_area` VALUES ('237', '450100', '450108', '良庆区');
INSERT INTO `t_comm_area` VALUES ('238', '450100', '450109', '邕宁区');
INSERT INTO `t_comm_area` VALUES ('239', '450100', '450123', '隆安县');
INSERT INTO `t_comm_area` VALUES ('240', '450100', '450124', '马山县');
INSERT INTO `t_comm_area` VALUES ('241', '450100', '450125', '上林县');
INSERT INTO `t_comm_area` VALUES ('242', '450100', '450126', '宾阳县');
INSERT INTO `t_comm_area` VALUES ('243', '450100', '450127', '横　县');
INSERT INTO `t_comm_area` VALUES ('244', '450200', '450223', '鹿寨县');
INSERT INTO `t_comm_area` VALUES ('245', '450200', '450224', '融安县');
INSERT INTO `t_comm_area` VALUES ('246', '450200', '450225', '融水苗族自治县');
INSERT INTO `t_comm_area` VALUES ('247', '450200', '450226', '三江侗族自治县');
INSERT INTO `t_comm_area` VALUES ('248', '450400', '450405', '长洲区');
INSERT INTO `t_comm_area` VALUES ('249', '450800', '450804', '覃塘区');
INSERT INTO `t_comm_area` VALUES ('250', '451000', '451001', '市辖区');
INSERT INTO `t_comm_area` VALUES ('251', '451000', '451002', '右江区');
INSERT INTO `t_comm_area` VALUES ('252', '451000', '451021', '田阳县');
INSERT INTO `t_comm_area` VALUES ('253', '451000', '451022', '田东县');
INSERT INTO `t_comm_area` VALUES ('254', '451000', '451023', '平果县');
INSERT INTO `t_comm_area` VALUES ('255', '451000', '451024', '德保县');
INSERT INTO `t_comm_area` VALUES ('256', '451000', '451025', '靖西县');
INSERT INTO `t_comm_area` VALUES ('257', '451000', '451026', '那坡县');
INSERT INTO `t_comm_area` VALUES ('258', '451000', '451027', '凌云县');
INSERT INTO `t_comm_area` VALUES ('259', '451000', '451028', '乐业县');
INSERT INTO `t_comm_area` VALUES ('260', '451000', '451029', '田林县');
INSERT INTO `t_comm_area` VALUES ('261', '451000', '451030', '西林县');
INSERT INTO `t_comm_area` VALUES ('262', '451000', '451031', '隆林各族自治县');
INSERT INTO `t_comm_area` VALUES ('263', '451100', '451101', '市辖区');
INSERT INTO `t_comm_area` VALUES ('264', '451100', '451102', '八步区');
INSERT INTO `t_comm_area` VALUES ('265', '451100', '451121', '昭平县');
INSERT INTO `t_comm_area` VALUES ('266', '451100', '451122', '钟山县');
INSERT INTO `t_comm_area` VALUES ('267', '451100', '451123', '富川瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('268', '451200', '451201', '市辖区');
INSERT INTO `t_comm_area` VALUES ('269', '451200', '451202', '金城江区');
INSERT INTO `t_comm_area` VALUES ('270', '451200', '451221', '南丹县');
INSERT INTO `t_comm_area` VALUES ('271', '451200', '451222', '天峨县');
INSERT INTO `t_comm_area` VALUES ('272', '451200', '451223', '凤山县');
INSERT INTO `t_comm_area` VALUES ('273', '451200', '451224', '东兰县');
INSERT INTO `t_comm_area` VALUES ('274', '451200', '451225', '罗城仫佬族自治县');
INSERT INTO `t_comm_area` VALUES ('275', '451200', '451226', '环江毛南族自治县');
INSERT INTO `t_comm_area` VALUES ('276', '451200', '451227', '巴马瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('277', '451200', '451228', '都安瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('278', '451200', '451229', '大化瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('279', '451200', '451281', '宜州市');
INSERT INTO `t_comm_area` VALUES ('280', '451300', '451301', '市辖区');
INSERT INTO `t_comm_area` VALUES ('281', '451300', '451302', '兴宾区');
INSERT INTO `t_comm_area` VALUES ('282', '451300', '451321', '忻城县');
INSERT INTO `t_comm_area` VALUES ('283', '451300', '451322', '象州县');
INSERT INTO `t_comm_area` VALUES ('284', '451300', '451323', '武宣县');
INSERT INTO `t_comm_area` VALUES ('285', '451300', '451324', '金秀瑶族自治县');
INSERT INTO `t_comm_area` VALUES ('286', '451300', '451381', '合山市');
INSERT INTO `t_comm_area` VALUES ('287', '451400', '451401', '市辖区');
INSERT INTO `t_comm_area` VALUES ('288', '451400', '451402', '江洲区');
INSERT INTO `t_comm_area` VALUES ('289', '451400', '451421', '扶绥县');
INSERT INTO `t_comm_area` VALUES ('290', '451400', '451422', '宁明县');
INSERT INTO `t_comm_area` VALUES ('291', '451400', '451423', '龙州县');
INSERT INTO `t_comm_area` VALUES ('292', '451400', '451424', '大新县');
INSERT INTO `t_comm_area` VALUES ('293', '451400', '451425', '天等县');
INSERT INTO `t_comm_area` VALUES ('294', '451400', '451481', '凭祥市');
INSERT INTO `t_comm_area` VALUES ('295', '460100', '460105', '秀英区');
INSERT INTO `t_comm_area` VALUES ('296', '460100', '460106', '龙华区');
INSERT INTO `t_comm_area` VALUES ('297', '460100', '460107', '琼山区');
INSERT INTO `t_comm_area` VALUES ('298', '460100', '460108', '美兰区');

-- ----------------------------
-- Table structure for `t_comm_backgroup_music`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_backgroup_music`;
CREATE TABLE `t_comm_backgroup_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` int(11) DEFAULT NULL COMMENT '发表文章的Id',
  `URL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网上音乐的URL',
  `STATUS` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='背景音乐';

-- ----------------------------
-- Records of t_comm_backgroup_music
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comm_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_city`;
CREATE TABLE `t_comm_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Province_Code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '省份的编码',
  `CODE` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '城市编码',
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=735 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='城市';

-- ----------------------------
-- Records of t_comm_city
-- ----------------------------
INSERT INTO `t_comm_city` VALUES ('368', '130000', '130200', '唐山市');
INSERT INTO `t_comm_city` VALUES ('369', '140000', '141100', '吕梁市');
INSERT INTO `t_comm_city` VALUES ('370', '150000', '150400', '赤峰市');
INSERT INTO `t_comm_city` VALUES ('371', '150000', '150800', '巴彦淖尔市');
INSERT INTO `t_comm_city` VALUES ('372', '150000', '150900', '乌兰察布市');
INSERT INTO `t_comm_city` VALUES ('373', '210000', '211300', '朝阳市');
INSERT INTO `t_comm_city` VALUES ('374', '220000', '220600', '白山市');
INSERT INTO `t_comm_city` VALUES ('375', '220000', '220700', '松原市');
INSERT INTO `t_comm_city` VALUES ('376', '230000', '230100', '哈尔滨市');
INSERT INTO `t_comm_city` VALUES ('377', '230000', '232700', '大兴安岭地区');
INSERT INTO `t_comm_city` VALUES ('378', '320000', '320100', '南京市');
INSERT INTO `t_comm_city` VALUES ('379', '320000', '320400', '常州市');
INSERT INTO `t_comm_city` VALUES ('380', '320000', '320900', '盐城市');
INSERT INTO `t_comm_city` VALUES ('381', '320000', '321100', '镇江市');
INSERT INTO `t_comm_city` VALUES ('382', '320000', '321300', '宿迁市');
INSERT INTO `t_comm_city` VALUES ('383', '330000', '330200', '宁波市');
INSERT INTO `t_comm_city` VALUES ('384', '330000', '330500', '湖州市');
INSERT INTO `t_comm_city` VALUES ('385', '340000', '340200', '芜湖市');
INSERT INTO `t_comm_city` VALUES ('386', '350000', '350200', '厦门市');
INSERT INTO `t_comm_city` VALUES ('387', '350000', '350300', '莆田市');
INSERT INTO `t_comm_city` VALUES ('388', '370000', '370900', '泰安市');
INSERT INTO `t_comm_city` VALUES ('389', '370000', '371100', '日照市');
INSERT INTO `t_comm_city` VALUES ('390', '410000', '410300', '洛阳市');
INSERT INTO `t_comm_city` VALUES ('391', '410000', '410500', '安阳市');
INSERT INTO `t_comm_city` VALUES ('392', '410000', '411100', '漯河市');
INSERT INTO `t_comm_city` VALUES ('393', '420000', '420800', '荆门市');
INSERT INTO `t_comm_city` VALUES ('394', '430000', '431200', '怀化市');
INSERT INTO `t_comm_city` VALUES ('395', '440000', '440100', '广州市');
INSERT INTO `t_comm_city` VALUES ('396', '440000', '440200', '韶关市');
INSERT INTO `t_comm_city` VALUES ('397', '440000', '440500', '汕头市');
INSERT INTO `t_comm_city` VALUES ('398', '440000', '440600', '佛山市');
INSERT INTO `t_comm_city` VALUES ('399', '440000', '440700', '江门市');
INSERT INTO `t_comm_city` VALUES ('400', '440000', '441300', '惠州市');
INSERT INTO `t_comm_city` VALUES ('401', '440000', '441800', '清远市');
INSERT INTO `t_comm_city` VALUES ('402', '450000', '450100', '南宁市');
INSERT INTO `t_comm_city` VALUES ('403', '450000', '450200', '柳州市');
INSERT INTO `t_comm_city` VALUES ('404', '450000', '450400', '梧州市');
INSERT INTO `t_comm_city` VALUES ('405', '450000', '450800', '贵港市');
INSERT INTO `t_comm_city` VALUES ('406', '450000', '451000', '百色市');
INSERT INTO `t_comm_city` VALUES ('407', '450000', '451100', '贺州市');
INSERT INTO `t_comm_city` VALUES ('408', '450000', '451200', '河池市');
INSERT INTO `t_comm_city` VALUES ('409', '450000', '451300', '来宾市');
INSERT INTO `t_comm_city` VALUES ('410', '450000', '451400', '崇左市');
INSERT INTO `t_comm_city` VALUES ('411', '460000', '460100', '海口市');
INSERT INTO `t_comm_city` VALUES ('412', '460000', '469030', '白沙黎族自治县');
INSERT INTO `t_comm_city` VALUES ('413', '460000', '469033', '乐东黎族自治县');
INSERT INTO `t_comm_city` VALUES ('414', '460000', '469034', '陵水黎族自治县');
INSERT INTO `t_comm_city` VALUES ('415', '460000', '469035', '保亭黎族苗族自治县');
INSERT INTO `t_comm_city` VALUES ('416', '460000', '469036', '琼中黎族苗族自治县');
INSERT INTO `t_comm_city` VALUES ('417', '460000', '469037', '西沙群岛');
INSERT INTO `t_comm_city` VALUES ('418', '460000', '469038', '南沙群岛');
INSERT INTO `t_comm_city` VALUES ('419', '460000', '469039', '中沙群岛的岛礁及其海域');
INSERT INTO `t_comm_city` VALUES ('420', '500000', '500100', '重庆市市辖区');
INSERT INTO `t_comm_city` VALUES ('421', '500000', '500200', '重庆市县');
INSERT INTO `t_comm_city` VALUES ('422', '510000', '510100', '成都市');
INSERT INTO `t_comm_city` VALUES ('423', '510000', '510900', '遂宁市');
INSERT INTO `t_comm_city` VALUES ('424', '520000', '520300', '遵义市');
INSERT INTO `t_comm_city` VALUES ('425', '520000', '520400', '安顺市');
INSERT INTO `t_comm_city` VALUES ('426', '520000', '522200', '铜仁地区');
INSERT INTO `t_comm_city` VALUES ('427', '520000', '522400', '毕节地区');
INSERT INTO `t_comm_city` VALUES ('428', '530000', '530100', '昆明市');
INSERT INTO `t_comm_city` VALUES ('429', '530000', '530400', '玉溪市');
INSERT INTO `t_comm_city` VALUES ('430', '530000', '530700', '丽江市');
INSERT INTO `t_comm_city` VALUES ('431', '530000', '530800', '思茅市');
INSERT INTO `t_comm_city` VALUES ('432', '530000', '530900', '临沧市');
INSERT INTO `t_comm_city` VALUES ('433', '610000', '610200', '铜川市');
INSERT INTO `t_comm_city` VALUES ('434', '610000', '610300', '宝鸡市');
INSERT INTO `t_comm_city` VALUES ('435', '620000', '620700', '张掖市');
INSERT INTO `t_comm_city` VALUES ('436', '620000', '620800', '平凉市');
INSERT INTO `t_comm_city` VALUES ('437', '620000', '620900', '酒泉市');
INSERT INTO `t_comm_city` VALUES ('438', '620000', '621000', '庆阳市');
INSERT INTO `t_comm_city` VALUES ('439', '620000', '622900', '临夏回族自治州');
INSERT INTO `t_comm_city` VALUES ('440', '640000', '640100', '银川市');
INSERT INTO `t_comm_city` VALUES ('441', '640000', '640200', '石嘴山市');
INSERT INTO `t_comm_city` VALUES ('442', '640000', '640500', '中卫市');
INSERT INTO `t_comm_city` VALUES ('443', '110000', '110100', '北京市市辖区');
INSERT INTO `t_comm_city` VALUES ('444', '110000', '110200', '北京市县');
INSERT INTO `t_comm_city` VALUES ('445', '120000', '120100', '天津市市辖区');
INSERT INTO `t_comm_city` VALUES ('446', '120000', '120200', '天津市县');
INSERT INTO `t_comm_city` VALUES ('447', '130000', '130100', '石家庄市');
INSERT INTO `t_comm_city` VALUES ('448', '130000', '130300', '秦皇岛市');
INSERT INTO `t_comm_city` VALUES ('449', '130000', '130400', '邯郸市');
INSERT INTO `t_comm_city` VALUES ('450', '130000', '130500', '邢台市');
INSERT INTO `t_comm_city` VALUES ('451', '130000', '130600', '保定市');
INSERT INTO `t_comm_city` VALUES ('452', '130000', '130700', '张家口市');
INSERT INTO `t_comm_city` VALUES ('453', '130000', '130800', '承德市');
INSERT INTO `t_comm_city` VALUES ('454', '130000', '130900', '沧州市');
INSERT INTO `t_comm_city` VALUES ('455', '130000', '131000', '廊坊市');
INSERT INTO `t_comm_city` VALUES ('456', '130000', '131100', '衡水市');
INSERT INTO `t_comm_city` VALUES ('457', '140000', '140100', '太原市');
INSERT INTO `t_comm_city` VALUES ('458', '140000', '140200', '大同市');
INSERT INTO `t_comm_city` VALUES ('459', '140000', '140300', '阳泉市');
INSERT INTO `t_comm_city` VALUES ('460', '140000', '140400', '长治市');
INSERT INTO `t_comm_city` VALUES ('461', '140000', '140500', '晋城市');
INSERT INTO `t_comm_city` VALUES ('462', '140000', '140600', '朔州市');
INSERT INTO `t_comm_city` VALUES ('463', '140000', '140700', '晋中市');
INSERT INTO `t_comm_city` VALUES ('464', '140000', '140800', '运城市');
INSERT INTO `t_comm_city` VALUES ('465', '140000', '140900', '忻州市');
INSERT INTO `t_comm_city` VALUES ('466', '140000', '141000', '临汾市');
INSERT INTO `t_comm_city` VALUES ('467', '150000', '150100', '呼和浩特市');
INSERT INTO `t_comm_city` VALUES ('468', '150000', '150200', '包头市');
INSERT INTO `t_comm_city` VALUES ('469', '150000', '150300', '乌海市');
INSERT INTO `t_comm_city` VALUES ('470', '150000', '150500', '通辽市');
INSERT INTO `t_comm_city` VALUES ('471', '150000', '150600', '鄂尔多斯市');
INSERT INTO `t_comm_city` VALUES ('472', '150000', '150700', '呼伦贝尔市');
INSERT INTO `t_comm_city` VALUES ('473', '150000', '152200', '兴安盟');
INSERT INTO `t_comm_city` VALUES ('474', '150000', '152500', '锡林郭勒盟');
INSERT INTO `t_comm_city` VALUES ('475', '150000', '152900', '阿拉善盟');
INSERT INTO `t_comm_city` VALUES ('476', '210000', '210100', '沈阳市');
INSERT INTO `t_comm_city` VALUES ('477', '210000', '210200', '大连市');
INSERT INTO `t_comm_city` VALUES ('478', '210000', '210300', '鞍山市');
INSERT INTO `t_comm_city` VALUES ('479', '210000', '210400', '抚顺市');
INSERT INTO `t_comm_city` VALUES ('480', '210000', '210500', '本溪市');
INSERT INTO `t_comm_city` VALUES ('481', '210000', '210600', '丹东市');
INSERT INTO `t_comm_city` VALUES ('482', '210000', '210700', '锦州市');
INSERT INTO `t_comm_city` VALUES ('483', '210000', '210800', '营口市');
INSERT INTO `t_comm_city` VALUES ('484', '210000', '210900', '阜新市');
INSERT INTO `t_comm_city` VALUES ('485', '210000', '211000', '辽阳市');
INSERT INTO `t_comm_city` VALUES ('486', '210000', '211100', '盘锦市');
INSERT INTO `t_comm_city` VALUES ('487', '210000', '211200', '铁岭市');
INSERT INTO `t_comm_city` VALUES ('488', '210000', '211400', '葫芦岛市');
INSERT INTO `t_comm_city` VALUES ('489', '220000', '220100', '长春市');
INSERT INTO `t_comm_city` VALUES ('490', '220000', '220200', '吉林市');
INSERT INTO `t_comm_city` VALUES ('491', '220000', '220300', '四平市');
INSERT INTO `t_comm_city` VALUES ('492', '220000', '220400', '辽源市');
INSERT INTO `t_comm_city` VALUES ('493', '220000', '220500', '通化市');
INSERT INTO `t_comm_city` VALUES ('494', '220000', '220800', '白城市');
INSERT INTO `t_comm_city` VALUES ('495', '220000', '222400', '延边朝鲜族自治州');
INSERT INTO `t_comm_city` VALUES ('496', '230000', '230200', '齐齐哈尔市');
INSERT INTO `t_comm_city` VALUES ('497', '230000', '230300', '鸡西市');
INSERT INTO `t_comm_city` VALUES ('498', '230000', '230400', '鹤岗市');
INSERT INTO `t_comm_city` VALUES ('499', '230000', '230500', '双鸭山市');
INSERT INTO `t_comm_city` VALUES ('500', '230000', '230600', '大庆市');
INSERT INTO `t_comm_city` VALUES ('501', '230000', '230700', '伊春市');
INSERT INTO `t_comm_city` VALUES ('502', '230000', '230800', '佳木斯市');
INSERT INTO `t_comm_city` VALUES ('503', '230000', '230900', '七台河市');
INSERT INTO `t_comm_city` VALUES ('504', '230000', '231000', '牡丹江市');
INSERT INTO `t_comm_city` VALUES ('505', '230000', '231100', '黑河市');
INSERT INTO `t_comm_city` VALUES ('506', '230000', '231200', '绥化市');
INSERT INTO `t_comm_city` VALUES ('507', '310000', '310100', '上海市市辖区');
INSERT INTO `t_comm_city` VALUES ('508', '310000', '310200', '上海市县');
INSERT INTO `t_comm_city` VALUES ('509', '320000', '320200', '无锡市');
INSERT INTO `t_comm_city` VALUES ('510', '320000', '320300', '徐州市');
INSERT INTO `t_comm_city` VALUES ('511', '320000', '320500', '苏州市');
INSERT INTO `t_comm_city` VALUES ('512', '320000', '320600', '南通市');
INSERT INTO `t_comm_city` VALUES ('513', '320000', '320700', '连云港市');
INSERT INTO `t_comm_city` VALUES ('514', '320000', '320800', '淮安市');
INSERT INTO `t_comm_city` VALUES ('515', '320000', '321000', '扬州市');
INSERT INTO `t_comm_city` VALUES ('516', '320000', '321200', '泰州市');
INSERT INTO `t_comm_city` VALUES ('517', '330000', '330100', '杭州市');
INSERT INTO `t_comm_city` VALUES ('518', '330000', '330300', '温州市');
INSERT INTO `t_comm_city` VALUES ('519', '330000', '330400', '嘉兴市');
INSERT INTO `t_comm_city` VALUES ('520', '330000', '330600', '绍兴市');
INSERT INTO `t_comm_city` VALUES ('521', '330000', '330700', '金华市');
INSERT INTO `t_comm_city` VALUES ('522', '330000', '330800', '衢州市');
INSERT INTO `t_comm_city` VALUES ('523', '330000', '330900', '舟山市');
INSERT INTO `t_comm_city` VALUES ('524', '330000', '331000', '台州市');
INSERT INTO `t_comm_city` VALUES ('525', '330000', '331100', '丽水市');
INSERT INTO `t_comm_city` VALUES ('526', '340000', '340100', '合肥市');
INSERT INTO `t_comm_city` VALUES ('527', '340000', '340300', '蚌埠市');
INSERT INTO `t_comm_city` VALUES ('528', '340000', '340400', '淮南市');
INSERT INTO `t_comm_city` VALUES ('529', '340000', '340500', '马鞍山市');
INSERT INTO `t_comm_city` VALUES ('530', '340000', '340600', '淮北市');
INSERT INTO `t_comm_city` VALUES ('531', '340000', '340700', '铜陵市');
INSERT INTO `t_comm_city` VALUES ('532', '340000', '340800', '安庆市');
INSERT INTO `t_comm_city` VALUES ('533', '340000', '341000', '黄山市');
INSERT INTO `t_comm_city` VALUES ('534', '340000', '341100', '滁州市');
INSERT INTO `t_comm_city` VALUES ('535', '340000', '341200', '阜阳市');
INSERT INTO `t_comm_city` VALUES ('536', '340000', '341300', '宿州市');
INSERT INTO `t_comm_city` VALUES ('537', '340000', '341400', '巢湖市');
INSERT INTO `t_comm_city` VALUES ('538', '340000', '341500', '六安市');
INSERT INTO `t_comm_city` VALUES ('539', '340000', '341600', '亳州市');
INSERT INTO `t_comm_city` VALUES ('540', '340000', '341700', '池州市');
INSERT INTO `t_comm_city` VALUES ('541', '340000', '341800', '宣城市');
INSERT INTO `t_comm_city` VALUES ('542', '350000', '350100', '福州市');
INSERT INTO `t_comm_city` VALUES ('543', '350000', '350400', '三明市');
INSERT INTO `t_comm_city` VALUES ('544', '350000', '350500', '泉州市');
INSERT INTO `t_comm_city` VALUES ('545', '350000', '350600', '漳州市');
INSERT INTO `t_comm_city` VALUES ('546', '350000', '350700', '南平市');
INSERT INTO `t_comm_city` VALUES ('547', '350000', '350800', '龙岩市');
INSERT INTO `t_comm_city` VALUES ('548', '350000', '350900', '宁德市');
INSERT INTO `t_comm_city` VALUES ('549', '360000', '360100', '南昌市');
INSERT INTO `t_comm_city` VALUES ('550', '360000', '360200', '景德镇市');
INSERT INTO `t_comm_city` VALUES ('551', '360000', '360300', '萍乡市');
INSERT INTO `t_comm_city` VALUES ('552', '360000', '360400', '九江市');
INSERT INTO `t_comm_city` VALUES ('553', '360000', '360500', '新余市');
INSERT INTO `t_comm_city` VALUES ('554', '360000', '360600', '鹰潭市');
INSERT INTO `t_comm_city` VALUES ('555', '360000', '360700', '赣州市');
INSERT INTO `t_comm_city` VALUES ('556', '360000', '360800', '吉安市');
INSERT INTO `t_comm_city` VALUES ('557', '360000', '360900', '宜春市');
INSERT INTO `t_comm_city` VALUES ('558', '360000', '361000', '抚州市');
INSERT INTO `t_comm_city` VALUES ('559', '360000', '361100', '上饶市');
INSERT INTO `t_comm_city` VALUES ('560', '370000', '370100', '济南市');
INSERT INTO `t_comm_city` VALUES ('561', '370000', '370200', '青岛市');
INSERT INTO `t_comm_city` VALUES ('562', '370000', '370300', '淄博市');
INSERT INTO `t_comm_city` VALUES ('563', '370000', '370400', '枣庄市');
INSERT INTO `t_comm_city` VALUES ('564', '370000', '370500', '东营市');
INSERT INTO `t_comm_city` VALUES ('565', '370000', '370600', '烟台市');
INSERT INTO `t_comm_city` VALUES ('566', '370000', '370700', '潍坊市');
INSERT INTO `t_comm_city` VALUES ('567', '370000', '370800', '济宁市');
INSERT INTO `t_comm_city` VALUES ('568', '370000', '371000', '威海市');
INSERT INTO `t_comm_city` VALUES ('569', '370000', '371200', '莱芜市');
INSERT INTO `t_comm_city` VALUES ('570', '370000', '371300', '临沂市');
INSERT INTO `t_comm_city` VALUES ('571', '370000', '371400', '德州市');
INSERT INTO `t_comm_city` VALUES ('572', '370000', '371500', '聊城市');
INSERT INTO `t_comm_city` VALUES ('573', '370000', '371600', '滨州市');
INSERT INTO `t_comm_city` VALUES ('574', '370000', '371700', '荷泽市');
INSERT INTO `t_comm_city` VALUES ('575', '410000', '410100', '郑州市');
INSERT INTO `t_comm_city` VALUES ('576', '410000', '410200', '开封市');
INSERT INTO `t_comm_city` VALUES ('577', '410000', '410400', '顶山市');
INSERT INTO `t_comm_city` VALUES ('578', '410000', '410600', '鹤壁市');
INSERT INTO `t_comm_city` VALUES ('579', '410000', '410700', '新乡市');
INSERT INTO `t_comm_city` VALUES ('580', '410000', '410800', '焦作市');
INSERT INTO `t_comm_city` VALUES ('581', '410000', '410900', '濮阳市');
INSERT INTO `t_comm_city` VALUES ('582', '410000', '411000', '许昌市');
INSERT INTO `t_comm_city` VALUES ('583', '410000', '411200', '三门峡市');
INSERT INTO `t_comm_city` VALUES ('584', '410000', '411300', '南阳市');
INSERT INTO `t_comm_city` VALUES ('585', '410000', '411400', '商丘市');
INSERT INTO `t_comm_city` VALUES ('586', '410000', '411500', '信阳市');
INSERT INTO `t_comm_city` VALUES ('587', '410000', '411600', '周口市');
INSERT INTO `t_comm_city` VALUES ('588', '410000', '411700', '驻马店市');
INSERT INTO `t_comm_city` VALUES ('589', '420000', '420100', '武汉市');
INSERT INTO `t_comm_city` VALUES ('590', '420000', '420200', '黄石市');
INSERT INTO `t_comm_city` VALUES ('591', '420000', '420300', '十堰市');
INSERT INTO `t_comm_city` VALUES ('592', '420000', '420500', '宜昌市');
INSERT INTO `t_comm_city` VALUES ('593', '420000', '420600', '襄樊市');
INSERT INTO `t_comm_city` VALUES ('594', '420000', '420700', '鄂州市');
INSERT INTO `t_comm_city` VALUES ('595', '420000', '420900', '孝感市');
INSERT INTO `t_comm_city` VALUES ('596', '420000', '421000', '荆州市');
INSERT INTO `t_comm_city` VALUES ('597', '420000', '421100', '黄冈市');
INSERT INTO `t_comm_city` VALUES ('598', '420000', '421200', '咸宁市');
INSERT INTO `t_comm_city` VALUES ('599', '420000', '421300', '随州市');
INSERT INTO `t_comm_city` VALUES ('600', '420000', '422800', '恩施土家族苗族自治州');
INSERT INTO `t_comm_city` VALUES ('601', '420000', '429004', '仙桃市');
INSERT INTO `t_comm_city` VALUES ('602', '420000', '429005', '潜江市');
INSERT INTO `t_comm_city` VALUES ('603', '420000', '429006', '天门市');
INSERT INTO `t_comm_city` VALUES ('604', '420000', '429021', '神农架林区');
INSERT INTO `t_comm_city` VALUES ('605', '430000', '430100', '长沙市');
INSERT INTO `t_comm_city` VALUES ('606', '430000', '430200', '株洲市');
INSERT INTO `t_comm_city` VALUES ('607', '430000', '430300', '湘潭市');
INSERT INTO `t_comm_city` VALUES ('608', '430000', '430400', '衡阳市');
INSERT INTO `t_comm_city` VALUES ('609', '430000', '430500', '邵阳市');
INSERT INTO `t_comm_city` VALUES ('610', '430000', '430600', '岳阳市');
INSERT INTO `t_comm_city` VALUES ('611', '430000', '430700', '常德市');
INSERT INTO `t_comm_city` VALUES ('612', '430000', '430800', '张家界市');
INSERT INTO `t_comm_city` VALUES ('613', '430000', '430900', '益阳市');
INSERT INTO `t_comm_city` VALUES ('614', '430000', '431000', '郴州市');
INSERT INTO `t_comm_city` VALUES ('615', '430000', '431100', '永州市');
INSERT INTO `t_comm_city` VALUES ('616', '430000', '431300', '娄底市');
INSERT INTO `t_comm_city` VALUES ('617', '430000', '433100', '湘西土家族苗族自治州');
INSERT INTO `t_comm_city` VALUES ('618', '440000', '440300', '深圳市');
INSERT INTO `t_comm_city` VALUES ('619', '440000', '440400', '珠海市');
INSERT INTO `t_comm_city` VALUES ('620', '440000', '440800', '湛江市');
INSERT INTO `t_comm_city` VALUES ('621', '440000', '440900', '茂名市');
INSERT INTO `t_comm_city` VALUES ('622', '440000', '441200', '肇庆市');
INSERT INTO `t_comm_city` VALUES ('623', '440000', '441400', '梅州市');
INSERT INTO `t_comm_city` VALUES ('624', '440000', '441500', '汕尾市');
INSERT INTO `t_comm_city` VALUES ('625', '440000', '441600', '河源市');
INSERT INTO `t_comm_city` VALUES ('626', '440000', '441700', '阳江市');
INSERT INTO `t_comm_city` VALUES ('627', '440000', '441900', '东莞市');
INSERT INTO `t_comm_city` VALUES ('628', '440000', '442000', '中山市');
INSERT INTO `t_comm_city` VALUES ('629', '440000', '445100', '潮州市');
INSERT INTO `t_comm_city` VALUES ('630', '440000', '445200', '揭阳市');
INSERT INTO `t_comm_city` VALUES ('631', '440000', '445300', '云浮市');
INSERT INTO `t_comm_city` VALUES ('632', '450000', '450300', '桂林市');
INSERT INTO `t_comm_city` VALUES ('633', '450000', '450500', '北海市');
INSERT INTO `t_comm_city` VALUES ('634', '450000', '450600', '防城港市');
INSERT INTO `t_comm_city` VALUES ('635', '450000', '450700', '钦州市');
INSERT INTO `t_comm_city` VALUES ('636', '450000', '450900', '玉林市');
INSERT INTO `t_comm_city` VALUES ('637', '460000', '460200', '三亚市');
INSERT INTO `t_comm_city` VALUES ('638', '460000', '469001', '五指山市');
INSERT INTO `t_comm_city` VALUES ('639', '460000', '469002', '琼海市');
INSERT INTO `t_comm_city` VALUES ('640', '460000', '469003', '儋州市');
INSERT INTO `t_comm_city` VALUES ('641', '460000', '469005', '文昌市');
INSERT INTO `t_comm_city` VALUES ('642', '460000', '469006', '万宁市');
INSERT INTO `t_comm_city` VALUES ('643', '460000', '469007', '东方市');
INSERT INTO `t_comm_city` VALUES ('644', '460000', '469025', '定安县');
INSERT INTO `t_comm_city` VALUES ('645', '460000', '469026', '屯昌县');
INSERT INTO `t_comm_city` VALUES ('646', '460000', '469027', '澄迈县');
INSERT INTO `t_comm_city` VALUES ('647', '460000', '469028', '临高县');
INSERT INTO `t_comm_city` VALUES ('648', '460000', '469031', '昌江黎族自治县');
INSERT INTO `t_comm_city` VALUES ('649', '510000', '510300', '自贡市');
INSERT INTO `t_comm_city` VALUES ('650', '510000', '510400', '攀枝花市');
INSERT INTO `t_comm_city` VALUES ('651', '510000', '510500', '泸州市');
INSERT INTO `t_comm_city` VALUES ('652', '510000', '510600', '德阳市');
INSERT INTO `t_comm_city` VALUES ('653', '510000', '510700', '绵阳市');
INSERT INTO `t_comm_city` VALUES ('654', '510000', '510800', '广元市');
INSERT INTO `t_comm_city` VALUES ('655', '510000', '511000', '内江市');
INSERT INTO `t_comm_city` VALUES ('656', '510000', '511100', '乐山市');
INSERT INTO `t_comm_city` VALUES ('657', '510000', '511300', '南充市');
INSERT INTO `t_comm_city` VALUES ('658', '510000', '511400', '眉山市');
INSERT INTO `t_comm_city` VALUES ('659', '510000', '511500', '宜宾市');
INSERT INTO `t_comm_city` VALUES ('660', '510000', '511600', '广安市');
INSERT INTO `t_comm_city` VALUES ('661', '510000', '511700', '达州市');
INSERT INTO `t_comm_city` VALUES ('662', '510000', '511800', '雅安市');
INSERT INTO `t_comm_city` VALUES ('663', '510000', '511900', '巴中市');
INSERT INTO `t_comm_city` VALUES ('664', '510000', '512000', '资阳市');
INSERT INTO `t_comm_city` VALUES ('665', '510000', '513200', '阿坝藏族羌族自治州');
INSERT INTO `t_comm_city` VALUES ('666', '510000', '513300', '甘孜藏族自治州');
INSERT INTO `t_comm_city` VALUES ('667', '510000', '513400', '凉山彝族自治州');
INSERT INTO `t_comm_city` VALUES ('668', '520000', '520100', '贵阳市');
INSERT INTO `t_comm_city` VALUES ('669', '520000', '520200', '六盘水市');
INSERT INTO `t_comm_city` VALUES ('670', '520000', '522300', '黔西南布依族苗族自治州');
INSERT INTO `t_comm_city` VALUES ('671', '520000', '522600', '黔东南苗族侗族自治州');
INSERT INTO `t_comm_city` VALUES ('672', '520000', '522700', '黔南布依族苗族自治州');
INSERT INTO `t_comm_city` VALUES ('673', '530000', '530300', '曲靖市');
INSERT INTO `t_comm_city` VALUES ('674', '530000', '530500', '保山市');
INSERT INTO `t_comm_city` VALUES ('675', '530000', '530600', '昭通市');
INSERT INTO `t_comm_city` VALUES ('676', '530000', '532300', '楚雄彝族自治州');
INSERT INTO `t_comm_city` VALUES ('677', '530000', '532500', '宁城县');
INSERT INTO `t_comm_city` VALUES ('678', '530000', '532600', '文山壮族苗族自治州');
INSERT INTO `t_comm_city` VALUES ('679', '530000', '532800', '西双版纳傣族自治州');
INSERT INTO `t_comm_city` VALUES ('680', '530000', '532900', '大理白族自治州');
INSERT INTO `t_comm_city` VALUES ('681', '530000', '533100', '德宏傣族景颇族自治州');
INSERT INTO `t_comm_city` VALUES ('682', '530000', '533300', '怒江傈僳族自治州');
INSERT INTO `t_comm_city` VALUES ('683', '530000', '533400', '迪庆藏族自治州');
INSERT INTO `t_comm_city` VALUES ('684', '540000', '540100', '拉萨市');
INSERT INTO `t_comm_city` VALUES ('685', '540000', '542100', '昌都地区');
INSERT INTO `t_comm_city` VALUES ('686', '540000', '542200', '山南地区');
INSERT INTO `t_comm_city` VALUES ('687', '540000', '542300', '日喀则地区');
INSERT INTO `t_comm_city` VALUES ('688', '540000', '542400', '那曲地区');
INSERT INTO `t_comm_city` VALUES ('689', '540000', '542500', '阿里地区');
INSERT INTO `t_comm_city` VALUES ('690', '540000', '542600', '林芝地区');
INSERT INTO `t_comm_city` VALUES ('691', '610000', '610100', '西安市');
INSERT INTO `t_comm_city` VALUES ('692', '610000', '610400', '咸阳市');
INSERT INTO `t_comm_city` VALUES ('693', '610000', '610500', '渭南市');
INSERT INTO `t_comm_city` VALUES ('694', '610000', '610600', '延安市');
INSERT INTO `t_comm_city` VALUES ('695', '610000', '610700', '汉中市');
INSERT INTO `t_comm_city` VALUES ('696', '610000', '610800', '榆林市');
INSERT INTO `t_comm_city` VALUES ('697', '610000', '610900', '安康市');
INSERT INTO `t_comm_city` VALUES ('698', '610000', '611000', '商洛市');
INSERT INTO `t_comm_city` VALUES ('699', '620000', '620100', '兰州市');
INSERT INTO `t_comm_city` VALUES ('700', '620000', '620200', '嘉峪关市');
INSERT INTO `t_comm_city` VALUES ('701', '620000', '620300', '金昌市');
INSERT INTO `t_comm_city` VALUES ('702', '620000', '620400', '白银市');
INSERT INTO `t_comm_city` VALUES ('703', '620000', '620500', '天水市');
INSERT INTO `t_comm_city` VALUES ('704', '620000', '620600', '武威市');
INSERT INTO `t_comm_city` VALUES ('705', '620000', '623000', '甘南藏族自治州');
INSERT INTO `t_comm_city` VALUES ('706', '630000', '630100', '西宁市');
INSERT INTO `t_comm_city` VALUES ('707', '630000', '632100', '海东地区');
INSERT INTO `t_comm_city` VALUES ('708', '630000', '632200', '海北藏族自治州');
INSERT INTO `t_comm_city` VALUES ('709', '630000', '632300', '黄南藏族自治州');
INSERT INTO `t_comm_city` VALUES ('710', '630000', '632500', '海南藏族自治州');
INSERT INTO `t_comm_city` VALUES ('711', '630000', '632600', '果洛藏族自治州');
INSERT INTO `t_comm_city` VALUES ('712', '630000', '632700', '玉树藏族自治州');
INSERT INTO `t_comm_city` VALUES ('713', '630000', '632800', '海西蒙古族藏族自治州');
INSERT INTO `t_comm_city` VALUES ('714', '640000', '640300', '吴忠市');
INSERT INTO `t_comm_city` VALUES ('715', '640000', '640400', '固原市');
INSERT INTO `t_comm_city` VALUES ('716', '650000', '650100', '乌鲁木齐市');
INSERT INTO `t_comm_city` VALUES ('717', '650000', '650200', '克拉玛依市');
INSERT INTO `t_comm_city` VALUES ('718', '650000', '652100', '吐鲁番地区');
INSERT INTO `t_comm_city` VALUES ('719', '650000', '652200', '哈密地区');
INSERT INTO `t_comm_city` VALUES ('720', '650000', '652300', '昌吉回族自治州');
INSERT INTO `t_comm_city` VALUES ('721', '650000', '652700', '博尔塔拉蒙古自治州');
INSERT INTO `t_comm_city` VALUES ('722', '650000', '652800', '巴音郭楞蒙古自治州');
INSERT INTO `t_comm_city` VALUES ('723', '650000', '652900', '阿克苏地区');
INSERT INTO `t_comm_city` VALUES ('724', '650000', '653000', '克孜勒苏柯尔克孜自治州');
INSERT INTO `t_comm_city` VALUES ('725', '650000', '653100', '喀什地区');
INSERT INTO `t_comm_city` VALUES ('726', '650000', '653200', '和田地区');
INSERT INTO `t_comm_city` VALUES ('727', '650000', '654000', '伊犁哈萨克自治州');
INSERT INTO `t_comm_city` VALUES ('728', '650000', '654200', '塔城地区');
INSERT INTO `t_comm_city` VALUES ('729', '650000', '654300', '阿勒泰地区');
INSERT INTO `t_comm_city` VALUES ('730', '650000', '659001', '石河子市');
INSERT INTO `t_comm_city` VALUES ('731', '650000', '659002', '阿拉尔市');
INSERT INTO `t_comm_city` VALUES ('732', '650000', '659003', '图木舒克市');
INSERT INTO `t_comm_city` VALUES ('733', '650000', '659004', '五家渠市');
INSERT INTO `t_comm_city` VALUES ('734', '660000', '659005', '香港');

-- ----------------------------
-- Table structure for `t_comm_city_sites`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_city_sites`;
CREATE TABLE `t_comm_city_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编码',
  `cityName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市名称',
  `orderNumber` int(11) DEFAULT NULL COMMENT '排序编号',
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='城市站点';

-- ----------------------------
-- Records of t_comm_city_sites
-- ----------------------------
INSERT INTO `t_comm_city_sites` VALUES ('1', '110100', '北京', '1', 'city11.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('2', '310100', '上海', '2', 'city12.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('3', '440100', '广州', '3', 'city13.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('4', '440300', '深圳', '4', 'city14.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('5', '330100', '杭州', '5', 'city15.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('6', '120100', '天津', '6', 'city16.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('7', '420100', '武汉', '7', 'city17.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('8', '500100', '重庆', '8', 'city18.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('9', '320100', '南京', '9', 'city19.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('10', '320500', '苏州', '10', 'city20.jpg');
INSERT INTO `t_comm_city_sites` VALUES ('11', '330200', '宁波', '11', null);
INSERT INTO `t_comm_city_sites` VALUES ('12', '450100', '南宁', '12', null);
INSERT INTO `t_comm_city_sites` VALUES ('13', '460100', '海口', '13', null);
INSERT INTO `t_comm_city_sites` VALUES ('14', '510100', '成都', '14', null);
INSERT INTO `t_comm_city_sites` VALUES ('15', '440800', '湛江', '15', null);
INSERT INTO `t_comm_city_sites` VALUES ('16', '440900', '茂名', '16', null);
INSERT INTO `t_comm_city_sites` VALUES ('17', '441200', '肇庆', '17', null);
INSERT INTO `t_comm_city_sites` VALUES ('18', '441400', '梅州', '18', null);
INSERT INTO `t_comm_city_sites` VALUES ('19', '441500', '汕尾', '19', null);
INSERT INTO `t_comm_city_sites` VALUES ('20', '441600', '河源', '20', null);
INSERT INTO `t_comm_city_sites` VALUES ('21', '441700', '阳江', '21', null);
INSERT INTO `t_comm_city_sites` VALUES ('22', '441900', '东莞', '22', null);
INSERT INTO `t_comm_city_sites` VALUES ('23', '442000', '中山', '23', null);
INSERT INTO `t_comm_city_sites` VALUES ('24', '445100', '潮州', '24', null);
INSERT INTO `t_comm_city_sites` VALUES ('25', '445200', '揭阳', '25', null);
INSERT INTO `t_comm_city_sites` VALUES ('26', '445300', '云浮', '26', null);
INSERT INTO `t_comm_city_sites` VALUES ('27', '450300', '桂林', '27', null);
INSERT INTO `t_comm_city_sites` VALUES ('28', '450500', '北海', '28', null);

-- ----------------------------
-- Table structure for `t_comm_class_master`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_class_master`;
CREATE TABLE `t_comm_class_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '类别编码.001:行业;002:职能;003:专业;004:证书分类、名称',
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '类别名称',
  `parentCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'parent code',
  PRIMARY KEY (`id`,`CODE`)
) ENGINE=MyISAM AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='类别主表';

-- ----------------------------
-- Records of t_comm_class_master
-- ----------------------------
INSERT INTO `t_comm_class_master` VALUES ('554', '003-1001', '房屋建筑类', '003');
INSERT INTO `t_comm_class_master` VALUES ('555', '003-1002', '市政公用类', '003');
INSERT INTO `t_comm_class_master` VALUES ('556', '003-1003', '公路类', '003');
INSERT INTO `t_comm_class_master` VALUES ('557', '003-1004', '铁路类', '003');
INSERT INTO `t_comm_class_master` VALUES ('558', '003-1005', '港口与航道类', '003');
INSERT INTO `t_comm_class_master` VALUES ('559', '003-1006', '水利水电类', '003');
INSERT INTO `t_comm_class_master` VALUES ('560', '003-1007', '电力类', '003');
INSERT INTO `t_comm_class_master` VALUES ('561', '003-1008', '矿山类', '003');
INSERT INTO `t_comm_class_master` VALUES ('562', '003-1009', '冶炼类', '003');
INSERT INTO `t_comm_class_master` VALUES ('563', '003-1010', '化工石油类', '003');
INSERT INTO `t_comm_class_master` VALUES ('564', '003-1011', '通信类', '003');
INSERT INTO `t_comm_class_master` VALUES ('565', '003-1012', '机电安装类', '003');
INSERT INTO `t_comm_class_master` VALUES ('566', '003-1013', '农林类', '003');
INSERT INTO `t_comm_class_master` VALUES ('567', '003-1014', '航天航空类', '003');
INSERT INTO `t_comm_class_master` VALUES ('568', '003-1015', '环保类', '003');
INSERT INTO `t_comm_class_master` VALUES ('569', '003-1016', '综合类', '003');
INSERT INTO `t_comm_class_master` VALUES ('570', '003-1001-1001', '房屋建筑工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('571', '003-1001-1002', '地基与基础工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('572', '003-1001-1003', '土石方工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('573', '003-1001-1004', '装饰装修工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('574', '003-1001-1005', '建筑幕墙工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('575', '003-1001-1006', '金属门窗工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('576', '003-1001-1007', '钢结构网架工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('577', '003-1001-1008', '附着开降脚手架工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('578', '003-1001-1009', '起重设备安装工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('579', '003-1001-1010', '给排水工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('580', '003-1001-1011', '通风与空调工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('581', '003-1001-1012', '电梯安装工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('582', '003-1001-1013', '消防设施工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('583', '003-1001-1014', '建筑电气工程（强电）', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('584', '003-1001-1015', '建筑智能化工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('585', '003-1001-1016', '建筑防水工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('586', '003-1001-1017', '防腐保温工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('587', '003-1001-1018', '爆破与拆除工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('588', '003-1001-1019', '园林绿化工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('589', '003-1001-1020', '高耸构筑物工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('590', '003-1001-1021', '古建筑工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('591', '003-1001-1022', '其它工程', '003-1001');
INSERT INTO `t_comm_class_master` VALUES ('592', '003-1002-1001', '城市道路桥梁', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('593', '003-1002-1002', '城市轨道交通工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('594', '003-1002-1003', '城市及道路照明工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('595', '003-1002-1004', '体育场地设施工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('596', '003-1002-1005', '管道工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('597', '003-1002-1006', '供水工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('598', '003-1002-1007', '排水工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('599', '003-1002-1008', '污水处理工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('600', '003-1002-1009', '燃气热力工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('601', '003-1002-1010', '垃圾处理工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('602', '003-1002-1011', '风景园林', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('603', '003-1002-1012', '发射台', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('604', '003-1002-1013', '市政公用其它工程', '003-1002');
INSERT INTO `t_comm_class_master` VALUES ('605', '003-1003-1001', '公路工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('606', '003-1003-1002', '公路路基工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('607', '003-1003-1003', '公路路面工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('608', '003-1003-1004', '公路桥梁工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('609', '003-1003-1005', '公路隧道工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('610', '003-1003-1006', '公路交通工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('611', '003-1003-1007', '公路通信、信号、电力电气化工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('612', '003-1003-1008', '服务区工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('613', '003-1003-1009', '公路工程附属设施', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('614', '003-1003-1010', '公路其它工程', '003-1003');
INSERT INTO `t_comm_class_master` VALUES ('615', '003-1004-1001', '铁路工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('616', '003-1004-1002', '铁路电务工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('617', '003-1004-1003', '铁路辅轨架梁工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('618', '003-1004-1004', '铁路电气化工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('619', '003-1004-1005', '铁路桥梁工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('620', '003-1004-1006', '铁路隧道工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('621', '003-1004-1007', '铁路其它工程、信号、电力电气化工程', '003-1004');
INSERT INTO `t_comm_class_master` VALUES ('622', '003-1005-1001', '港口与海岸工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('623', '003-1005-1002', '港口装卸设备安装工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('624', '003-1005-1003', '航道工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('625', '003-1005-1004', '通航建筑工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('626', '003-1005-1005', '通航设备安装工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('627', '003-1005-1006', '水上交通管制工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('628', '003-1005-1007', '港口与航道其它工程', '003-1005');
INSERT INTO `t_comm_class_master` VALUES ('629', '003-1006-1001', '水利水电工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('630', '003-1006-1002', '水工建筑物基础处理工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('631', '003-1006-1003', '水工金属结构制作与安装工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('632', '003-1006-1004', '水利水电机电设备安装工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('633', '003-1006-1005', '河湖整治工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('634', '003-1006-1006', '堤防工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('635', '003-1006-1007', '水工大坝工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('636', '003-1006-1008', '水工隧洞工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('637', '003-1006-1009', '水利水电其它工程', '003-1006');
INSERT INTO `t_comm_class_master` VALUES ('638', '003-1007-1001', '火电设备安装', '003-1007');
INSERT INTO `t_comm_class_master` VALUES ('639', '003-1007-1002', '送变电工程', '003-1007');
INSERT INTO `t_comm_class_master` VALUES ('640', '003-1007-1003', '核工程', '003-1007');
INSERT INTO `t_comm_class_master` VALUES ('641', '003-1007-1004', '电力其它工程', '003-1007');
INSERT INTO `t_comm_class_master` VALUES ('642', '003-1008-1001', '炉窑工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('643', '003-1008-1002', '煤矿工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('644', '003-1008-1003', '冶金矿山工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('645', '003-1008-1004', '化工矿山工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('646', '003-1008-1006', '铀矿工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('647', '003-1008-1007', '建材类非金属矿工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('648', '003-1008-1008', '矿山其它工程', '003-1008');
INSERT INTO `t_comm_class_master` VALUES ('649', '003-1009-1001', '冶炼机电设备安装工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('650', '003-1009-1002', '钢铁冶炼、连铸工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('651', '003-1009-1003', '轧钢工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('652', '003-1009-1004', '冶炼辅助工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('653', '003-1009-1005', '有色冶炼工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('654', '003-1009-1006', '建材工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('655', '003-1009-1007', '冶炼其它工程', '003-1009');
INSERT INTO `t_comm_class_master` VALUES ('656', '003-1010-1001', '化工石油设备管道安装工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('657', '003-1010-1002', '海洋石油工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('658', '003-1010-1003', '油田工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('659', '003-1010-1004', '油气储运工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('660', '003-1010-1005', '炼油化工工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('661', '003-1010-1006', '基本原材料工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('662', '003-1010-1007', '化肥工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('663', '003-1010-1008', '酸碱工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('664', '003-1010-1009', '轮胎工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('665', '003-1010-1010', '核化工及加工工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('666', '003-1010-1011', '医药及其它化工石油工程', '003-1010');
INSERT INTO `t_comm_class_master` VALUES ('667', '003-1011-1001', '电信工程', '003-1011');
INSERT INTO `t_comm_class_master` VALUES ('668', '003-1011-1002', '有线、无线传输通信工程，卫星、综合布线', '003-1011');
INSERT INTO `t_comm_class_master` VALUES ('669', '003-1011-1003', '邮政、电信、广播枢纽及交换工程', '003-1011');
INSERT INTO `t_comm_class_master` VALUES ('670', '003-1011-1004', '通信其它工程', '003-1011');
INSERT INTO `t_comm_class_master` VALUES ('671', '003-1012-1001', '机电安装工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('672', '003-1012-1002', '电子工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('673', '003-1012-1003', '机械工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('674', '003-1012-1004', '电子工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('675', '003-1012-1005', '轻纺工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('676', '003-1012-1006', '兵器工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('677', '003-1012-1007', '船舶工程', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('678', '003-1012-1008', '机电安装其它工程   ', '003-1012');
INSERT INTO `t_comm_class_master` VALUES ('679', '003-1013-1001', '林业局（场）总体工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('680', '003-1013-1002', '林产工业工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('681', '003-1013-1003', '农业综合开发工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('682', '003-1013-1004', '种植业工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('683', '003-1013-1005', '兽医/畜牧工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('684', '003-1013-1006', '渔业工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('685', '003-1013-1007', '设施农业工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('686', '003-1013-1008', '核设施退役及放射性三废处理处置工程其它工', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('687', '003-1013-1009', '农林其它工程', '003-1013');
INSERT INTO `t_comm_class_master` VALUES ('688', '003-1014-1001', '机场场道工程', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('689', '003-1014-1002', '机场空管工程及航站楼弱电系统工程', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('690', '003-1014-1003', '机场目视助航工程', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('691', '003-1014-1004', '民用机场工程', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('692', '003-1014-1005', '航空飞行器', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('693', '003-1014-1006', '航天空间飞行器', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('694', '003-1014-1007', '航天航空其它工程', '003-1014');
INSERT INTO `t_comm_class_master` VALUES ('695', '003-1015-1001', '环境损害控制工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('696', '003-1015-1002', '环境监测工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('697', '003-1015-1003', '环境污染治理工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('698', '003-1015-1004', '污水处理工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('699', '003-1015-1005', '固体废物、粪便、泔水处理工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('700', '003-1015-1006', '防沙治沙工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('701', '003-1015-1007', '环保其它工程', '003-1015');
INSERT INTO `t_comm_class_master` VALUES ('702', '003-1016-1001', '预拌商品混凝土工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('703', '003-1016-1002', '混凝土预制构件', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('704', '003-1016-1003', '桥梁工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('705', '003-1016-1004', '预应力工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('706', '003-1016-1005', '环保工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('707', '003-1016-1006', '特种专业工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('708', '003-1016-1007', '无损检测工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('709', '003-1016-1008', '其它综合工程', '003-1016');
INSERT INTO `t_comm_class_master` VALUES ('710', '002-1001', '建筑师/建筑设计师', '002');
INSERT INTO `t_comm_class_master` VALUES ('711', '002-1002', '规划设计师', '002');
INSERT INTO `t_comm_class_master` VALUES ('712', '002-1003', '园林景观设计师', '002');
INSERT INTO `t_comm_class_master` VALUES ('713', '002-1004', '结构工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('714', '002-1005', '岩土工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('715', '002-1006', '设备工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('716', '002-1007', '室内外装潢设计师', '002');
INSERT INTO `t_comm_class_master` VALUES ('717', '002-1008', '绘图员/建模人员', '002');
INSERT INTO `t_comm_class_master` VALUES ('718', '002-1009', '效果图', '002');
INSERT INTO `t_comm_class_master` VALUES ('719', '002-1010', '给排水工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('720', '002-1011', '暖通空调工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('721', '002-1012', '电气/强电/弱电/机电工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('722', '002-1013', '路桥/隧道工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('723', '002-1014', '市政工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('724', '002-1015', '工程部经理/项目经理/建造师', '002');
INSERT INTO `t_comm_class_master` VALUES ('725', '002-1016', '总工程师/技术负责人', '002');
INSERT INTO `t_comm_class_master` VALUES ('726', '002-1017', '造价工程师/预算员/成本控制', '002');
INSERT INTO `t_comm_class_master` VALUES ('727', '002-1018', '工长/施工员', '002');
INSERT INTO `t_comm_class_master` VALUES ('728', '002-1019', '土建工程师/装饰工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('729', '002-1020', '安全/质检员/安全质量工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('730', '002-1021', '监理员/监理工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('731', '002-1022', '土建/工民建监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('732', '002-1023', '公路/铁路/桥梁/隧道/市政监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('733', '002-1024', '水利/水电监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('734', '002-1025', '电力/燃气监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('735', '002-1026', '机电/设备/通讯/安装监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('736', '002-1027', '暖通/给排水监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('737', '002-1028', '园林/绿化/景观/林业监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('738', '002-1029', '装饰/装潢监理', '002');
INSERT INTO `t_comm_class_master` VALUES ('739', '002-1030', '工程咨询/招投标人员', '002');
INSERT INTO `t_comm_class_master` VALUES ('740', '002-1031', '测量/测绘员', '002');
INSERT INTO `t_comm_class_master` VALUES ('741', '002-1032', '资料员/档案管理员', '002');
INSERT INTO `t_comm_class_master` VALUES ('742', '002-1033', '试验员/检测员', '002');
INSERT INTO `t_comm_class_master` VALUES ('743', '002-1034', '材料员/采购员/物资管理', '002');
INSERT INTO `t_comm_class_master` VALUES ('744', '002-1035', '建筑工人/维修工', '002');
INSERT INTO `t_comm_class_master` VALUES ('745', '002-1036', '物业管理人员', '002');
INSERT INTO `t_comm_class_master` VALUES ('746', '002-1037', '房地产销售/中介/置业顾问', '002');
INSERT INTO `t_comm_class_master` VALUES ('747', '002-1038', '房地产/土地评估师', '002');
INSERT INTO `t_comm_class_master` VALUES ('748', '002-1039', '房地产前期/策划/投资', '002');
INSERT INTO `t_comm_class_master` VALUES ('749', '002-1040', '总经理/副总经理/部门经理', '002');
INSERT INTO `t_comm_class_master` VALUES ('750', '002-1041', '项目策划经理', '002');
INSERT INTO `t_comm_class_master` VALUES ('751', '002-1042', '前期部/投融资部/开发部经理', '002');
INSERT INTO `t_comm_class_master` VALUES ('752', '002-1043', '招投标主管', '002');
INSERT INTO `t_comm_class_master` VALUES ('753', '002-1044', '招商经理/主管/专员', '002');
INSERT INTO `t_comm_class_master` VALUES ('754', '002-1045', '幕墙工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('755', '002-1046', '水利工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('756', '002-1047', '环保工程师', '002');
INSERT INTO `t_comm_class_master` VALUES ('757', '002-1048', '铁路/城市轨道交通类', '002');
INSERT INTO `t_comm_class_master` VALUES ('758', '002-1049', '财务审计类', '002');
INSERT INTO `t_comm_class_master` VALUES ('759', '002-1050', '人力资源类', '002');
INSERT INTO `t_comm_class_master` VALUES ('760', '002-1051', '行政文秘类', '002');
INSERT INTO `t_comm_class_master` VALUES ('761', '002-1052', '市场销售类', '002');
INSERT INTO `t_comm_class_master` VALUES ('762', '002-1053', '计算机/网络人员', '002');
INSERT INTO `t_comm_class_master` VALUES ('763', '002-1054', '其他职能', '002');
INSERT INTO `t_comm_class_master` VALUES ('764', '004-1001', '执业证书', '004');
INSERT INTO `t_comm_class_master` VALUES ('765', '004-1002', '职称证书', '004');
INSERT INTO `t_comm_class_master` VALUES ('766', '004-1001-1001', '一级建造师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('767', '004-1001-1002', '二级建造师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('768', '004-1001-1003', '注册环保工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('769', '004-1001-1004', '注册安全工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('770', '004-1001-1005', '注册电气工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('771', '004-1001-1006', '一级注册建筑师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('772', '004-1001-1007', '二级注册建筑师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('773', '004-1001-1008', '注册环评工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('774', '004-1001-1009', '注册化工工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('775', '004-1001-1010', '注册咨询工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('776', '004-1001-1011', '一级注册结构师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('777', '004-1001-1012', '二级注册结构师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('778', '004-1001-1013', '建设部造价工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('779', '004-1001-1014', '水利部造价工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('780', '004-1001-1015', '交通部造价工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('781', '004-1001-1016', '注册城市规划师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('782', '004-1001-1017', '注册岩土工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('783', '004-1001-1018', '建设部监理工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('784', '004-1001-1019', '水利部监理工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('785', '004-1001-1020', '注册土木工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('786', '004-1001-1021', '注册资产评估师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('787', '004-1001-1022', '注册公用设备工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('788', '004-1001-1023', '注册给排水工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('789', '004-1001-1024', '全国建设工程造价员', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('790', '004-1001-1025', '招标师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('791', '004-1001-1026', '预算员', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('792', '004-1001-1027', '交通部监理工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('793', '004-1001-1028', '项目管理师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('794', '004-1001-1029', '注册暖通工程师', '004-1001');
INSERT INTO `t_comm_class_master` VALUES ('795', '004-1002-1001', '道路桥梁高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('796', '004-1002-1002', '市政工程高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('797', '004-1002-1003', '公路工程高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('798', '004-1002-1004', '土木工程高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('799', '004-1002-1005', '建筑工程高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('800', '004-1002-1006', '测量工程高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('801', '004-1002-1007', '水利水电高级工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('802', '004-1002-1008', '道桥工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('803', '004-1002-1009', '暖通工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('804', '004-1002-1010', '给排水工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('805', '004-1002-1011', '水利工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('806', '004-1002-1012', '化工工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('807', '004-1002-1013', '市政工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('808', '004-1002-1014', '电气工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('809', '004-1002-1015', '工民建工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('810', '004-1002-1016', '照明工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('811', '004-1002-1017', '机械工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('812', '004-1002-1018', '公路工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('813', '004-1002-1019', '机电工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('814', '004-1002-1020', '测量工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('815', '004-1002-1021', '园林工程师', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('816', '004-1002-1022', '中级会计师证', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('817', '004-1002-1023', '高级会计师证', '004-1002');
INSERT INTO `t_comm_class_master` VALUES ('839', '017-1001', '首页', '017');
INSERT INTO `t_comm_class_master` VALUES ('840', '017-1001-1001', '顶部的图片位置', '017-1001');
INSERT INTO `t_comm_class_master` VALUES ('841', '017-1001-1002', '城市站点页面--推荐企业位置', '017-1001');
INSERT INTO `t_comm_class_master` VALUES ('842', '017-1001-1003', '城市站点页面--城市热门企业位置', '017-1001');
INSERT INTO `t_comm_class_master` VALUES ('843', '017-1002', '猎头中心', '017');
INSERT INTO `t_comm_class_master` VALUES ('844', '017-1002-1001', '猎头中心--推荐企业位置', '017-1002');
INSERT INTO `t_comm_class_master` VALUES ('845', '017-1003', '人才挖掘', '017');
INSERT INTO `t_comm_class_master` VALUES ('846', '017-1003-1001', '人才挖掘--右边轮播位置', '017-1003');
INSERT INTO `t_comm_class_master` VALUES ('847', '017-1004', '创业沙龙', '017');
INSERT INTO `t_comm_class_master` VALUES ('848', '017-1004-1001', '创业沙龙--右边轮播位置', '017-1004');
INSERT INTO `t_comm_class_master` VALUES ('850', '017-1005', '招聘广告', '017');
INSERT INTO `t_comm_class_master` VALUES ('851', '017-1005-1001', '招聘广告--右边位置', '017-1005');
INSERT INTO `t_comm_class_master` VALUES ('852', '017-1005-1002', '招聘广告--左边上半部分位置', '017-1005');
INSERT INTO `t_comm_class_master` VALUES ('853', '017-1005-1003', '招聘广告--左边名企招聘', '017-1005');
INSERT INTO `t_comm_class_master` VALUES ('1140', '001-1002-1042', '砖木结构', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1139', '001-1002-1041', '园林绿化', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1138', '001-1002-1040', '三废治理', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1137', '001-1002-1039', '加固改造', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1136', '001-1002-1038', '家具配套', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1135', '001-1002-1037', '装饰装修', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1134', '001-1002-1036', '设备安装', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1133', '001-1002-1035', '幕墙施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1132', '001-1002-1034', '通信施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1131', '001-1002-1033', '建筑智能', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1130', '001-1002-1032', '灯光音响', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1129', '001-1002-1031', '建筑电气', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1128', '001-1002-1030', '送电变电', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1127', '001-1002-1029', '防水防腐', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1126', '001-1002-1028', '给水排水', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1125', '001-1002-1027', '环保节能', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1124', '001-1002-1026', '采暖保温', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1123', '001-1002-1025', '通风空调', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1122', '001-1002-1024', '人防施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1121', '001-1002-1023', '消防施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1120', '001-1002-1022', '预制构件', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1119', '001-1002-1021', '预应力砼', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1118', '001-1002-1020', '水下施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1117', '001-1002-1019', '地下施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1116', '001-1002-1018', '管道线路', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1115', '001-1002-1017', '交通设施', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1114', '001-1002-1016', '箱涵施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1113', '001-1002-1015', '隧道施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1112', '001-1002-1014', '桥梁施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1111', '001-1002-1013', '路面施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1110', '001-1002-1012', '路基施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1109', '001-1002-1011', '砖石砌体', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1108', '001-1002-1010', '结构装配', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1107', '001-1002-1009', '大跨结构', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1106', '001-1002-1008', '钢架结构', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1105', '001-1002-1007', '地基基础', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1104', '001-1002-1006', '爆破施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1103', '001-1002-1005', '土方石方', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1102', '001-1002-1004', '小区市政', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1101', '001-1002-1003', '房建施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1100', '001-1002-1002', '专业施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1099', '001-1002-1001', '施工总包', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1098', '001-1002', '工程专业承包', '001');
INSERT INTO `t_comm_class_master` VALUES ('1097', '001-1001-1010', '施工管理', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1096', '001-1001-1009', '工程监理', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1095', '001-1001-1008', '招标投标', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1094', '001-1001-1007', '工程造价', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1093', '001-1001-1006', '工程设计', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1092', '001-1001-1005', '工程勘察', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1091', '001-1001-1004', '项目管理', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1090', '001-1001-1003', '工程评估', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1089', '001-1001-1002', '投资策划', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1088', '001-1001-1001', '建设规划', '001-1001');
INSERT INTO `t_comm_class_master` VALUES ('1087', '001-1001', '工程专业顾问', '001');
INSERT INTO `t_comm_class_master` VALUES ('960', '018', '线下沙龙栏目', '0');
INSERT INTO `t_comm_class_master` VALUES ('961', '018-1001', '嘉宾致辞', '018');
INSERT INTO `t_comm_class_master` VALUES ('962', '018-1002', '嘉宾观点', '018');
INSERT INTO `t_comm_class_master` VALUES ('963', '018-1003', '用户观点', '018');
INSERT INTO `t_comm_class_master` VALUES ('964', '018-1004', '嘉宾讨论', '018');
INSERT INTO `t_comm_class_master` VALUES ('965', '018-1005', '嘉宾互动', '018');
INSERT INTO `t_comm_class_master` VALUES ('966', '018-1006', '用户互动', '018');
INSERT INTO `t_comm_class_master` VALUES ('967', '015', '沙龙主题', '0');
INSERT INTO `t_comm_class_master` VALUES ('968', '015-1001', '沙龙', '015');
INSERT INTO `t_comm_class_master` VALUES ('969', '015-1002', '沙龙图片', '015');
INSERT INTO `t_comm_class_master` VALUES ('970', '015-1003', '沙龙视频', '015');
INSERT INTO `t_comm_class_master` VALUES ('971', '015-1004', '沙龙文章', '015');
INSERT INTO `t_comm_class_master` VALUES ('972', '015-1001-1001', '沙龙发起人', '015-1001');
INSERT INTO `t_comm_class_master` VALUES ('973', '015-1001-1002', '沙龙名称', '015-1001');
INSERT INTO `t_comm_class_master` VALUES ('974', '015-1001-1003', '沙龙简介', '015-1001');
INSERT INTO `t_comm_class_master` VALUES ('975', '015-1002-1001', '图片标题', '015-1002');
INSERT INTO `t_comm_class_master` VALUES ('976', '015-1002-1002', '图片作者', '015-1002');
INSERT INTO `t_comm_class_master` VALUES ('977', '015-1003-1001', '视频标题', '015-1003');
INSERT INTO `t_comm_class_master` VALUES ('978', '015-1003-1002', '视频作者', '015-1003');
INSERT INTO `t_comm_class_master` VALUES ('979', '015-1004-1001', '文章标题', '015-1004');
INSERT INTO `t_comm_class_master` VALUES ('980', '015-1004-1002', '文章内容', '015-1004');
INSERT INTO `t_comm_class_master` VALUES ('981', '015-1004-1003', '文章作者', '015-1004');
INSERT INTO `t_comm_class_master` VALUES ('1086', '001', '行业', '0');
INSERT INTO `t_comm_class_master` VALUES ('983', '002', '职能', '0');
INSERT INTO `t_comm_class_master` VALUES ('984', '003', '专业', '0');
INSERT INTO `t_comm_class_master` VALUES ('985', '004', '证书分类', '0');
INSERT INTO `t_comm_class_master` VALUES ('986', '005', '工作性质', '0');
INSERT INTO `t_comm_class_master` VALUES ('987', '006', '工作年限', '0');
INSERT INTO `t_comm_class_master` VALUES ('988', '007', '学历要求', '0');
INSERT INTO `t_comm_class_master` VALUES ('989', '008', '语言能力', '0');
INSERT INTO `t_comm_class_master` VALUES ('990', '009', '掌握程度', '0');
INSERT INTO `t_comm_class_master` VALUES ('991', '010', '简历要求语言', '0');
INSERT INTO `t_comm_class_master` VALUES ('992', '011', '计算机等级', '0');
INSERT INTO `t_comm_class_master` VALUES ('993', '012', '注册状况', '0');
INSERT INTO `t_comm_class_master` VALUES ('994', '013', '月薪范围', '0');
INSERT INTO `t_comm_class_master` VALUES ('995', '014', '单位规模', '0');
INSERT INTO `t_comm_class_master` VALUES ('996', '005-1001', '兼职', '005');
INSERT INTO `t_comm_class_master` VALUES ('997', '005-1002', '全职', '005');
INSERT INTO `t_comm_class_master` VALUES ('998', '0-0', '不限', '006');
INSERT INTO `t_comm_class_master` VALUES ('999', '0-1', '一年以下', '006');
INSERT INTO `t_comm_class_master` VALUES ('1000', '1-2', '1-2年', '006');
INSERT INTO `t_comm_class_master` VALUES ('1001', '3-5', '3-5年', '006');
INSERT INTO `t_comm_class_master` VALUES ('1002', '6-7', '6-7年', '006');
INSERT INTO `t_comm_class_master` VALUES ('1003', '8-99', '8-10年及以上', '006');
INSERT INTO `t_comm_class_master` VALUES ('1004', '0', '不限', '007');
INSERT INTO `t_comm_class_master` VALUES ('1005', '1', '高中以下', '007');
INSERT INTO `t_comm_class_master` VALUES ('1006', '2', '中技', '007');
INSERT INTO `t_comm_class_master` VALUES ('1007', '3', '大专', '007');
INSERT INTO `t_comm_class_master` VALUES ('1008', '4', '本科', '007');
INSERT INTO `t_comm_class_master` VALUES ('1009', '5', '硕士', '007');
INSERT INTO `t_comm_class_master` VALUES ('1010', '6', 'MBA', '007');
INSERT INTO `t_comm_class_master` VALUES ('1011', '7', '博士', '007');
INSERT INTO `t_comm_class_master` VALUES ('1012', '0', '不限', '008');
INSERT INTO `t_comm_class_master` VALUES ('1013', '1', '英语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1014', '2', '日语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1015', '3', '法语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1016', '4', '德语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1017', '5', '俄语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1018', '6', '韩语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1019', '7', '西班牙语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1020', '8', '葡萄牙语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1021', '9', '阿拉伯语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1022', '10', '意大利语', '008');
INSERT INTO `t_comm_class_master` VALUES ('1023', '11', '上海话', '008');
INSERT INTO `t_comm_class_master` VALUES ('1024', '12', '闽南话', '008');
INSERT INTO `t_comm_class_master` VALUES ('1025', '0', '不限', '009');
INSERT INTO `t_comm_class_master` VALUES ('1026', '1', '一般', '009');
INSERT INTO `t_comm_class_master` VALUES ('1027', '2', '熟练', '009');
INSERT INTO `t_comm_class_master` VALUES ('1028', '3', '母语', '009');
INSERT INTO `t_comm_class_master` VALUES ('1029', '010-1002', '英文', '010');
INSERT INTO `t_comm_class_master` VALUES ('1030', '010-1003', '中文和英文', '010');
INSERT INTO `t_comm_class_master` VALUES ('1031', '0', '不限', '011');
INSERT INTO `t_comm_class_master` VALUES ('1032', '1', '一般', '011');
INSERT INTO `t_comm_class_master` VALUES ('1033', '2', '熟练', '011');
INSERT INTO `t_comm_class_master` VALUES ('1034', '3', '精通', '011');
INSERT INTO `t_comm_class_master` VALUES ('1035', '012-1001', '初始注册', '012');
INSERT INTO `t_comm_class_master` VALUES ('1036', '012-1002', '变更注册', '012');
INSERT INTO `t_comm_class_master` VALUES ('1037', '013-1001', '面议', '013');
INSERT INTO `t_comm_class_master` VALUES ('1038', '013-1002', '1500以下', '013');
INSERT INTO `t_comm_class_master` VALUES ('1039', '013-1003', '1500-1999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1040', '013-1004', '2000-2999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1041', '013-1005', '3000-4499', '013');
INSERT INTO `t_comm_class_master` VALUES ('1042', '013-1006', '4500-5999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1043', '013-1007', '6000-7999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1044', '013-1008', '8000-9999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1045', '013-1009', '10000-14999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1046', '013-1010', '15000-19999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1047', '013-1011', '20000-29999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1048', '013-1012', '30000-49999', '013');
INSERT INTO `t_comm_class_master` VALUES ('1049', '013-1013', '50000及以上', '013');
INSERT INTO `t_comm_class_master` VALUES ('1050', '014-1001', '20人以下', '014');
INSERT INTO `t_comm_class_master` VALUES ('1051', '014-1002', '20-99人', '014');
INSERT INTO `t_comm_class_master` VALUES ('1052', '014-1003', '100-499人', '014');
INSERT INTO `t_comm_class_master` VALUES ('1053', '014-1004', '500-999人', '014');
INSERT INTO `t_comm_class_master` VALUES ('1054', '014-1005', '1000-9999人', '014');
INSERT INTO `t_comm_class_master` VALUES ('1055', '014-1006', '10000人及以上', '014');
INSERT INTO `t_comm_class_master` VALUES ('1056', '0-0', '不限', '019');
INSERT INTO `t_comm_class_master` VALUES ('1057', '18-23', '18-23', '019');
INSERT INTO `t_comm_class_master` VALUES ('1058', '23-25', '23-25', '019');
INSERT INTO `t_comm_class_master` VALUES ('1059', '25-30', '25-30', '019');
INSERT INTO `t_comm_class_master` VALUES ('1060', '30-35', '30-35', '019');
INSERT INTO `t_comm_class_master` VALUES ('1061', '35-40', '35-40', '019');
INSERT INTO `t_comm_class_master` VALUES ('1062', '40-45', '40-45', '019');
INSERT INTO `t_comm_class_master` VALUES ('1063', '45-170', '45岁以上', '019');
INSERT INTO `t_comm_class_master` VALUES ('1064', '016', '增值服务人才挖掘', '016');
INSERT INTO `t_comm_class_master` VALUES ('1065', '016-1001', '行业类型', '016');
INSERT INTO `t_comm_class_master` VALUES ('1066', '016-1002', '专业类型', '016');
INSERT INTO `t_comm_class_master` VALUES ('1067', '016-1003', '职能名称', '016');
INSERT INTO `t_comm_class_master` VALUES ('1068', '016-1004', '地    区', '016');
INSERT INTO `t_comm_class_master` VALUES ('1069', '016-1005', '专    长', '016');
INSERT INTO `t_comm_class_master` VALUES ('1070', '016-1006', '学    历', '016');
INSERT INTO `t_comm_class_master` VALUES ('1071', '016-1007', '工作年限', '016');
INSERT INTO `t_comm_class_master` VALUES ('1072', '016-1008', '年    龄', '016');
INSERT INTO `t_comm_class_master` VALUES ('1073', '016-1009', '性    别', '016');
INSERT INTO `t_comm_class_master` VALUES ('1074', '016-1010', '语言能力', '016');
INSERT INTO `t_comm_class_master` VALUES ('1075', '016-1011', '掌握程度', '016');
INSERT INTO `t_comm_class_master` VALUES ('1076', '016-1012', '计算机能力', '016');
INSERT INTO `t_comm_class_master` VALUES ('1077', '016-1013', '顾    问', '016');
INSERT INTO `t_comm_class_master` VALUES ('1078', '016-1014', '工作性质', '016');
INSERT INTO `t_comm_class_master` VALUES ('1079', '016-1015', '更新日期', '016');
INSERT INTO `t_comm_class_master` VALUES ('1080', '016-1016', '星级指数', '016');
INSERT INTO `t_comm_class_master` VALUES ('1081', '016-1017', '职位关键字', '016');
INSERT INTO `t_comm_class_master` VALUES ('1082', '019', '年龄', '0');
INSERT INTO `t_comm_class_master` VALUES ('1084', '017-1005-1004', '招聘广告--左边热门招聘', '017-1005');
INSERT INTO `t_comm_class_master` VALUES ('1085', '017-1005-1005', '招聘广告--左边紧急招聘', '017-1005');
INSERT INTO `t_comm_class_master` VALUES ('1141', '001-1002-1043', '拆旧修缮', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1142', '001-1002-1044', '古建施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1143', '001-1002-1045', '文体设施', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1144', '001-1002-1046', '架子工程', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1145', '001-1002-1047', '灾害治理', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1146', '001-1002-1048', '特殊施工', '001-1002');
INSERT INTO `t_comm_class_master` VALUES ('1147', '001-1003', '工程相关服务', '001');
INSERT INTO `t_comm_class_master` VALUES ('1148', '001-1003-1001', '代理申报', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1149', '001-1003-1002', '资质咨询', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1150', '001-1003-1003', '代理报建', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1151', '001-1003-1004', '融资担保', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1152', '001-1003-1005', '代理收款', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1153', '001-1003-1006', '法律咨询', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1154', '001-1003-1007', '投资咨询', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1155', '001-1003-1008', '专家咨询', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1156', '001-1003-1009', '建设培训', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1157', '001-1003-1010', '人才招聘', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1158', '001-1003-1011', '劳务资源', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1159', '001-1003-1012', '体系认证', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1160', '001-1003-1013', '公关策划', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1161', '001-1003-1014', '财务审计', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1162', '001-1003-1015', '后勤安保', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1163', '001-1003-1016', '设备维修', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1164', '001-1003-1017', '物资供应', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1165', '001-1003-1018', '设备租赁', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1166', '001-1003-1019', '工程物流', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1167', '001-1003-1020', '工程翻译', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1168', '001-1003-1021', '物业管理', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1169', '001-1003-1022', '建设报关', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1170', '001-1003-1023', '工程检测', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1171', '001-1003-1024', '建筑风水', '001-1003');
INSERT INTO `t_comm_class_master` VALUES ('1172', '001-1004', '工程科学研究', '001');
INSERT INTO `t_comm_class_master` VALUES ('1173', '001-1004-1001', '工程技术', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1174', '001-1004-1002', '工程材料', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1175', '001-1004-1003', '工程设备', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1176', '001-1004-1004', '工程五金', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1177', '001-1004-1005', '器具用品', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1178', '001-1004-1006', '工程试验', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1179', '001-1004-1007', '结构安全', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1180', '001-1004-1008', '工程安全', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1181', '001-1004-1009', '岩土工程', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1182', '001-1004-1010', '地质灾害', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1183', '001-1004-1011', '环境保护', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1184', '001-1004-1012', '建筑节能', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1185', '001-1004-1013', '工程计算', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1186', '001-1004-1014', '工程软件', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1187', '001-1004-1015', '工程管理', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1188', '001-1004-1016', '企业管理', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1189', '001-1004-1017', '城市规划', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1190', '001-1004-1018', '房地产及物业', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1191', '001-1004-1019', '勘察设计', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1192', '001-1004-1020', '施工及装饰', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1193', '001-1004-1021', '监理和工程咨询', '001-1004');
INSERT INTO `t_comm_class_master` VALUES ('1194', '001-1004-1022', '建材设备厂商', '001-1004');

-- ----------------------------
-- Table structure for `t_comm_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_comment`;
CREATE TABLE `t_comm_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL COMMENT '评论源的ID',
  `subjectType` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '评论的类型(0-文章评论,1-图片评论,2-视频评论,3-沙龙评论)',
  `content` varchar(800) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `author` int(11) DEFAULT NULL COMMENT '评论人ID',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态(0-待审核,1-通过,2-未通过)',
  `submitDate` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`ID`),
  KEY `fk_t_comm_comment_author` (`author`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2721 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='评论';

-- ----------------------------
-- Records of t_comm_comment
-- ----------------------------
INSERT INTO `t_comm_comment` VALUES ('2691', '1788', '3', '111111111111111111111', '302', '2', '2011-04-11 11:37:43');
INSERT INTO `t_comm_comment` VALUES ('2693', '1788', '3', '1111', '307', '1', '2011-04-11 16:43:42');
INSERT INTO `t_comm_comment` VALUES ('2694', '2311', '1', '1111111', '302', '1', '2011-04-12 09:37:21');
INSERT INTO `t_comm_comment` VALUES ('2695', '2289', '2', '1111111111', '302', '1', '2011-04-12 09:44:27');
INSERT INTO `t_comm_comment` VALUES ('2696', '535', '0', '111', '302', '1', '2011-04-12 09:48:29');
INSERT INTO `t_comm_comment` VALUES ('2702', '2311', '1', '222', '302', '0', '2011-04-12 10:02:59');
INSERT INTO `t_comm_comment` VALUES ('2701', '2311', '1', '222', '302', '2', '2011-04-12 10:02:45');
INSERT INTO `t_comm_comment` VALUES ('2700', '2311', '1', '11111', '302', '0', '2011-04-12 10:02:42');
INSERT INTO `t_comm_comment` VALUES ('2703', '546', '0', '10', '302', '1', '2011-04-12 10:37:24');
INSERT INTO `t_comm_comment` VALUES ('2704', '546', '0', '10', '302', '1', '2011-04-12 10:38:40');
INSERT INTO `t_comm_comment` VALUES ('2705', '546', '0', '10', '302', '1', '2011-04-12 10:39:00');
INSERT INTO `t_comm_comment` VALUES ('2706', '546', '0', '89', '302', '1', '2011-04-12 10:42:12');
INSERT INTO `t_comm_comment` VALUES ('2707', '1789', '3', '111', '302', '1', '2011-04-12 11:35:24');
INSERT INTO `t_comm_comment` VALUES ('2708', '1789', '3', '111', '302', '1', '2011-04-12 11:35:42');
INSERT INTO `t_comm_comment` VALUES ('2709', '1789', '3', '111111111111', '303', '1', '2011-04-12 16:34:27');
INSERT INTO `t_comm_comment` VALUES ('2710', '1789', '3', '111', '302', '1', '2011-04-13 16:43:57');
INSERT INTO `t_comm_comment` VALUES ('2711', '1841', '3', '他那天那个能耐发给你发给你股份那个你发功能发给你回复的发挥好的话如何如何让热贴和任何让他华容他和然后特如何如何如何让他俄塔和任何人都会', '314', '1', '2011-04-18 15:03:13');
INSERT INTO `t_comm_comment` VALUES ('2712', '1841', '3', '让他和认同和认同和人很热很热他', '314', '0', '2011-04-18 15:02:46');
INSERT INTO `t_comm_comment` VALUES ('2713', '1787', '3', '评论测试哦哦', '302', '1', '2011-04-19 16:17:15');
INSERT INTO `t_comm_comment` VALUES ('2714', '1787', '3', '评论测试哦哦', '302', '0', '2011-04-19 16:18:31');
INSERT INTO `t_comm_comment` VALUES ('2715', '1787', '3', '评论测试哦哦', '302', '0', '2011-04-19 16:23:22');
INSERT INTO `t_comm_comment` VALUES ('2716', '1845', '3', '11', '302', '0', '2011-04-25 11:32:59');
INSERT INTO `t_comm_comment` VALUES ('2717', '1845', '3', '11', '302', '0', '2011-04-25 11:44:09');
INSERT INTO `t_comm_comment` VALUES ('2718', '1789', '3', '11', '329', '0', '2011-04-26 18:17:00');
INSERT INTO `t_comm_comment` VALUES ('2719', '1863', '3', '12323123213121233333333', '331', '1', '2011-07-21 11:30:45');
INSERT INTO `t_comm_comment` VALUES ('2720', '1863', '3', '123123', '331', '1', '2011-07-21 11:33:22');

-- ----------------------------
-- Table structure for `t_comm_filter_words`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_filter_words`;
CREATE TABLE `t_comm_filter_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `words` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '过滤词',
  `notes` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `last_edit_date` datetime NOT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1798 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='过滤词';

-- ----------------------------
-- Records of t_comm_filter_words
-- ----------------------------
INSERT INTO `t_comm_filter_words` VALUES ('1796', '江泽民', '', '690', '2011-04-07 15:55:32');
INSERT INTO `t_comm_filter_words` VALUES ('1797', '胡锦涛', '1', '543', '2011-04-25 11:32:26');

-- ----------------------------
-- Table structure for `t_comm_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_function`;
CREATE TABLE `t_comm_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '功能编码',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '功能名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_FUNCTION_CODE` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统功能表';

-- ----------------------------
-- Records of t_comm_function
-- ----------------------------
INSERT INTO `t_comm_function` VALUES ('95', '1001-1001', '增值服务套餐名称维护');
INSERT INTO `t_comm_function` VALUES ('96', '1001-1002', '增值服务人才挖掘字段设置        ');
INSERT INTO `t_comm_function` VALUES ('97', '1001-1003', '增值服务挂证服务设置          ');
INSERT INTO `t_comm_function` VALUES ('98', '1001-1004', '猎证服务设置');
INSERT INTO `t_comm_function` VALUES ('99', '1001-1005', '增值服务招聘服务设置          ');
INSERT INTO `t_comm_function` VALUES ('100', '1001-1006', '广告位服务设置');
INSERT INTO `t_comm_function` VALUES ('101', '1002-1001', '管理员管理               ');
INSERT INTO `t_comm_function` VALUES ('102', '1002-1002', '管理员角色管理             ');
INSERT INTO `t_comm_function` VALUES ('103', '1002-1003', '管理员权限设置             ');
INSERT INTO `t_comm_function` VALUES ('104', '1003-1001', '角色管理                ');
INSERT INTO `t_comm_function` VALUES ('105', '1003-1002', '权限设置                ');
INSERT INTO `t_comm_function` VALUES ('106', '1004-1001', '功能点维护               ');
INSERT INTO `t_comm_function` VALUES ('107', '1005-1001', '会员管理                ');
INSERT INTO `t_comm_function` VALUES ('108', '1005-1002', '密码重置                ');
INSERT INTO `t_comm_function` VALUES ('109', '1006-1001', '招聘应聘人数              ');
INSERT INTO `t_comm_function` VALUES ('110', '1006-1002', '猎证统计                ');
INSERT INTO `t_comm_function` VALUES ('111', '1007-1001', '过滤词管理               ');
INSERT INTO `t_comm_function` VALUES ('112', '1008-1001', '线下人才库               ');
INSERT INTO `t_comm_function` VALUES ('113', '1009-1001', '线下人才匹配-个人求职意向信息列表');
INSERT INTO `t_comm_function` VALUES ('114', '1009-1002', '线下人才匹配一企业人求职意向信息列表');
INSERT INTO `t_comm_function` VALUES ('115', '1010-1001', '招聘方管理               ');
INSERT INTO `t_comm_function` VALUES ('116', '1010-1002', '招聘职位管理              ');
INSERT INTO `t_comm_function` VALUES ('117', '1011-1001', '求职方管理               ');
INSERT INTO `t_comm_function` VALUES ('118', '1011-1002', '求职意向管理              ');
INSERT INTO `t_comm_function` VALUES ('119', '1012-1001', '猎证需求管理              ');
INSERT INTO `t_comm_function` VALUES ('120', '1013-1001', '证书管理                ');
INSERT INTO `t_comm_function` VALUES ('121', '1014-1001', '沙龙管理-沙龙审核           ');
INSERT INTO `t_comm_function` VALUES ('122', '1014-1002', '沙龙管理-经典沙龙设置         ');
INSERT INTO `t_comm_function` VALUES ('123', '1014-1003', '沙龙管理-经典文章设置         ');
INSERT INTO `t_comm_function` VALUES ('124', '1014-1004', '沙龙管理-主办单位设置         ');
INSERT INTO `t_comm_function` VALUES ('125', '1015-1001', '线下沙龙图片库             ');
INSERT INTO `t_comm_function` VALUES ('126', '1016-1001', '线下沙龙视频库             ');
INSERT INTO `t_comm_function` VALUES ('127', '1017-1001', '文章管理                ');
INSERT INTO `t_comm_function` VALUES ('128', '1018-1001', '增值服务管理');
INSERT INTO `t_comm_function` VALUES ('129', '1019-1001', '积分管理-积分设置           ');
INSERT INTO `t_comm_function` VALUES ('130', '1019-1002', '积分管理-积分调整           ');
INSERT INTO `t_comm_function` VALUES ('131', '1020-1001', '系统日志                ');
INSERT INTO `t_comm_function` VALUES ('132', '1021-1001', '修改密码                ');
INSERT INTO `t_comm_function` VALUES ('133', '1022-1001', '退出系统                ');
INSERT INTO `t_comm_function` VALUES ('134', '1023-1001', '返回首页                ');
INSERT INTO `t_comm_function` VALUES ('135', '1024-1001', '评论管理                ');
INSERT INTO `t_comm_function` VALUES ('136', '1025-1001', '订单管理                ');
INSERT INTO `t_comm_function` VALUES ('137', '1026-1001', '广告管理                ');

-- ----------------------------
-- Table structure for `t_comm_function_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_function_role`;
CREATE TABLE `t_comm_function_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionid` int(11) NOT NULL COMMENT '功能id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_FUNCTION_ROLE_FUNIDANDROLEID` (`functionid`,`roleid`) USING BTREE,
  UNIQUE KEY `UN_T_COMM_FUNCTION_ROLE_FUNIDANDUSERID` (`functionid`,`userid`) USING BTREE,
  KEY `FK_T_COMM_FUNCTION_ROLE_ROLEID` (`roleid`) USING BTREE,
  KEY `FK_T_COMM_FUNCTION_ROLE_USERID1` (`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='功能点会员角色分配表';

-- ----------------------------
-- Records of t_comm_function_role
-- ----------------------------
INSERT INTO `t_comm_function_role` VALUES ('74', '95', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('75', '96', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('76', '97', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('77', '98', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('78', '99', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('79', '100', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('80', '101', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('81', '102', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('82', '103', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('83', '104', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('84', '105', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('85', '106', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('86', '107', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('87', '108', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('88', '109', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('89', '110', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('90', '111', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('91', '112', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('92', '113', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('93', '114', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('94', '115', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('95', '116', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('96', '117', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('97', '118', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('98', '119', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('99', '120', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('100', '121', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('101', '122', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('102', '123', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('103', '124', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('104', '125', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('105', '126', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('106', '127', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('107', '128', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('108', '129', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('109', '130', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('110', '131', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('111', '132', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('112', '133', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('113', '134', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('114', '135', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('115', '136', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('116', '137', '143', null);
INSERT INTO `t_comm_function_role` VALUES ('117', '121', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('118', '122', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('119', '123', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('120', '124', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('121', '125', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('122', '126', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('123', '127', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('124', '135', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('125', '137', '142', null);
INSERT INTO `t_comm_function_role` VALUES ('126', '99', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('127', '100', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('128', '112', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('129', '113', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('130', '114', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('131', '115', null, '303');
INSERT INTO `t_comm_function_role` VALUES ('132', '95', null, '311');
INSERT INTO `t_comm_function_role` VALUES ('133', '96', null, '311');
INSERT INTO `t_comm_function_role` VALUES ('134', '97', null, '311');
INSERT INTO `t_comm_function_role` VALUES ('135', '98', null, '311');
INSERT INTO `t_comm_function_role` VALUES ('136', '99', null, '311');

-- ----------------------------
-- Table structure for `t_comm_function_role_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_function_role_admin`;
CREATE TABLE `t_comm_function_role_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionid` int(11) NOT NULL COMMENT '功能id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  `userid` int(11) DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_FUNCTION_ROLE_AM_FUNIDANDROLEID` (`functionid`,`roleid`) USING BTREE,
  UNIQUE KEY `UN_T_COMM_FUNCTION_ROLE_AM_FUNIDANDUSERID` (`functionid`,`userid`) USING BTREE,
  KEY `FK_T_COMM_FUNCTION_ROLE_AM_ROLEID` (`roleid`) USING BTREE,
  KEY `FK_T_COMM_FUNCTION_ROLE_AM_USERID1` (`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='功能点管理员角色分配表';

-- ----------------------------
-- Records of t_comm_function_role_admin
-- ----------------------------
INSERT INTO `t_comm_function_role_admin` VALUES ('208', '95', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('209', '96', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('210', '97', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('211', '98', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('212', '99', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('213', '100', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('214', '101', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('215', '102', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('216', '103', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('217', '104', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('218', '105', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('219', '106', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('220', '107', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('221', '108', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('222', '109', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('223', '110', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('224', '111', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('225', '112', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('226', '113', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('227', '114', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('228', '115', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('229', '116', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('230', '117', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('231', '118', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('232', '119', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('233', '120', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('234', '121', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('235', '122', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('236', '123', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('237', '124', null, '687');
INSERT INTO `t_comm_function_role_admin` VALUES ('238', '132', null, '688');
INSERT INTO `t_comm_function_role_admin` VALUES ('239', '135', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('240', '136', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('241', '137', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('242', '105', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('243', '106', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('244', '107', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('245', '108', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('246', '109', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('247', '110', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('248', '111', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('249', '112', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('250', '113', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('251', '114', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('340', '96', null, '691');
INSERT INTO `t_comm_function_role_admin` VALUES ('339', '95', null, '691');
INSERT INTO `t_comm_function_role_admin` VALUES ('338', '98', '280', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('337', '137', '279', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('336', '136', '279', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('335', '130', '279', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('334', '129', '279', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('333', '128', '279', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('282', '95', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('283', '96', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('284', '97', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('285', '98', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('286', '99', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('287', '100', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('288', '101', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('289', '102', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('290', '103', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('291', '104', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('292', '105', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('293', '106', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('294', '107', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('295', '108', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('296', '109', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('297', '110', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('298', '111', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('299', '112', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('300', '113', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('301', '114', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('302', '115', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('303', '116', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('304', '117', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('305', '118', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('306', '119', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('307', '120', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('308', '121', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('309', '122', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('310', '123', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('311', '124', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('312', '125', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('313', '126', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('314', '127', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('315', '128', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('316', '129', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('317', '130', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('318', '131', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('319', '132', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('320', '133', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('321', '134', '276', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('322', '95', null, '688');
INSERT INTO `t_comm_function_role_admin` VALUES ('323', '96', null, '688');
INSERT INTO `t_comm_function_role_admin` VALUES ('324', '99', null, '688');
INSERT INTO `t_comm_function_role_admin` VALUES ('325', '98', null, '690');
INSERT INTO `t_comm_function_role_admin` VALUES ('326', '121', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('327', '122', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('328', '123', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('329', '124', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('330', '125', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('331', '126', '278', null);
INSERT INTO `t_comm_function_role_admin` VALUES ('332', '127', '278', null);

-- ----------------------------
-- Table structure for `t_comm_host_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_host_unit`;
CREATE TABLE `t_comm_host_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '主办单位名称',
  `pictureName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片名称',
  `introduction` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位简介',
  `intOrder` int(1) NOT NULL COMMENT '排列顺序',
  `linkURL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=534 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='主办单位';

-- ----------------------------
-- Records of t_comm_host_unit
-- ----------------------------
INSERT INTO `t_comm_host_unit` VALUES ('529', '深圳科技有限公司', '13021676634254071714.jpg', '深圳科技有限公司', '5', 'http://www.dotoyo.com');
INSERT INTO `t_comm_host_unit` VALUES ('530', '深圳科技有限公司', '13021677080674071715.jpg', '深圳科技有限公司', '2', 'http://www.dotoyo.com');
INSERT INTO `t_comm_host_unit` VALUES ('531', '北京中南海', '13021693913174071743.jpg', '北京中南海北京中南海', '4', 'http://www.sina.com.cn');
INSERT INTO `t_comm_host_unit` VALUES ('532', 'CCAV', '13022235427604080845.jpg', '/usr/local/dotoyo_hr/uploadFile', '1', 'http://www.sina.com.cn');
INSERT INTO `t_comm_host_unit` VALUES ('533', '无敌单位', '13022263566914080932.jpg', '　公司的组织形式。以营利为目的的社团法人。在资本主义社会获得高度发展。我国在建国后对私营公司进行了社会主义改造。国营工、商、建筑、运输等部门中实行独立经济核算的经营管理组织和某些城市中按行业划分的专业管理机构，也通称公司。近年来随着我国经济体制的改革，享有法人资格的各种公司纷纷设立，按章程从事自身的生产经营活动。 　　清 魏', '3', 'http://www.dotoyo.com');

-- ----------------------------
-- Table structure for `t_comm_hotcity`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_hotcity`;
CREATE TABLE `t_comm_hotcity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityCode` varbinary(10) NOT NULL COMMENT '城市CODE',
  `pic` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `orderNumber` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`,`cityCode`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='热点城市';

-- ----------------------------
-- Records of t_comm_hotcity
-- ----------------------------
INSERT INTO `t_comm_hotcity` VALUES ('11', 0x313130313030, 'city1.jpg', '1');
INSERT INTO `t_comm_hotcity` VALUES ('12', 0x333130313030, 'city2.jpg', '2');
INSERT INTO `t_comm_hotcity` VALUES ('13', 0x343430313030, 'city3.jpg', '3');
INSERT INTO `t_comm_hotcity` VALUES ('14', 0x343430333030, 'city4.jpg', '4');
INSERT INTO `t_comm_hotcity` VALUES ('15', 0x333330313030, 'city5.jpg', '5');
INSERT INTO `t_comm_hotcity` VALUES ('16', 0x313230313030, 'city6.jpg', '6');
INSERT INTO `t_comm_hotcity` VALUES ('17', 0x343230313030, 'city7.jpg', '7');
INSERT INTO `t_comm_hotcity` VALUES ('18', 0x353030313030, 'city8.jpg', '8');
INSERT INTO `t_comm_hotcity` VALUES ('19', 0x333230313030, 'city9.jpg', '9');
INSERT INTO `t_comm_hotcity` VALUES ('20', 0x333230353030, 'city10.jpg', '10');

-- ----------------------------
-- Table structure for `t_comm_hot_competencys`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_hot_competencys`;
CREATE TABLE `t_comm_hot_competencys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '热门职能ID',
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '热门职能编码',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '热门职能名称',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '热门职能状态:0 无效;1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_comm_hot_competencys
-- ----------------------------
INSERT INTO `t_comm_hot_competencys` VALUES ('1', '002-1002', '规划设计师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('2', '002-1004', '结构工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('3', '002-1005', '岩土工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('4', '002-1006', '设备工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('5', '002-1009', '效果图', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('6', '002-1010', '给排水工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('7', '002-1014', '市政工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('8', '002-1018', '工长/施工员', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('9', '002-1033', '试验员/检测员', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('10', '002-1036', '物业管理人员', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('11', '002-1041', '项目策划经理', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('12', '002-1043', '招投标主管', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('13', '002-1045', '幕墙工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('14', '002-1046', '水利工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('15', '002-1047', '环保工程师', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('16', '002-1049', '财务审计类', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('17', '002-1050', '人力资源类', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('18', '002-1051', '行政文秘类', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('19', '002-1052', '市场销售类', '1');
INSERT INTO `t_comm_hot_competencys` VALUES ('20', '002-1054', '其他职能', '1');

-- ----------------------------
-- Table structure for `t_comm_interview_receive_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_interview_receive_notice`;
CREATE TABLE `t_comm_interview_receive_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderId` int(11) NOT NULL COMMENT '发送者ID',
  `receiverId` int(11) NOT NULL COMMENT '接收者ID',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '通知标题',
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '通知内容',
  `noticeDate` datetime NOT NULL COMMENT '发送日期',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态：0未查看，1已查看',
  `jobName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '职位名称',
  PRIMARY KEY (`id`),
  KEY `FK_t_comm_interview_receive_notice` (`receiverId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_comm_interview_receive_notice
-- ----------------------------
INSERT INTO `t_comm_interview_receive_notice` VALUES ('177', '309', '301', '面试通知', '面试通知信息................', '2011-04-08 09:37:02', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('178', '309', '301', '面试通知', '面试通知信息................', '2011-04-08 09:37:06', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('179', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 09:44:49', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('180', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 09:47:18', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('181', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:33', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('182', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:39', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('183', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:51', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('184', '309', '316', '面试通知', '面试通知信息................', '2011-04-11 10:18:45', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('185', '309', '301', '面试通知', '面试通知信息................', '2011-04-11 10:18:52', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('186', '314', '304', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('187', '314', '303', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('188', '314', '301', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('189', '314', '299', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('190', '314', '298', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('191', '314', '297', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('192', '314', '307', '面试通知', '面试通知信息................', '2011-04-14 15:03:54', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('193', '302', '298', '面试通知', '面试通知信息................', '2011-04-14 15:15:12', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('194', '314', '307', '面试通知', '面试通知信息................', '2011-04-14 16:20:08', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('195', '302', '316', '面试通知', '面试通知信息................', '2011-04-14 17:24:33', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('196', '302', '327', '面试通知', '面试通知信息................', '2011-04-14 17:29:56', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('197', '302', '327', '面试通知', '面试通知信息................', '2011-04-14 17:35:13', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('198', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:57:18', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('199', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:08', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('200', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:11', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('201', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:31', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('202', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:59:02', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('203', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 18:03:36', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('204', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 18:03:49', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('205', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 18:13:47', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('206', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 18:18:22', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('207', '330', '323', '面试通知', '面试通知信息................', '2011-04-14 19:44:16', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('208', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:26', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('209', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:42', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('210', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:49', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('211', '309', '301', '面试通知', '面试通知信息................', '2011-04-18 09:56:46', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('212', '309', '307', '面试通知', '面试通知信息................', '2011-04-18 10:00:26', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('213', '309', '327', '面试通知', '面试通知信息................', '2011-04-18 10:00:27', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('214', '309', '323', '面试通知', '面试通知信息................', '2011-04-18 10:00:29', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('215', '330', '333', '面试通知', '面试通知信息................', '2011-04-18 11:43:10', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('216', '314', '316', '面试通知', '面试通知信息................', '2011-04-18 14:32:01', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('217', '302', '324', '面试通知', '面试通知信息................', '2011-04-19 10:58:06', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('218', '302', '334', '面试通知', '面试通知信息................', '2011-04-27 09:40:49', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('219', '302', '333', '面试通知', '面试通知信息................', '2011-04-27 09:40:53', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('220', '302', '329', '面试通知', '面试通知信息................', '2011-04-27 09:40:54', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('221', '302', '301', '面试通知', '面试通知信息................', '2011-04-27 09:40:55', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('222', '302', '329', '面试通知', '面试通知信息................', '2011-04-27 09:40:56', '1', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('223', '302', '307', '面试通知', '面试通知信息................', '2011-04-27 09:40:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('224', '302', '327', '面试通知', '面试通知信息................', '2011-04-27 09:40:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('225', '302', '324', '面试通知', '面试通知信息................', '2011-04-27 09:40:58', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('226', '331', '334', '面试通知', '面试通知信息................', '2011-04-27 11:11:52', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('227', '331', '333', '面试通知', '面试通知信息................', '2011-04-27 11:11:54', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('228', '331', '329', '面试通知', '面试通知信息................', '2011-04-27 11:11:55', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('229', '331', '301', '面试通知', '面试通知信息................', '2011-04-27 11:11:57', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('230', '331', '329', '面试通知', '面试通知信息................', '2011-04-27 11:11:58', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('231', '331', '307', '面试通知', '面试通知信息................', '2011-04-27 11:12:00', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('232', '331', '327', '面试通知', '面试通知信息................', '2011-04-27 11:12:02', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('233', '331', '324', '面试通知', '面试通知信息................', '2011-04-27 11:12:03', '0', '');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('234', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:35', '0', '工程监理');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('235', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:43', '0', 'grgegeg');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('236', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:52', '0', '造价工程师');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('237', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:02', '0', '工程监理');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('238', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:24', '0', 'grgegeg');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('239', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:35', '0', '造价工程师');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('240', '336', '338', '面试通知', '面试通知信息................', '2011-05-04 10:32:15', '0', '工程勘察');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('241', '336', '338', '面试通知', '面试通知信息................', '2011-05-04 10:33:36', '1', '工程勘察');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('242', '331', '297', '面试通知', '面试通知信息................', '2011-07-19 16:21:50', '0', '???');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('243', '331', '334', '面试通知', '面试通知信息................', '2011-07-20 11:22:38', '0', '意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('244', '331', '333', '面试通知', '面试通知信息................', '2011-07-20 11:22:40', '1', '个人意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('245', '331', '333', '面试通知', '面试通知信息................', '2011-07-20 11:23:00', '0', '个人意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('246', '331', '301', '面试通知', '面试通知信息................', '2011-07-20 11:23:01', '0', 'CFO');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('247', '331', '329', '面试通知', '面试通知信息................', '2011-07-20 11:23:03', '0', '人才中心个人意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('248', '331', '327', '面试通知', '面试通知信息................', '2011-07-20 11:23:04', '0', '111');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('249', '331', '324', '面试通知', '面试通知信息................', '2011-07-20 11:23:07', '0', 'ssfs');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('250', '331', '324', '面试通知', '面试通知信息................', '2011-07-20 11:23:08', '0', 'sfsfsfsdfsdf');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('251', '331', '323', '面试通知', '面试通知信息................', '2011-07-20 11:23:10', '0', '意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('252', '331', '352', '面试通知', '面试通知信息................', '2011-07-20 17:40:37', '0', '注册意向职位');
INSERT INTO `t_comm_interview_receive_notice` VALUES ('253', '331', '303', '面试通知', '面试通知信息................', '2011-07-20 18:02:29', '0', '高级全职顾问');

-- ----------------------------
-- Table structure for `t_comm_interview_send_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_interview_send_notice`;
CREATE TABLE `t_comm_interview_send_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderId` int(11) NOT NULL COMMENT '发送者id',
  `receiverId` int(11) NOT NULL COMMENT '接收者Id',
  `title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '通知标题',
  `message` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '通知信息',
  `noticeDate` datetime NOT NULL COMMENT '通知发出时间',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '通知状态：0为查看，1已查看',
  `jobName` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '职位名称',
  PRIMARY KEY (`id`),
  KEY `FK_t_comm_interview_send_notice` (`senderId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='面试通知';

-- ----------------------------
-- Records of t_comm_interview_send_notice
-- ----------------------------
INSERT INTO `t_comm_interview_send_notice` VALUES ('177', '309', '301', '面试通知', '面试通知信息................', '2011-04-08 09:37:02', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('178', '309', '301', '面试通知', '面试通知信息................', '2011-04-08 09:37:06', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('179', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 09:44:49', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('180', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 09:47:18', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('181', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:33', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('182', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:39', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('183', '314', '316', '面试通知', '面试通知信息................', '2011-04-08 10:03:51', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('184', '309', '316', '面试通知', '面试通知信息................', '2011-04-11 10:18:45', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('185', '309', '301', '面试通知', '面试通知信息................', '2011-04-11 10:18:52', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('186', '314', '304', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('187', '314', '303', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('188', '314', '301', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('189', '314', '299', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('190', '314', '298', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('191', '314', '297', '面试通知', '面试通知信息................', '2011-04-14 15:02:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('192', '314', '307', '面试通知', '面试通知信息................', '2011-04-14 15:03:54', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('193', '302', '298', '面试通知', '面试通知信息................', '2011-04-14 15:15:12', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('194', '314', '307', '面试通知', '面试通知信息................', '2011-04-14 16:20:08', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('195', '302', '316', '面试通知', '面试通知信息................', '2011-04-14 17:24:33', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('196', '302', '327', '面试通知', '面试通知信息................', '2011-04-14 17:29:56', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('197', '302', '327', '面试通知', '面试通知信息................', '2011-04-14 17:35:13', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('198', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:57:18', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('199', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:08', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('200', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:11', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('201', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:58:31', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('202', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 17:59:02', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('203', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 18:03:36', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('204', '302', '329', '面试通知', '面试通知信息................', '2011-04-14 18:03:49', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('205', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 18:13:47', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('206', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 18:18:22', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('207', '330', '323', '面试通知', '面试通知信息................', '2011-04-14 19:44:16', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('208', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:26', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('209', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:42', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('210', '330', '329', '面试通知', '面试通知信息................', '2011-04-14 19:45:49', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('211', '309', '301', '面试通知', '面试通知信息................', '2011-04-18 09:56:46', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('212', '309', '307', '面试通知', '面试通知信息................', '2011-04-18 10:00:26', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('213', '309', '327', '面试通知', '面试通知信息................', '2011-04-18 10:00:27', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('214', '309', '323', '面试通知', '面试通知信息................', '2011-04-18 10:00:29', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('215', '330', '333', '面试通知', '面试通知信息................', '2011-04-18 11:43:10', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('216', '314', '316', '面试通知', '面试通知信息................', '2011-04-18 14:32:01', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('217', '302', '324', '面试通知', '面试通知信息................', '2011-04-19 10:58:06', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('218', '302', '334', '面试通知', '面试通知信息................', '2011-04-27 09:40:49', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('219', '302', '333', '面试通知', '面试通知信息................', '2011-04-27 09:40:53', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('220', '302', '329', '面试通知', '面试通知信息................', '2011-04-27 09:40:54', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('221', '302', '301', '面试通知', '面试通知信息................', '2011-04-27 09:40:55', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('222', '302', '329', '面试通知', '面试通知信息................', '2011-04-27 09:40:56', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('223', '302', '307', '面试通知', '面试通知信息................', '2011-04-27 09:40:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('224', '302', '327', '面试通知', '面试通知信息................', '2011-04-27 09:40:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('225', '302', '324', '面试通知', '面试通知信息................', '2011-04-27 09:40:58', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('226', '331', '334', '面试通知', '面试通知信息................', '2011-04-27 11:11:52', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('227', '331', '333', '面试通知', '面试通知信息................', '2011-04-27 11:11:54', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('228', '331', '329', '面试通知', '面试通知信息................', '2011-04-27 11:11:55', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('229', '331', '301', '面试通知', '面试通知信息................', '2011-04-27 11:11:57', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('230', '331', '329', '面试通知', '面试通知信息................', '2011-04-27 11:11:58', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('231', '331', '307', '面试通知', '面试通知信息................', '2011-04-27 11:12:00', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('232', '331', '327', '面试通知', '面试通知信息................', '2011-04-27 11:12:02', '0', '');
INSERT INTO `t_comm_interview_send_notice` VALUES ('242', '331', '297', '面试通知', '面试通知信息................', '2011-07-19 16:21:50', '0', '???');
INSERT INTO `t_comm_interview_send_notice` VALUES ('234', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:35', '0', '工程监理');
INSERT INTO `t_comm_interview_send_notice` VALUES ('235', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:43', '0', 'grgegeg');
INSERT INTO `t_comm_interview_send_notice` VALUES ('236', '336', '337', '面试通知', '面试通知信息................', '2011-05-03 18:08:52', '0', '造价工程师');
INSERT INTO `t_comm_interview_send_notice` VALUES ('237', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:02', '0', '工程监理');
INSERT INTO `t_comm_interview_send_notice` VALUES ('238', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:24', '0', 'grgegeg');
INSERT INTO `t_comm_interview_send_notice` VALUES ('239', '336', '338', '面试通知', '面试通知信息................', '2011-05-03 18:15:35', '0', '造价工程师');
INSERT INTO `t_comm_interview_send_notice` VALUES ('240', '336', '338', '面试通知', '面试通知信息................', '2011-05-04 10:32:15', '0', '工程勘察');
INSERT INTO `t_comm_interview_send_notice` VALUES ('241', '336', '338', '面试通知', '面试通知信息................', '2011-05-04 10:33:36', '0', '工程勘察');
INSERT INTO `t_comm_interview_send_notice` VALUES ('243', '331', '334', '面试通知', '面试通知信息................', '2011-07-20 11:22:38', '0', '意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('244', '331', '333', '面试通知', '面试通知信息................', '2011-07-20 11:22:40', '0', '个人意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('245', '331', '333', '面试通知', '面试通知信息................', '2011-07-20 11:23:00', '0', '个人意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('246', '331', '301', '面试通知', '面试通知信息................', '2011-07-20 11:23:01', '0', 'CFO');
INSERT INTO `t_comm_interview_send_notice` VALUES ('247', '331', '329', '面试通知', '面试通知信息................', '2011-07-20 11:23:03', '0', '人才中心个人意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('248', '331', '327', '面试通知', '面试通知信息................', '2011-07-20 11:23:04', '0', '111');
INSERT INTO `t_comm_interview_send_notice` VALUES ('249', '331', '324', '面试通知', '面试通知信息................', '2011-07-20 11:23:07', '0', 'ssfs');
INSERT INTO `t_comm_interview_send_notice` VALUES ('250', '331', '324', '面试通知', '面试通知信息................', '2011-07-20 11:23:08', '0', 'sfsfsfsdfsdf');
INSERT INTO `t_comm_interview_send_notice` VALUES ('251', '331', '323', '面试通知', '面试通知信息................', '2011-07-20 11:23:10', '0', '意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('252', '331', '352', '面试通知', '面试通知信息................', '2011-07-20 17:40:37', '0', '注册意向职位');
INSERT INTO `t_comm_interview_send_notice` VALUES ('253', '331', '303', '面试通知', '面试通知信息................', '2011-07-20 18:02:29', '0', '高级全职顾问');

-- ----------------------------
-- Table structure for `t_comm_msg_set`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_msg_set`;
CREATE TABLE `t_comm_msg_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户名',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `msg` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自动回复的信息',
  PRIMARY KEY (`id`),
  KEY `FK_t_comm_msg_set` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业站内自动回复信息设置';

-- ----------------------------
-- Records of t_comm_msg_set
-- ----------------------------
INSERT INTO `t_comm_msg_set` VALUES ('26', '301', '感谢', '感谢来信');
INSERT INTO `t_comm_msg_set` VALUES ('27', '309', '谢谢申请职位', '谢谢申请职位');
INSERT INTO `t_comm_msg_set` VALUES ('28', '314', '维尔微软', '让她用545u45u45u45u455');
INSERT INTO `t_comm_msg_set` VALUES ('29', '316', '46y4564567456', '456745674567jfgjdjfgyjrtyujrtyurtuturtu');
INSERT INTO `t_comm_msg_set` VALUES ('30', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位');
INSERT INTO `t_comm_msg_set` VALUES ('31', '327', '面试邀请自动回复', '面试邀请自动回复');
INSERT INTO `t_comm_msg_set` VALUES ('32', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！');
INSERT INTO `t_comm_msg_set` VALUES ('33', '330', '职位申请自动回复', '职位申请自动回复');
INSERT INTO `t_comm_msg_set` VALUES ('34', '331', '职位申请自动回复', '职位申请自动回复');
INSERT INTO `t_comm_msg_set` VALUES ('35', '335', '谢谢面试邀请', '谢谢面试邀请');
INSERT INTO `t_comm_msg_set` VALUES ('36', '336', '32453453', '4563474567456745674567456745674567');
INSERT INTO `t_comm_msg_set` VALUES ('37', '338', '45用35也45', '4567457456767845674574567');

-- ----------------------------
-- Table structure for `t_comm_offlinesearchresult`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_offlinesearchresult`;
CREATE TABLE `t_comm_offlinesearchresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '搜索公司ID',
  `userName` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '搜索公司帐号',
  `industryTypeCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行业类型编码',
  `specializedTypeCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业类型编码',
  `competencyCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职能编码',
  `provinceCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域编码',
  `metier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专长',
  `educationCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学历编码',
  `workingLifeCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作年限编码',
  `age` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄',
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别0：女，1：男',
  `langCapaCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '语言能力编码',
  `masteryCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '掌握程度编码',
  `computerGradeCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '计算机能力编码',
  `isAdviser` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否顾问0：不是、1：是',
  `jobNatureCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作性质编码',
  `userInfoUpdateDate` int(11) DEFAULT NULL COMMENT '用户资料更新日期（指搜索到的人才记录）',
  `categoryIndex` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '星级指数',
  `jobKeyWord` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位关键字',
  `recruitingNumber` int(11) DEFAULT NULL COMMENT '招聘人数',
  `jobIssuetDate` datetime DEFAULT NULL COMMENT '发布日期',
  `jobExpiryDate` datetime DEFAULT NULL COMMENT '有效期结束日期',
  `jobResponsibility` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '岗位职责',
  `jobRequirements` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任职要求',
  PRIMARY KEY (`id`),
  KEY `FK_t_comm_offlinesearchresult` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=642 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业线下人才搜索记录表';

-- ----------------------------
-- Records of t_comm_offlinesearchresult
-- ----------------------------
INSERT INTO `t_comm_offlinesearchresult` VALUES ('533', '314', 'ly@dotoyo.com', '001-1009', '', '002-1003', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('534', '314', 'ly@dotoyo.com', '001-1009', '003-1001-1004', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('535', '302', 'kcoolks@126.com', '001-1001', '003-1001-1001', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('536', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('537', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('538', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('539', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('540', '314', 'ly@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('541', '314', 'ly@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('542', '314', 'ly@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('543', '314', 'ly@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('544', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('545', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('546', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('547', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '职位', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('548', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '工程监理', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('549', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('550', '317', 'qy2@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('551', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('552', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('553', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('554', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('555', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('556', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('557', '328', 'gr8@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('558', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('559', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('560', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('561', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('562', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('563', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('564', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('565', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('566', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('567', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('568', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('569', '302', 'kcoolks@126.com', '001-1005', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('570', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('571', '302', 'kcoolks@126.com', '', '', '', '110000', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('572', '302', 'kcoolks@126.com', '001-1001', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('573', '302', 'kcoolks@126.com', '', '003-1001-1006', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('574', '302', 'kcoolks@126.com', '', '', '', '540000', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('575', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('576', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '2', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('577', '302', 'kcoolks@126.com', '001-1045', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('578', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '1', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('579', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '3', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('580', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '5', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('581', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '10', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('582', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '11', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('583', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '1111', null, null, '111', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('584', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '111111111', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('585', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '1', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('586', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '123', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('587', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '123', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('588', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '123', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('589', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '1232');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('590', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '1232', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('591', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '12312', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('592', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '12312', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('593', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '1232');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('594', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '1', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('595', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('596', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('597', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '4', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('598', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('599', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('600', '330', 'qy9@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('601', '330', 'qy9@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('602', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('603', '302', 'kcoolks@126.com', '001-1001', '', '002-1003', '110000', '110100', '', '', '', '', '', '', '', '', '', '0', '', '0', '2', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('604', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('605', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('606', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('607', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('608', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('609', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('610', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('611', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('612', '302', 'kcoolks@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('613', '302', 'kcoolks@126.com', '001-1001', '003-1001-1001', '', '', '', '', '', '', '', '', '', '', '', '', '', '005-1002', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('614', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('615', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('616', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('617', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('618', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('619', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('620', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('621', '336', '886@126.com', '001-1001-1002', '', '002-1005', '440000', '440300', '', '3法规放发分', '0', '0-0', '0-0', '', '0', '0', '0', '1', '005-1002', '0', '5', '', '0', null, null, '是否vsdfbvdbd', '发布的不得不说的不是的士大夫不是代表');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('622', '336', '886@126.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('623', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('624', '331', 'dty@dotoyo.com', '', '', '', '210000', '211300', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('625', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('626', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('627', '331', 'dty@dotoyo.com', '001-1001-1004', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('628', '331', 'dty@dotoyo.com', '001-1001-1002', '', '002-1002', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('629', '331', 'dty@dotoyo.com', '001-1001-1001', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('630', '331', 'dty@dotoyo.com', '001-1001-1003', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('631', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('632', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('633', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('634', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('635', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('636', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('637', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('638', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('639', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('640', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');
INSERT INTO `t_comm_offlinesearchresult` VALUES ('641', '331', 'dty@dotoyo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '0', null, null, '', '');

-- ----------------------------
-- Table structure for `t_comm_payment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_payment`;
CREATE TABLE `t_comm_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payer` int(11) NOT NULL COMMENT '支付人',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态,0:待审核;1:已支付',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '支付金额',
  `submitDate` datetime DEFAULT NULL COMMENT '支付生成时间',
  `confirmDate` datetime DEFAULT NULL COMMENT '确认支付时间',
  `confirmMan` int(11) DEFAULT NULL COMMENT '确认操作人(id)',
  `notes` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='支付记录';

-- ----------------------------
-- Records of t_comm_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_comm_province`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_province`;
CREATE TABLE `t_comm_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '省份编码',
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='省份';

-- ----------------------------
-- Records of t_comm_province
-- ----------------------------
INSERT INTO `t_comm_province` VALUES ('33', '110000', '北京市');
INSERT INTO `t_comm_province` VALUES ('34', '120000', '天津市');
INSERT INTO `t_comm_province` VALUES ('35', '130000', '河北省');
INSERT INTO `t_comm_province` VALUES ('36', '140000', '山西省');
INSERT INTO `t_comm_province` VALUES ('37', '150000', '内蒙古');
INSERT INTO `t_comm_province` VALUES ('38', '210000', '辽宁省');
INSERT INTO `t_comm_province` VALUES ('39', '220000', '吉林省');
INSERT INTO `t_comm_province` VALUES ('40', '230000', '黑龙江');
INSERT INTO `t_comm_province` VALUES ('41', '310000', '上海市');
INSERT INTO `t_comm_province` VALUES ('42', '320000', '江苏省');
INSERT INTO `t_comm_province` VALUES ('43', '330000', '浙江省');
INSERT INTO `t_comm_province` VALUES ('44', '340000', '安徽省');
INSERT INTO `t_comm_province` VALUES ('45', '350000', '福建省');
INSERT INTO `t_comm_province` VALUES ('46', '360000', '江西省');
INSERT INTO `t_comm_province` VALUES ('47', '370000', '山东省');
INSERT INTO `t_comm_province` VALUES ('48', '410000', '河南省');
INSERT INTO `t_comm_province` VALUES ('49', '420000', '湖北省');
INSERT INTO `t_comm_province` VALUES ('50', '430000', '湖南省');
INSERT INTO `t_comm_province` VALUES ('51', '440000', '广东省');
INSERT INTO `t_comm_province` VALUES ('52', '450000', '广西');
INSERT INTO `t_comm_province` VALUES ('53', '460000', '海南省');
INSERT INTO `t_comm_province` VALUES ('54', '500000', '重庆市');
INSERT INTO `t_comm_province` VALUES ('55', '510000', '四川省');
INSERT INTO `t_comm_province` VALUES ('56', '520000', '贵州省');
INSERT INTO `t_comm_province` VALUES ('57', '530000', '云南省');
INSERT INTO `t_comm_province` VALUES ('58', '540000', '西藏');
INSERT INTO `t_comm_province` VALUES ('59', '610000', '陕西省');
INSERT INTO `t_comm_province` VALUES ('60', '620000', '甘肃省');
INSERT INTO `t_comm_province` VALUES ('61', '630000', '青海省');
INSERT INTO `t_comm_province` VALUES ('62', '640000', '宁夏');
INSERT INTO `t_comm_province` VALUES ('63', '650000', '新疆');

-- ----------------------------
-- Table structure for `t_comm_receive_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_receive_msg`;
CREATE TABLE `t_comm_receive_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiverId` int(11) NOT NULL COMMENT '接收者ID',
  `senderId` int(11) NOT NULL COMMENT '发送者ID（0表示系统信息）',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '类型（0：系统消息、1：用户消息）',
  `receiveDate` datetime NOT NULL COMMENT '接收日期',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0：未查看、1：已查看）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='收件箱站内信';

-- ----------------------------
-- Records of t_comm_receive_msg
-- ----------------------------
INSERT INTO `t_comm_receive_msg` VALUES ('599', '309', '301', '感谢', '感谢来信', '1', '2011-04-08 09:37:03', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('600', '309', '301', '感谢', '感谢来信', '1', '2011-04-08 09:37:06', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('601', '301', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-08 09:38:43', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('602', '309', '301', 'RE：谢谢申请职位', '这个功能申请成功', '1', '2011-04-08 09:39:33', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('603', '300', '301', 'RE：谢谢申请职位', '为什么会发给这么多人？', '1', '2011-04-08 09:40:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('604', '309', '301', 'RE：谢谢申请职位', '为什么会发给这么多人？', '1', '2011-04-08 09:40:19', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('605', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 09:50:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('606', '316', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-08 09:50:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('607', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 09:50:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('608', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:01:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('609', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:01:58', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('610', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:07:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('611', '307', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-08 10:07:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('612', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:07:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('613', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:07:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('614', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:07:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('615', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('616', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('617', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('618', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('619', '307', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-08 10:09:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('620', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('621', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('622', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:09:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('623', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:15:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('624', '307', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-08 10:15:28', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('625', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:15:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('626', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:15:53', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('627', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-08 10:15:55', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('628', '309', '316', '46y4564567456', '456745674567jfgjdjfgyjrtyujrtyurtuturtu', '1', '2011-04-11 10:18:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('629', '309', '301', '感谢', '感谢来信', '1', '2011-04-11 10:18:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('630', '316', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-11 11:18:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('631', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-11 11:18:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('632', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-11 11:18:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('633', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-11 11:18:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('634', '316', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-11 11:18:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('635', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-12 09:24:35被用户ly@dotoyo.com浏览。', '0', '2011-04-12 09:24:35', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('636', '314', '0', '系统消息', '你好，你发布的证书需求信息在2011-04-14 09:36:32被用户yq@dotoyo.com浏览。', '0', '2011-04-14 09:36:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('637', '309', '0', '系统消息', '你好，你发布的证书需求信息在2011-04-14 10:48:23被用户yq@dotoyo.com浏览。', '0', '2011-04-14 10:48:23', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('638', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:49:48被用户qy@dotoyo.com浏览。', '0', '2011-04-14 10:49:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('639', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:54:53被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:54:53', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('640', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:00被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('641', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:02被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('642', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:04被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('643', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:05被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:05', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('644', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:07被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('645', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:08被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('646', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:10被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('647', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:11被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:11', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('648', '301', '0', '系统消息', '你好，你发布的证书信息在2011-04-14 10:55:13被用户qy99@dotoyo.com浏览。', '0', '2011-04-14 10:55:13', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('649', '302', '316', '46y4564567456', '456745674567jfgjdjfgyjrtyujrtyurtuturtu', '1', '2011-04-14 17:24:33', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('650', '302', '327', '面试邀请自动回复', '面试邀请自动回复', '1', '2011-04-14 17:35:13', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('651', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('652', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('653', '329', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('654', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('655', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('656', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('657', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('658', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('659', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('660', '329', '309', '谢谢申请职位', '谢谢申请职位', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('661', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('662', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('663', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('664', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-14 18:00:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('665', '302', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 18:03:36', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('666', '302', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 18:03:49', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('667', '329', '330', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-14 18:09:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('668', '330', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 18:13:47', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('669', '329', '330', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-14 18:17:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('670', '329', '330', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-14 18:17:54', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('671', '330', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 18:18:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('672', '330', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 19:45:26', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('673', '330', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 19:45:42', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('674', '330', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-14 19:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('675', '309', '301', '感谢', '感谢来信', '1', '2011-04-18 09:56:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('676', '309', '327', '面试邀请自动回复', '面试邀请自动回复', '1', '2011-04-18 10:00:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('677', '324', '0', '系统消息', '你好，你发布的证书信息在2011-04-18 11:24:24被用户ly@dotoyo.com浏览。', '0', '2011-04-18 11:24:24', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('678', '329', '0', '系统消息', '你好，你发布的证书信息在2011-04-21 10:22:40被用户kcoolks@126.com浏览。', '0', '2011-04-21 10:22:40', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('679', '329', '0', '系统消息', '你好，你发布的证书信息在2011-04-21 10:24:02被用户kcoolks@126.com浏览。', '0', '2011-04-21 10:24:02', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('680', '302', '0', '系统消息', '你好，你发布的证书需求信息在2011-04-26 17:49:07被用户gr9@126.com浏览。', '0', '2011-04-26 17:49:08', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('681', '302', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-27 09:40:54', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('682', '302', '301', '感谢', '感谢来信', '1', '2011-04-27 09:40:55', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('683', '302', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-27 09:40:56', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('684', '302', '327', '面试邀请自动回复', '面试邀请自动回复', '1', '2011-04-27 09:40:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('685', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 09:42:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('686', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 09:42:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('687', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 09:42:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('688', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 09:42:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('689', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 09:42:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('690', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:07:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('691', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:07:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('692', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:07:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('693', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:07:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('694', '329', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:09:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('695', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:09:31', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('696', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:09:31', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('697', '329', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:09:31', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('698', '303', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:10:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('699', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:10:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('700', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:10:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('701', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:10:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('702', '331', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-27 11:11:55', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('703', '331', '301', '感谢', '感谢来信', '1', '2011-04-27 11:11:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('704', '331', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-04-27 11:11:58', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('705', '331', '327', '面试邀请自动回复', '面试邀请自动回复', '1', '2011-04-27 11:12:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('706', '334', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:13:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('707', '334', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:13:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('708', '334', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:13:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('709', '334', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:13:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('710', '323', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:42:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('711', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:42:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('712', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:42:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('713', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:42:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('714', '323', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:43:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('715', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:43:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('716', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:43:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('717', '323', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:43:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('718', '303', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('719', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('720', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('721', '303', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('722', '333', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:48:17', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('723', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:17', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('724', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:17', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('725', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:17', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('726', '333', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:48:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('727', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('728', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('729', '333', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:48:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('730', '307', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:51:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('731', '307', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:51:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('732', '307', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:51:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('733', '307', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:51:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('734', '325', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:52:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('735', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('736', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('737', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('738', '327', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:52:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('739', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('740', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('741', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:52:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('742', '327', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:53:36', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('743', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:53:36', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('744', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:53:36', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('745', '327', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:53:36', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('746', '332', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:56:20', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('747', '332', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:56:20', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('748', '332', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:56:20', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('749', '332', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:56:20', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('750', '308', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:58:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('751', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:58:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('752', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:58:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('753', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:58:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('754', '308', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 11:59:28', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('755', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:59:28', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('756', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:59:28', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('757', '308', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 11:59:28', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('758', '335', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 12:02:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('759', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:02:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('760', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:02:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('761', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:02:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('762', '335', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 12:04:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('763', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:04:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('764', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:04:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('765', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:04:15', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('766', '335', '314', '维尔微软', '让她用545u45u45u45u455', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('767', '335', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('768', '335', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('769', '335', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('770', '335', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('771', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('772', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('773', '335', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-27 12:05:48', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('774', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-29 16:40:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('775', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-29 16:40:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('776', '325', '302', '谢谢，我们已经收到您的职位', '谢谢，我们已经收到您的职位', '1', '2011-04-29 16:40:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('777', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('778', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('779', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('780', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('781', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('782', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('783', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('784', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('785', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('786', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-04-29 16:44:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('787', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-03 18:13:59', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('788', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-03 18:13:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('789', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-03 18:13:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('790', '329', '0', '系统消息', '你好，你发布的证书信息在2011-05-03 20:23:07被用户dty@dotoyo.com浏览。', '0', '2011-05-03 20:23:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('791', '301', '0', '系统消息', '你好，你发布的证书信息在2011-05-03 20:25:00被用户dty@dotoyo.com浏览。', '0', '2011-05-03 20:25:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('792', '336', '338', '45用35也45', '4567457456767845674574567', '1', '2011-05-04 10:33:36', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('793', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 11:17:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('794', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 11:28:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('795', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 11:28:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('796', '338', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 11:28:03', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('797', '338', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 11:29:24', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('798', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('799', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('800', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('801', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('802', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('803', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('804', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('805', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('806', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('807', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:01:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('808', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('809', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('810', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('811', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('812', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('813', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('814', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('815', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('816', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('817', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:04:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('818', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:06:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('819', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:06:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('820', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:08:42', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('821', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:08:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('822', '334', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('823', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('824', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('825', '334', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('826', '334', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('827', '334', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('828', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('829', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('830', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('831', '334', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:14:41', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('832', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('833', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('834', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('835', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('836', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('837', '339', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('838', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('839', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('840', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('841', '339', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:16:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('842', '333', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('843', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('844', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('845', '333', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('846', '333', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('847', '333', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('848', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('849', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('850', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('851', '333', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:17:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('852', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('853', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('854', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('855', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('856', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('857', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('858', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('859', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('860', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('861', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('862', '329', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('863', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('864', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('865', '329', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('866', '329', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('867', '329', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('868', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('869', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('870', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('871', '329', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:21:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('872', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:22:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('873', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('874', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('875', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:22:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('876', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:22:06', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('877', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:22:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('878', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('879', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('880', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('881', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:22:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('882', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('883', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('884', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('885', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('886', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('887', '327', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('888', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('889', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('890', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('891', '327', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 12:23:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('892', '303', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('893', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('894', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('895', '303', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('896', '303', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('897', '303', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('898', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('899', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('900', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('901', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:32:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('902', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('903', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('904', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('905', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('906', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('907', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('908', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('909', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('910', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('911', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:34', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('912', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('913', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('914', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('915', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('916', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('917', '307', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('918', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('919', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('920', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('921', '307', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:33:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('922', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('923', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('924', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('925', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('926', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('927', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('928', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('929', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('930', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('931', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:34:51', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('932', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('933', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('934', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('935', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('936', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('937', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('938', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('939', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('940', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('941', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('942', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('943', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('944', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('945', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('946', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('947', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('948', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('949', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('950', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('951', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('952', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('953', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('954', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('955', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('956', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('957', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('958', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('959', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('960', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('961', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:35:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('962', '340', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('963', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('964', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('965', '340', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('966', '340', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('967', '340', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('968', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('969', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('970', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('971', '340', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 14:59:37', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('972', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('973', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('974', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('975', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('976', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('977', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('978', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('979', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('980', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('981', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:07:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('982', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('983', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('984', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('985', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('986', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('987', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('988', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('989', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('990', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('991', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:08:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('992', '341', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('993', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('994', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('995', '341', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('996', '341', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('997', '341', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('998', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('999', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1000', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1001', '341', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-04 15:10:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1002', '329', '0', '系统消息', '你好，你发布的证书信息在2011-05-04 16:15:11被用户886@126.com浏览。', '0', '2011-05-04 16:15:11', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1003', '333', '0', '系统消息', '你好，你发布的证书信息在2011-05-04 16:15:24被用户886@126.com浏览。', '0', '2011-05-04 16:15:24', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1004', '324', '0', '系统消息', '你好，你发布的证书信息在2011-05-04 16:15:49被用户886@126.com浏览。', '0', '2011-05-04 16:15:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1005', '333', '0', '系统消息', '你好，你发布的证书信息在2011-05-04 16:16:04被用户886@126.com浏览。', '0', '2011-05-04 16:16:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1006', '333', '0', '系统消息', '你好，你发布的证书信息在2011-05-04 16:23:18被用户886@126.com浏览。', '0', '2011-05-04 16:23:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1007', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1008', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1009', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1010', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1011', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1012', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1013', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1014', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1015', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1016', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:26:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1017', '343', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1018', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1019', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1020', '343', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1021', '343', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1022', '343', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1023', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1024', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1025', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1026', '343', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:00', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1027', '342', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1028', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1029', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1030', '342', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1031', '342', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1032', '342', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1033', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1034', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1035', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1036', '342', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:42:25', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1037', '344', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1038', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1039', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1040', '344', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1041', '344', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1042', '344', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1043', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1044', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1045', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1046', '344', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:45:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1047', '345', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1048', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1049', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1050', '345', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1051', '345', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1052', '345', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1053', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1054', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1055', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1056', '345', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:47:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1057', '315', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1058', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1059', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1060', '315', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1061', '315', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1062', '315', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1063', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1064', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1065', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1066', '315', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 11:53:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1067', '346', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:17:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1068', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1069', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1070', '346', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1071', '346', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1072', '346', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1073', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1074', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1075', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1076', '346', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:17:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1077', '347', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1078', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1079', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1080', '347', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1081', '347', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1082', '347', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1083', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1084', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1085', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1086', '347', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:18:21', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1087', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1088', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1089', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1090', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1091', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1092', '332', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1093', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1094', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1095', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1096', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:41:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1097', '325', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1098', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1099', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1100', '325', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1101', '325', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1102', '325', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1103', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1104', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1105', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1106', '325', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-06 15:42:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1107', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1108', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1109', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1110', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1111', '310', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1112', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1113', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1114', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1115', '310', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:12:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1116', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1117', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1118', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1119', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1120', '308', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1121', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1122', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1123', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1124', '308', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:15:30', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1125', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:16:09', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1126', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:16:09', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1127', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:16:09', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1128', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:16:09', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1129', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:16:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1130', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:16:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1131', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:16:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1132', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:16:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1133', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:16:10', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1134', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1135', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1136', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1137', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1138', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1139', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1140', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1141', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1142', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:54:27', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1143', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1144', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1145', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1146', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1147', '323', '336', '32453453', '4563474567456745674567456745674567', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1148', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1149', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1150', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1151', '323', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-05-09 15:56:22', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1152', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:16:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1153', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:16:18', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1154', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:16:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1155', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1156', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1157', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1158', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1159', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1160', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1161', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1162', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1163', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1164', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1165', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:17:59', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1166', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1167', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1168', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1169', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1170', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1171', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1172', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1173', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1174', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1175', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:19', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1176', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:32', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1177', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:40', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1178', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1179', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1180', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1181', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1182', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1183', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1184', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1185', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1186', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1187', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1188', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:18:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1189', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1190', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1191', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1192', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1193', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1194', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1195', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1196', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1197', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1198', '332', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:19:29', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1199', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1200', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1201', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1202', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1203', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1204', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1205', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1206', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1207', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1208', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:20:46', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1209', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1210', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1211', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1212', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1213', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1214', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1215', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1216', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1217', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1218', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1219', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1220', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1221', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1222', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1223', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1224', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1225', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:21:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1226', '331', '301', '感谢', '感谢来信', '1', '2011-07-20 11:23:01', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1227', '331', '329', '谢谢邀请面试，已收到！', '谢谢邀请面试，已收到！\r\n我定会准时到达贵公司进行面试！', '1', '2011-07-20 11:23:03', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('1228', '331', '327', '面试邀请自动回复', '面试邀请自动回复', '1', '2011-07-20 11:23:04', '1');
INSERT INTO `t_comm_receive_msg` VALUES ('1229', '303', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 11:38:13', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1230', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:48:56被用户dty@dotoyo.com浏览。', '0', '2011-07-20 17:48:56', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1231', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:54:02被用户qy11@126.com浏览。', '0', '2011-07-20 17:54:02', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1232', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:54:54被用户qy11@126.com浏览。', '0', '2011-07-20 17:54:54', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1233', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:54:58被用户qy11@126.com浏览。', '0', '2011-07-20 17:54:58', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1234', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:04被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:04', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1235', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:09被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:09', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1236', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:38被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:38', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1237', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:42被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:42', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1238', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:45被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1239', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:49被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:49', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1240', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:53被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:53', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1241', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:55:57被用户qy11@126.com浏览。', '0', '2011-07-20 17:55:57', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1242', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:56:01被用户qy11@126.com浏览。', '0', '2011-07-20 17:56:01', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1243', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:56:05被用户qy11@126.com浏览。', '0', '2011-07-20 17:56:05', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1244', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:56:08被用户qy11@126.com浏览。', '0', '2011-07-20 17:56:08', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1245', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 17:56:50被用户qy11@126.com浏览。', '0', '2011-07-20 17:56:50', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1246', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1247', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1248', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1249', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1250', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1251', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1252', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:44', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1253', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1254', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1255', '352', '331', '职位申请自动回复', '职位申请自动回复', '1', '2011-07-20 18:09:45', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1256', '352', '331', 'RE：谢谢邀请面试，已收到！', 'RE：谢谢邀请面试，已收到！', '1', '2011-07-20 18:10:12', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1257', '329', '331', 'RE：谢谢邀请面试，已收到！', 'RE：谢谢邀请面试，已收到！', '1', '2011-07-20 18:10:12', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1258', '352', '331', 'RE：谢谢邀请面试，已收到！', 'RE：谢谢邀请面试，已收到！', '1', '2011-07-20 18:10:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1259', '329', '331', 'RE：谢谢邀请面试，已收到！', 'RE：谢谢邀请面试，已收到！', '1', '2011-07-20 18:10:14', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1260', '327', '331', 'RE：面试邀请自动回复', '12321', '1', '2011-07-20 18:10:52', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1261', '352', '331', 'RE：面试邀请自动回复', '123123', '1', '2011-07-20 18:11:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1262', '327', '331', 'RE：面试邀请自动回复', '123123', '1', '2011-07-20 18:11:07', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1263', '352', '331', 'RE：谢谢邀请面试，已收到！1232', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:13:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1264', '327', '331', 'RE：谢谢邀请面试，已收到！1232', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:13:39', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1265', '303', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1266', '307', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1267', '308', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1268', '310', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1269', '315', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1270', '323', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1271', '325', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1272', '327', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1273', '329', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1274', '352', '331', 'RE：面试邀请自动回复', 'RE：谢谢邀请面试，已收到！1232', '1', '2011-07-20 18:14:16', '0');
INSERT INTO `t_comm_receive_msg` VALUES ('1275', '329', '0', '系统消息', '你好，你发布的证书信息在2011-07-20 18:44:41被用户dty@dotoyo.com浏览。', '0', '2011-07-20 18:44:41', '0');

-- ----------------------------
-- Table structure for `t_comm_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_role`;
CREATE TABLE `t_comm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_ROLE_CODE` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统角色表';

-- ----------------------------
-- Records of t_comm_role
-- ----------------------------
INSERT INTO `t_comm_role` VALUES ('142', 'js100', '信息官');
INSERT INTO `t_comm_role` VALUES ('143', 'js101', '付费会员');

-- ----------------------------
-- Table structure for `t_comm_role_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_role_admin`;
CREATE TABLE `t_comm_role_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_ROLE_ADMIN_CODE` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统角色表';

-- ----------------------------
-- Records of t_comm_role_admin
-- ----------------------------
INSERT INTO `t_comm_role_admin` VALUES ('279', 'JS-002', '支付管理');
INSERT INTO `t_comm_role_admin` VALUES ('276', 'js100', '超级管理员');
INSERT INTO `t_comm_role_admin` VALUES ('278', 'js101', '编辑');
INSERT INTO `t_comm_role_admin` VALUES ('280', 'js005', '测试1');

-- ----------------------------
-- Table structure for `t_comm_sys_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_sys_parameter`;
CREATE TABLE `t_comm_sys_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `sysValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '值',
  `notes` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统参数表';

-- ----------------------------
-- Records of t_comm_sys_parameter
-- ----------------------------
INSERT INTO `t_comm_sys_parameter` VALUES ('1', '10001', '上传图片审核设置', '1', '上传图片审核设置开关。0--不需要审核，1--需要审核');
INSERT INTO `t_comm_sys_parameter` VALUES ('2', '10002', '上传视频审核设置', '1', '上传视频审核设置开关。0--不需要审核，1--需要审核');
INSERT INTO `t_comm_sys_parameter` VALUES ('3', '10003', '支付期限', '1', '会员预定服务支付期限天数');

-- ----------------------------
-- Table structure for `t_comm_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_user_role`;
CREATE TABLE `t_comm_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_USER_ROLE_USERROLEID` (`userid`,`roleid`) USING BTREE,
  KEY `FK_T_COMM_USER_ROLE_ROLEID` (`roleid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='会员角色分配表';

-- ----------------------------
-- Records of t_comm_user_role
-- ----------------------------
INSERT INTO `t_comm_user_role` VALUES ('145', '311', '142');
INSERT INTO `t_comm_user_role` VALUES ('142', '304', '143');
INSERT INTO `t_comm_user_role` VALUES ('143', '302', '143');
INSERT INTO `t_comm_user_role` VALUES ('144', '303', '142');

-- ----------------------------
-- Table structure for `t_comm_user_role_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_comm_user_role_admin`;
CREATE TABLE `t_comm_user_role_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '管理员ID',
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_COMM_USER_ROLE_AM_USERROLEID` (`userid`,`roleid`) USING BTREE,
  KEY `FK_T_COMM_USER_ROLE_AM_ROLEID` (`roleid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员角色分配表';

-- ----------------------------
-- Records of t_comm_user_role_admin
-- ----------------------------
INSERT INTO `t_comm_user_role_admin` VALUES ('132', '687', '276');
INSERT INTO `t_comm_user_role_admin` VALUES ('137', '689', '276');
INSERT INTO `t_comm_user_role_admin` VALUES ('138', '690', '276');
INSERT INTO `t_comm_user_role_admin` VALUES ('135', '688', '276');
INSERT INTO `t_comm_user_role_admin` VALUES ('136', '692', '276');
INSERT INTO `t_comm_user_role_admin` VALUES ('145', '691', '279');
INSERT INTO `t_comm_user_role_admin` VALUES ('144', '691', '278');
INSERT INTO `t_comm_user_role_admin` VALUES ('148', '694', '278');
INSERT INTO `t_comm_user_role_admin` VALUES ('147', '694', '279');

-- ----------------------------
-- Table structure for `t_hhc_applicationjobrecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_hhc_applicationjobrecord`;
CREATE TABLE `t_hhc_applicationjobrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `jobId` int(11) DEFAULT NULL COMMENT '职位Id',
  `recruitLtdId` int(11) DEFAULT NULL COMMENT '招聘公司Id',
  `applicationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '申请状态:0 未查看,1 已查看,2 已发送面试邀请',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2449 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户职位申请记录表';

-- ----------------------------
-- Records of t_hhc_applicationjobrecord
-- ----------------------------
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1678', '301', '2490', '314', '2011-04-08 09:27:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1679', '301', '2486', '312', '2011-04-08 09:27:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1680', '301', '2487', '312', '2011-04-08 09:27:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1681', '301', '2491', '314', '2011-04-08 09:27:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1682', '301', '2490', '314', '2011-04-08 09:29:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1683', '316', '2490', '314', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1684', '316', '2489', '314', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1685', '316', '2486', '312', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1686', '316', '2487', '312', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1687', '316', '2488', '314', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1688', '316', '2491', '314', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1689', '316', '2483', '302', '2011-04-08 09:34:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1690', '316', '2490', '314', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1691', '316', '2489', '314', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1692', '316', '2486', '312', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1693', '316', '2487', '312', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1694', '316', '2488', '314', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1695', '316', '2491', '314', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1696', '316', '2483', '302', '2011-04-08 09:34:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1697', '301', '2492', '309', '2011-04-08 09:35:43', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1698', '316', '2488', '314', '2011-04-08 09:37:05', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1699', '316', '2487', '312', '2011-04-08 09:37:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1700', '316', '2489', '314', '2011-04-08 09:37:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1701', '316', '2490', '314', '2011-04-08 09:38:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1702', '316', '2490', '314', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1703', '316', '2489', '314', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1704', '316', '2486', '312', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1705', '316', '2487', '312', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1706', '316', '2488', '314', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1707', '316', '2491', '314', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1708', '316', '2483', '302', '2011-04-08 09:38:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1709', '301', '2492', '309', '2011-04-08 09:38:43', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1710', '316', '2487', '312', '2011-04-08 09:43:35', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1711', '316', '2490', '314', '2011-04-08 09:50:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1712', '316', '2492', '309', '2011-04-08 09:50:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1713', '316', '2489', '314', '2011-04-08 09:50:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1714', '316', '2486', '312', '2011-04-08 09:50:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1715', '316', '2487', '312', '2011-04-08 09:50:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1716', '316', '2490', '314', '2011-04-08 10:01:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1717', '316', '2489', '314', '2011-04-08 10:01:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1718', '307', '2490', '314', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1719', '307', '2492', '309', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1720', '307', '2493', '302', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1721', '307', '2489', '314', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1722', '307', '2486', '312', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1723', '307', '2487', '312', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1724', '307', '2488', '314', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1725', '307', '2491', '314', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1726', '307', '2483', '302', '2011-04-08 10:07:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1727', '307', '2483', '302', '2011-04-08 10:08:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1728', '307', '2483', '302', '2011-04-08 10:08:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1729', '307', '2483', '302', '2011-04-08 10:08:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1730', '307', '2490', '314', '2011-04-08 10:09:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1731', '307', '2483', '302', '2011-04-08 10:09:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1732', '307', '2491', '314', '2011-04-08 10:09:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1733', '307', '2488', '314', '2011-04-08 10:09:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1734', '307', '2487', '312', '2011-04-08 10:09:42', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1735', '307', '2490', '314', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1736', '307', '2492', '309', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1737', '307', '2493', '302', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1738', '307', '2489', '314', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1739', '307', '2486', '312', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1740', '307', '2487', '312', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1741', '307', '2488', '314', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1742', '307', '2491', '314', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1743', '307', '2483', '302', '2011-04-08 10:09:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1744', '307', '2483', '302', '2011-04-08 10:09:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1745', '307', '2483', '302', '2011-04-08 10:09:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1746', '307', '2483', '302', '2011-04-08 10:09:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1747', '307', '2490', '314', '2011-04-08 10:15:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1748', '307', '2492', '309', '2011-04-08 10:15:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1749', '307', '2493', '302', '2011-04-08 10:15:43', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1750', '307', '2489', '314', '2011-04-08 10:15:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1751', '307', '2486', '312', '2011-04-08 10:15:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1752', '307', '2487', '312', '2011-04-08 10:15:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1753', '307', '2488', '314', '2011-04-08 10:15:53', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1754', '307', '2491', '314', '2011-04-08 10:15:55', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1755', '307', '2483', '302', '2011-04-08 10:15:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1756', '307', '2483', '302', '2011-04-08 10:22:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1757', '307', '2483', '302', '2011-04-08 10:23:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1758', '307', '2493', '302', '2011-04-08 10:27:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1759', '316', '2483', '302', '2011-04-08 10:29:56', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1760', '307', '2483', '302', '2011-04-08 10:35:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1764', '316', '2495', '309', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1762', '307', '2483', '302', '2011-04-08 10:38:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1763', '307', '2483', '302', '2011-04-08 12:25:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1765', '316', '2496', '314', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1766', '316', '2493', '302', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1767', '316', '2489', '314', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1768', '316', '2488', '314', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1769', '316', '2491', '314', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1770', '316', '2483', '302', '2011-04-11 11:18:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1771', '316', '2483', '302', '2011-04-11 15:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1772', '316', '2483', '302', '2011-04-11 15:18:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1792', '329', '2488', '314', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1784', '329', '2500', '321', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1785', '329', '2501', '326', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1786', '329', '2497', '302', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1787', '329', '2498', '302', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1788', '329', '2495', '309', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1789', '329', '2496', '314', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1790', '329', '2493', '302', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1791', '329', '2489', '314', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1783', '329', '2499', '321', '2011-04-14 18:00:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1793', '329', '2502', '330', '2011-04-14 18:06:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1794', '329', '2502', '330', '2011-04-14 18:08:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1795', '329', '2502', '330', '2011-04-14 18:08:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1796', '329', '2502', '330', '2011-04-14 18:09:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1797', '329', '2502', '330', '2011-04-14 18:17:26', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1798', '329', '2502', '330', '2011-04-14 18:17:54', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1799', '329', '2558', '314', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1800', '329', '2548', '331', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1801', '329', '2554', '331', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1802', '329', '2555', '331', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1803', '329', '2556', '331', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1804', '329', '2500', '321', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1805', '329', '2497', '302', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1806', '329', '2498', '302', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1807', '329', '2493', '302', '2011-04-27 09:42:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1808', '329', '2558', '314', '2011-04-27 09:42:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1809', '329', '2558', '314', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1810', '329', '2548', '331', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1811', '329', '2554', '331', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1812', '329', '2555', '331', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1813', '329', '2556', '331', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1814', '329', '2500', '321', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1815', '329', '2497', '302', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1816', '329', '2498', '302', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1817', '329', '2493', '302', '2011-04-27 11:07:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1818', '329', '2558', '314', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1819', '329', '2548', '331', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1820', '329', '2554', '331', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1821', '329', '2555', '331', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1822', '329', '2556', '331', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1823', '329', '2500', '321', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1824', '329', '2497', '302', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1825', '329', '2498', '302', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1826', '329', '2493', '302', '2011-04-27 11:09:31', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1827', '303', '2558', '314', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1828', '303', '2548', '331', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1829', '303', '2554', '331', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1830', '303', '2555', '331', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1831', '303', '2556', '331', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1832', '303', '2500', '321', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1833', '303', '2497', '302', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1834', '303', '2498', '302', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1835', '303', '2493', '302', '2011-04-27 11:10:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1836', '334', '2558', '314', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1837', '334', '2548', '331', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1838', '334', '2554', '331', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1839', '334', '2555', '331', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1840', '334', '2556', '331', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1841', '334', '2500', '321', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1842', '334', '2497', '302', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1843', '334', '2498', '302', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1844', '334', '2493', '302', '2011-04-27 11:13:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1845', '310', '2556', '331', '2011-04-27 11:37:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1846', '310', '2556', '331', '2011-04-27 11:38:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1847', '310', '2556', '331', '2011-04-27 11:39:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1848', '310', '2554', '331', '2011-04-27 11:40:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1849', '310', '2555', '331', '2011-04-27 11:40:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1850', '323', '2556', '331', '2011-04-27 11:42:02', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1851', '323', '2555', '331', '2011-04-27 11:42:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1852', '323', '2558', '314', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1853', '323', '2548', '331', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1854', '323', '2554', '331', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1855', '323', '2555', '331', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1856', '323', '2556', '331', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1857', '323', '2500', '321', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1858', '323', '2497', '302', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1859', '323', '2498', '302', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1860', '323', '2493', '302', '2011-04-27 11:42:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1861', '323', '2558', '314', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1862', '323', '2548', '331', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1863', '323', '2554', '331', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1864', '323', '2555', '331', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1865', '323', '2556', '331', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1866', '323', '2500', '321', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1867', '323', '2497', '302', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1868', '323', '2498', '302', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1869', '323', '2493', '302', '2011-04-27 11:43:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1870', '303', '2558', '314', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1871', '303', '2548', '331', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1872', '303', '2554', '331', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1873', '303', '2555', '331', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1874', '303', '2556', '331', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1875', '303', '2500', '321', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1876', '303', '2497', '302', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1877', '303', '2498', '302', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1878', '303', '2493', '302', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1879', '324', '2556', '331', '2011-04-27 11:47:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1880', '333', '2556', '331', '2011-04-27 11:48:11', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1881', '333', '2558', '314', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1882', '333', '2548', '331', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1883', '333', '2554', '331', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1884', '333', '2555', '331', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1885', '333', '2556', '331', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1886', '333', '2500', '321', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1887', '333', '2497', '302', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1888', '333', '2498', '302', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1889', '333', '2493', '302', '2011-04-27 11:48:17', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1890', '333', '2558', '314', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1891', '333', '2548', '331', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1892', '333', '2554', '331', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1893', '333', '2555', '331', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1894', '333', '2556', '331', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1895', '333', '2500', '321', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1896', '333', '2497', '302', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1897', '333', '2498', '302', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1898', '333', '2493', '302', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1899', '307', '2556', '331', '2011-04-27 11:51:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1900', '307', '2558', '314', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1901', '307', '2548', '331', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1902', '307', '2554', '331', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1903', '307', '2555', '331', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1904', '307', '2556', '331', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1905', '307', '2500', '321', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1906', '307', '2497', '302', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1907', '307', '2498', '302', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1908', '307', '2493', '302', '2011-04-27 11:51:39', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1909', '325', '2558', '314', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1910', '325', '2548', '331', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1911', '325', '2554', '331', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1912', '325', '2555', '331', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1913', '325', '2556', '331', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1914', '325', '2500', '321', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1915', '325', '2497', '302', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1916', '325', '2498', '302', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1917', '325', '2493', '302', '2011-04-27 11:52:14', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1918', '327', '2558', '314', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1919', '327', '2548', '331', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1920', '327', '2554', '331', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1921', '327', '2555', '331', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1922', '327', '2556', '331', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1923', '327', '2500', '321', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1924', '327', '2497', '302', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1925', '327', '2498', '302', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1926', '327', '2493', '302', '2011-04-27 11:52:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1927', '327', '2558', '314', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1928', '327', '2548', '331', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1929', '327', '2554', '331', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1930', '327', '2555', '331', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1931', '327', '2556', '331', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1932', '327', '2500', '321', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1933', '327', '2497', '302', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1934', '327', '2498', '302', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1935', '327', '2493', '302', '2011-04-27 11:53:36', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1936', '332', '2558', '314', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1937', '332', '2548', '331', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1938', '332', '2554', '331', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1939', '332', '2555', '331', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1940', '332', '2556', '331', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1941', '332', '2500', '321', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1942', '332', '2497', '302', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1943', '332', '2498', '302', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1944', '332', '2493', '302', '2011-04-27 11:56:20', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1945', '308', '2558', '314', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1946', '308', '2548', '331', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1947', '308', '2554', '331', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1948', '308', '2555', '331', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1949', '308', '2556', '331', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1950', '308', '2500', '321', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1951', '308', '2497', '302', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1952', '308', '2498', '302', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1953', '308', '2493', '302', '2011-04-27 11:58:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1954', '308', '2558', '314', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1955', '308', '2548', '331', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1956', '308', '2554', '331', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1957', '308', '2555', '331', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1958', '308', '2556', '331', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1959', '308', '2500', '321', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1960', '308', '2497', '302', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1961', '308', '2498', '302', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1962', '308', '2493', '302', '2011-04-27 11:59:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1989', '335', '2493', '302', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1988', '335', '2498', '302', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1987', '335', '2497', '302', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1986', '335', '2500', '321', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1985', '335', '2556', '331', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1984', '335', '2555', '331', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1983', '335', '2554', '331', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1982', '335', '2548', '331', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1981', '335', '2558', '314', '2011-04-27 12:05:48', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1990', '325', '2500', '321', '2011-04-29 16:40:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1991', '325', '2497', '302', '2011-04-29 16:40:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1992', '325', '2498', '302', '2011-04-29 16:40:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1993', '325', '2493', '302', '2011-04-29 16:40:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1994', '327', '2548', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1995', '327', '2549', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1996', '327', '2550', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1997', '327', '2551', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1998', '327', '2552', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('1999', '327', '2553', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2000', '327', '2554', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2001', '327', '2555', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2002', '327', '2556', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2003', '327', '2544', '331', '2011-04-29 16:44:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2004', '337', '2561', '336', '2011-05-03 18:02:11', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2005', '337', '2562', '336', '2011-05-03 18:02:11', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2006', '337', '2564', '336', '2011-05-03 18:02:11', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2007', '338', '2561', '336', '2011-05-03 18:13:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2008', '338', '2562', '336', '2011-05-03 18:13:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2009', '338', '2564', '336', '2011-05-03 18:13:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2010', '338', '2561', '336', '2011-05-04 11:17:16', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2011', '338', '2561', '336', '2011-05-04 11:28:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2012', '338', '2562', '336', '2011-05-04 11:28:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2013', '338', '2564', '336', '2011-05-04 11:28:03', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2014', '338', '2566', '331', '2011-05-04 11:29:24', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2015', '307', '2565', '336', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2016', '307', '2566', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2017', '307', '2567', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2018', '307', '2561', '336', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2019', '307', '2562', '336', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2020', '307', '2564', '336', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2021', '307', '2548', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2022', '307', '2549', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2023', '307', '2550', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2024', '307', '2551', '331', '2011-05-04 12:01:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2025', '339', '2565', '336', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2026', '339', '2566', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2027', '339', '2567', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2028', '339', '2561', '336', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2029', '339', '2562', '336', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2030', '339', '2564', '336', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2031', '339', '2548', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2032', '339', '2549', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2033', '339', '2550', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2034', '339', '2551', '331', '2011-05-04 12:04:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2035', '339', '2566', '331', '2011-05-04 12:06:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2036', '339', '2567', '331', '2011-05-04 12:06:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2037', '339', '2561', '336', '2011-05-04 12:08:42', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2038', '339', '2561', '336', '2011-05-04 12:08:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2039', '334', '2565', '336', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2040', '334', '2566', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2041', '334', '2567', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2042', '334', '2561', '336', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2043', '334', '2562', '336', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2044', '334', '2564', '336', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2045', '334', '2548', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2046', '334', '2549', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2047', '334', '2550', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2048', '334', '2551', '331', '2011-05-04 12:14:41', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2049', '339', '2565', '336', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2050', '339', '2566', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2051', '339', '2567', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2052', '339', '2561', '336', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2053', '339', '2562', '336', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2054', '339', '2564', '336', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2055', '339', '2548', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2056', '339', '2549', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2057', '339', '2550', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2058', '339', '2551', '331', '2011-05-04 12:16:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2059', '333', '2565', '336', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2060', '333', '2566', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2061', '333', '2567', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2062', '333', '2561', '336', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2063', '333', '2562', '336', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2064', '333', '2564', '336', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2065', '333', '2548', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2066', '333', '2549', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2067', '333', '2550', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2068', '333', '2551', '331', '2011-05-04 12:17:06', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2069', '332', '2565', '336', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2070', '332', '2566', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2071', '332', '2567', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2072', '332', '2561', '336', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2073', '332', '2562', '336', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2074', '332', '2564', '336', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2075', '332', '2548', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2076', '332', '2549', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2077', '332', '2550', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2078', '332', '2551', '331', '2011-05-04 12:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2079', '329', '2565', '336', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2080', '329', '2566', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2081', '329', '2567', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2082', '329', '2561', '336', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2083', '329', '2562', '336', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2084', '329', '2564', '336', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2085', '329', '2548', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2086', '329', '2549', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2087', '329', '2550', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2088', '329', '2551', '331', '2011-05-04 12:21:04', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2089', '327', '2565', '336', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2090', '327', '2566', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2091', '327', '2567', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2092', '327', '2561', '336', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2093', '327', '2562', '336', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2094', '327', '2564', '336', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2095', '327', '2548', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2096', '327', '2549', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2097', '327', '2550', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2098', '327', '2551', '331', '2011-05-04 12:22:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2099', '327', '2565', '336', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2100', '327', '2566', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2101', '327', '2567', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2102', '327', '2561', '336', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2103', '327', '2562', '336', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2104', '327', '2564', '336', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2105', '327', '2548', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2106', '327', '2549', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2107', '327', '2550', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2108', '327', '2551', '331', '2011-05-04 12:23:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2109', '303', '2565', '336', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2110', '303', '2566', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2111', '303', '2567', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2112', '303', '2561', '336', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2113', '303', '2562', '336', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2114', '303', '2564', '336', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2115', '303', '2548', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2116', '303', '2549', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2117', '303', '2550', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2118', '303', '2551', '331', '2011-05-04 14:32:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2119', '307', '2565', '336', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2120', '307', '2566', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2121', '307', '2567', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2122', '307', '2561', '336', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2123', '307', '2562', '336', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2124', '307', '2564', '336', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2125', '307', '2548', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2126', '307', '2549', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2127', '307', '2550', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2128', '307', '2551', '331', '2011-05-04 14:33:34', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2129', '307', '2565', '336', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2130', '307', '2566', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2131', '307', '2567', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2132', '307', '2561', '336', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2133', '307', '2562', '336', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2134', '307', '2564', '336', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2135', '307', '2548', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2136', '307', '2549', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2137', '307', '2550', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2138', '307', '2551', '331', '2011-05-04 14:33:52', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2139', '308', '2565', '336', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2140', '308', '2566', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2141', '308', '2567', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2142', '308', '2561', '336', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2143', '308', '2562', '336', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2144', '308', '2564', '336', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2145', '308', '2548', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2146', '308', '2549', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2147', '308', '2550', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2148', '308', '2551', '331', '2011-05-04 14:34:51', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2149', '308', '2565', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2150', '308', '2566', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2151', '308', '2567', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2152', '308', '2561', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2153', '308', '2562', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2154', '308', '2564', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2155', '308', '2548', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2156', '308', '2549', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2157', '308', '2550', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2158', '308', '2551', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2159', '308', '2565', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2160', '308', '2566', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2161', '308', '2567', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2162', '308', '2561', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2163', '308', '2562', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2164', '308', '2564', '336', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2165', '308', '2548', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2166', '308', '2549', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2167', '308', '2550', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2168', '308', '2551', '331', '2011-05-04 14:35:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2169', '310', '2565', '336', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2170', '310', '2566', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2171', '310', '2567', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2172', '310', '2561', '336', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2173', '310', '2562', '336', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2174', '310', '2564', '336', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2175', '310', '2548', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2176', '310', '2549', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2177', '310', '2550', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2178', '310', '2551', '331', '2011-05-04 14:35:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2179', '340', '2565', '336', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2180', '340', '2566', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2181', '340', '2567', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2182', '340', '2561', '336', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2183', '340', '2562', '336', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2184', '340', '2564', '336', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2185', '340', '2548', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2186', '340', '2549', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2187', '340', '2550', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2188', '340', '2551', '331', '2011-05-04 14:59:37', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2189', '310', '2565', '336', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2190', '310', '2566', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2191', '310', '2567', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2192', '310', '2561', '336', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2193', '310', '2562', '336', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2194', '310', '2564', '336', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2195', '310', '2548', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2196', '310', '2549', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2197', '310', '2550', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2198', '310', '2551', '331', '2011-05-04 15:07:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2199', '323', '2565', '336', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2200', '323', '2566', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2201', '323', '2567', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2202', '323', '2561', '336', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2203', '323', '2562', '336', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2204', '323', '2564', '336', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2205', '323', '2548', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2206', '323', '2549', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2207', '323', '2550', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2208', '323', '2551', '331', '2011-05-04 15:08:58', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2209', '341', '2565', '336', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2210', '341', '2566', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2211', '341', '2567', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2212', '341', '2561', '336', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2213', '341', '2562', '336', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2214', '341', '2564', '336', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2215', '341', '2548', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2216', '341', '2549', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2217', '341', '2550', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2218', '341', '2551', '331', '2011-05-04 15:10:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2219', '323', '2565', '336', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2220', '323', '2566', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2221', '323', '2567', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2222', '323', '2561', '336', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2223', '323', '2562', '336', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2224', '323', '2564', '336', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2225', '323', '2548', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2226', '323', '2549', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2227', '323', '2550', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2228', '323', '2551', '331', '2011-05-06 11:26:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2229', '343', '2565', '336', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2230', '343', '2566', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2231', '343', '2567', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2232', '343', '2561', '336', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2233', '343', '2562', '336', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2234', '343', '2564', '336', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2235', '343', '2548', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2236', '343', '2549', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2237', '343', '2550', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2238', '343', '2551', '331', '2011-05-06 11:42:00', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2239', '342', '2565', '336', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2240', '342', '2566', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2241', '342', '2567', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2242', '342', '2561', '336', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2243', '342', '2562', '336', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2244', '342', '2564', '336', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2245', '342', '2548', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2246', '342', '2549', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2247', '342', '2550', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2248', '342', '2551', '331', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2249', '344', '2565', '336', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2250', '344', '2566', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2251', '344', '2567', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2252', '344', '2561', '336', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2253', '344', '2562', '336', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2254', '344', '2564', '336', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2255', '344', '2548', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2256', '344', '2549', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2257', '344', '2550', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2258', '344', '2551', '331', '2011-05-06 11:45:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2259', '345', '2565', '336', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2260', '345', '2566', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2261', '345', '2567', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2262', '345', '2561', '336', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2263', '345', '2562', '336', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2264', '345', '2564', '336', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2265', '345', '2548', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2266', '345', '2549', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2267', '345', '2550', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2268', '345', '2551', '331', '2011-05-06 11:47:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2269', '315', '2565', '336', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2270', '315', '2566', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2271', '315', '2567', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2272', '315', '2561', '336', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2273', '315', '2562', '336', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2274', '315', '2564', '336', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2275', '315', '2548', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2276', '315', '2549', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2277', '315', '2550', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2278', '315', '2551', '331', '2011-05-06 11:53:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2279', '346', '2565', '336', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2280', '346', '2566', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2281', '346', '2567', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2282', '346', '2561', '336', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2283', '346', '2562', '336', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2284', '346', '2564', '336', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2285', '346', '2548', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2286', '346', '2549', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2287', '346', '2550', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2288', '346', '2551', '331', '2011-05-06 15:17:50', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2289', '347', '2565', '336', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2290', '347', '2566', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2291', '347', '2567', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2292', '347', '2561', '336', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2293', '347', '2562', '336', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2294', '347', '2564', '336', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2295', '347', '2548', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2296', '347', '2549', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2297', '347', '2550', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2298', '347', '2551', '331', '2011-05-06 15:18:21', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2299', '332', '2565', '336', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2300', '332', '2566', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2301', '332', '2567', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2302', '332', '2561', '336', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2303', '332', '2562', '336', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2304', '332', '2564', '336', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2305', '332', '2548', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2306', '332', '2549', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2307', '332', '2550', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2308', '332', '2551', '331', '2011-05-06 15:41:07', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2309', '325', '2565', '336', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2310', '325', '2566', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2311', '325', '2567', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2312', '325', '2561', '336', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2313', '325', '2562', '336', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2314', '325', '2564', '336', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2315', '325', '2548', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2316', '325', '2549', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2317', '325', '2550', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2318', '325', '2551', '331', '2011-05-06 15:42:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2319', '310', '2565', '336', '2011-05-09 15:12:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2320', '310', '2567', '331', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2321', '310', '2561', '336', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2322', '310', '2562', '336', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2323', '310', '2564', '336', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2324', '310', '2548', '331', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2325', '310', '2554', '331', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2326', '310', '2555', '331', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2327', '310', '2556', '331', '2011-05-09 15:12:28', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2328', '308', '2565', '336', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2329', '308', '2567', '331', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2330', '308', '2561', '336', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2331', '308', '2562', '336', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2332', '308', '2564', '336', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2333', '308', '2548', '331', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2334', '308', '2554', '331', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2335', '308', '2555', '331', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2336', '308', '2556', '331', '2011-05-09 15:15:30', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2337', '323', '2565', '336', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2338', '323', '2567', '331', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2339', '323', '2561', '336', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2340', '323', '2562', '336', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2341', '323', '2564', '336', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2342', '323', '2548', '331', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2343', '323', '2554', '331', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2344', '323', '2555', '331', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2345', '323', '2556', '331', '2011-05-09 15:16:10', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2346', '323', '2565', '336', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2347', '323', '2567', '331', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2348', '323', '2561', '336', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2349', '323', '2562', '336', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2350', '323', '2564', '336', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2351', '323', '2548', '331', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2352', '323', '2554', '331', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2353', '323', '2555', '331', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2354', '323', '2556', '331', '2011-05-09 15:54:27', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2355', '323', '2565', '336', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2356', '323', '2567', '331', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2357', '323', '2561', '336', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2358', '323', '2562', '336', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2359', '323', '2564', '336', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2360', '323', '2548', '331', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2361', '323', '2554', '331', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2362', '323', '2555', '331', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2363', '323', '2556', '331', '2011-05-09 15:56:22', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2364', '332', '2569', '331', '2011-07-20 11:16:08', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2365', '332', '2547', '331', '2011-07-20 11:16:18', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2366', '332', '2545', '331', '2011-07-20 11:16:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2367', '332', '2546', '331', '2011-07-20 11:17:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2368', '332', '2569', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2369', '332', '2570', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2370', '332', '2568', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2371', '332', '2547', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2372', '332', '2545', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2373', '332', '2567', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2374', '332', '2546', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2375', '332', '2549', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2376', '332', '2556', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2377', '332', '2554', '331', '2011-07-20 11:17:59', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2378', '332', '2569', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2379', '332', '2570', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2380', '332', '2568', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2381', '332', '2547', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2382', '332', '2545', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2383', '332', '2567', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2384', '332', '2546', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2385', '332', '2549', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2386', '332', '2556', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2387', '332', '2554', '331', '2011-07-20 11:18:19', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2388', '332', '2570', '331', '2011-07-20 11:18:32', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2389', '332', '2570', '331', '2011-07-20 11:18:40', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2390', '332', '2569', '331', '2011-07-20 11:18:49', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2391', '332', '2569', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2392', '332', '2570', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2393', '332', '2568', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2394', '332', '2547', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2395', '332', '2545', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2396', '332', '2567', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2397', '332', '2546', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2398', '332', '2549', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2399', '332', '2556', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2400', '332', '2554', '331', '2011-07-20 11:18:57', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2401', '332', '2552', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2402', '332', '2550', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2403', '332', '2548', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2404', '332', '2544', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2405', '332', '2555', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2406', '332', '2553', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2407', '332', '2551', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2408', '332', '2517', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2409', '332', '2526', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2410', '332', '2524', '331', '2011-07-20 11:19:29', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2411', '303', '2569', '331', '2011-07-20 11:20:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2412', '303', '2570', '331', '2011-07-20 11:20:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2413', '303', '2568', '331', '2011-07-20 11:20:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2414', '303', '2547', '331', '2011-07-20 11:20:46', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2415', '303', '2545', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2416', '303', '2567', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2417', '303', '2546', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2418', '303', '2549', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2419', '303', '2556', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2420', '303', '2554', '331', '2011-07-20 11:20:47', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2421', '303', '2552', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2422', '303', '2550', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2423', '303', '2548', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2424', '303', '2544', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2425', '303', '2555', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2426', '303', '2553', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2427', '303', '2551', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2428', '303', '2517', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2429', '303', '2526', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2430', '303', '2524', '331', '2011-07-20 11:21:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2431', '303', '2522', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2432', '303', '2520', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2433', '303', '2518', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2434', '303', '2525', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2435', '303', '2523', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2436', '303', '2521', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2437', '303', '2519', '331', '2011-07-20 11:21:44', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2438', '303', '2569', '331', '2011-07-20 11:38:13', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2439', '352', '2569', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2440', '352', '2570', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2441', '352', '2568', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2442', '352', '2547', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2443', '352', '2545', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2444', '352', '2567', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2445', '352', '2546', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2446', '352', '2549', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2447', '352', '2556', '331', '2011-07-20 18:09:45', '1');
INSERT INTO `t_hhc_applicationjobrecord` VALUES ('2448', '352', '2554', '331', '2011-07-20 18:09:45', '1');

-- ----------------------------
-- Table structure for `t_hhc_jobinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_hhc_jobinfo`;
CREATE TABLE `t_hhc_jobinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `jobName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '职位名称',
  `industryType` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '行业类型',
  `competency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职能',
  `specializedType` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专业类型',
  `jobNature` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '工作性质',
  `isAdviser` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否是顾问:y 是;n 不是',
  `recruitingNumber` int(11) NOT NULL COMMENT '招聘人数',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '区编码',
  `salary` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '月薪',
  `age` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '年龄',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别:0 女;1 男',
  `education` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学历要求',
  `workingLife` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限',
  `langCapa` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '语言能力',
  `mastery` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '掌握程度',
  `computerGrade` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '计算机能',
  `jobResponsibility` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `jobRequirements` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `jobIssuetDate` datetime DEFAULT NULL COMMENT '发布日期',
  `jobExpiryDate` datetime DEFAULT NULL COMMENT '有效期结束日期',
  `filterIndustryType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '行业类型(面试者行业类型)过滤',
  `filterSpecializedType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '专业类型过滤',
  `filterMetier` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专长过滤',
  `filterJobNature` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作性质过滤',
  `filterltWorkingLife` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(小于)',
  `filtergtWorkingLife` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(大于)',
  `filterEducation` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学历要求过滤',
  `filterSex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别:0 女;1 男 过滤',
  `filterltAge` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(小于)',
  `filtergtAge` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(大于)',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '职位信息插入日期',
  `status` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '0 关闭,1 正常,2 过期',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '职位信息最后更新时间',
  `suspendDate` datetime DEFAULT NULL COMMENT '职位暂停发布日期',
  `clicks` int(11) DEFAULT '0' COMMENT '职位被点击次数',
  PRIMARY KEY (`id`),
  KEY `FK_t_hhc_jobinfo` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2571 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='招聘职位信息表';

-- ----------------------------
-- Records of t_hhc_jobinfo
-- ----------------------------
INSERT INTO `t_hhc_jobinfo` VALUES ('2483', '302', '工程监理', '001-1010', '002-1001', '003-1001-1002', '005-1002', '1', '100', '440000', '440300', '', '013-1008', '23-25', '2', '4', '1-2', '1', '1', '2', '1、38-45岁，本科及以上学历，建筑或工民建相关专业； \r\n2、5年以上房地产开发项目公司总经理职位工作经历，具有丰富的房地产开发公司管理工作经验；具有50万平米以上房地产项目的全程操作经验； \r\n3、熟悉房地产行业相关政策和法律法规，熟悉房地产开发流程，在项目前期', '6、38-45岁，本科及以上学历，建筑或工民建相关专业； \r\n7、5年以上房地产开发项目公司总经理职位工作经历，具有丰富的房地产开发公司管理工作经验；具有50万平米以上房地产项目的全程操作经验；', '2011-04-15 11:22:43', '2011-04-16 11:22:43', '001-1001', '003-1001-1001', '工程监理', 'noLimit', '3', '15', '4', '1', '20', '35', '2011-04-06 11:27:19', '2', '2012-08-27 02:00:00', null, '3');
INSERT INTO `t_hhc_jobinfo` VALUES ('2484', '302', '管理员', '001-1010', '002-1032', '003-1001-1004', '005-1002', '1', '100', '110000', '110100', '', '013-1008', '', '2', '', '', '', '', '', '1、38-45岁，本科及以上学历，建筑或工民建相关专业； \r\n2、5年以上房地产开发项目公司总经理职位工作经历，具有丰富的房地产开发公司管理工作经验；具有50万平米以上房地产项目的全程操作经验；', '1、38-45岁，本科及以上学历，建筑或工民建相关专业； \r\n2、5年以上房地产开发项目公司总经理职位工作经历，具有丰富的房地产开发公司管理工作经验；具有50万平米以上房地产项目的全程操作经验；', '2011-04-06 00:00:00', '2011-04-06 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-06 11:38:55', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2485', '312', '工程监理', '001-1006', '002-1005', '003-1001-1002', '005-1002', '0', '1000', '110000', '110100', '', '', '', '2', '', '', '', '', '', '工程监理1', '工程监理2', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 12:09:22', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2486', '312', '工程监理', '001-1006', '002-1004', '003-1001-1003', '005-1002', '1', '100', '440000', '440300', '', '', '', '2', '', '', '', '', '', '1', '2', '2011-04-07 00:00:00', '2011-04-08 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 12:15:11', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2487', '312', '工程监理', '001-1006', '002-1004', '003-1001-1003', '005-1002', '1', '100', '440000', '440300', '', '', '', '2', '', '', '', '', '', '1', '2', '2011-04-07 00:00:00', '2011-04-08 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 12:25:02', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2488', '314', 'wdwd', '001-1005', '002-1001', '003-1001-1003', '005-1002', '0', '12', '440000', '440300', '', '', '', '2', '', '', '', '', '', '4rt3t34534y34y34', 'w45y34y56y5645u457u45', '2011-04-07 00:00:00', '2011-04-21 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 14:56:08', '2', '2011-04-22 02:00:00', '2011-04-07 14:58:50', '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2489', '314', 'wertgertyyewryry', '001-1016', '002-1020', '003-1001-1009', '005-1002', '0', '23', '430000', '430600', '', '013-1012', '30-35', '1', '5', '6-7', '0', '0', '2', 'wrggasvb slcblbclbscigsfbw dfctxASCXGASFKASFSAOFIGUGUYGY', 'dfgdsdfnofh南方国内外而国内而过哦我饿日光 啊如果反而哦顾问哦日国际', '2011-04-07 15:05:27', '2011-04-20 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 15:04:42', '2', '2012-08-27 02:00:00', null, '4');
INSERT INTO `t_hhc_jobinfo` VALUES ('2490', '314', '监理工程师', '001-1005', '002-1005', '003-1001-1005', '005-1002', '0', '2', '440000', '441300', '', '013-1009', '30-35', '1', '4', '6-7', '0', '', '', '史蒂夫那份全家福企鹅股票金额确认感觉哦赶集网二极管亲人团聚强平稳俄军股票金额庞哥金额苹果键盘二极管额外如果仅凭俄国家配额价格配额价格平均而苹果键盘二极管威尔感觉哦平均股票哦借款人股票金额庞哥金额破解人工配额将我二哥', '史蒂夫那份全家福企鹅股票金额确认感觉哦赶集网二极管亲人团聚强平稳俄军股票金额庞哥金额苹果键盘二极管额外如果仅凭俄国家配额价格配额价格平均而苹果键盘二极管威尔感觉哦平均股票哦借款人股票金额庞哥金额破解人工配额将我二哥', '2011-04-08 00:00:00', '2011-04-09 00:00:00', '001-1003', '', '', '', '', '', '', '2', '', '', '2011-04-07 15:16:45', '2', '2012-08-27 02:00:00', null, '3');
INSERT INTO `t_hhc_jobinfo` VALUES ('2491', '314', '造价工程师', '001-1013', '002-1011', '003-1001-1008', '005-1002', '1', '5', '440000', '441500', '', '', '', '2', '', '', '', '', '', '阿瑟的发大水的', '完全放弃发放巍峨巍峨', '2011-04-07 00:00:00', '2011-04-14 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-07 15:28:25', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2492', '309', '工程师测试职位', '001-1001', '002-1001', '003-1001-1001', '005-1002', '1', '3', '440000', '440300', '', '013-1001', '0-0', '2', '0', '6-7', '0', '0', '3', '测试岗位职责', '测试任职要求', '2011-04-08 00:00:00', '2011-04-09 00:00:00', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-08 09:34:24', '2', '2012-08-27 02:00:00', null, '2');
INSERT INTO `t_hhc_jobinfo` VALUES ('2493', '302', '快速申请', '001-1003', '002-1001', '003-1001-1002', '005-1002', '1', '11', '110000', '110100', '', '', '', '2', '', '', '', '', '', '1', '11', '2011-04-08 00:00:00', '2011-04-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-08 10:06:25', '2', '2011-05-04 02:00:09', '2011-04-15 11:20:20', '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2495', '309', '测试职位11', '001-1001', '002-1001', '003-1001-1003', '005-1002', '1', '3', '430000', '430600', '', '013-1013', '', '2', '', '', '', '', '', '测试岗位职责', '测试任职要求', '2011-04-11 00:00:00', '2011-04-15 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-11 10:02:01', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2496', '314', '设计师', '001-1017', '002-1002', '003-1001-1012', '005-1002', '0', '10', '440000', '440300', '', '013-1006', '30-35', '1', '5', '3-5', '0', '0', '0', '南方网二纺机服务而', '热特瑞特我让他瓦儿童人', '2011-04-11 00:00:00', '2011-04-21 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-11 10:48:48', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2497', '302', '北京市职位', '001-1003', '002-1004', '003-1001-1002', '005-1002', '1', '10', '110000', '110100', '', '', '', '2', '', '', '', '', '', '·1', '11', '2011-04-12 00:00:00', '2011-04-29 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-12 18:58:38', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2498', '302', '北京市测试职位', '001-1002', '002-1010', '003-1001-1001', '005-1002', '0', '10', '110000', '110100', '', '', '', '2', '', '', '', '', '', '北京市测试职位', '北京市测试职位', '2011-04-12 00:00:00', '2011-04-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-12 19:02:05', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2499', '321', '大太阳测试职位', '001-1001', '002-1001', '003-1001-1001', '005-1001', '1', '10', '430000', '433100', '', '013-1010', '', '2', '', '', '', '', '', '11', '11', '2011-04-14 00:00:00', '2011-04-14 00:00:00', '001-1001', '003-1001-1001', '', '', '', '', '', '2', '', '', '2011-04-14 10:42:50', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2500', '321', '北京市测试职位', '001-1003', '002-1005', '003-1001-1003', '005-1002', '1', '10', '110000', '110200', '', '013-1004', '', '2', '', '', '', '', '', '1', '1', '2011-04-14 00:00:00', '2011-04-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-14 11:12:58', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2501', '326', '测试企业数字', '001-1001', '002-1001', '003-1001-1001', '005-1001', '0', '10', '110000', '110200', '', '', '', '2', '', '', '', '', '', '11', '11', '2011-04-14 00:00:00', '2011-04-15 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-14 11:19:21', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2502', '330', '职位名称', '001-1004', '002-1001', '003-1001-1003', '005-1002', '0', '10', '110000', '110100', '', '', '', '2', '', '', '', '', '', '1', '11', '2011-04-14 00:00:00', '2011-04-22 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-14 18:06:23', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2503', '330', '测试发布日期设置', '001-1001', '002-1001', '003-1001-1001', '005-1002', '1', '100', '110000', '110100', '', '013-1008', '', '2', '', '', '', '', '', '11', '11', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-14 20:06:10', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2504', '302', '职位名称2', '001-1001', '002-1018', '003-1001-1002', '005-1001', '1', '100', '110000', '110100', '', '013-1005', '30-35', '0', '3', '0-1', '7', '', '', '岗位职责1', '任职要求', '2011-04-15 00:00:00', '2011-04-16 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:32:30', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2505', '302', '职位名称1', '001-1001', '002-1018', '003-1001-1002', '005-1002', '1', '100', '110000', '110100', '', '013-1005', '30-35', '0', '3', '0-1', '7', '', '', '岗位职责1', '任职要求', '2011-04-15 00:00:00', '2011-04-16 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:32:34', '2', '2012-08-27 02:00:00', null, '3');
INSERT INTO `t_hhc_jobinfo` VALUES ('2506', '302', '职位名称1', '001-1001', '002-1018', '003-1001-1002', '005-1001', '1', '100', '110000', '110100', '', '013-1005', '30-35', '0', '3', '0-1', '7', '', '', '岗位职责1', '任职要求', '2011-04-15 00:00:00', '2011-04-16 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:32:38', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2507', '302', '职位名称1', '001-1001', '002-1018', '003-1001-1002', '005-1002', '0', '100', '110000', '110100', '', '013-1005', '30-35', '0', '3', '0-1', '7', '', '', '岗位职责1', '任职要求', '2011-04-15 00:00:00', '2011-04-16 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:32:41', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2508', '302', '职位名称1', '001-1001', '002-1018', '003-1001-1002', '005-1002', '1', '100', '110000', '110100', '', '013-1005', '30-35', '0', '3', '0-1', '7', '', '', '岗位职责1', '任职要求', '2011-04-15 00:00:00', '2011-04-16 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:32:44', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2509', '330', '猎头高管', '001-1001', '002-1018', '003-1001-1005', '005-1001', '0', '100', '440000', '440300', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:40:12', '2', '2012-08-27 02:00:00', null, '2');
INSERT INTO `t_hhc_jobinfo` VALUES ('2510', '330', '猎头公司高管1', '001-1008', '002-1018', '003-1001-1008', '005-1001', '0', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:42:52', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2511', '330', '猎头公司高管2', '001-1008', '002-1018', '003-1001-1008', '005-1001', '1', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:42:58', '2', '2012-08-27 02:00:00', null, '4');
INSERT INTO `t_hhc_jobinfo` VALUES ('2512', '330', '猎头公司高管3', '001-1008', '002-1018', '003-1001-1008', '005-1002', '0', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:43:00', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2513', '330', '猎头公司高管4', '001-1008', '002-1018', '003-1001-1008', '005-1002', '1', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:43:03', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2514', '330', '猎头公司高管5', '001-1008', '002-1018', '003-1001-1008', '005-1002', '1', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:43:06', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2515', '330', '猎头公司高管6', '001-1008', '002-1018', '003-1001-1008', '005-1001', '1', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:43:09', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2516', '330', '猎头公司高管7', '001-1008', '002-1018', '003-1001-1008', '005-1001', '1', '1000', '120000', '120100', '', '013-1011', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-04-18 09:06:33', '2011-04-19 09:06:33', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 15:43:12', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2517', '331', '高级主管1', '001-1002', '002-1018', '003-1001-1013', '005-1001', '1', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:22', '2', '2012-08-27 02:00:00', null, '5');
INSERT INTO `t_hhc_jobinfo` VALUES ('2518', '331', '高级主管2', '001-1002', '002-1018', '003-1001-1013', '005-1001', '0', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:27', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2519', '331', '高级主管3', '001-1002', '002-1018', '003-1001-1013', '005-1002', '0', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:29', '2', '2012-08-27 02:00:00', null, '5');
INSERT INTO `t_hhc_jobinfo` VALUES ('2520', '331', '高级主管4', '001-1002', '002-1018', '003-1001-1013', '005-1002', '1', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:31', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2521', '331', '高级主管5', '001-1002', '002-1018', '003-1001-1013', '005-1001', '0', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:33', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2522', '331', '高级主管6', '001-1002', '002-1018', '003-1001-1013', '005-1002', '1', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:35', '2', '2012-08-27 02:00:00', null, '3');
INSERT INTO `t_hhc_jobinfo` VALUES ('2523', '331', '高级主管7', '001-1002', '002-1018', '003-1001-1013', '005-1002', '0', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:37', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2524', '331', '高级主管8', '001-1002', '002-1018', '003-1001-1013', '005-1001', '0', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:39', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2525', '331', '高级主管9', '001-1002', '002-1018', '003-1001-1013', '005-1002', '1', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:41', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2526', '331', '高级主管10', '001-1002', '002-1018', '003-1001-1013', '005-1001', '1', '10000', '110000', '110100', '', '013-1013', '23-25', '1', '1', '6-7', '4', '2', '2', '岗位职责', '任职要求', '2011-08-16 05:10:58', '2011-08-23 05:10:58', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:02:43', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2558', '314', '监理工程师', '001-1005', '002-1007', '003-1001-1004', '005-1002', '1', '10', '120000', '120100', '', '013-1008', '30-35', '1', '5', '6-7', '1', '2', '2', '热管ipwerjgnpwegwer日发给我而沃尔夫微软', '额外人访问二房二厅反而让他我让他维尔', '2011-04-21 00:00:00', '2011-04-28 00:00:00', 'noLimit', '003-1001-1001', '', '005-1001', '', '', '', '2', '', '', '2011-04-21 10:12:19', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2557', '302', '111', '001-1001', '002-1054', '003-1001-1001', '005-1002', '1', '10', '110000', '110100', '', '', '', '2', '', '', '', '', '', '1', '1', '2011-04-19 00:00:00', '2011-04-20 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-19 10:41:21', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2548', '331', '高级全职顾问', '001-1030', '002-1034', '003-1001-1019', '005-1002', '1', '100', '210000', '210700', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-28 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:27:43', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2549', '331', '高级兼职顾问', '001-1016', '002-1034', '003-1003-1001', '005-1001', '1', '1000', '460000', '469005', '', '013-1010', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:28:44', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2550', '331', '高级全职非顾问', '001-1028', '002-1045', '003-1002-1010', '005-1002', '0', '133', '430000', '430700', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', 'noLimit', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:30:43', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2551', '331', '高级兼职非顾问', '001-1050', '002-1034', '003-1002-1008', '005-1001', '0', '333', '500000', '500100', '', '', '30-35', '0', '4', '6-7', '3', '2', '1', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:32:49', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2552', '331', '高级全职非顾问', '001-1040', '002-1034', '003-1004-1007', '005-1002', '0', '255', '460000', '469001', '', '013-1009', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:37:14', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2553', '331', '高级安全全职顾问', '001-1022', '002-1020', '003-1002-1005', '005-1002', '1', '1000', '350000', '350400', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:39:20', '2', '2012-08-27 02:00:00', null, '2');
INSERT INTO `t_hhc_jobinfo` VALUES ('2554', '331', '高级安全兼职顾问', '001-1041', '002-1020', '003-1007-1003', '005-1001', '1', '999', '640000', '640300', '', '', '', '2', '', '', '', '', '', '1', '1', '2011-07-15 05:33:57', '2011-07-28 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:40:29', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2555', '331', '高级安全全职非顾问', '001-1088', '002-1020', '003-1005-1002', '005-1002', '0', '666', '620000', '621000', '', '', '', '2', '', '', '', '', '', '1', '2', '2011-07-15 05:33:57', '2011-07-28 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:41:24', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2556', '331', '高级安全兼职非顾问', '001-1054', '002-1020', '003-1004-1006', '005-1001', '0', '555', '520000', '522600', '', '', '', '2', '', '', '', '', '', '1', '2', '2011-07-15 05:33:57', '2011-07-28 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 17:42:22', '2', '2012-08-27 02:00:00', null, '2');
INSERT INTO `t_hhc_jobinfo` VALUES ('2544', '331', '高级兼职顾问', '001-1001', '002-1032', '003-1001-1001', '005-1001', '1', '100', '110000', '110100', '', '013-1010', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:33:57', '2011-07-22 05:33:57', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:27:51', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2545', '331', '高级全职顾问', '001-1014', '002-1032', '003-1001-1004', '005-1002', '1', '100', '310000', '310100', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:34:00', '2011-07-22 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:29:45', '2', '2012-08-27 02:00:00', null, '2');
INSERT INTO `t_hhc_jobinfo` VALUES ('2546', '331', '高级兼职非顾问', '001-1037', '002-1032', '003-1001-1010', '005-1001', '0', '1000', '370000', '371000', '', '', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:34:00', '2011-07-22 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:30:51', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2547', '331', '高级全职非顾问', '001-1026', '002-1032', '003-1001-1005', '005-1002', '0', '10000', '410000', '410100', '', '013-1008', '', '2', '', '', '', '', '', '岗位职责', '任职要求', '2011-07-15 05:34:00', '2011-07-22 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-15 16:31:58', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2559', '302', '测试提示语', '001-1002', '002-1004', '003-1001-1002', '005-1002', '0', '10', '120000', '120100', '', '013-1005', '', '2', '', '', '', '', '', '11', '11', '2011-04-22 00:00:00', '2011-04-23 00:00:00', '001-1002', '', '', '', '', '', '', '2', '', '', '2011-04-22 16:13:45', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2560', '331', '测试后台招聘方管理', '001-1001', '002-1001', '003-1001-1001', '005-1001', '1', '100', '110000', '110100', '', '013-1005', '', '2', '', '', '', '', '', '测试后台招聘方管理', '测试后台招聘方管理', '2011-07-15 05:34:00', '2011-07-16 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-04-25 15:11:17', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2561', '336', '造价工程师', '001-1001-1007', '002-1049', '003-1001-1001', '005-1002', '1', '100', '440000', '440300', '', '013-1001', '35-40', '2', '4', '6-7', '0', '0', '0', '我份额位居而南方泡网而你骗我哦', '尔特微软特锐 而痛苦吗瓦儿童美味额头', '2011-05-03 00:00:00', '2011-05-31 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-05-03 14:46:04', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2562', '336', '工程监理', '001-1001-1010', '002-1005', '003-1001-1003', '005-1002', '1', '12', '440000', '440300', '', '', '40-45', '2', '5', '6-7', '0', '0', '0', '而个人割肉割让给而顾问哦个给我恶搞如果网而过为俄国', '而顾问哦各位哥哥万恶顾问哦个哥哥哥哥', '2011-05-03 00:00:00', '2011-05-31 00:00:00', '001-1001-1003', '', '', '', '', '', '', '2', '', '', '2011-05-03 15:05:10', '2', '2012-08-27 02:00:00', null, '1');
INSERT INTO `t_hhc_jobinfo` VALUES ('2563', '336', 'asdcas', '001-1001-1008', '002-1001', '003-1001-1011', '005-1002', '1', '260', '440000', '440300', '', '013-1001', '35-40', '2', '4', '6-7', '0', '', '', '机身内存的温暖哦我能无法察觉我的那我哦我的文档我的我的', '文档错误哦富翁额达环保无毒不稳定为代表未来的路为您带来无尽的礼物即可得我对我的空间那我等你我看你的口味哦党内万恶的刊物的可能问得哪里我哦可能的我的iwdwjindwend我的家我对你哦我你的我的哦我难道哦我能的', '2011-05-03 00:00:00', '2011-05-31 00:00:00', '001-1001-1003', '003-1001-1008', '', 'noLimit', '20', '10', '3', '2', '45', '25', '2011-05-03 15:18:25', '2', '2011-06-01 02:00:00', '2011-05-03 15:28:05', '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2564', '336', 'grgegeg', '001-1002-1001', '002-1011', '003-1001-1011', '005-1002', '1', '120', '440000', '440300', '', '013-1001', '', '2', '', '', '', '', '', 'erthrtertherther', 'grtherthrherherherhrh', '2011-05-03 00:00:00', '2011-05-13 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-05-03 15:24:17', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2565', '336', 'sergeryrty', '001-1002-1006', '002-1026', '003-1001-1006', '005-1002', '1', '30', '440000', '441900', '', '013-1001', '0-0', '2', '0', '0-0', '0', '0', '0', '妓女那万恶；发；哦份额方法疯狂买房来看方法年龄放宽了法律人我俄方法律看看法兰克福疯狂买房昆明', '妓女那万恶；发；哦份额方法疯狂买房来看方法年龄放宽了法律人我俄方法律看看法兰克福疯狂买房昆明', '2011-05-04 00:00:00', '2011-05-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-05-03 15:47:40', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2566', '331', '测试职位申请', '001-1001-1001', '002-1001', '003-1001-1001', '005-1002', '1', '100', '110000', '110100', '', '013-1004', '18-23', '2', '', '', '', '', '', '1', '1', '2011-07-15 05:34:00', '2011-07-18 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-05-04 10:52:22', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2567', '331', '测试职位申请1', '001-1001-1003', '002-1004', '003-1001-1001', '005-1002', '0', '1', '110000', '110100', '', '013-1004', '', '2', '', '', '', '', '', '1', '1', '2011-07-15 05:34:00', '2011-07-25 05:34:00', '', '', '', '', '', '', '', '2', '', '', '2011-05-04 11:57:17', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2568', '331', '职位20110719', '001-1001-1002', '002-1001', '003-1001-1006', '005-1002', '0', '100', '150000', '150100', '', '013-1005', '25-30', '1', '3', '6-7', '7', '2', '2', '21213', '职位20110719', '2011-07-19 00:00:00', '2011-08-06 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-07-19 19:21:12', '2', '2012-08-27 02:00:00', null, '0');
INSERT INTO `t_hhc_jobinfo` VALUES ('2569', '331', '1232', '001-1001-1001', '002-1001', '003-1001-1002', '005-1001', '1', '123', '110000', '110100', '', '013-1005', '', '2', '', '', '', '', '', '12313', '123213213', '2011-07-20 00:00:00', '2011-07-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-07-20 10:02:32', '2', '2012-08-27 02:00:00', null, '8');
INSERT INTO `t_hhc_jobinfo` VALUES ('2570', '331', '121212', '001-1002-1012', '002-1012', '003-1001-1014', '005-1001', '1', '321', '110000', '110100', '', '', '', '2', '', '', '', '', '', 'idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位', '东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位  东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位 东方网', '2011-07-20 00:00:00', '2011-07-30 00:00:00', '', '', '', '', '', '', '', '2', '', '', '2011-07-20 10:33:38', '2', '2012-08-27 02:00:00', null, '2');

-- ----------------------------
-- Table structure for `t_hhc_jobinfotemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_hhc_jobinfotemplate`;
CREATE TABLE `t_hhc_jobinfotemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `jobName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '职位名称',
  `industryType` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '行业类型',
  `competency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职能',
  `specializedType` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专业类型',
  `jobNature` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '工作性质',
  `isAdviser` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否是顾问:y 是;n 不是',
  `recruitingNumber` int(11) NOT NULL COMMENT '招聘人数',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '区编码',
  `salary` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '月薪',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别:0 女;1 男',
  `education` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学历要求',
  `workingLife` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限',
  `langCapa` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '语言能力',
  `mastery` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '掌握程度',
  `computerGrade` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '计算机能',
  `jobResponsibility` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '岗位职责',
  `jobRequirements` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '任职要求',
  `jobIssuetDate` datetime DEFAULT NULL COMMENT '发布日期',
  `jobEffectiveStartDate` datetime DEFAULT NULL COMMENT '有效期开始日期',
  `jobExpiryDate` datetime DEFAULT NULL COMMENT '有效期结束日期',
  `tmpName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '模板名称',
  `romanNum` varchar(5) COLLATE utf8_bin DEFAULT '' COMMENT '模板名称后缀－罗马数字',
  `filterIndustryType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '行业类型(面试者行业类型)过滤',
  `filterSpecializedType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '专业类型过滤',
  `filterMetier` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专长过滤',
  `filterJobNature` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作性质过滤',
  `filterltWorkingLife` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(小于)',
  `filtergtWorkingLife` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(大于)',
  `filterEducation` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学历要求过滤',
  `filterSex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别:0 女;1 男 过滤',
  `filterltAge` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(小于)',
  `filtergtAge` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限过滤(大于)',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '职位信息插入日期',
  PRIMARY KEY (`id`,`tmpName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='招聘信息模板表';

-- ----------------------------
-- Records of t_hhc_jobinfotemplate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_hhc_receipt_of_applications_for_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `t_hhc_receipt_of_applications_for_jobs`;
CREATE TABLE `t_hhc_receipt_of_applications_for_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户Id',
  `jobId` int(11) NOT NULL COMMENT '职位Id',
  `recruitLtdId` int(11) NOT NULL COMMENT '招聘公司Id',
  `applicationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `STATUS` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请状态:0 未查看,1 已查看未邀请,2 已发面试邀请',
  PRIMARY KEY (`id`),
  KEY `FK_t_hhc_receipt_of_applications_for_jobs` (`jobId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=398 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业收到的职位申请记录';

-- ----------------------------
-- Records of t_hhc_receipt_of_applications_for_jobs
-- ----------------------------
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('218', '316', '2488', '314', '2011-04-08 09:37:05', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('219', '316', '2487', '312', '2011-04-08 09:50:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('220', '316', '2489', '314', '2011-04-08 10:01:58', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('221', '316', '2490', '314', '2011-04-08 10:01:50', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('222', '316', '2492', '309', '2011-04-08 09:50:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('223', '316', '2486', '312', '2011-04-08 09:50:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('224', '303', '2548', '331', '2011-07-20 11:21:13', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('225', '303', '2554', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('226', '303', '2555', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('227', '303', '2556', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('228', '303', '2500', '321', '2011-04-27 11:44:19', '1');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('229', '303', '2497', '302', '2011-04-27 11:44:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('230', '303', '2498', '302', '2011-04-27 11:44:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('231', '303', '2493', '302', '2011-04-27 11:44:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('232', '334', '2548', '331', '2011-05-04 12:14:41', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('233', '334', '2554', '331', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('234', '334', '2555', '331', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('235', '334', '2556', '331', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('236', '334', '2500', '321', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('237', '334', '2497', '302', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('238', '334', '2498', '302', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('239', '334', '2493', '302', '2011-04-27 11:13:18', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('240', '333', '2556', '331', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('241', '333', '2558', '314', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('242', '333', '2548', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('243', '333', '2554', '331', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('244', '333', '2555', '331', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('245', '333', '2500', '321', '2011-04-27 11:48:19', '1');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('246', '333', '2497', '302', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('247', '333', '2498', '302', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('248', '333', '2493', '302', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('249', '333', '2558', '314', '2011-04-27 11:48:19', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('250', '332', '2548', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('251', '332', '2554', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('252', '332', '2555', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('253', '332', '2556', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('254', '332', '2500', '321', '2011-04-27 11:56:21', '1');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('255', '332', '2497', '302', '2011-04-27 11:56:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('256', '332', '2498', '302', '2011-04-27 11:56:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('257', '332', '2493', '302', '2011-04-27 11:56:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('258', '337', '2561', '336', '2011-05-03 18:02:11', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('259', '337', '2562', '336', '2011-05-03 18:02:11', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('260', '337', '2564', '336', '2011-05-03 18:02:11', '2');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('261', '338', '2561', '336', '2011-05-04 11:28:04', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('262', '338', '2562', '336', '2011-05-04 11:28:04', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('263', '338', '2564', '336', '2011-05-04 11:28:04', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('264', '338', '2566', '331', '2011-05-04 11:29:24', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('265', '334', '2565', '336', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('266', '334', '2566', '331', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('267', '334', '2567', '331', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('268', '334', '2561', '336', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('269', '334', '2562', '336', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('270', '334', '2564', '336', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('271', '334', '2549', '331', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('272', '334', '2550', '331', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('273', '334', '2551', '331', '2011-05-04 12:14:42', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('274', '333', '2565', '336', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('275', '333', '2566', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('276', '333', '2567', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('277', '333', '2561', '336', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('278', '333', '2562', '336', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('279', '333', '2564', '336', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('280', '333', '2549', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('281', '333', '2550', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('282', '333', '2551', '331', '2011-05-04 12:17:06', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('283', '332', '2565', '336', '2011-05-06 15:41:08', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('284', '332', '2566', '331', '2011-05-06 15:41:08', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('285', '332', '2567', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('286', '332', '2561', '336', '2011-05-06 15:41:08', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('287', '332', '2562', '336', '2011-05-06 15:41:08', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('288', '332', '2564', '336', '2011-05-06 15:41:08', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('289', '332', '2549', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('290', '332', '2550', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('291', '332', '2551', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('292', '303', '2565', '336', '2011-05-04 14:32:52', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('293', '303', '2566', '331', '2011-05-04 14:32:52', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('294', '303', '2567', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('295', '303', '2561', '336', '2011-05-04 14:32:52', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('296', '303', '2562', '336', '2011-05-04 14:32:52', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('297', '303', '2564', '336', '2011-05-04 14:32:52', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('298', '303', '2549', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('299', '303', '2550', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('300', '303', '2551', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('301', '340', '2565', '336', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('302', '340', '2566', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('303', '340', '2567', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('304', '340', '2561', '336', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('305', '340', '2562', '336', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('306', '340', '2564', '336', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('307', '340', '2548', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('308', '340', '2549', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('309', '340', '2550', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('310', '340', '2551', '331', '2011-05-04 14:59:38', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('311', '342', '2565', '336', '2011-05-06 11:42:25', '1');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('312', '342', '2566', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('313', '342', '2567', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('314', '342', '2561', '336', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('315', '342', '2562', '336', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('316', '342', '2564', '336', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('317', '342', '2548', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('318', '342', '2549', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('319', '342', '2550', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('320', '342', '2551', '331', '2011-05-06 11:42:25', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('321', '347', '2565', '336', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('322', '347', '2566', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('323', '347', '2567', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('324', '347', '2561', '336', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('325', '347', '2564', '336', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('326', '347', '2548', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('327', '347', '2549', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('328', '347', '2550', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('329', '347', '2551', '331', '2011-05-06 15:18:21', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('330', '310', '2565', '336', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('331', '310', '2567', '331', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('332', '310', '2561', '336', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('333', '310', '2562', '336', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('334', '310', '2564', '336', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('335', '310', '2548', '331', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('336', '310', '2554', '331', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('337', '310', '2555', '331', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('338', '310', '2556', '331', '2011-05-09 15:12:28', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('339', '308', '2565', '336', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('340', '308', '2567', '331', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('341', '308', '2561', '336', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('342', '308', '2562', '336', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('343', '308', '2564', '336', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('344', '308', '2548', '331', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('345', '308', '2554', '331', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('346', '308', '2555', '331', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('347', '308', '2556', '331', '2011-05-09 15:15:30', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('348', '323', '2565', '336', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('349', '323', '2567', '331', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('350', '323', '2561', '336', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('351', '323', '2562', '336', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('352', '323', '2564', '336', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('353', '323', '2548', '331', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('354', '323', '2554', '331', '2011-05-09 15:56:22', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('355', '323', '2555', '331', '2011-05-09 15:56:24', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('356', '323', '2556', '331', '2011-05-09 15:56:24', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('357', '332', '2569', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('358', '332', '2547', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('359', '332', '2545', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('360', '332', '2546', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('361', '332', '2570', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('362', '332', '2568', '331', '2011-07-20 11:18:57', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('363', '332', '2552', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('364', '332', '2544', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('365', '332', '2553', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('366', '332', '2517', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('367', '332', '2526', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('368', '332', '2524', '331', '2011-07-20 11:19:29', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('369', '303', '2569', '331', '2011-07-20 11:38:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('370', '303', '2570', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('371', '303', '2568', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('372', '303', '2547', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('373', '303', '2545', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('374', '303', '2546', '331', '2011-07-20 11:20:47', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('375', '303', '2552', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('376', '303', '2544', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('377', '303', '2553', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('378', '303', '2517', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('379', '303', '2526', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('380', '303', '2524', '331', '2011-07-20 11:21:13', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('381', '303', '2522', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('382', '303', '2520', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('383', '303', '2518', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('384', '303', '2525', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('385', '303', '2523', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('386', '303', '2521', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('387', '303', '2519', '331', '2011-07-20 11:21:44', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('388', '352', '2569', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('389', '352', '2570', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('390', '352', '2568', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('391', '352', '2547', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('392', '352', '2545', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('393', '352', '2567', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('394', '352', '2546', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('395', '352', '2549', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('396', '352', '2556', '331', '2011-07-20 18:09:45', '0');
INSERT INTO `t_hhc_receipt_of_applications_for_jobs` VALUES ('397', '352', '2554', '331', '2011-07-20 18:09:45', '0');

-- ----------------------------
-- Table structure for `t_login_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_user`;
CREATE TABLE `t_login_user` (
  `id` int(11) NOT NULL,
  `userName` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '用户名(Email)',
  `PASSWORD` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `POINT` decimal(10,0) DEFAULT '0' COMMENT '积分',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态 0:停用;1:正常',
  `registerDate` datetime DEFAULT NULL COMMENT '注册日期',
  `lastLoginDate` datetime DEFAULT NULL COMMENT '最后登录日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`userName`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户注册';

-- ----------------------------
-- Records of t_login_user
-- ----------------------------
INSERT INTO `t_login_user` VALUES ('10000', '576970357@qq.com', '41a15bdbf3d1141ab390423d808e1765', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10001', '13717666769@163.com', 'ef381e7e48dbf25c9185e639b7c61085', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10003', '13713736785@126.com', '30068d2ec65bec843fe0bf58fc759e32', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10004', '2247052136@qq.com', '31b830af414ed3e9088bd26446fe1af3', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10006', 'sanyiniao@126.com', '9950432b1fa6273d723d3c68fb6177bb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10007', 'xj@dotoyo.com', '8b36dfa48bfedb6bc788cf0f73eeed2c', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10008', 'wutingting81@163.com', '7d673769335f7e91d2979a4668c3ac30', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10009', 'zhangjingwu@21cn.com', 'bc31200775d10203009cbf55236d4138', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10010', '1035145044@qq.com', '6ebbb76a4312e27ff301915b4f88853e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10012', 'wyfff858@163.com', 'e807f1fcf82d132f9bb018ca6738a19f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10013', '18666925566@qq.com', 'd9323f3f3acdfc3b59078e06e05451df', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10014', '371547339@qq.com', 'a8ca225b8d437430b8697480b764ba1d', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10016', '5676341t@163.com', '7d6f900488b5801b2f3dbf7e7c248a59', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10017', 'caisisio@qq.com', 'a39e008bf66789700c3e319588c27ef4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10019', 'cobo91lyy@126.com', '6938451bda935f3b5b6f3c8ef28e1f21', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10020', '5698401@qq.com', '7e051aa09457454766f9e23116373e64', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10021', 'xfhtsoft@qq.com', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10022', 'yicx@dfl.com.cn', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10023', '543382864@qq.com', 'fb53fade034bdb3a066ecf2af0a06501', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10024', 'yangshun@dfl.com.cn', '6d68a67da0a9a87ae0cc915c35e55596', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10025', '490114136@qq.com', '6755ecec17988305c6a1e075e49d2378', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10027', '195519786@QQ.COM', 'bfb0342b8de866698e7e2e3c5efed743', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10028', 'kapa588@163.com', '8b9ed88d71a957eadb5f3edef247d256', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10029', 'yezihaiyang5200@sina.com', 'a0b5fbaca57c089cb1e38f04f79555c4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10030', 'liangchao0209@sina.com', 'ff857abc6df70b16b366c9bed647e7b7', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10031', '783244676@126.com', '69d1e61232296cf6c2fee761e25ad5fa', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10032', 'fanggaozi@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10033', 'yangyan1li2ok@126.com', '79876419a647e0dd662d0ed9f1beadab', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10034', 'fanwenhong@126.com', 'bfb8b29caac655995f86b9ef4fa14f27', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10035', 'liangchao0209@sohu.com', 'ff857abc6df70b16b366c9bed647e7b7', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10037', 'denghaibing1314@yahoo.com.cn', '917ba24e37b6b5c16ecf9476195d1918', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10038', 'heshuhao81@126.com', '3ff2639bdd40beb172c08a14783647ce', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10039', 'zsh8111@163.com', '11c94efd33613dff559ec288843615ac', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10040', 'ljx1238899@sina.com', '21ef05aed5af92469a50b35623d52101', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10041', '229421569@qq.com', '60b2b700f5e4ce17a4ad20c5e40f163f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10042', '617302171@qq.com', 'd29be9f91a5228631a2ef3bc03c3d653', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10043', 'gaoshaohualli@163.com', '0c2a0d976d8d1d924967d3aa44ebf8d2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10044', 'www.417033393@qq.com', '9817d594cdb68ce17a841841b98d41e0', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10045', 'dfs@ad.com', '76a069e39d1caed306059f9ef17a4e33', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10046', 'the_daydream@163.com', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10047', 'lelecool@126.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10048', '2432672020@qq.com', '0b2fb4080eef47533e312405a290d4a1', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10049', 'daiqunfang15814086712@163.com', '0b6172d4b9703985e47b7a8706555457', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10051', '598643433@qq.com', '325c72fff55f345d5f6000da7711c1e2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10052', 'chuanyelove@126.com', '91f35025c92753fb7f3f7153a9edd52f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10053', '472586656@qq.com', '2e7499469daf922e8b40a71b10fa26bd', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10054', 'hlx@123.com', '76a069e39d1caed306059f9ef17a4e33', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10056', '11@qq.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10057', '1209373611@qq.com', '66e5f74eebc83ac016b6cf482889b2ab', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10058', 'xdbwgzl8@163.com', '021b6f1342f863f3f8f26e6a815617d2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10059', '1961633059@qq.com', 'aded27dae3995255de547f3968872391', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10061', '13726204615@163.com', '7852aa4f90a1d5d603eb9a8fdb0d84d1', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10062', '112065264@qq.com', 'c029ab478f336d322ca205963bbe3a20', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10063', '1985104501@qq.com', 'd4bcc0417e9433e4c1b2598b6ccd4a51', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10064', '942259609@qq.com', 'aa63e07a29153ddcbb6e9945b49474fc', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10065', 'xujian441700@qq.com', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10066', '549251780@qq.com', '93a363cc73df96a22210da3e3b830a5b', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10067', 'yangszpt@yeah.net', '526daa39c7f3f76942dcb67b43ea17bf', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10068', '583809305@qq.com', '3efeed979a59a3ac32ca50a9203e8649', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10070', 'fengshoumail@163.com', '1864dcfe08ee2817ba730635ad8a6363', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10071', 'elle179200018@126.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10072', '69771558@QQ.COM', '0bdffa6a350656d6d32d8c95b4625bdc', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10073', 'jiangxvhua@163.com', 'fd43ef708e34673c6d7c0e1d892bdeed', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10074', 'huangsing@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10075', 'jimhan@3km.cc', 'bb23f2dfb80b92749045530c44add040', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10077', 'maguangtao@3km.cc', 'cb97d1630b1acb4f5af6fe6ec482b32f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10078', 'qhong1118@163.com', 'e18b06d715a900af7563b7268b1a88b2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10079', '4911177996@qq.com', '87bdc49fc00452737a0d814cdb85e5e4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10081', '243267202@qq.com', '0b2fb4080eef47533e312405a290d4a1', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10082', '617765117@qq.com', '4297f44b13955235245b2497399d7a93', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10083', 'kcoolksss@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10084', '769305827@qq.com', 'f5dc4fd41e50b2a301fe977860069ffc', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10085', '478413106@qq.com', '0571749e2ac330a7455809c6b0e7af90', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10088', '504210067@qq.com', '07dc7f69b743692b89637cf7b61656e3', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10090', '820877905@qq.com', 'd15f91893707df781ba916ad6d7002f2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10091', 'xiaodan280403@163.com', '5d838d477ddf355fc15df1db90bee0aa', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10093', 'kenuobiya@163.com', 'b28e0c1feaa06a4a80b78e91eecc87c4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10094', '414510638@qq.com', '377990151585ce9d9f199f22ec0276d3', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10095', 'admin1', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10096', '734013840@qq.com', 'd3a3324b27a124a5196db9e4214ccd56', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10097', '651315796@qq.com', '6412121cbb2dc2cb9e460cfee7046be2', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10098', '1012936441@qq.com', 'f5575c28b55788925861afeee60fcef6', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10099', 'xidefufm@126.com', '17fec174bf230fdcd63229528cde7352', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10100', 'meiluoao11111@163.com', '23a1fe69bcaf3aea316e3f806d141db8', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10101', 'pengjunxx@sina.com', 'f4e0166e1c0882e8415a04a5d5053d6a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10102', '25755853@qq.com', '69a9a594aeb92b4c1f0d5ea08463db78', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10104', 'COBO91yy@126.com', '25f9e794323b453885f5181f1b624d0b', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10105', 'www.648435758@qq.com', '0b6172d4b9703985e47b7a8706555457', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10108', '1366524345@qq.com', 'ae2863bc6fbfad68beb5ad2e3dd3b704', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10109', 'cobo91cl', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10110', 'xuzhiqiang2110@126.co', '428efa2c062cb0eebceffe9f391678cd', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10111', 'xuzhiqiang2110@126.com', '428efa2c062cb0eebceffe9f391678cd', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10113', 'tototo@163.com', 'e807f1fcf82d132f9bb018ca6738a19f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10114', 'manblog@qq.com', 'f7d02e32bea115d7eae275b46f4a1413', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10117', 'LUOXIAOBAO', '70f5232f20e1454cfb871a1f6cbbcd92', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10118', 'admin1@22.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10119', 'chtwoaini@126.com', 'd22c6c3978de299dd0d0e10a7bd5ae0f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10121', 'huangdc', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10124', '6528@QQ.COM', '70f5232f20e1454cfb871a1f6cbbcd92', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10125', 'lql3718@sina.com', '7b0929fc4aae6555be06a2f484eb0389', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10126', '1197438797@qq.com', 'e08b0fbb06edc71898aef811b8b854bc', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10128', '783244676@qq.com', '69d1e61232296cf6c2fee761e25ad5fa', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10129', '4730045@qq.com', 'fee450fab0ba489e83d28aa9b1ff204e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10130', '2429877723@qq.com', 'c64ebf35cdbbbdddb4658fd14e582567', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10131', 'gaoshaohua134@163.com', '9aafadcae550ecc849af70a45ceb5d8d', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10133', 'hcy870702@126.com', '7155162bc2bcc5e688c86c2042e8d13b', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10134', 'kcoolkssss@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10136', 'czlqz@163.com', '0ad0c29344158e624c766c211b35b9d4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10137', '732835373@qq.com', '88973944484023629f19883b64cb0195', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10138', 'kcoolks@163.com', '082b0d593101ca2e6a188c640d2b6282', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10139', 'law06067@sina.com', '14d06ed1a7e094daf6d0b26d0acf3fd5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10140', 'chwei821@163.com', 'fa335a97be88d18eeddda0793ce1b204', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10141', 'xujian783532199@qq.com', 'e1d278742b540d0b4e32677eca63faa4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10142', '402094810@qq.com', 'ec580792aa15d258e55f2c6278f2d8e5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10144', '520fanfan620@163.com', 'ad6a87b41f3501505c855d80d9f6850f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10145', '1059978344@qq.com', '007addaa441b04b14a2403b1ba239b96', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10147', '55555@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10148', 'admin@126.com', '082b0d593101ca2e6a188c640d2b6282', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10150', '515652906@qq.com', '50b2a226882d3135535740ac648a7464', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10151', 'jeack@126.com', '3a70864a7922a90cde69baa9af3fe739', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10156', 'yertwy@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10157', '497612838@QQ.COM', '16439c0e6b2007686558e0859bfea4c5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10158', 'cobo91yq', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10160', 'kcoolkss@126.com', '082b0d593101ca2e6a188c640d2b6282', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10162', 'hdc', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10163', '709905949@qq.com', '4c30593f537afdd4db1cc50c78faf399', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10164', 'hxingh1030@126.com', '5286be2659c55c725cd407d282d8475a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10166', 'beikechen@163.com', 'ebab4ed9c5ff978cfe8e6c32ad978182', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10167', 'hn_jhq@163.com', '93a9e5bb1d598a453606e890f72bd393', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10168', 'xzy333333@126.com', '2cdf7aca1ac03ca2786bbca9a895e39a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10169', 'ye168998@163.com', '27ceaf6b7d4001fb515180d6ba511ce5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10170', 'Janehy2002@yahoo.com', '0df8294336094b9f2f6dc6686f1d5614', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10171', '491117796@qq.com', '49d0d488c524d7fe5fa6e6289812a1f6', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10172', 'zhanglihui0130@163.com', '7d80aed13fa7f7169c1140dd771f6623', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10173', 'xqj8013@163.com', '67f87f117bb378e9b57d03fe575162ca', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10175', '333@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10176', 'wlht5518@126.com', '6f11b8b81fc06fbd8e2ca35704e0c4e6', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10177', 'hwz_178@126.com ', '12e3f9565d4884adfeb222613be90490', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10178', 'sunnn@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10179', 'liuzl@jzpt.com', '2b174c09c6f1bd0c10d48339545fb73c', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10180', 'sieuhf324@sohu.com', '3540d3a4cb48b4352a74ee6b0925e222', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10181', '156085407@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10182', 'yq@dotoyo.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10183', 'lsq0102@163.com', 'c66a8d744d21a87a9e1eed0275cd6b3c', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10185', 'wxlong7@126.com', 'bfdf55822a81576ec7c56c302d0caf92', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10187', 'she_liping2009@163.com', '40e628025c67f4a73866b7d201146f63', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10188', 'sndddeeq@163.com', '1d9cf30029b5b23dccab79644bf29e36', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10190', 'LUOXIAOBAO@SINA.com', '70f5232f20e1454cfb871a1f6cbbcd92', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10192', 'cobo91jm@126.com', '75caefbd3742e9c7f48254ba31bafc7b', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10193', 'shunda@hshsdxj.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10194', '809091181', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10195', 'dfzx@163.com', '1a628bc6e309f2b30b790f2a7a3b92d6', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10196', '406480898@qq.com', '20ff11e9deddb59eda66fa5dc34526fb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10197', 'the_daydream@sina.cn', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10198', '896786619@qq.com', 'c0b786852c3cf721448a36baf581a004', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10200', 'kdkjc@163.com', '8e09b7f0a8262a58cdffff32b10453cb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10203', '401370730@qq.com', 'a7dd3e7ab0f4f549ebe0e86252948a11', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10205', 'yices@126.com', '93638bd37cebfc3b09a23ea9d86aa18e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10207', '379670348@qq.com', '52e11474b624db81592d98f7a394bf83', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10208', 'yueyunlin@163.com', 'cbdbf78b3d8440f5e7d2b8c3412a95e5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10209', 'xfhtsoft', 'de9b9ed78d7e2e1dceeffee780e2f919', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10503', 'qpwdb@139.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10505', 'j122112@163.com', '09ba1b888bd7d200a233a8945817aca3', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10514', '174499659@qq.com', 'a0bdaa9051ab60f6b031880491c40f9d', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10515', 'ceshi@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10521', '2291040814@qq.com', '670b14728ad9902aecba32e22fa4f6bd', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10523', 'weibo@sina.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10524', 'hm-0922-mh@163.com', 'ce6f849da65bacdeb860ebc43768e430', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10527', '1943777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10529', 'xuzili001@163.com', '02fd195aa548d5d44a9f672728c7888a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10533', 'daxin-1-2-3@163.com', '0818899a6320093e155d288466bd63de', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10537', 'h_lmail@126.com', 'a264023d122068a3bd47f38768573445', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10539', 'msunn_seo@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10543', 'shitai@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10549', 'haimi777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10552', '13902929580@139.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10565', 'jsj3061wxw@163.com', 'f14b3f0e1e3e046f33d9ca1a25a2f2f4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10573', 'daolizhu777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10577', '15811818697@126.com', '86c243c7a34fa4d8018d4b259f6ac73e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10581', '18907086301@189.cn', '0128b3c717a5d185716bccc0bf96e09d', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10585', 'banqiaomei520@163.com', '278a3a0c60b4e7613433afb644be8700', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10587', 'football-boy-521@163.com', '0818899a6320093e155d288466bd63de', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10588', 'liba777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10590', '13755030179@163.com', 'fb4bea2d611bc64010efe99ec88cfbb0', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10596', 'moonlight_02527@sina.com', 'aa5c1962ece6a69348f1deeb78fe1189', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10598', 'znc@163.com', '8977ecbb8cb82d77fb091c7a7f186163', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10603', 'sun001@163.com', '5435c3120d93398c82747e319771bb58', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10608', 'wyan210@163.com', '99ef8301e1719bcacef0ccac50e92787', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10609', 'nicai@yahoo.com', '529faef522e1b7f8ce1387406caf9394', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10612', 'cobo91yq@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10613', 'sina@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10614', 'jiangnanshouzi777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10622', 'mobeipangzi777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10623', 'feiduduzuoweimen@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10628', 'niubihonghong777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10634', 'xfjy@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10643', '363085843@qq.com', '02f7042be08b5c44b3e29d2f1c5d23bb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10644', 'l_S_c2008@163.com', '022339d7574d92f406c460b6ca6c0c98', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10645', '553687235@qq.com', '9660b902c37bfe8c1ceb0f0829865e68', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10648', 'xishi256@163.com', 'e705e9cd43b715607fbc971054dcfa9b', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10655', '2426335181@qq.com', 'b47123e4109e6839adb7ae2a28300d96', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10660', 'zhuangbility@sina.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10661', 'name@domain.com', '22eecd4734de3ab076b43c7aa18fe560', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10666', 'ds@163.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10667', '1871290315@qq.com', '3f230640b78d7e71ac5514e57935eb69', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10673', 'www.shanghaoqq.com@qq.com', '64632707603057c09ac2ad75c08d0a48', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10675', 'shao_2010_liang@163.com', 'ca6b48f157ebb0f3e9c8b04fc52e0494', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10676', '13926553449@139.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10706', '1099484237@qq.com', '1c5a6f2ef5b29cf0fdb7d6ce225e5ad4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10707', 'chenhao1949@yahoo.com.cn', 'c912a7913233923c49aacbae86cd8ed3', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10710', 'cobo91sh@126.com', 'f021a7a1ca2ea677046004a70e8b10e1', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10716', '13714508986@qq.com', '2c3676c4c88fc372c087d3aa4ee946fa', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10717', 'lianshang1105@163.com', '303c7ac4c3c1d8b8bbf27942df81b2e8', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10726', '25776583@qq.com', '78cd0db10c8ae9c9fec5bdeb13554ae4', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10733', '331205549@qq.com', '790a26695c7c9f38fa32d95bfa6b8e4a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10737', '4592@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10738', 'whjsc@163.com', '067d966425e36a6cbfe2a9ffde4b2a4f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10752', '99@qq.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10753', 'dc2618@sina.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10755', 'theo_1234@163.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10760', 'dudu777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10763', 'cuiyi56@163.com', 'bcff7b2153e091b454d2a2d306c8da7a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10764', 'liuchaoya0115@126.com', 'a91edd4bc9a550f47ad845e9c3588fa5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10765', 'mezxy@tom.com455146637', '71b3b26aaa319e0cdf6fdb8429c112b0', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10767', '1006166554@qq.com', '39ec952ce29f6f5e451de6bf5b8c492f', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10773', 'bbbl@sina.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10774', '1871457583@qq.com', '54621b46c1664db5ba7127d8f22aff00', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10776', 'hdc@dotoyo.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10778', 'wweya2012@163.com', '7bd1592d280fbf89f0a8d94fd6063372', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10779', '363085366@qq.com', '77923b92bb25bdcea8d9cda6ae750b8a', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10783', 'zsyzays@sina.com', '05aa85afd09b362790302876b73ed825', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10790', 'EDA05@163.COM', '16439c0e6b2007686558e0859bfea4c5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10792', '16570709@qq.com', '0fc79078fb68f733eafbc1d9c94569eb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10797', 'jw780118@163.com', '3c3da637f193067b16edea9287831fa5', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10799', 'mezxy@tom.com', '71b3b26aaa319e0cdf6fdb8429c112b0', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10802', 'edwinzhang1983@gmail.com', '48ced6500bfcc27171fbdafe39ae5a49', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10803', 'zifan_dang@163.com', '0b13fa595b2b063a95b385988ee32abb', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10805', 'fan-wh@sohu.com', '2f69ef169e6b67a5b543203e10dcae67', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10807', '66026884@qq.com', 'dd9260f200b6d4feeaf565dd7a667995', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10809', '1762963599@qq.com', '32374a1ba466ff453407a25ca7c6105c', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10815', 'shoujijiyouweimen777@163.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10817', 'lshshome@21cn.com', '5d7fc987b9a2d1f1d14869bb2ce17478', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10819', '78583581@.qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10820', 'dbmqp@139.com', '1c8e1351077f7bb26cc3ae8cc3115646', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10824', '112@qq.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10827', 'cmmm@163.com', 'a7c146eca70e9102ecdeb7e35f210739', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10831', '345@163.com', 'b98eb823dc09e75c19ccbeab3133f0f6', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10833', '001166@126.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10836', '1111@126.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10839', '54649@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '2012-08-29 17:54:56', null);
INSERT INTO `t_login_user` VALUES ('10841', 'zx24585506@163.com', '96e79218965eb72c92a549dd5a330112', '0', '1', '2012-08-29 17:54:56', null);

-- ----------------------------
-- Table structure for `t_login_user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_user_admin`;
CREATE TABLE `t_login_user_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员名(Email)',
  `PASSWORD` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `POINT` decimal(10,0) DEFAULT '0' COMMENT '积分',
  `STATUS` int(11) DEFAULT '1' COMMENT '状态 0:停用;1:正常',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册日期',
  `lastLoginDate` datetime DEFAULT NULL COMMENT '最后登录日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=695 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员';

-- ----------------------------
-- Records of t_login_user_admin
-- ----------------------------
INSERT INTO `t_login_user_admin` VALUES ('543', 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '100000', '1', '2011-04-01 15:12:35', null);
INSERT INTO `t_login_user_admin` VALUES ('687', 'pgh', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-03 12:00:02', null);
INSERT INTO `t_login_user_admin` VALUES ('688', 'admin123', '4QrcOUm6Wau+VuBX8g+IPg==', '0', '1', '2011-04-06 15:20:32', null);
INSERT INTO `t_login_user_admin` VALUES ('689', 'ly', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-06 15:24:37', null);
INSERT INTO `t_login_user_admin` VALUES ('690', 'yq', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-06 17:44:35', null);
INSERT INTO `t_login_user_admin` VALUES ('691', 'admin1', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-06 18:59:08', null);
INSERT INTO `t_login_user_admin` VALUES ('692', 'admin1234', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-06 19:06:32', null);
INSERT INTO `t_login_user_admin` VALUES ('694', 'ceshi', 'ISGMyneATSuhkiwz4BURBQ==', '0', '1', '2011-04-22 10:44:48', null);

-- ----------------------------
-- Table structure for `t_personcenter_filtercompany`
-- ----------------------------
DROP TABLE IF EXISTS `t_personcenter_filtercompany`;
CREATE TABLE `t_personcenter_filtercompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名1',
  `companyName2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名2',
  `companyName3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名3',
  `companyName4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名4',
  `companyName5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名5',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='过滤企业访问设置';

-- ----------------------------
-- Records of t_personcenter_filtercompany
-- ----------------------------
INSERT INTO `t_personcenter_filtercompany` VALUES ('16', '大太阳', '博站', '', '', '', '301');
INSERT INTO `t_personcenter_filtercompany` VALUES ('17', '', '', '', '', '', '316');
INSERT INTO `t_personcenter_filtercompany` VALUES ('18', '', '', '', '', '', '307');
INSERT INTO `t_personcenter_filtercompany` VALUES ('19', '', '', '', '', '', '303');
INSERT INTO `t_personcenter_filtercompany` VALUES ('20', '', '', '', '', '', '324');
INSERT INTO `t_personcenter_filtercompany` VALUES ('21', '', '', '', '', '', '329');
INSERT INTO `t_personcenter_filtercompany` VALUES ('22', '', '', '', '', '', '352');

-- ----------------------------
-- Table structure for `t_salon_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_salon_article`;
CREATE TABLE `t_salon_article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `salonId` int(11) NOT NULL COMMENT '沙龙ID',
  `subject` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文章标题',
  `author` int(11) NOT NULL COMMENT '作者(或者上传者)',
  `content` longtext COLLATE utf8_unicode_ci COMMENT '内容',
  `pictureName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `videoName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频',
  `articleStatus` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `isExcellent` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否为经典沙龙文章',
  `browseCount` decimal(10,0) DEFAULT '0' COMMENT '被浏览次数',
  `reputationCount` decimal(10,0) DEFAULT '0' COMMENT '好评次数',
  `SchlussgruppeCount` decimal(10,0) DEFAULT '0' COMMENT '差评次数',
  `isRecomment` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否推荐(0-否,1-是)',
  `iscream` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否精华(0-否,1-是)',
  `submitDate` datetime DEFAULT NULL COMMENT '发表时间',
  `offlineSalonColumn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '线下沙龙栏目(线上沙龙此列为空)',
  `articleBelongTo` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '线下沙龙文章的作者(线上沙龙为空)',
  `facePicName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '线下沙龙文章人物头像图片名称',
  `authorName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`ID`),
  KEY `fk_t_salon_article_salonId` (`salonId`) USING BTREE,
  KEY `fk_t_salon_article_author` (`author`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_salon_article
-- ----------------------------
INSERT INTO `t_salon_article` VALUES ('528', '1786', '测试中文', '297', '<p>\r\n	http://localhost:8080/uploadFile/13018161006314031535.jpg</p>\r\n', '', '', '1', '1', '13', '1', '0', '1', '1', '2011-07-19 14:33:27', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('529', '1786', '我要讲话', '297', '<p>\r\n	美吧？</p>\r\n', '13021586926574071444.jpg', '', '1', '1', '1', '0', '0', '1', '1', '2011-04-07 14:44:52', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('530', '1786', '我要讲话2', '297', '<p>\r\n	/memcached -d -m 1024 -u root -p 11211 -c 1024 -P /tmp/memcached.pid</p>\r\n', '13021625107024071548.jpg', '', '1', '1', '3', '0', '0', '1', '1', '2011-04-07 15:48:30', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('531', '1786', '我要讲话2', '297', '<p>\r\n	/memcached -d -m 1024 -u root -p 11211 -c 1024 -P /tmp/memcached.pid</p>\r\n', '13021625263614071548.jpg', '', '1', '1', '8', '0', '0', '1', '1', '2011-04-07 15:48:46', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('532', '1789', '111', '302', '<p>\r\n	<li>\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420581\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420581\" jquery1302320165578=\"2\" target=\"_blank\"><font color=\"#5e98d7\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=1656314\" target=\"_blank\">lxy_***omao@163.com</a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-09 09:30&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=194\"><font color=\"#41637c\">邮箱版本</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=195\"><font color=\"#41637c\">适配iPad</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n</p>\r\n<ul>\r\n	<li class=\"col\">\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420574\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420574\" jquery1302320165578=\"4\" target=\"_blank\"><font color=\"#5e98d7\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=5268529\" target=\"_blank\">lijili***97003@163.com</a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-09 09:25&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=194\"><font color=\"#41637c\">邮箱版本</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=195\"><font color=\"#41637c\">适配iPad</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li>\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419716\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">现在还有什么积分活动吗?</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419716\" jquery1302320165578=\"6\" target=\"_blank\"><font color=\"#5e98d7\">现在还有什么积分活动吗?</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=1767778\" target=\"_blank\">driftk***_fuzed@163.com</a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 23:30&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=21\"><font color=\"#41637c\">密码/帐号问题</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=50\"><font color=\"#41637c\">取回密码</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li class=\"col\">\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419398\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">求专业人士推荐一个好点的少儿美术培训机构!~~</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419398\" jquery1302320165578=\"8\" target=\"_blank\"><font color=\"#5e98d7\">我儿子喜欢画画，，特别喜欢自己在家乱涂乱画的。我和他爸爸商量着送他去一家专业点的画室培训。</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=5247981\" target=\"_blank\">ine***nn@163.com</a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 14:47&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=21\"><font color=\"#41637c\">密码/帐号问题</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=51\"><font color=\"#41637c\">密码保护</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li>\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419989\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">积分都能干什么&ldquo;？</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419989\" jquery1302320165578=\"10\" target=\"_blank\"><font color=\"#5e98d7\">同上</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=3419629\" target=\"_blank\">lich***666@163.com</a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 13:55&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=29\"><font color=\"#41637c\">邮箱积分</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=80\"><font color=\"#41637c\">邮箱积分</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n</ul>\r\n', '13023213228844091155.jpg', '', '1', '1', '17', '1', '0', '1', '1', '2011-04-09 11:55:22', '018-1001', '111', '13023213229014091155.jpg', null);
INSERT INTO `t_salon_article` VALUES ('533', '1789', '222', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，</p>\r\n<p jquery1302321228796=\"5\">\r\n	上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023223890974091213.jpg', '', '1', '0', '0', '0', '0', '0', '0', '2011-04-09 12:13:09', '018-1001', '222', '13023223890974091213.jpg', null);
INSERT INTO `t_salon_article` VALUES ('534', '1789', '333', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023228295254091220.jpg', '', '1', '0', '0', '0', '0', '0', '0', '2011-04-09 12:20:29', '018-1002', '111', '13023228295264091220.jpg', null);
INSERT INTO `t_salon_article` VALUES ('535', '1789', '333', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023228737074091221.jpg', '', '1', '1', '11', '1', '0', '1', '1', '2011-04-09 12:21:13', '018-1002', '111', '13023228737084091221.jpg', null);
INSERT INTO `t_salon_article` VALUES ('536', '1789', '333', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023229083004091221.jpg', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-09 12:21:48', '018-1002', '111', '13023229083014091221.jpg', null);
INSERT INTO `t_salon_article` VALUES ('537', '1789', '444', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023232774774091227.jpg', '', '1', '1', '5', '0', '0', '0', '0', '2011-04-09 12:27:57', '018-1003', '444', '13023232774774091227.jpg', null);
INSERT INTO `t_salon_article` VALUES ('538', '1789', '444', '302', '<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n<p jquery1302321228796=\"5\">\r\n	我儿子在我们家附近的画室学画画,叫达达画室. 上了3个月的课了，上次我小叔子来家里，看到儿子的画，给他好一顿夸，说孩子画画的比例还有创意的构思都很好。小叔子是北师大中国画研究生毕业的，是青年画家。地址是在螃蟹甲,离你们家比较近的&hellip;.</p>\r\n', '13023232945164091228.jpg', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-09 12:28:14', '018-1003', '444', '13023232945174091228.jpg', null);
INSERT INTO `t_salon_article` VALUES ('539', '1788', '11', '307', '<p>\r\n	11</p>\r\n', '', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-11 16:44:48', '018-1001', '111', '', null);
INSERT INTO `t_salon_article` VALUES ('540', '1788', '11', '307', '<p>\r\n	11</p>\r\n', '', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-11 16:47:42', '018-1001', '111', '', null);
INSERT INTO `t_salon_article` VALUES ('541', '1788', '11', '307', '<p>\r\n	11</p>\r\n', '', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-11 16:47:45', '018-1001', '111', '', null);
INSERT INTO `t_salon_article` VALUES ('542', '1788', '11', '307', '<p>\r\n	11</p>\r\n', '', '', '1', '1', '1', '0', '0', '1', '1', '2011-04-11 16:48:21', '018-1001', '111', '', null);
INSERT INTO `t_salon_article` VALUES ('543', '1811', '测试文章', '307', '<p>\r\n	测试文章测试文章测试文章测试文章测试文章测试文章</p>\r\n', '13025175329524111825.jpg', '13025175329524111825.rm', '1', '1', '8', '1', '3', '1', '1', '2011-04-11 18:25:32', '018-1001', '测试文章11', '13025175329534111825.jpg', null);
INSERT INTO `t_salon_article` VALUES ('544', '1811', '测试文章', '307', '<p>\r\n	测试文章测试文章测试文章测试文章测试文章测试文章</p>\r\n', '13025176043654111826.jpg', '13025176043654111826.rm', '1', '1', '1', '0', '0', '1', '1', '2011-04-11 18:26:44', '018-1001', '测试文章11', '13025176043664111826.jpg', null);
INSERT INTO `t_salon_article` VALUES ('547', '1789', '用户互动', '302', '<p>\r\n	用户互动用户互动</p>\r\n', '13025751571894121025.jpg', '13025751571904121025.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 10:25:57', '018-1006', '用户互动', '13025751571904121025.jpg', null);
INSERT INTO `t_salon_article` VALUES ('546', '1789', '用户互动', '302', '<p>\r\n	用户互动用户互动</p>\r\n', '13025750052974121023.jpg', '13025750052984121023.rm', '1', '1', '29', '2', '8', '1', '1', '2011-04-12 10:23:25', '018-1006', '用户互动', '13025750052984121023.jpg', null);
INSERT INTO `t_salon_article` VALUES ('548', '1789', '用户互动', '302', '<p>\r\n	用户互动用户互动</p>\r\n', '13025759095634121038.jpg', '13025759095644121038.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 10:38:29', '018-1006', '用户互动', '13025759095644121038.jpg', null);
INSERT INTO `t_salon_article` VALUES ('549', '1789', '个人嘉宾互动', '303', '<p>\r\n	个人嘉宾互动</p>\r\n', '13025971818294121633.jpg', '13025971818304121633.rm', '1', '1', '6', '2', '1', '0', '0', '2011-04-12 16:33:01', '018-1005', '个人嘉宾互动', '13025971818314121633.jpg', null);
INSERT INTO `t_salon_article` VALUES ('550', '1789', '个人嘉宾互动', '303', '<p>\r\n	个人嘉宾互动</p>\r\n', '13025972242864121633.jpg', '13025972242874121633.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 16:33:44', '018-1005', '个人嘉宾互动', '13025972242874121633.jpg', null);
INSERT INTO `t_salon_article` VALUES ('551', '1789', '个人嘉宾互动', '303', '<p>\r\n	个人嘉宾互动</p>\r\n', '13025972412404121634.jpg', '13025972412414121634.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 16:34:01', '018-1005', '个人嘉宾互动', '13025972412414121634.jpg', null);
INSERT INTO `t_salon_article` VALUES ('552', '1789', '111', '302', '<p>\r\n	1111111</p>\r\n', '13025978353974121643.jpg', '13025978353984121643.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 16:43:55', '018-1001', '111', '13025978353994121643.jpg', null);
INSERT INTO `t_salon_article` VALUES ('553', '1789', '测试嘉宾致辞', '302', '<p>\r\n	测试嘉宾致辞测试嘉宾致辞</p>\r\n', '13025978710204121644.jpg', '13025978710214121644.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-12 16:44:31', '018-1001', '测试嘉宾致辞', '13025978710224121644.jpg', null);
INSERT INTO `t_salon_article` VALUES ('554', '1841', '阿斯顿飞巍峨乏味哦', '314', '<p>\r\n	微蜂窝恶报法律文化发布wife</p>\r\n<p>\r\n	无纺布无法ibwfiw 万分无法哦uwpefwef</p>\r\n<p>\r\n	我俄方帮我iefdwef 无法额外废弃物服务器【份额</p>\r\n<p>\r\n	无法恶报王府井我ifbwf 任发改委发文服务哦</p>\r\n<p>\r\n	我俄方部分iwfpwfwfwef 我俄方破口无法看完哦佛为</p>\r\n<p>\r\n	服务发票武汉反扒我俄方片我俄方</p>\r\n<p>\r\n	我俄方ibwpefibwpefb</p>\r\n', '13027477662544141022.jpg', '', '1', '0', '1', '0', '0', '0', '0', '2011-04-14 10:22:46', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('555', '1841', '阿斯顿飞巍峨乏味哦', '314', '<p>\r\n	微蜂窝恶报法律文化发布wife</p>\r\n<p>\r\n	无纺布无法ibwfiw 万分无法哦uwpefwef</p>\r\n<p>\r\n	我俄方帮我iefdwef 无法额外废弃物服务器【份额</p>\r\n<p>\r\n	无法恶报王府井我ifbwf 任发改委发文服务哦</p>\r\n<p>\r\n	我俄方部分iwfpwfwfwef 我俄方破口无法看完哦佛为</p>\r\n<p>\r\n	服务发票武汉反扒我俄方片我俄方</p>\r\n<p>\r\n	我俄方ibwpefibwpefb</p>\r\n', '13027478323614141023.jpg', '', '1', '1', '6', '1', '0', '0', '0', '2011-04-14 10:23:52', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('556', '1841', '沃尔夫平稳而蜂鸟网', '314', '<p>\r\n	网而过iewrgpewrpgwerg</p>\r\n<p>\r\n	而根据鞥平稳而高品位恶搞评价网而过</p>\r\n<p>\r\n	网而过客人过来色谱高僧僧</p>\r\n<p>\r\n	二个ijebngpieguergnwev</p>\r\n<p>\r\n	让各位贵宾我和各位恶搞万恶不</p>\r\n<p>\r\n	而非干涸不过发iebigbweigb</p>\r\n', '13027479134704141025.jpg', '', '1', '1', '8', '0', '0', '0', '0', '2011-04-14 10:25:13', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('557', '1841', '沃尔夫平稳而蜂鸟网', '314', '<p>\r\n	网而过iewrgpewrpgwerg</p>\r\n<p>\r\n	而根据鞥平稳而高品位恶搞评价网而过</p>\r\n<p>\r\n	网而过客人过来色谱高僧僧</p>\r\n<p>\r\n	二个ijebngpieguergnwev</p>\r\n<p>\r\n	让各位贵宾我和各位恶搞万恶不</p>\r\n<p>\r\n	而非干涸不过发iebigbweigb</p>\r\n', '13027479601714141026.jpg', '', '0', '0', '0', '0', '0', '0', '0', '2011-04-14 10:26:00', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('558', '1787', '测试嘉宾致辞', '302', '<p>\r\n	&nbsp;</p>\r\n<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420581\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></strong></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420581\" jquery1302320165578=\"2\" target=\"_blank\"><font color=\"#5e98d7\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<table border=\"0\" cellspacing=\"0\">\r\n					<tbody>\r\n						<tr class=\"font_h font_e\">\r\n							<td class=\"font_b2 font7\">\r\n								<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=1656314\" target=\"_blank\"><font color=\"#ff6600\">lxy_***omao@163.com</font></a>&nbsp;&nbsp;</td>\r\n							<td>\r\n								2011-04-09 09:30&nbsp;&nbsp;</td>\r\n							<td>\r\n								<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n							<td>\r\n								5分&nbsp;&nbsp;&nbsp;</td>\r\n							<td class=\"font8\">\r\n								[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=194\"><font color=\"#41637c\">邮箱版本</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=195\"><font color=\"#41637c\">适配iPad</font></a>]</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n<ul>\r\n	<li class=\"col\">\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420574\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=420574\" jquery1302320165578=\"4\" target=\"_blank\"><font color=\"#5e98d7\">网易邮箱通讯录支持哪些格式的通讯录文件导入？</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=5268529\" target=\"_blank\"><font color=\"#ff6600\">lijili***97003@163.com</font></a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-09 09:25&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=194\"><font color=\"#41637c\">邮箱版本</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=195\"><font color=\"#41637c\">适配iPad</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li>\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419716\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">现在还有什么积分活动吗?</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419716\" jquery1302320165578=\"6\" target=\"_blank\"><font color=\"#5e98d7\">现在还有什么积分活动吗?</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=1767778\" target=\"_blank\"><font color=\"#ff6600\">driftk***_fuzed@163.com</font></a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 23:30&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=21\"><font color=\"#41637c\">密码/帐号问题</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=50\"><font color=\"#41637c\">取回密码</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li class=\"col\">\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419398\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">求专业人士推荐一个好点的少儿美术培训机构!~~</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419398\" jquery1302320165578=\"8\" target=\"_blank\"><font color=\"#5e98d7\">我儿子喜欢画画，，特别喜欢自己在家乱涂乱画的。我和他爸爸商量着送他去一家专业点的画室培训。</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=5247981\" target=\"_blank\"><font color=\"#ff6600\">ine***nn@163.com</font></a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 14:47&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=21\"><font color=\"#41637c\">密码/帐号问题</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=51\"><font color=\"#41637c\">密码保护</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n	<li>\r\n		<table border=\"0\" cellspacing=\"5\" class=\"q_li_main\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font_big font_b\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419989\" target=\"_blank\"><strong><font color=\"#5e98d7\" size=\"3\">积分都能干什么&ldquo;？</font></strong></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<a class=\"font_b1 font11\" href=\"http://zhidao.mail.163.com/zhidao/topic/view.do?qid=419989\" jquery1302320165578=\"10\" target=\"_blank\"><font color=\"#5e98d7\">同上</font></a></td>\r\n				</tr>\r\n				<tr>\r\n					<td>\r\n						<table border=\"0\" cellspacing=\"0\">\r\n							<tbody>\r\n								<tr class=\"font_h font_e\">\r\n									<td class=\"font_b2 font7\">\r\n										<a href=\"http://zhidao.mail.163.com/zhidao/user/view.do?id=3419629\" target=\"_blank\"><font color=\"#ff6600\">lich***666@163.com</font></a>&nbsp;&nbsp;</td>\r\n									<td>\r\n										2011-04-08 13:55&nbsp;&nbsp;</td>\r\n									<td>\r\n										<img src=\"http://mimg.163.com/xm/know/icon-25.gif\" /></td>\r\n									<td>\r\n										5分&nbsp;&nbsp;&nbsp;</td>\r\n									<td class=\"font8\">\r\n										[<a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=29\"><font color=\"#41637c\">邮箱积分</font></a> - <a href=\"http://zhidao.mail.163.com/zhidao/browse/browse/browse.do?tid=80\"><font color=\"#41637c\">邮箱积分</font></a>]</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>\r\n', '13032010252434191617.jpg', '13032010252444191617.rm', '1', '0', '1', '0', '0', '0', '0', '2011-04-19 16:17:05', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('559', '1789', '测试视频封面', '302', '<p>\r\n	测试视频封面</p>\r\n', '13032020068594191633.jpg', '13032020068594191633.rm', '1', '0', '0', '0', '0', '0', '0', '2011-04-19 16:33:26', '018-1002', '我', '13032020068604191633.jpg', null);
INSERT INTO `t_salon_article` VALUES ('560', '1789', '测试作者', '302', '<p>\r\n	测试作者</p>\r\n', '13032030730914191651.jpg', '13032030730924191651.rm', '1', '0', '1', '0', '0', '0', '0', '2011-04-19 16:51:13', '018-1002', '测试作者名称', '13032030730924191651.jpg', null);
INSERT INTO `t_salon_article` VALUES ('561', '1789', '测试作者', '302', '<p>\r\n	测试作者</p>\r\n', '13032030982184191651.jpg', '13032030982194191651.rm', '1', '0', '0', '0', '0', '0', '0', '2011-04-19 16:51:38', '018-1002', '测试作者名称', '13032030982194191651.jpg', null);
INSERT INTO `t_salon_article` VALUES ('562', '1798', '测试作者名称', '302', '<p>\r\n	测试作者名称</p>\r\n', '13032039309124191705.jpg', '13032039309134191705.rm', '1', '0', '0', '0', '0', '0', '0', '2011-04-19 17:05:30', '018-1001', '测试作者名称', '13032039309134191705.jpg', null);
INSERT INTO `t_salon_article` VALUES ('563', '1798', '测试作者名称', '302', '<p>\r\n	测试作者名称</p>\r\n', '13032039552374191705.jpg', '13032039552384191705.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-19 17:05:55', '018-1001', '测试作者名称', '13032039552384191705.jpg', null);
INSERT INTO `t_salon_article` VALUES ('564', '1798', '测试作者名称', '302', '<p>\r\n	测试作者名称</p>\r\n', '13032039758114191706.jpg', '13032039758114191706.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-19 17:06:15', '018-1001', '测试作者名称', '13032039758124191706.jpg', null);
INSERT INTO `t_salon_article` VALUES ('565', '1799', '测试作者名称标题', '302', '<p>\r\n	测试</p>\r\n', '13032040589724191707.jpg', '13032040589734191707.rm', '1', '0', '1', '0', '0', '0', '0', '2011-04-19 17:07:38', '018-1001', '作者名称', '13032040589734191707.jpg', null);
INSERT INTO `t_salon_article` VALUES ('566', '1799', '测试作者名称标题', '302', '<p>\r\n	测试</p>\r\n', '13032040751874191707.jpg', '13032040751884191707.rm', '0', '0', '0', '0', '0', '0', '0', '2011-04-19 17:07:55', '018-1001', '作者名称', '13032040751884191707.jpg', null);
INSERT INTO `t_salon_article` VALUES ('568', '1844', '测试内容1', '302', '<p>\r\n	测试内容1</p>\r\n', '13034698938604221858.jpg', '13034698938614221858.flv', '1', '0', '2', '0', '0', '0', '0', '2011-04-22 18:58:13', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('569', '1844', '测试内容1', '302', '<p>\r\n	测试内容1测试内容1</p>\r\n', '13034699120434221858.jpg', '13034699120444221858.flv', '1', '0', '0', '0', '0', '0', '0', '2011-04-22 18:58:32', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('570', '1844', '测试内容2', '302', '<p>\r\n	测试内容1</p>\r\n', '13034699384154221858.jpg', '13034699384154221858.flv', '1', '0', '0', '0', '0', '0', '0', '2011-04-22 18:58:58', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('571', '1844', '测试内容3', '302', '<p>\r\n	测试内容3</p>\r\n', '13034699537504221859.jpg', '13034699537514221859.flv', '1', '0', '1', '0', '0', '0', '0', '2011-04-22 18:59:13', '', '', '', null);
INSERT INTO `t_salon_article` VALUES ('572', '1845', '111', '302', '<p>\r\n	1111</p>\r\n', '13034703621354221906.jpg', '13034703621354221906.flv', '1', '0', '0', '0', '0', '0', '0', '2011-04-22 19:06:02', '018-1001', '111', '13034703621364221906.jpg', null);
INSERT INTO `t_salon_article` VALUES ('573', '1845', '222', '302', '<p>\r\n	1222</p>\r\n', '13034709700814221916.jpg', '13034709700814221916.flv', '1', '0', '0', '0', '0', '0', '0', '2011-04-22 19:16:10', '018-1002', '111', '13034709700814221916.jpg', null);
INSERT INTO `t_salon_article` VALUES ('574', '1845', '222', '302', '<p>\r\n	1222</p>\r\n', '13034709704284221916.jpg', '13034709704284221916.flv', '1', '0', '0', '0', '0', '0', '0', '2011-04-22 19:16:10', '018-1002', '111', '13034709704294221916.jpg', null);
INSERT INTO `t_salon_article` VALUES ('575', '1789', '11', '329', '<p>\r\n	1111</p>\r\n', '13038130607814261817.jpg', '13038130607814261817.flv', '0', '0', '0', '0', '0', '0', '0', '2011-04-26 18:17:40', '018-1001', '111', '13038130607824261817.jpg', null);
INSERT INTO `t_salon_article` VALUES ('576', '1844', '11111111111111', '331', '<p>\r\n	111111111111111</p>\r\n<hr />\r\n', '13043961659585031216.jpg', '13043961659595031216.rm', '1', '0', '13', '1', '4', '0', '0', '2011-05-03 12:16:05', '', '', '', '');
INSERT INTO `t_salon_article` VALUES ('577', '1839', '嘉宾致辞的标题', '331', '<p>\r\n	嘉宾致辞的作者</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	嘉宾致辞的作者</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://hrf.dotoyo.com/uploadFile/201105/1304420671508.jpg\" style=\"width: 87px; height: 88px\" />嘉宾致辞的作者嘉 <img alt=\"\" src=\"http://hrf.dotoyo.com/uploadFile/201105/1304420696710.jpg\" style=\"width: 87px; height: 88px\" />宾致辞的作者</p>\r\n<p>\r\n	嘉宾致辞的作者</p>\r\n', '13044217826715031923.bmp', '13044217826735031923.rm', '1', '0', '13', '0', '0', '0', '0', '2011-05-03 19:23:02', '018-1001', '嘉宾致辞的作者', '13044217826745031923.bmp', '嘉宾致辞的作者');
INSERT INTO `t_salon_article` VALUES ('578', '1831', '线上沙龙文章标题', '331', '<p>\r\n	线上沙龙文章标题</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	线上沙龙文章标题</p>\r\n', '13044244990425032008.jpg', '13044244990525032008.rm', '1', '0', '20', '0', '0', '0', '0', '2011-05-03 20:08:19', '', '', '', '');
INSERT INTO `t_salon_article` VALUES ('579', '1831', '1111', '303', '<p>\r\n	11111111</p>\r\n', '13044752060595041013.jpg', '13044752060595041013.rm', '0', '0', '0', '0', '0', '0', '0', '2011-05-04 10:13:26', '', '', '', '');
INSERT INTO `t_salon_article` VALUES ('580', '1826', '嘉宾致辞的标题', '302', '<p>\r\n	11111111111111雅雅<img alt=\"\" src=\"http://hrf.dotoyo.com/uploadFile/201105/1304510831548.jpg\" style=\"width: 1680px; height: 730px\" /></p>\r\n', '13045108506885042007.jpg', '13045108506915042007.avi', '1', '0', '4', '0', '0', '0', '0', '2011-05-04 20:07:30', '018-1001', '嘉宾致辞的作者', '13045108506935042007.gif', '嘉宾致辞的作者');
INSERT INTO `t_salon_article` VALUES ('581', '1831', '测试嘉宾致辞', '331', '<p>\r\n	测试嘉宾致辞测</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	试嘉宾致辞测试</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://hrf.dotoyo.com/uploadFile/201105/1304646991903.jpg\" style=\"width: 612px; height: 82px\" /></p>\r\n<p>\r\n	嘉宾致辞测试嘉宾致辞</p>\r\n<p>\r\n	<img alt=\"\" src=\"http://hrf.dotoyo.com/uploadFile/201105/1304647030963.jpg\" style=\"width: 1680px; height: 730px\" /></p>\r\n', '13046470427175060957.gif', '13046470427295060957.avi', '1', '0', '13', '0', '0', '0', '0', '2011-05-06 09:57:22', '', '', '', '');
INSERT INTO `t_salon_article` VALUES ('582', '1863', '测试标题', '331', '<p>\r\n	测试标题测试标题测试标题测试标题</p>\r\n', '13111335704277201146.jpg', '13111335704287201146.flv', '1', '0', '16', '0', '0', '0', '0', '2011-07-20 11:46:10', '018-1001', '测试标题作者', '13111335704287201146.jpg', '测试标题作者');
INSERT INTO `t_salon_article` VALUES ('583', '1863', '测试标题2', '331', '<p>\r\n	测试标题测试标题</p>\r\n', '13111336018587201146.jpg', '13111336018587201146.flv', '1', '0', '16', '2', '0', '0', '0', '2011-07-20 11:46:41', '018-1004', '测试标题作者2', '13111336018597201146.jpg', '测试标题作者2');
INSERT INTO `t_salon_article` VALUES ('584', '1863', '测试标题3', '331', '<p>\r\n	测试标题3测试标题3</p>\r\n', '13111342185157201156.jpg', '13111342185187201156.flv', '1', '0', '2', '0', '0', '0', '0', '2011-07-20 11:56:58', '018-1006', '测试标题3作者', '13111342185187201156.jpg', '测试标题3作者');
INSERT INTO `t_salon_article` VALUES ('585', '1863', '测试标题4', '307', '<p>\r\n	测试标题4测试标题4测试标题4</p>\r\n', '13111460147657201513.jpg', '13111460147687201513.flv', '1', '0', '1', '0', '0', '0', '0', '2011-07-20 15:13:34', '018-1002', '测试标题作者4', '13111460147697201513.jpg', '测试标题作者4');
INSERT INTO `t_salon_article` VALUES ('586', '1858', '测试标题5', '307', '<p>\r\n	测试标题5</p>\r\n', '13111461917657201516.jpg', '13111461917667201516.flv', '1', '0', '1', '0', '0', '0', '0', '2011-07-20 15:16:31', '018-1006', '测试标题作者5', '13111461917667201516.jpg', '测试标题作者5');

-- ----------------------------
-- Table structure for `t_salon_attend`
-- ----------------------------
DROP TABLE IF EXISTS `t_salon_attend`;
CREATE TABLE `t_salon_attend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salonId` int(11) DEFAULT NULL COMMENT '沙龙ID',
  `userId` int(11) DEFAULT NULL COMMENT '参加者',
  `joinDate` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`),
  KEY `FK_attend_salonId` (`salonId`) USING BTREE,
  KEY `FK_attend_userId` (`userId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=789 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='沙龙参加者';

-- ----------------------------
-- Records of t_salon_attend
-- ----------------------------
INSERT INTO `t_salon_attend` VALUES ('667', '1786', '302', '2011-04-03 15:31:54');
INSERT INTO `t_salon_attend` VALUES ('668', '1787', '297', '2011-04-03 15:35:00');
INSERT INTO `t_salon_attend` VALUES ('669', '1786', '297', '2011-04-03 15:43:51');
INSERT INTO `t_salon_attend` VALUES ('767', '1854', '331', '2011-05-03 17:30:31');
INSERT INTO `t_salon_attend` VALUES ('768', '1855', '331', '2011-05-03 17:32:09');
INSERT INTO `t_salon_attend` VALUES ('766', '1853', '331', '2011-05-03 17:26:31');
INSERT INTO `t_salon_attend` VALUES ('765', '1844', '331', '2011-05-03 12:12:12');
INSERT INTO `t_salon_attend` VALUES ('764', '1789', '329', '2011-04-26 18:16:55');
INSERT INTO `t_salon_attend` VALUES ('763', '1845', '329', '2011-04-26 18:15:35');
INSERT INTO `t_salon_attend` VALUES ('676', '1794', '302', '2011-04-07 17:35:35');
INSERT INTO `t_salon_attend` VALUES ('677', '1795', '302', '2011-04-07 17:35:39');
INSERT INTO `t_salon_attend` VALUES ('678', '1796', '302', '2011-04-08 09:28:03');
INSERT INTO `t_salon_attend` VALUES ('679', '1797', '302', '2011-04-08 09:28:27');
INSERT INTO `t_salon_attend` VALUES ('762', '1852', '329', '2011-04-26 18:14:23');
INSERT INTO `t_salon_attend` VALUES ('761', '1851', '329', '2011-04-26 18:11:25');
INSERT INTO `t_salon_attend` VALUES ('760', '1850', '302', '2011-04-26 09:07:33');
INSERT INTO `t_salon_attend` VALUES ('759', '1849', '331', '2011-04-25 09:08:51');
INSERT INTO `t_salon_attend` VALUES ('684', '1802', '302', '2011-04-08 18:45:11');
INSERT INTO `t_salon_attend` VALUES ('685', '1803', '302', '2011-04-08 18:45:30');
INSERT INTO `t_salon_attend` VALUES ('686', '1804', '302', '2011-04-08 18:45:42');
INSERT INTO `t_salon_attend` VALUES ('756', '1846', '302', '2011-04-22 11:18:51');
INSERT INTO `t_salon_attend` VALUES ('688', '1806', '302', '2011-04-08 18:51:28');
INSERT INTO `t_salon_attend` VALUES ('689', '1807', '302', '2011-04-08 18:51:53');
INSERT INTO `t_salon_attend` VALUES ('755', '1845', '302', '2011-04-22 11:06:29');
INSERT INTO `t_salon_attend` VALUES ('754', '1844', '302', '2011-04-19 17:10:31');
INSERT INTO `t_salon_attend` VALUES ('758', '1848', '302', '2011-04-22 11:32:52');
INSERT INTO `t_salon_attend` VALUES ('694', '1787', '302', '2011-04-11 15:49:46');
INSERT INTO `t_salon_attend` VALUES ('753', '1798', '302', '2011-04-19 17:04:43');
INSERT INTO `t_salon_attend` VALUES ('752', '1799', '302', '2011-04-19 16:53:31');
INSERT INTO `t_salon_attend` VALUES ('751', '1844', '314', '2011-04-19 10:45:49');
INSERT INTO `t_salon_attend` VALUES ('750', '1843', '331', '2011-04-18 18:19:28');
INSERT INTO `t_salon_attend` VALUES ('749', '1842', '331', '2011-04-18 18:19:06');
INSERT INTO `t_salon_attend` VALUES ('700', '1817', '302', '2011-04-11 16:21:08');
INSERT INTO `t_salon_attend` VALUES ('732', '1830', '307', '2011-04-12 15:07:11');
INSERT INTO `t_salon_attend` VALUES ('745', '1789', '302', '2011-04-12 16:41:15');
INSERT INTO `t_salon_attend` VALUES ('747', '1840', '303', '2011-04-12 17:10:59');
INSERT INTO `t_salon_attend` VALUES ('746', '1839', '303', '2011-04-12 17:10:14');
INSERT INTO `t_salon_attend` VALUES ('748', '1841', '314', '2011-04-14 10:21:09');
INSERT INTO `t_salon_attend` VALUES ('742', '1789', '303', '2011-04-12 16:23:39');
INSERT INTO `t_salon_attend` VALUES ('741', '1826', '307', '2011-04-12 15:23:10');
INSERT INTO `t_salon_attend` VALUES ('740', '1828', '307', '2011-04-12 15:22:42');
INSERT INTO `t_salon_attend` VALUES ('739', '1820', '307', '2011-04-12 15:22:21');
INSERT INTO `t_salon_attend` VALUES ('738', '1789', '307', '2011-04-12 15:20:55');
INSERT INTO `t_salon_attend` VALUES ('737', '1838', '307', '2011-04-12 15:12:28');
INSERT INTO `t_salon_attend` VALUES ('734', '1836', '307', '2011-04-12 15:08:14');
INSERT INTO `t_salon_attend` VALUES ('736', '1824', '307', '2011-04-12 15:10:58');
INSERT INTO `t_salon_attend` VALUES ('714', '1826', '303', '2011-04-12 11:55:49');
INSERT INTO `t_salon_attend` VALUES ('715', '1827', '303', '2011-04-12 11:59:02');
INSERT INTO `t_salon_attend` VALUES ('716', '1828', '303', '2011-04-12 11:59:37');
INSERT INTO `t_salon_attend` VALUES ('717', '1829', '303', '2011-04-12 12:01:44');
INSERT INTO `t_salon_attend` VALUES ('718', '1830', '303', '2011-04-12 12:09:27');
INSERT INTO `t_salon_attend` VALUES ('719', '1831', '303', '2011-04-12 12:10:34');
INSERT INTO `t_salon_attend` VALUES ('720', '1832', '303', '2011-04-12 12:10:50');
INSERT INTO `t_salon_attend` VALUES ('757', '1847', '302', '2011-04-22 11:22:57');
INSERT INTO `t_salon_attend` VALUES ('769', '1856', '331', '2011-05-03 17:53:59');
INSERT INTO `t_salon_attend` VALUES ('770', '1839', '331', '2011-05-03 19:03:19');
INSERT INTO `t_salon_attend` VALUES ('771', '1831', '331', '2011-05-03 20:07:38');
INSERT INTO `t_salon_attend` VALUES ('772', '1831', '302', '2011-05-04 16:28:16');
INSERT INTO `t_salon_attend` VALUES ('773', '1857', '331', '2011-05-04 19:22:10');
INSERT INTO `t_salon_attend` VALUES ('774', '1826', '302', '2011-05-04 20:05:59');
INSERT INTO `t_salon_attend` VALUES ('775', '1826', '331', '2011-05-06 11:00:18');
INSERT INTO `t_salon_attend` VALUES ('776', '1853', '323', '2011-05-09 16:03:38');
INSERT INTO `t_salon_attend` VALUES ('777', '1858', '331', '2011-07-19 16:13:52');
INSERT INTO `t_salon_attend` VALUES ('778', '1859', '331', '2011-07-19 16:31:33');
INSERT INTO `t_salon_attend` VALUES ('779', '1860', '331', '2011-07-19 16:32:17');
INSERT INTO `t_salon_attend` VALUES ('780', '1861', '331', '2011-07-19 16:37:33');
INSERT INTO `t_salon_attend` VALUES ('781', '1862', '331', '2011-07-19 19:15:21');
INSERT INTO `t_salon_attend` VALUES ('782', '1863', '331', '2011-07-20 09:10:47');
INSERT INTO `t_salon_attend` VALUES ('783', '1863', '307', '2011-07-20 15:12:13');
INSERT INTO `t_salon_attend` VALUES ('784', '1858', '307', '2011-07-20 15:16:01');
INSERT INTO `t_salon_attend` VALUES ('785', '1864', '307', '2011-07-20 15:55:17');
INSERT INTO `t_salon_attend` VALUES ('786', '1865', '307', '2011-07-20 15:56:40');
INSERT INTO `t_salon_attend` VALUES ('787', '1866', '331', '2011-07-21 11:35:56');
INSERT INTO `t_salon_attend` VALUES ('788', '1859', '307', '2011-08-05 12:26:05');

-- ----------------------------
-- Table structure for `t_salon_homepagedisplay`
-- ----------------------------
DROP TABLE IF EXISTS `t_salon_homepagedisplay`;
CREATE TABLE `t_salon_homepagedisplay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salonId` int(11) NOT NULL COMMENT '沙龙ID',
  `intOrder` int(11) DEFAULT NULL COMMENT '排列顺序',
  PRIMARY KEY (`id`),
  KEY `fk_t_salon_homepagedisplay_salonid` (`salonId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='设置沙龙首页显示的沙龙';

-- ----------------------------
-- Records of t_salon_homepagedisplay
-- ----------------------------
INSERT INTO `t_salon_homepagedisplay` VALUES ('414', '1858', '2');
INSERT INTO `t_salon_homepagedisplay` VALUES ('415', '1863', '1');
INSERT INTO `t_salon_homepagedisplay` VALUES ('416', '1859', '3');
INSERT INTO `t_salon_homepagedisplay` VALUES ('417', '1860', '4');

-- ----------------------------
-- Table structure for `t_salon_media`
-- ----------------------------
DROP TABLE IF EXISTS `t_salon_media`;
CREATE TABLE `t_salon_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salonId` int(11) DEFAULT NULL COMMENT '沙龙ID',
  `author` int(11) DEFAULT NULL COMMENT '作者',
  `mediaType` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型(0-图片,1-视频)',
  `mediaName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片或者视频的名称',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `submitDate` datetime DEFAULT NULL COMMENT '发表时间',
  `subject` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `videoCoverPic` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频封面图片',
  `isExcellent` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片或者视频经典(0-否,1-是)',
  PRIMARY KEY (`id`),
  KEY `FK_media_author` (`author`) USING BTREE,
  KEY `FK_media_salonId` (`salonId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2428 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='存放沙龙图片文件和视频文件信息';

-- ----------------------------
-- Records of t_salon_media
-- ----------------------------
INSERT INTO `t_salon_media` VALUES ('2277', '1786', '297', '0', '13021586926574071444.jpg', '1', '2011-04-07 14:44:52', '我要讲话', '', '0');
INSERT INTO `t_salon_media` VALUES ('2278', '1786', '297', '0', '13021625107024071548.jpg', '1', '2011-04-07 15:48:30', '我要讲话2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2279', '1786', '297', '0', '13021625263614071548.jpg', '1', '2011-04-07 15:48:46', '我要讲话2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2280', '1789', '302', '0', 'tou1302170085235.jpg', '1', '2011-04-07 17:54:45', '沙龙测试图片', '', '0');
INSERT INTO `t_salon_media` VALUES ('2281', '1789', '302', '1', '复件 title1302170456971.rm', '1', '2011-04-07 18:00:56', '测试视频', '13021704569714071800.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2282', '1789', '302', '1', '复件 title1302170473130.rm', '1', '2011-04-07 18:01:13', '测试视频', '13021704731304071801.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2283', '1789', '302', '0', 'tou1302170537862.jpg', '1', '2011-04-07 18:02:17', '1', '', '0');
INSERT INTO `t_salon_media` VALUES ('2284', '1789', '302', '0', 'you1302170544287.jpg', '1', '2011-04-07 18:02:24', '2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2285', '1789', '302', '1', '复件 title1302170589363.rm', '1', '2011-04-07 18:03:09', '1', '13021705893634071803.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2286', '1789', '302', '1', '复件 title1302170597272.rm', '1', '2011-04-07 18:03:17', '2', '13021705972724071803.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2287', '1789', '302', '0', 'you1302170649377.jpg', '1', '2011-04-07 18:04:09', '3', '', '0');
INSERT INTO `t_salon_media` VALUES ('2422', '1863', '331', '1', 'title1311235522222.flv', '1', '2011-07-21 16:05:22', '测试视频是不是有标题的标题', '13112355222237211605.jpg', '1');
INSERT INTO `t_salon_media` VALUES ('2289', '1789', '302', '1', '复件 title1302170693457.rm', '1', '2011-04-07 18:04:53', '4', '13021706934574071804.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2290', '1789', '302', '0', 'you1302171405166.jpg', '1', '2011-04-07 18:16:45', '5', '', '0');
INSERT INTO `t_salon_media` VALUES ('2291', '1789', '302', '0', 'you1302171409270.jpg', '1', '2011-04-07 18:16:49', '6', '', '0');
INSERT INTO `t_salon_media` VALUES ('2292', '1789', '302', '0', 'tou1302171413676.jpg', '1', '2011-04-07 18:16:53', '7', '', '0');
INSERT INTO `t_salon_media` VALUES ('2293', '1789', '302', '0', 'you1302171420190.jpg', '1', '2011-04-07 18:17:00', '8', '', '0');
INSERT INTO `t_salon_media` VALUES ('2294', '1789', '302', '0', 'you1302171423899.jpg', '1', '2011-04-07 18:17:03', '9', '', '0');
INSERT INTO `t_salon_media` VALUES ('2295', '1789', '302', '0', 'tou1302171428639.jpg', '1', '2011-04-07 18:17:08', '10', '', '0');
INSERT INTO `t_salon_media` VALUES ('2296', '1789', '302', '0', 'tou1302171432375.jpg', '1', '2011-04-07 18:17:12', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2297', '1789', '302', '0', 'you1302171436312.jpg', '1', '2011-04-07 18:17:16', '12', '', '0');
INSERT INTO `t_salon_media` VALUES ('2298', '1789', '302', '0', 'you1302171481244.jpg', '1', '2011-04-07 18:18:01', '13', '', '1');
INSERT INTO `t_salon_media` VALUES ('2299', '1789', '302', '0', '13023213228844091155.jpg', '1', '2011-04-09 11:55:22', '111', '', '1');
INSERT INTO `t_salon_media` VALUES ('2300', '1789', '302', '0', '13023223890974091213.jpg', '1', '2011-04-09 12:13:09', '222', '', '1');
INSERT INTO `t_salon_media` VALUES ('2301', '1789', '302', '0', '13023228295254091220.jpg', '1', '2011-04-09 12:20:29', '333', '', '1');
INSERT INTO `t_salon_media` VALUES ('2302', '1789', '302', '0', '13023228737074091221.jpg', '1', '2011-04-09 12:21:13', '333', '', '1');
INSERT INTO `t_salon_media` VALUES ('2303', '1789', '302', '0', '13023229083004091221.jpg', '1', '2011-04-09 12:21:48', '333', '', '1');
INSERT INTO `t_salon_media` VALUES ('2304', '1789', '302', '0', '13023232774774091227.jpg', '1', '2011-04-09 12:27:57', '444', '', '1');
INSERT INTO `t_salon_media` VALUES ('2305', '1789', '302', '0', '13023232945164091228.jpg', '1', '2011-04-09 12:28:14', '444', '', '1');
INSERT INTO `t_salon_media` VALUES ('2425', '1863', '331', '0', 'tou1311237169320.jpg', '1', '2011-07-21 16:32:49', '3123', '', '0');
INSERT INTO `t_salon_media` VALUES ('2424', '1863', '331', '0', 'you1311237169320.jpg', '1', '2011-07-21 16:32:49', '12312', '', '0');
INSERT INTO `t_salon_media` VALUES ('2308', '1799', '307', '1', '复件 title1302511811924.rm', '1', '2011-04-11 16:50:11', '1111111', '13025118119244111650.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2423', '1863', '331', '0', '测试图片1311237169319.jpg', '1', '2011-07-21 16:32:49', '12312', '', '0');
INSERT INTO `t_salon_media` VALUES ('2310', '1789', '307', '0', 'you1302516726497.jpg', '1', '2011-04-11 18:12:06', '1111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2311', '1789', '307', '0', 'tou1302516759106.jpg', '1', '2011-04-11 18:12:39', '上传图片', '', '0');
INSERT INTO `t_salon_media` VALUES ('2312', '1798', '307', '0', 'you1302516857657.jpg', '1', '2011-04-11 18:14:17', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2313', '1811', '307', '0', 'tou1302516877020.jpg', '1', '2011-04-11 18:14:37', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2314', '1820', '307', '0', 'tou1302517014003.jpg', '1', '2011-04-11 18:16:54', '11333', '', '0');
INSERT INTO `t_salon_media` VALUES ('2315', '1824', '307', '0', 'tou1302517129181.jpg', '1', '2011-04-11 18:18:49', '1111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2316', '1824', '307', '1', '复件 title1302517239181.rm', '1', '2011-04-11 18:20:39', '111', '13025172391824111820.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2317', '1820', '307', '1', '复件 title1302517278455.rm', '1', '2011-04-11 18:21:18', '111', '13025172784564111821.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2318', '1811', '307', '1', '复件 title1302517364331.rm', '1', '2011-04-11 18:22:44', '1111111', '13025173643314111822.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2319', '1811', '307', '0', '13025175329524111825.jpg', '1', '2011-04-11 18:25:32', '测试文章', '', '0');
INSERT INTO `t_salon_media` VALUES ('2320', '1811', '307', '1', '13025175329524111825.rm', '1', '2011-04-11 18:25:32', '测试文章', '', '0');
INSERT INTO `t_salon_media` VALUES ('2321', '1811', '307', '0', '13025176043654111826.jpg', '1', '2011-04-11 18:26:44', '测试文章', '', '0');
INSERT INTO `t_salon_media` VALUES ('2322', '1811', '307', '1', '13025176043654111826.rm', '1', '2011-04-11 18:26:44', '测试文章', '', '0');
INSERT INTO `t_salon_media` VALUES ('2359', '1841', '314', '0', '13027478323614141023.jpg', '1', '2011-04-14 10:23:52', '阿斯顿飞巍峨乏味哦', '', '0');
INSERT INTO `t_salon_media` VALUES ('2327', '1789', '302', '0', '13025751571894121025.jpg', '1', '2011-04-12 10:25:57', '用户互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2325', '1789', '302', '0', '13025750052974121023.jpg', '1', '2011-04-12 10:23:25', '用户互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2329', '1789', '302', '0', '13025759095634121038.jpg', '1', '2011-04-12 10:38:29', '用户互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2358', '1841', '314', '0', '13027477662544141022.jpg', '1', '2011-04-14 10:22:46', '阿斯顿飞巍峨乏味哦', '', '0');
INSERT INTO `t_salon_media` VALUES ('2332', '1789', '307', '1', '复件 title1302592882862.rm', '1', '2011-04-12 15:21:22', '测试视频', '13025928828624121521.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2334', '1824', '307', '1', '复件 title1302592936308.rm', '1', '2011-04-12 15:22:16', '1', '13025929363084121522.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2335', '1820', '307', '1', '复件 title1302592954559.rm', '1', '2011-04-12 15:22:34', '111', '13025929545604121522.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2336', '1828', '307', '1', '复件 title1302592973903.rm', '1', '2011-04-12 15:22:53', '111', '13025929739034121522.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2337', '1826', '307', '1', '复件 title1302593001146.rm', '1', '2011-04-12 15:23:21', '11111', '13025930011464121523.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2338', '1826', '307', '1', '复件 title1302593029217.rm', '1', '2011-04-12 15:23:49', '1111', '13025930292174121523.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2339', '1826', '307', '1', '复件 title1302593041904.rm', '1', '2011-04-12 15:24:01', '11', '13025930419054121524.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2427', '1863', '331', '0', 'you1311237169322.jpg', '1', '2011-07-21 16:32:49', '123123', '', '0');
INSERT INTO `t_salon_media` VALUES ('2341', '1799', '302', '1', '复件 title1302596811731.rm', '1', '2011-04-12 16:26:51', '111', '13025968117314121626.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2342', '1799', '302', '0', 'you1302596824891.jpg', '1', '2011-04-12 16:27:04', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2343', '1789', '303', '0', '13025971818294121633.jpg', '1', '2011-04-12 16:33:01', '个人嘉宾互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2345', '1789', '303', '0', '13025972242864121633.jpg', '1', '2011-04-12 16:33:44', '个人嘉宾互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2362', '1787', '302', '0', '13032010252434191617.jpg', '1', '2011-04-19 16:17:05', '测试嘉宾致辞', '', '0');
INSERT INTO `t_salon_media` VALUES ('2347', '1789', '303', '0', '13025972412404121634.jpg', '1', '2011-04-12 16:34:01', '个人嘉宾互动', '', '0');
INSERT INTO `t_salon_media` VALUES ('2361', '1841', '314', '0', '13027479601714141026.jpg', '0', '2011-04-14 10:26:00', '沃尔夫平稳而蜂鸟网', '', '0');
INSERT INTO `t_salon_media` VALUES ('2426', '1863', '331', '0', '测试图片1311237169321.jpg', '1', '2011-07-21 16:32:49', '123123', '', '0');
INSERT INTO `t_salon_media` VALUES ('2350', '1789', '302', '0', 'tou1302597756488.jpg', '1', '2011-04-12 16:42:36', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2351', '1789', '302', '0', '13025978353974121643.jpg', '0', '2011-04-12 16:43:55', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2353', '1789', '302', '0', '13025978710204121644.jpg', '0', '2011-04-12 16:44:31', '测试嘉宾致辞', '', '0');
INSERT INTO `t_salon_media` VALUES ('2360', '1841', '314', '0', '13027479134704141025.jpg', '1', '2011-04-14 10:25:13', '沃尔夫平稳而蜂鸟网', '', '0');
INSERT INTO `t_salon_media` VALUES ('2355', '1839', '303', '1', '复件 title1302599860325.rm', '0', '2011-04-12 17:17:40', '111', '13025998603254121717.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2356', '1839', '303', '0', 'you1302599877393.jpg', '1', '2011-04-12 17:17:57', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2357', '1839', '303', '1', '复件 title1302599912101.rm', '1', '2011-04-12 17:18:32', '11', '13025999121014121718.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2363', '1787', '302', '1', '13032010252444191617.rm', '1', '2011-04-19 16:17:05', '测试嘉宾致辞', '', '0');
INSERT INTO `t_salon_media` VALUES ('2364', '1789', '302', '0', '13032020068594191633.jpg', '1', '2011-04-19 16:33:26', '测试视频封面', '', '0');
INSERT INTO `t_salon_media` VALUES ('2365', '1789', '302', '1', '13032020068594191633.rm', '1', '2011-04-19 16:33:26', '测试视频封面', '', '0');
INSERT INTO `t_salon_media` VALUES ('2366', '1789', '302', '0', '13032030730914191651.jpg', '1', '2011-04-19 16:51:13', '测试作者', '', '0');
INSERT INTO `t_salon_media` VALUES ('2367', '1789', '302', '1', '13032030730924191651.rm', '1', '2011-04-19 16:51:13', '测试作者', '', '0');
INSERT INTO `t_salon_media` VALUES ('2368', '1789', '302', '0', '13032030982184191651.jpg', '1', '2011-04-19 16:51:38', '测试作者', '', '0');
INSERT INTO `t_salon_media` VALUES ('2369', '1789', '302', '1', '13032030982194191651.rm', '1', '2011-04-19 16:51:38', '测试作者', '', '0');
INSERT INTO `t_salon_media` VALUES ('2370', '1798', '302', '0', '13032039309124191705.jpg', '1', '2011-04-19 17:05:30', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2371', '1798', '302', '1', '13032039309134191705.rm', '1', '2011-04-19 17:05:30', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2372', '1798', '302', '0', '13032039552374191705.jpg', '1', '2011-04-19 17:05:55', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2373', '1798', '302', '1', '13032039552384191705.rm', '0', '2011-04-19 17:05:55', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2374', '1798', '302', '0', '13032039758114191706.jpg', '1', '2011-04-19 17:06:15', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2375', '1798', '302', '1', '13032039758114191706.rm', '0', '2011-04-19 17:06:15', '测试作者名称', '', '0');
INSERT INTO `t_salon_media` VALUES ('2376', '1799', '302', '0', '13032040589724191707.jpg', '1', '2011-04-19 17:07:38', '测试作者名称标题', '', '0');
INSERT INTO `t_salon_media` VALUES ('2377', '1799', '302', '1', '13032040589734191707.rm', '1', '2011-04-19 17:07:38', '测试作者名称标题', '', '0');
INSERT INTO `t_salon_media` VALUES ('2378', '1799', '302', '0', '13032040751874191707.jpg', '0', '2011-04-19 17:07:55', '测试作者名称标题', '', '0');
INSERT INTO `t_salon_media` VALUES ('2379', '1799', '302', '1', '13032040751884191707.rm', '0', '2011-04-19 17:07:55', '测试作者名称标题', '', '0');
INSERT INTO `t_salon_media` VALUES ('2383', '1844', '302', '1', '13034698938614221858.flv', '1', '2011-04-22 18:58:13', '测试内容1', '', '0');
INSERT INTO `t_salon_media` VALUES ('2382', '1844', '302', '0', '13034698938604221858.jpg', '1', '2011-04-22 18:58:13', '测试内容1', '', '0');
INSERT INTO `t_salon_media` VALUES ('2384', '1844', '302', '0', '13034699120434221858.jpg', '1', '2011-04-22 18:58:32', '测试内容1', '', '0');
INSERT INTO `t_salon_media` VALUES ('2385', '1844', '302', '1', '13034699120444221858.flv', '1', '2011-04-22 18:58:32', '测试内容1', '', '0');
INSERT INTO `t_salon_media` VALUES ('2386', '1844', '302', '0', '13034699384154221858.jpg', '1', '2011-04-22 18:58:58', '测试内容2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2387', '1844', '302', '1', '13034699384154221858.flv', '1', '2011-04-22 18:58:58', '测试内容2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2388', '1844', '302', '0', '13034699537504221859.jpg', '1', '2011-04-22 18:59:13', '测试内容3', '', '0');
INSERT INTO `t_salon_media` VALUES ('2389', '1844', '302', '1', '13034699537514221859.flv', '1', '2011-04-22 18:59:13', '测试内容3', '', '0');
INSERT INTO `t_salon_media` VALUES ('2390', '1845', '302', '0', '13034703621354221906.jpg', '1', '2011-04-22 19:06:02', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2391', '1845', '302', '1', '13034703621354221906.flv', '1', '2011-04-22 19:06:02', '111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2392', '1845', '302', '0', '13034709700814221916.jpg', '1', '2011-04-22 19:16:10', '222', '', '0');
INSERT INTO `t_salon_media` VALUES ('2393', '1845', '302', '1', '13034709700814221916.flv', '1', '2011-04-22 19:16:10', '222', '', '0');
INSERT INTO `t_salon_media` VALUES ('2394', '1845', '302', '0', '13034709704284221916.jpg', '1', '2011-04-22 19:16:10', '222', '', '0');
INSERT INTO `t_salon_media` VALUES ('2395', '1845', '302', '1', '13034709704284221916.flv', '1', '2011-04-22 19:16:10', '222', '', '0');
INSERT INTO `t_salon_media` VALUES ('2396', '1847', '302', '0', 'you1303781928874.jpg', '1', '2011-04-26 09:38:48', '1111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2397', '1789', '302', '0', '测试图片1303803721643.jpg', '1', '2011-04-26 15:42:01', 'kcoolks@126.com，欢迎您！', '', '0');
INSERT INTO `t_salon_media` VALUES ('2398', '1789', '302', '0', 'tou1303803748286.jpg', '1', '2011-04-26 15:42:28', 'kcoolks@126.com，欢迎您！ 2', '', '0');
INSERT INTO `t_salon_media` VALUES ('2399', '1789', '302', '0', 'tou1303803890195.jpg', '1', '2011-04-26 15:44:50', 'kcoolks@126.com，欢迎您！3', '', '0');
INSERT INTO `t_salon_media` VALUES ('2400', '1845', '329', '1', '复件 title1303812954609.rm', '0', '2011-04-26 18:15:54', '1111', '13038129546094261815.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2401', '1845', '329', '0', 'you1303812962389.jpg', '1', '2011-04-26 18:16:02', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2402', '1789', '329', '0', '13038130607814261817.jpg', '0', '2011-04-26 18:17:40', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2403', '1789', '329', '1', '13038130607814261817.flv', '0', '2011-04-26 18:17:40', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2404', '1844', '331', '1', '13043961659595031216.rm', '1', '2011-05-03 12:16:05', '11111111111111', '13043961659585031216.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2405', '1839', '331', '1', '13044217826735031923.rm', '1', '2011-05-03 19:23:02', '嘉宾致辞的标题', '13044217826715031923.bmp', '0');
INSERT INTO `t_salon_media` VALUES ('2406', '1831', '331', '1', '13044244990525032008.rm', '1', '2011-05-03 20:08:19', '线上沙龙文章标题', '13044244990425032008.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2407', '1831', '331', '0', 'you1304424724988.jpg', '1', '2011-05-03 20:12:04', '1111', '', '0');
INSERT INTO `t_salon_media` VALUES ('2408', '1831', '331', '0', 'you1304424776819.jpg', '1', '2011-05-03 20:12:56', '11', '', '0');
INSERT INTO `t_salon_media` VALUES ('2409', '1831', '303', '1', '13044752060595041013.rm', '0', '2011-05-04 10:13:26', '1111', '13044752060595041013.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2410', '1839', '331', '1', '复件 title1304502212577.rm', '1', '2011-05-04 17:43:32', '11', '13045022125785041743.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2411', '1839', '331', '1', '复件 title1304503506677.rm', '0', '2011-05-04 18:05:06', '11', '13045035066775041805.gif', '0');
INSERT INTO `t_salon_media` VALUES ('2412', '1839', '331', '1', '11111304504791648.avi', '1', '2011-05-04 18:26:31', '1111ceshiship', '13045047916785041826.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2413', '1839', '331', '1', '11111304505210024.avi', '1', '2011-05-04 18:33:30', '2323', '13045052100275041833.gif', '0');
INSERT INTO `t_salon_media` VALUES ('2414', '1826', '302', '1', '13045108506915042007.avi', '1', '2011-05-04 20:07:30', '嘉宾致辞的标题', '13045108506885042007.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2415', '1831', '331', '1', '13046470427295060957.avi', '1', '2011-05-06 09:57:22', '测试嘉宾致辞', '13046470427175060957.gif', '0');
INSERT INTO `t_salon_media` VALUES ('2416', '1863', '331', '1', 'title1311127881657.flv', '1', '2011-07-20 10:11:21', '20110720视频', '13111278816577201011.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2417', '1863', '331', '1', '13111335704287201146.flv', '1', '2011-07-20 11:46:10', '测试标题', '13111335704277201146.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2418', '1863', '331', '1', '13111336018587201146.flv', '1', '2011-07-20 11:46:41', '测试标题2', '13111336018587201146.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2419', '1863', '331', '1', '13111342185187201156.flv', '1', '2011-07-20 11:56:58', '测试标题3', '13111342185157201156.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2420', '1863', '307', '1', '13111460147687201513.flv', '1', '2011-07-20 15:13:34', '测试标题4', '13111460147657201513.jpg', '0');
INSERT INTO `t_salon_media` VALUES ('2421', '1858', '307', '1', '13111461917667201516.flv', '1', '2011-07-20 15:16:31', '测试标题5', '13111461917657201516.jpg', '0');

-- ----------------------------
-- Table structure for `t_salon_saloninfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_salon_saloninfo`;
CREATE TABLE `t_salon_saloninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salonType` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '沙龙类型(1--线上沙龙,0--线下沙龙)',
  `subject` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '主题',
  `content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startDate` datetime NOT NULL COMMENT '开始时间',
  `endDate` datetime NOT NULL COMMENT '结束时间',
  `compere` int(11) NOT NULL COMMENT '发起人',
  `sponsor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主办方',
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '举办地点',
  `isExcellent` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否为经典沙龙(0-否,1-是)',
  `subjectPic` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '沙龙主题图片',
  `audiFlag` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审核标识(0-待审核,1-通过,2-不通过)',
  `browseCount` decimal(10,0) DEFAULT '0' COMMENT '沙龙点击数',
  `reputationCount` decimal(10,0) DEFAULT '0' COMMENT '好评次数',
  `schlussgruppeCount` decimal(10,0) DEFAULT '0' COMMENT '差评次数',
  `ADDDATE` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_salon_saloninfo_compere` (`compere`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1867 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_salon_saloninfo
-- ----------------------------
INSERT INTO `t_salon_saloninfo` VALUES ('1786', '1', '测试沙龙', '111', '2011-04-03 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13021669238364071702.jpg', '1', '34', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1787', '1', '设计沙龙', '设计沙龙设计沙龙设计沙龙', '2011-04-03 00:00:00', '2011-04-30 00:00:00', '297', '', '', '0', '13111241225907200908.jpg', '1', '66', '1', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1788', '0', '线下测试沙龙', '线下测试沙龙', '2011-04-06 00:00:00', '2011-04-30 00:00:00', '302', '', '', '1', '13021669327914071702.jpg', '1', '71', '1', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1789', '0', '线下测试沙龙', '线下测试沙龙', '2011-04-06 00:00:00', '2011-04-30 00:00:00', '302', '', '', '1', '13020811270294061712.jpg', '1', '255', '10', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1790', '0', '日本为什么有大地震', '日本为什么有大地震', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '工程沙龙', '日本', '1', '13021679212924071718.jpg', '1', '3', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1791', '0', '日本为什么有大地震', '日本为什么有大地震', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '工程沙龙', '日本', '1', '13021679269324071718.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1792', '0', '日本为什么有大地震', '日本为什么有大地震', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '工程沙龙', '日本', '1', '13021679708794071719.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1793', '0', '日本为什么有大地震', '日本为什么有大地震', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '工程沙龙', '日本', '1', '13021679744764071719.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1794', '1', '日本为什么有大地震', '日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）\r\n日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '', '', '1', '13021689353814071735.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1795', '1', '日本为什么有大地震', '日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）\r\n日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有大地震（线上）日本为什么有', '2011-04-07 00:00:00', '2011-04-07 00:00:00', '302', '', '', '1', '13021689395334071735.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1796', '1', '沙龙', '　公司的组织形式。以营利为目的的社团法人。在资本主义社会获得高度发展。我国在建国后对私营公司进行了社会主义改造。国营工、商、建筑、运输等部门中实行独立经济核算的经营管理组织和某些城市中按行业划分的专业管理机构，也通称公司。近年来随着我国经济体制的改革，享有法人资格的各种公司纷纷设立，按章程从事自身的生产经营活动。 　　清 魏源 《筹海篇四》：“西洋互市 广东 者十馀国，皆散商无公司，惟 英吉利 有之。公司者，数十商辏资营运，出则通力合作，归则计本均分，其局大而联。” 曹禺 《雷雨》第一幕：“这边公司的事，你交代完了么？”', '2011-04-08 00:00:00', '2011-04-08 00:00:00', '302', '', '', '1', '13022260837224080928.jpg', '2', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1797', '1', '沙龙', '　公司的组织形式。以营利为目的的社团法人。在资本主义社会获得高度发展。我国在建国后对私营公司进行了社会主义改造。国营工、商、建筑、运输等部门中实行独立经济核算的经营管理组织和某些城市中按行业划分的专业管理机构，也通称公司。近年来随着我国经济体制的改革，享有法人资格的各种公司纷纷设立，按章程从事自身的生产经营活动。 　　清 魏源 《筹海篇四》：“西洋互市 广东 者十馀国，皆散商无公司，惟 英吉利 有之。公司者，数十商辏资营运，出则通力合作，归则计本均分，其局大而联。” 曹禺 《雷雨》第一幕：“这边公司的事，你交代完了么？”', '2011-04-08 00:00:00', '2011-04-08 00:00:00', '302', '', '', '1', '13022261079794080928.jpg', '2', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1798', '0', '1', '1111', '2011-04-08 00:00:00', '2011-04-23 00:00:00', '302', '', '', '1', '13022593823974081843.jpg', '2', '13', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1799', '0', '11', '短信面试通知 \r\n  \r\n中国人才热线针对企业的批量面试通知需求，特别推出短信面试通知产品！\r\n     招聘企业通过招聘管理系统的“面试通知”功能，可选择在发送邮件面试通知的同时，向求职者的手机发送面试通知短信，短信内容由企业自行设定，包括面试时间、地点、公司名称、职位名称或其它事项等！。 \r\n \r\n产品优势： \r\n1、 面试通知短信可以多选群发，大大降低企业面试通知的工作量和时间成本； \r\n2、 短信即发即收，手机通常随身携带，求职者可以立刻读取，不会错过面试机会； \r\n3、 短信内容可以预设，职位名称和求职者姓名自动载入，面试通知效率更高；', '2011-04-23 00:00:00', '2011-04-30 00:00:00', '302', '', '', '1', '13022594721394081844.jpg', '1', '33', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1800', '0', '11', '11', '2011-04-08 00:00:00', '2011-04-30 00:00:00', '302', '', '', '0', '13022594865954081844.jpg', '2', '3', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1801', '0', '11', '11', '2011-04-08 00:00:00', '2011-04-23 00:00:00', '302', '1', '', '0', '13022594986324081844.jpg', '2', '4', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1802', '1', '11', '111', '2011-04-08 00:00:00', '2011-04-23 00:00:00', '302', '', '', '0', '13022595115624081845.jpg', '2', '9', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1803', '1', '11', '111', '2011-04-08 00:00:00', '2011-04-23 00:00:00', '302', '', '', '0', '13022595309254081845.jpg', '2', '5', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1804', '1', '111', '111', '2011-04-09 00:00:00', '2011-04-23 00:00:00', '302', '', '', '1', '13022595428784081845.jpg', '2', '5', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1808', '1', '线上沙龙20110411', '11更近一步，网络活动营销是指通过精心策划的具有鲜明主题，能够引起轰动效应的，具有强烈新闻价值的——一个单一的、或是系列性组合的营销活动\r\n编辑本段网络活动的特点\r\n　　1、不受时空所限 　　\r\n    网络活动的活动形式在互联网上，因此目标受众只要在PC机或者手机的旁边就可以参加活动，而且一般的网络活动都会持续一段时间，这样在世界的不同地方的人，即使不在同一个时间也可以共同参加活动。这样就避免了线下的活动定时定点性。这样可以大大的增加参加的人群与影响力。 　　\r\n    2、互动性 　　现阶段的网络活动秉承web2.0时代的互联网特性，大大增加了网民或者说目标受众的参与程度。现在的网络营销活动不仅仅是为了吸引观众的眼球，更多的要求目标受众能够参与进来，这样才能完成一个有效的传播过程，完成活动意义。 　　', '2011-04-11 00:00:00', '2011-09-10 00:00:00', '302', '', '', '0', '13024901046584111048.jpg', '1', '31', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1852', '1', '测试shalom主办方', '测试shalom~主办方', '2011-04-26 00:00:00', '2011-04-27 00:00:00', '329', '', '', '1', '13038128638134261814.jpg', '1', '1', '0', '0', '2011-04-26 18:14:23');
INSERT INTO `t_salon_saloninfo` VALUES ('1806', '1', '111', '111', '2011-04-08 00:00:00', '2011-04-23 00:00:00', '302', '', '', '0', '13022598888434081851.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1807', '1', '11', '1', '2011-04-08 00:00:00', '2011-04-30 00:00:00', '302', '', '', '0', '13022599139114081851.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1809', '1', '线上沙龙20110411', '线上沙龙20110411\r\n\r\n线上沙龙20110411', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13024946173914111203.jpg', '1', '15', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1810', '1', '2011041101', '11111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13024953696284111216.jpg', '1', '18', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1811', '0', '2011041102', '111', '2011-04-11 00:00:00', '2011-04-30 00:00:00', '302', '大太阳', '深圳', '1', '13024954148454111216.jpg', '1', '25', '9', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1812', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025099941614111619.jpg', '1', '3', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1813', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025099974644111619.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1814', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025100570924111620.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1815', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025100601694111621.jpg', '1', '2', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1816', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025100640894111621.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1817', '1', '1111111', '11111111111111111', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025100684814111621.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1818', '1', '排序', '排序', '2011-04-11 00:00:00', '2011-08-17 00:00:00', '302', '', '', '0', '13025103905834111626.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1819', '1', '排序', '排序', '2011-04-11 00:00:00', '2011-04-13 00:00:00', '302', '', '', '0', '13025107264044111632.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1820', '0', '图片上传', '图片上传', '2011-04-11 00:00:00', '2011-04-30 00:00:00', '307', '图片上传11', '图片上传1111', '0', '13025169357564111815.jpg', '1', '7', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1821', '0', '图片上传', '图片上传', '2011-04-11 00:00:00', '2011-04-30 00:00:00', '307', '图片上传11', '图片上传1111', '0', '13025169858504111816.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1822', '0', '图片上传', '图片上传', '2011-04-11 00:00:00', '2011-04-30 00:00:00', '307', '图片上传11', '图片上传1111', '0', '13025169873194111816.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1823', '0', '图片上传', '图片上传', '2011-04-11 00:00:00', '2011-04-30 00:00:00', '307', '图片上传11', '图片上传1111', '0', '13025169897954111816.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1824', '0', '图片测试', '图片测试', '2011-04-11 00:00:00', '2011-04-23 00:00:00', '307', '图片测试图片测试', '图片测试', '0', '13025170829074111818.jpg', '2', '15', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1825', '0', '图片测试', '图片测试', '2011-04-11 00:00:00', '2011-04-23 00:00:00', '307', '图片测试图片测试', '图片测试', '0', '13025171120714111818.jpg', '2', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1826', '0', '个人线下沙龙', '个人线下沙龙', '2011-04-12 00:00:00', '2011-05-06 00:00:00', '303', '个人线下沙龙', '个人线下沙龙', '1', '13025805495294121155.jpg', '1', '27', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1827', '0', '个人线下沙龙', '个人线下沙龙', '2011-04-12 00:00:00', '2011-04-12 00:00:00', '303', '个人线下沙龙', '个人线下沙龙', '1', '13025807420634121159.jpg', '1', '1', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1828', '0', '个人线下沙龙2', '个人线下沙龙2', '2011-04-12 00:00:00', '2011-04-30 00:00:00', '303', '个人线下沙龙2', '个人线下沙龙2', '1', '13025807774674121159.jpg', '1', '5', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1829', '0', '个人线下沙龙3', '11', '2011-04-12 00:00:00', '2011-04-15 00:00:00', '303', '1', '11', '1', '13025809047274121201.jpg', '1', '7', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1830', '1', '个人线上沙龙1', '个人线上沙龙1', '2011-04-12 00:00:00', '2011-05-07 00:00:00', '303', '', '', '1', '13025813671024121209.jpg', '1', '13', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1831', '1', '个人线上沙龙2', '个人线上沙龙2', '2011-04-12 00:00:00', '2011-05-07 00:00:00', '303', '', '', '1', '13025814340294121210.jpg', '1', '48', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1832', '1', '个人线上沙龙2', '个人线上沙龙2', '2011-04-12 00:00:00', '2011-05-07 00:00:00', '303', '', '', '1', '13025814503974121210.jpg', '1', '19', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1833', '1', '测试线上沙龙', '测试线上沙龙', '2011-04-12 00:00:00', '2011-04-14 00:00:00', '307', '', '', '1', '13025901700904121436.jpg', '1', '2', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1834', '1', '1111111111111', '1111111111111', '2011-04-12 00:00:00', '2011-04-12 00:00:00', '307', '', '', '1', '13025903663674121439.jpg', '1', '0', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1837', '1', '测试图片', '测试图片、视频', '2011-04-12 00:00:00', '2011-04-13 00:00:00', '307', '', '', '1', '13025919754954121506.jpg', '1', '2', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1836', '1', '测试图片视频', '测试图片、视频', '2011-04-12 00:00:00', '2011-04-13 00:00:00', '307', '', '', '1', '13025919390804121505.jpg', '1', '6', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1838', '0', '测试图片视频', '测试图片视频', '2011-04-12 00:00:00', '2011-04-13 00:00:00', '307', '测试图片视频', '测试图片视频', '1', '13025923483004121512.jpg', '1', '2', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1839', '0', '管理员后台测试沙龙视频图片库', '管理员后台测试沙龙视频图片库', '2011-04-12 00:00:00', '2011-05-07 00:00:00', '303', '管理员后台测试沙龙视频图片库', '管理员后台测试沙龙视频图片库', '1', '13025994147194121710.jpg', '1', '78', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1840', '0', '管理员后台测试沙龙视频图片库', '管理员后台测试沙龙视频图片库', '2011-04-12 00:00:00', '2011-05-07 00:00:00', '303', '管理员后台测试沙龙视频图片库', '管理员后台测试沙龙视频图片库', '1', '13025994595884121710.jpg', '1', '3', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1841', '1', '建筑设计欣赏', '建筑与人们的生活息息相关', '2011-04-14 00:00:00', '2011-04-28 00:00:00', '314', '', '', '1', '13027476698934141021.jpg', '1', '17', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1842', '1', '?9?????', '?????? \r\n\r\n?????? \r\n\r\n?????? \r\n\r\n?????? \r\n\r\n??????\r\n\r\n??????', '2011-04-18 00:00:00', '2011-08-17 00:00:00', '331', '', '', '0', '13031219466734181819.jpg', '1', '17', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1843', '1', '?9?????', '?????? \r\n\r\n?????? \r\n\r\n?????? \r\n\r\n?????? \r\n\r\n??????\r\n\r\n??????', '2011-04-18 00:00:00', '2011-08-17 00:00:00', '331', '', '', '0', '13031219684004181819.jpg', '1', '11', '0', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1859', '0', '线下沙龙201107191', '线下沙龙201107191', '2011-07-19 00:00:00', '2011-09-02 00:00:00', '331', '大太阳公司1', '深圳1', '1', '13111258222017200937.jpg', '1', '14', '0', '0', '2011-07-19 16:57:37');
INSERT INTO `t_salon_saloninfo` VALUES ('1844', '1', '是你附近我是你服务', '费蜂鸟网蜂鸟网粉嫩粉嫩 粉嫩粉嫩；粉嫩嫩方法分请问废弃物父亲无法欺骗方法粉嫩粉嫩妇女欺负你欺负你欺负你；粉嫩粉嫩却无法；将能否让你却无法你趣味额；妇女维权放牛娃丰南区丰南区服务费ijfnofn扶困济危发而非巍峨金饭碗金额风景我俄方沃尔夫国际网呢如果网而过；网而过网而过为俄国网而过；恶搞网而过网而过', '2011-04-19 00:00:00', '2011-05-05 00:00:00', '314', '', '', '1', '13031811499584191045.jpg', '1', '42', '1', '0', '2011-04-21 10:42:19');
INSERT INTO `t_salon_saloninfo` VALUES ('1845', '0', '测试首页显示BUG是否修复', '测试首页显示BUG是否修复', '2011-04-22 00:00:00', '2011-04-27 00:00:00', '302', '大太阳', '大太阳', '1', '13034415892834221106.jpg', '1', '46', '0', '0', '2011-04-22 11:06:29');
INSERT INTO `t_salon_saloninfo` VALUES ('1846', '0', '测试首页显示BUG是否修复2', '测试首页显示BUG是否修复2', '2011-04-22 00:00:00', '2011-04-24 00:00:00', '302', '大太阳', '大太阳', '1', '13034423312694221118.jpg', '1', '7', '0', '0', '2011-04-22 11:18:51');
INSERT INTO `t_salon_saloninfo` VALUES ('1847', '0', '测试首页显示BUG是否修复3', '测试首页显示BUG是否修复3', '2011-04-22 00:00:00', '2011-04-26 00:00:00', '302', '大太阳', '大太阳', '1', '13034425773794221122.jpg', '1', '7', '0', '0', '2011-04-22 11:22:57');
INSERT INTO `t_salon_saloninfo` VALUES ('1848', '0', '测试首页显示BUG是否修复', '测试首页显示BUG是否修复', '2011-04-22 00:00:00', '2011-04-30 00:00:00', '302', '测试首页显示BUG是否修复', '测试首页显示BUG是否修复', '1', '13034431727874221132.jpg', '1', '0', '0', '0', '2011-04-22 11:32:52');
INSERT INTO `t_salon_saloninfo` VALUES ('1849', '0', '????????', '????????-??', '2011-04-25 00:00:00', '2011-08-17 00:00:00', '331', '????????-???', '????????-??', '0', '13036937311054250908.jpg', '1', '4', '0', '0', '2011-04-25 09:08:51');
INSERT INTO `t_salon_saloninfo` VALUES ('1858', '0', '线下沙龙20110719', '线下沙龙20110719', '2011-07-19 00:00:00', '2011-07-30 00:00:00', '331', '大太阳公司', '深圳', '1', '13111258360037200937.jpg', '1', '24', '0', '0', '2011-07-19 16:39:55');
INSERT INTO `t_salon_saloninfo` VALUES ('1850', '0', '测试经典沙龙对错1', '11111111111111111111111\r\n\r\n22222222222222\r\n\r\n22222222222222222222222222222222\r\n11111111111111111111111\r\n\r\n22222222222222\r\n\r\n2222222222222222222222222222222211111111111111111111111\r\n\r\n22222222222222\r\n\r\n22222222222222222222222222222222', '2011-04-26 00:00:00', '2011-04-27 00:00:00', '302', '测试经典沙龙对错2', '测试经典沙龙对错3', '1', '13037800530074260907.jpg', '1', '6', '0', '0', '2011-04-26 09:07:33');
INSERT INTO `t_salon_saloninfo` VALUES ('1851', '0', '测试shalom', '测试shalom~主办方', '2011-04-26 00:00:00', '2011-04-27 00:00:00', '329', '测试shalom~主办方', '测试shalom~地点', '1', '13038126851934261811.jpg', '1', '0', '0', '0', '2011-04-26 18:11:25');
INSERT INTO `t_salon_saloninfo` VALUES ('1853', '0', '????20110503', '1', '2011-05-03 00:00:00', '2011-08-17 00:00:00', '331', '????20110503???', '????', '1', '13044147911515031726.jpg', '1', '12', '0', '0', '2011-05-03 17:26:31');
INSERT INTO `t_salon_saloninfo` VALUES ('1854', '0', '????201105032', '????20110503????20110503????20110503\r\n\r\n????20110503????20110503\r\n\r\n????20110503????20110503\r\n\r\n????20110503', '2011-05-03 00:00:00', '2011-08-17 00:00:00', '331', '????20110503???2', '????2', '0', '13044150309895031730.bmp', '1', '11', '0', '0', '2011-05-03 17:30:30');
INSERT INTO `t_salon_saloninfo` VALUES ('1855', '0', '????201105033', '????20110503\r\n\r\n????20110503\r\n\r\n????20110503', '2011-05-03 00:00:00', '2011-08-17 00:00:00', '331', '??????3', '????3', '0', '13044151295435031732.bmp', '1', '14', '0', '0', '2011-05-03 17:32:09');
INSERT INTO `t_salon_saloninfo` VALUES ('1856', '0', '11', '11', '2011-05-03 00:00:00', '2011-08-17 00:00:00', '331', '11', '11', '0', '13044164397225031753.bmp', '1', '10', '0', '0', '2011-05-03 17:53:59');
INSERT INTO `t_salon_saloninfo` VALUES ('1857', '0', '????', '????', '2011-05-04 00:00:00', '2011-08-17 00:00:00', '331', '???', '????', '1', '13045081301715041922.gif', '1', '11', '0', '0', '2011-05-04 19:22:10');
INSERT INTO `t_salon_saloninfo` VALUES ('1860', '0', '线下沙龙201107192', '线下沙龙201107191', '2011-07-19 00:00:00', '2011-08-19 00:00:00', '331', '大太阳公司2', '深圳2', '1', '13111258595797200937.jpg', '1', '4', '0', '0', '2011-07-19 16:58:20');
INSERT INTO `t_salon_saloninfo` VALUES ('1861', '0', '123', '232', '2011-07-19 00:00:00', '2011-07-19 00:00:00', '331', '21312', '123123', '1', '13110646533267191637.jpg', '1', '1', '0', '0', '2011-07-19 17:03:37');
INSERT INTO `t_salon_saloninfo` VALUES ('1862', '0', '201107191900', '2011071919:00', '2011-07-19 00:00:00', '2011-08-06 00:00:00', '331', '大太阳公司3', '深圳', '1', '13111259326017200938.jpg', '1', '8', '0', '0', '2011-07-19 19:15:21');
INSERT INTO `t_salon_saloninfo` VALUES ('1863', '0', '线下沙龙201107193', '线下沙龙201107193', '2011-07-20 00:00:00', '2011-08-06 00:00:00', '331', '大太阳公司3', '深圳3', '1', '13111258142097200936.jpg', '1', '90', '0', '0', '2011-07-20 09:10:47');
INSERT INTO `t_salon_saloninfo` VALUES ('1864', '1', '20110720线上沙龙', '20110720线上沙龙', '2011-07-20 00:00:00', '2011-08-20 00:00:00', '307', '', '', '1', '13111485175107201555.jpg', '1', '14', '0', '0', '2011-07-20 15:55:17');
INSERT INTO `t_salon_saloninfo` VALUES ('1865', '1', '20110720线上沙龙2', '20110720线上沙龙', '2011-07-20 00:00:00', '2011-08-06 00:00:00', '307', '', '', '1', '13111485999877201556.jpg', '1', '14', '0', '0', '2011-07-20 15:56:40');
INSERT INTO `t_salon_saloninfo` VALUES ('1866', '0', '1232', '123123', '2011-07-21 00:00:00', '2011-07-23 00:00:00', '331', '321', '123123', '0', '13112193562127211135.jpg', '1', '0', '0', '0', '2011-07-21 11:35:56');

-- ----------------------------
-- Table structure for `t_sys_ad`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_ad`;
CREATE TABLE `t_sys_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '广告标题',
  `company` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司',
  `city` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司所在城市编码',
  `province` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司所在省份编码',
  `position` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '位置',
  `startDate` datetime NOT NULL COMMENT '广告时段-开始',
  `endDate` datetime NOT NULL COMMENT '广告时段-结束',
  `stopDate` datetime DEFAULT NULL COMMENT '广告时段-暂停',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态 0暂停, 1 打开',
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '广告类型 0图片,1文字,2 flash',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片或者flash存放路径',
  `typeContent` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片或者flash连接路径,或者文字广告信息',
  `imgName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片名称',
  `width` double DEFAULT NULL COMMENT '广告大小-长',
  `height` double DEFAULT NULL COMMENT '广告大小-宽',
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '介绍',
  `adindex` int(11) DEFAULT '100' COMMENT '索引',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=659 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理';

-- ----------------------------
-- Records of t_sys_ad
-- ----------------------------
INSERT INTO `t_sys_ad` VALUES ('495', '扼腕图45他', '大太阳广告', '440300', '440000', '017-1001-1002', '2011-04-12 15:39:00', '2011-05-06 15:51:25', '2011-04-12 18:07:20', '1', '2', 'http://www.sohu.com', '235日3452345235345235324', '', '0', '0', '364575676785678678ghg最热格瑞特让她用', '100');
INSERT INTO `t_sys_ad` VALUES ('657', '广告1', '广告', '120100', '120000', '017-1005-1001', '2011-07-21 10:56:00', '2011-08-17 10:56:00', null, '1', '0', 'http://www.dotoyo.com', '广告', '13112186086987211123.jpg', '0', '0', '广告', '100');
INSERT INTO `t_sys_ad` VALUES ('496', '45业5用5', '456456用56456', '110100', '110000', '017-1001-1002', '2011-04-12 15:43:00', '2011-05-05 15:54:23', '2011-04-12 18:07:20', '1', '2', 'http://www.sohu.com', '34太2345343623623', '13025954959334121604.jpg', '0', '0', 'qewdq2dqdqdqdqdqd', '100');
INSERT INTO `t_sys_ad` VALUES ('497', '测试广告', '测试广告', '110200', '110000', '017-1001-1002', '2011-04-12 15:47:00', '2011-04-28 15:58:22', '2011-04-12 18:07:20', '1', '1', 'http://www.dotoyo.com', '测试广告', '13025956076394121606.jpg', '0', '0', '测试广告', '100');
INSERT INTO `t_sys_ad` VALUES ('498', 'r3t34t545t', 't53453535', '110100', '110000', '017-1001-1003', '2011-04-12 15:47:00', '2011-04-28 15:47:00', null, '1', '1', 'http://www.baidu.com', '3245234523452345', '', '0', '0', 'w3r234t234t34t4', '100');
INSERT INTO `t_sys_ad` VALUES ('499', '46uy578u657', '878967896789', '440100', '440000', '017-1002-1001', '2011-04-12 15:48:00', '2011-05-03 15:50:01', '2011-04-15 15:22:31', '1', '0', 'http://www.sohu.com', '789678967896789', '13025957666224121609.jpg', '0', '0', 'w4t45t634563463456', '100');
INSERT INTO `t_sys_ad` VALUES ('500', '2134214234', '4323435345345', '110100', '110000', '017-1001-1002', '2011-04-12 15:54:00', '2011-05-05 16:05:21', '2011-04-12 18:07:20', '1', '0', 'http://www.baidu.com', 'wetfwtwertwertert', '13025961424304121615.jpg', '0', '0', 'wegvwegwe那是风景我俄方顾问哦发个好玩尔尕娃而', '100');
INSERT INTO `t_sys_ad` VALUES ('501', '2阿斯发布', '沃尔夫我认为而', '440100', '440000', '017-1001-1002', '2011-04-12 15:57:00', '2011-05-04 16:08:19', '2011-04-12 18:07:20', '1', '1', 'http://www.baidu.com', '不是的哦法吧是噢地方', '', '0', '0', '阿斯顿部分iwbdfwuwef就哦我的服务', '100');
INSERT INTO `t_sys_ad` VALUES ('502', '网而过', '完全儿童瓦儿童', '440100', '440000', '017-1001-1002', '2011-04-12 15:58:00', '2011-05-05 16:09:17', '2011-04-12 18:07:20', '1', '0', 'http://www.sohu.com', '去网而过网而过我', '13025963222244121618.gif', '0', '0', 'rthrethrth5ty', '100');
INSERT INTO `t_sys_ad` VALUES ('503', '继而功能', '无法而你哦', '110100', '110000', '017-1001-1003', '2011-04-12 16:00:00', '2011-05-06 16:00:00', null, '1', '1', 'http://www.baidu.com', '好吧使得哦发布扫地方', '', '0', '0', '开标是都哦ifbcasidf', '100');
INSERT INTO `t_sys_ad` VALUES ('504', '就哈我不哦佛', '污染范围内去哦耳目', '110100', '110000', '017-1002-1001', '2011-04-12 16:01:00', '2011-05-05 16:05:23', '2011-04-15 15:22:31', '1', '0', 'http://www.sohu.com', '岁的法国的那个', '13025964723474121621.jpg', '0', '0', '啊还不是毒霸杀毒', '100');
INSERT INTO `t_sys_ad` VALUES ('505', '纳税人妇女', '热特瑞特让他', '110100', '110000', '017-1002-1001', '2011-04-12 16:06:00', '2011-05-05 16:07:00', '2011-04-15 15:22:31', '1', '1', 'http://www.baidu.com', '十分你哦无法沃尔夫巍峨日文', '', '0', '0', '撒旦发斯蒂芬斯蒂芬', '100');
INSERT INTO `t_sys_ad` VALUES ('506', '问题让我额头', '45也5用6以后你', '110100', '110000', '017-1001-1002', '2011-04-12 16:08:00', '2011-05-05 16:08:44', '2011-04-12 18:07:20', '1', '2', 'http://www.baidu.com', '投入也如如图有人 ', '13025970957384121631.png', '0', '0', '尚未成熟哦爱我', '100');
INSERT INTO `t_sys_ad` VALUES ('507', '啊的束缚阿斯顿', '巍峨乏味全额', '110100', '110000', '017-1003-1001', '2011-04-12 16:15:00', '2011-08-17 16:15:00', null, '1', '0', 'http://www.baidu.com', '尔尕娃而个人个', '13112152310387211027.jpg', '0', '0', 'erthertyheryert', '100');
INSERT INTO `t_sys_ad` VALUES ('508', 'waertwqrtw', 'ertewrtewrtewrt', '110100', '110000', '017-1004-1001', '2011-04-12 16:24:00', '2011-08-17 16:24:00', null, '1', '0', 'http://www.baidu.com', 'w45ye45y34 ', '13038778613714271217.jpg', '0', '0', 'ertwertertyert', '100');
INSERT INTO `t_sys_ad` VALUES ('509', 'zdfsgsdrgdf', 'yertyertyrty', '440100', '440000', '017-1005-1001', '2011-04-12 16:27:00', '2011-08-17 19:00:00', '2011-04-12 20:08:11', '1', '0', 'http://www.baidu.com', 'wrgwertgwertyerty', '13025980467034121647.jpg', '0', '0', 'rtherhhetyrtyurtyuty', '100');
INSERT INTO `t_sys_ad` VALUES ('510', 'qwretgwertwer', '34t34t6345636', '110100', '110000', '017-1005-1001', '2011-04-12 16:32:00', '2011-08-17 19:00:00', '2011-04-12 20:08:11', '1', '0', 'http://www.baidu.com', 'teyeryryur56yuret6', '13025983671294121652.png', '0', '0', 'retwe5twe5twe5', '100');
INSERT INTO `t_sys_ad` VALUES ('511', '我呢份的巍峨', '沃尔夫微软', '110100', '110000', '017-1005-1001', '2011-04-12 16:35:00', '2011-08-17 19:00:00', '2011-04-12 20:08:11', '1', '0', 'http://www.baidu.com', '阿斯发波阿瑟发', '13025985236014121655.jpg', '0', '0', 'ertertyertye', '100');
INSERT INTO `t_sys_ad` VALUES ('512', '问得我', '大长今你骗我地方', '110100', '110000', '017-1005-1002', '2011-04-12 16:40:00', '2011-08-17 16:40:00', '2011-04-12 20:07:15', '1', '0', 'http://www.baidu.com', '我俄方帮我放', '13045064036085041853.gif', '0', '0', 'rthretrtyhrtyrt', '100');
INSERT INTO `t_sys_ad` VALUES ('513', '我我俄方', '阿九岁的女才爬上', '110100', '110000', '017-1005-1002', '2011-04-06 16:46:00', '2011-08-17 05:53:00', '2011-04-21 11:56:11', '1', '0', 'http://www.baidu.com', '扼腕从份额个我', '13112164924147211048.jpg', '0', '0', 'wtherthrth', '100');
INSERT INTO `t_sys_ad` VALUES ('514', '巴士佛vbwdf', '沃尔塔格威尔特我让他', '141100', '140000', '017-1005-1003', '2011-04-12 16:48:00', '2011-08-17 16:48:00', null, '1', '0', 'http://www.baidu.com', '斯特哥', '13025993153434121708.jpg', '0', '0', 'wedfwedwqdwdwd', '100');
INSERT INTO `t_sys_ad` VALUES ('515', 'wfvsdafve', 'ergfwergwergewr', '211300', '210000', '017-1005-1003', '2011-04-12 16:49:00', '2011-08-17 16:49:00', null, '1', '0', 'http://www.baidu.com', 'werg', '13112171751727211059.jpg', '0', '0', 'wefwedfwed', '100');
INSERT INTO `t_sys_ad` VALUES ('516', 'rtg4etg4t', '3t3t34t34t', '120100', '120000', '017-1005-1003', '2011-04-12 16:50:00', '2011-08-17 16:50:00', null, '1', '0', 'http://www.baidu.com', 't4tge4gergerger', '13025994630954121711.png', '0', '0', 'rgergergerg', '100');
INSERT INTO `t_sys_ad` VALUES ('518', '扼腕全方位', '我额头服务而法国我', '141100', '140000', '017-1005-1004', '2011-04-12 16:54:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.baidu.com', '深度发烧不地方', '13025996633304121714.png', '0', '0', 'wrgfwergwergwerg', '100');
INSERT INTO `t_sys_ad` VALUES ('519', 'wfjewhfwef', '阿斯顿哦发v', '211300', '210000', '017-1005-1004', '2011-04-12 16:55:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.baidu.com', 'basdvcasdc ', '13025997358644121715.gif', '0', '0', 'awvsdfvsdfvsdfv', '100');
INSERT INTO `t_sys_ad` VALUES ('520', 'rfgekjfljfwe1', 'regjwergpsegpwe', '130200', '130000', '017-1005-1005', '2011-04-12 16:59:00', '2011-08-17 15:48:00', '2011-04-12 19:50:27', '1', '0', 'http://www.baidu.com', 'rgtewrgwergewrg', '13025999411234121719.gif', '0', '0', 'wefwefwerf', '100');
INSERT INTO `t_sys_ad` VALUES ('521', '你的爸爸1', '说你的风采苏打粉', '150400', '150000', '017-1005-1005', '2011-04-12 17:00:00', '2011-08-17 15:48:00', '2011-04-12 19:50:43', '1', '0', 'http://www.baidu.com', '沃尔夫沃尔夫冈', '13026000056034121720.jpg', '0', '0', '哪怕是地方女我俄方', '100');
INSERT INTO `t_sys_ad` VALUES ('522', '城市站点广告', '大太阳公司', '110100', '110000', '017-1001-1002', '2011-04-12 17:44:00', '2011-05-06 08:14:05', '2011-04-12 18:49:52', '1', '0', 'http://www.dotoyo.com', '城市站点广告', '13026026445274121804.jpg', '0', '0', '城市站点广告', '100');
INSERT INTO `t_sys_ad` VALUES ('523', '1', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:20:00', null, '1', '0', 'http://www.dotoyo.com', '111', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('524', '12', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:21:05', '2011-04-12 18:50:24', '1', '0', 'http://www.dotoyo.com', '111', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('525', '333', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:21:11', '2011-04-12 18:50:24', '1', '0', 'http://www.dotoyo.com', '111', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('526', '555', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:20:51', '2011-04-12 18:50:24', '1', '0', 'http://www.dotoyo.com', '111', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('527', '666', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:20:00', null, '1', '0', 'http://www.dotoyo.com', '111', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('528', '文字广告文字广告告11文', '111', '110100', '110000', '017-1001-1002', '2011-04-12 18:20:00', '2011-04-21 18:20:00', null, '1', '1', 'http://www.dotoyo.com', '文字广告', '13026047998994121839.jpg', '0', '0', '1111', '100');
INSERT INTO `t_sys_ad` VALUES ('529', '告文字广告告文字广告告文字广告告文字广告', '11', '110100', '110000', '017-1001-1002', '2011-04-12 18:26:00', '2011-04-28 18:26:00', null, '1', '1', 'http://www.dotoyo.com', '11111111', '', '0', '0', '11111111', '100');
INSERT INTO `t_sys_ad` VALUES ('530', '图片图片广告', '图片图片广告', '110100', '110000', '017-1001-1002', '2011-04-12 18:29:00', '2011-04-28 18:29:00', null, '1', '0', 'http://www.dotoyo.com', '图片图片广告', '13026054470184121850.jpg', '0', '0', '图片图片广告', '100');
INSERT INTO `t_sys_ad` VALUES ('531', '北京市测试职位', '北京市测试职位', '110100', '110000', '017-1001-1003', '2011-04-12 18:46:00', '2011-04-29 18:46:00', null, '1', '1', 'http://www.dotoyo.com', '北京市测试职位北京市测试职位', '', '0', '0', '北京市测试职位北京市测试职位', '100');
INSERT INTO `t_sys_ad` VALUES ('532', '深圳大太阳网络科技有限公司', '11', '110100', '110000', '017-1001-1003', '2011-04-12 18:47:00', '2011-04-28 18:47:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('533', '深圳大太阳网络科技有限公司深圳分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('534', '深圳大太阳网络科技有限公司北京分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('535', '深圳大太阳网络科技有限公司湖南分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('536', '深圳大太阳网络科技有限公司湖北分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('537', '深圳大太阳网络科技有限公司广东分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('538', '深圳大太阳网络科技有限公司广州分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('539', '深圳大太阳网络科技有限公司人才分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('540', '深圳大太阳网络科技有限公司南京分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('541', '深圳大太阳网络科技有限公司武汉分公司', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('542', '石河子市天娱传媒', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('543', '石河子市天娱文化传媒', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('544', '北京金亿家商贸中心', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('545', '广西南宁市康普磊莘贸易', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('546', '四川天润园林绿化责任', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('547', '南京科化新型液晶显示器', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('548', '深圳市盛源科技开发', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('549', '佛山市禅城区露一手小食店', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('550', '佛山市禅城区食店', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('551', '佛山市禅城区食2分店', '深圳大太阳网络科技有限公司', '110100', '110000', '017-1001-1003', '2011-04-12 18:49:00', '2011-04-22 18:49:00', null, '1', '1', 'http://www.dotoyo.com', '深圳大太阳网络科技有限公司', '', '0', '0', '深圳大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('552', '紧急招聘紧急招聘', '紧急招聘', '110100', '110000', '017-1005-1001', '2011-04-12 19:26:00', '2011-08-17 19:00:00', '2011-04-12 20:08:11', '1', '0', 'http://www.dotoyo.com', '紧急招聘紧急招聘', '13026090585494121950.jpg', '0', '0', '紧急招聘紧急招聘', '100');
INSERT INTO `t_sys_ad` VALUES ('553', '猎头中心广告', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 14:58:00', '2011-04-22 14:58:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028520617024151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('554', '猎头中心广告2', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 15:01:00', '2011-04-20 15:01:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028521114334151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('555', '猎头中心广告3', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 15:01:00', '2011-04-21 15:01:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028521114334151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('556', '猎头中心广告4', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 15:01:00', '2011-04-21 15:01:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028521114334151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('557', '猎头中心广告5', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 15:01:00', '2011-04-22 15:01:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028521114334151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('558', '猎头中心广告6', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 15:01:00', '2011-04-21 15:01:00', '2011-04-15 15:22:31', '1', '0', 'http://www.dotoyo.com', '大太阳网络科技有限公司', '13028521114334151521.jpg', '0', '0', '大太阳网络科技有限公司', '100');
INSERT INTO `t_sys_ad` VALUES ('559', '我对得起', '钱大群大群完全', '110100', '110000', '017-1002-1001', '2011-04-15 16:25:00', '2011-04-28 16:25:00', null, '1', '0', 'http://www.baidu.com', '恶物权法巍峨乏味哦', '13028571704094151646.jpg', '0', '0', '', '100');
INSERT INTO `t_sys_ad` VALUES ('560', '猎头中心文字广告', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-28 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('561', '猎头中心文字广告1', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-20 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('562', '猎头中心文字广告2', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-20 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('563', '猎头中心文字广告3', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-21 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('564', '猎头中心文字广告4', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-20 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('565', '猎头中心文字广告5', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-29 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('566', '猎头中心文字广告6', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-20 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('567', '猎头中心文字广告7', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-22 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('568', '猎头中心文字广告8', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-22 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('569', '猎头中心文字广告9', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-22 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('570', '猎头中心文字广告10', '大太阳网络科技有限公司', '110100', '110000', '017-1002-1001', '2011-04-15 17:00:00', '2011-04-21 17:00:00', null, '1', '1', 'http://www.dotoyo.com', '猎头中心文字广告', '', '0', '0', '猎头中心文字广告', '100');
INSERT INTO `t_sys_ad` VALUES ('571', 'werfwr', 'wrwrw', '110100', '110000', '017-1001-1002', '2011-04-18 09:18:00', '2011-04-19 09:18:00', null, '1', '0', 'http://www.baidu.com', 'wfwffff', '13030907457424180939.jpg', '0', '0', 'tgrtg', '100');
INSERT INTO `t_sys_ad` VALUES ('572', 'er23r23', '4234234234', '110100', '110000', '017-1001-1002', '2011-04-18 09:19:00', '2011-04-22 09:19:00', null, '1', '0', 'http://www.baidu.com', '23er2rfasfsf', '13030907947704180939.jpg', '0', '0', 'htyjhrtjrtj', '100');
INSERT INTO `t_sys_ad` VALUES ('573', '3t5345', '4y6456456', '110100', '110000', '017-1001-1002', '2011-04-18 09:26:00', '2011-04-22 09:26:00', null, '1', '1', 'http://www.baidu.com', '34tw45t45645645456', '', '0', '0', 't43rt3t34t', '100');
INSERT INTO `t_sys_ad` VALUES ('574', '武汉吧非典了帮我放ibwqeifbwqe', '我俄方巍峨乏味发我俄方我问巍峨乏味哦发', '110100', '110000', '017-1001-1002', '2011-04-18 09:31:00', '2011-04-28 09:31:00', null, '1', '1', 'http://www.baidu.com', '达无法访问父亲无法', '', '0', '0', 'gevfwerfwe', '100');
INSERT INTO `t_sys_ad` VALUES ('575', '南方网服务巍峨乏味发我佛为服务巍峨乏味发', '我佛为服务服务', '110100', '110000', '017-1001-1002', '2011-04-18 09:32:00', '2011-04-21 09:33:20', '2011-04-21 11:56:11', '1', '1', 'http://www.baidu.com', '我佛为服务', '', '0', '0', 'qfwqf是否卫生服务', '100');
INSERT INTO `t_sys_ad` VALUES ('576', '的风格不符的方式', '份额个很多帅哥还是', '110100', '110000', '017-1005-1003', '2011-04-18 09:51:00', '2011-08-17 09:51:00', '2011-04-21 11:56:11', '1', '0', 'http://www.baidu.com', '大幅波动不大', '13112171960297211059.jpg', '0', '0', 'xc xc  szd afvaegseghser', '100');
INSERT INTO `t_sys_ad` VALUES ('577', '粉丝网方式', '分为反而反而', '110100', '110000', '017-1005-1003', '2011-04-18 10:19:00', '2011-08-17 10:19:00', '2011-04-21 11:56:11', '1', '0', 'http://www/sohu.com', '从vsavsav ', '13030943695254181039.png', '0', '0', 'rtyhr', '100');
INSERT INTO `t_sys_ad` VALUES ('578', '4r34r5234', '2345t2345234', '120100', '120000', '017-1005-1004', '2011-04-18 10:37:00', '2011-08-17 16:05:00', '2011-04-21 11:56:11', '1', '0', 'http://www.sohu.com', 'r234r2r23r2r2r', '13030954692164181057.jpg', '0', '0', '', '100');
INSERT INTO `t_sys_ad` VALUES ('579', 'wfwfwfwfw', 'wfwfwfwf', '320500', '320000', '017-1001-1002', '2011-04-18 11:17:00', '2011-04-27 11:17:16', '2011-04-21 11:56:11', '1', '0', 'http://www.dotoyo.com', 'qfdqedfqedfqed', '13030978910624181138.jpg', '0', '0', 'fqdq', '100');
INSERT INTO `t_sys_ad` VALUES ('580', 'qwdqwd', 'dqdqdqd', '310100', '310000', '017-1001-1002', '2011-04-18 11:19:00', '2011-04-27 11:19:15', '2011-04-21 11:56:11', '1', '0', 'http://www.dotoyo.com', 'qeqdqcaqqqwdqdqdqdqdqdqdqdqd', '13030980150004181140.png', '0', '0', 'sdqadqdqd', '100');
INSERT INTO `t_sys_ad` VALUES ('581', '你在这里是做什么的啊你在这里是做什么的啊', '你在这里是做什么的啊你在这里是做什么的啊', '110100', '110000', '017-1002-1001', '2011-04-19 10:18:00', '2011-04-29 10:18:13', '2011-04-21 11:56:11', '1', '0', 'http://www.sohu.com', '给你拍人体各让他他给你提供哦让他哦人通过呢如果呢绒噢乖托管人内容提供；呢如果让他个人他跟认同感呢人体各让他内容和认同感；男人女人认同感很认同呢绒儿很然后呢然后儿童和然后他呢绒儿很然后呢然后而很热很热和二和任何人而恨任何人或儿很然后呢人；和哦很热好呢任何人好呢然后呢日哦好呢任何人好ierthethierth      如何如何推动二和任何人和儿和日哦和', '13031807743784191039.png', '0', '0', '34t34t43t4', '100');
INSERT INTO `t_sys_ad` VALUES ('582', '千多块钱变得空前加大千万', '不当老板去了对不起对不起多了不起', '110100', '110000', '017-1005-1004', '2011-04-20 14:33:00', '2011-08-17 16:05:00', '2011-04-21 11:56:11', '1', '0', 'http://www.baidu.com', '的驱动器', '13032824758324201454.jpg', '0', '0', 'wdqdqdqdqdqd', '100');
INSERT INTO `t_sys_ad` VALUES ('583', '广告位', '广告位', '440300', '440000', '017-1005-1001', '2011-04-21 11:33:00', '2011-08-17 19:00:00', '2011-04-21 11:56:11', '1', '0', 'http://www.dotoyo.com', '广告位', '13033581136704211155.jpg', '0', '0', '广告位', '100');
INSERT INTO `t_sys_ad` VALUES ('584', '广告标题20110421', '大太阳公司', '440300', '440000', '017-1005-1001', '2011-04-21 14:42:00', '2011-08-17 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '广告标题20110421', '13033694485654211504.jpg', '0', '0', '广告标题20110421', '100');
INSERT INTO `t_sys_ad` VALUES ('639', '测试广告2', '公司', '110200', '110000', '017-1004-1001', '2011-07-20 18:49:00', '2011-08-30 18:49:00', null, '1', '0', 'http://www.dotoyo.com', '测试广告', '13112133735707210956.jpg', '0', '0', '测试广告', '1');
INSERT INTO `t_sys_ad` VALUES ('585', '广告标题', '广告公司', '110100', '110000', '017-1005-1001', '2011-05-03 15:15:00', '2011-08-17 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '广告标题', '13112182678697211117.jpg', '0', '0', '广告标题', '101');
INSERT INTO `t_sys_ad` VALUES ('591', '广告标题1', '广告公司1', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '111');
INSERT INTO `t_sys_ad` VALUES ('592', '广告标题2', '广告公司2', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '110');
INSERT INTO `t_sys_ad` VALUES ('593', '广告标题3', '广告公司3', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('594', '广告标题4', '广告公司4', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('595', '广告标题5', '广告公司5', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('596', '广告标题6', '广告公司6', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '110');
INSERT INTO `t_sys_ad` VALUES ('597', '广告标题7', '广告公司7', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('598', '广告标题8', '广告公司8', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('599', '广告标题9', '广告公司9', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 10:38:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('600', '广告标题10', '广告公司10', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('601', '广告标题11', '广告公司11', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('602', '广告标题12', '广告公司12', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('603', '广告标题13', '广告公司13', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('604', '广告标题14', '广告公司14', '110100', '110000', '017-1005-1005', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('605', '广告标题15', '广告公司15', '110100', '110000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13112166355477211050.jpg', '0', '0', '1http://www.dotoyo.com', '2');
INSERT INTO `t_sys_ad` VALUES ('606', '广告标题16', '广告公司16', '110100', '110000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044105322425031615.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('607', '广告标题17', '广告公司17', '110100', '110000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044105462815031615.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('608', '广告标题18', '广告公司18', '110100', '110000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044105573485031615.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('609', '广告标题19', '广告公司19', '110100', '110000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13112171605717211059.jpg', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('610', '广告标题20', '广告公司20', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044105844945031616.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('611', '广告标题28', '广告公司21', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044106249735031617.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('612', '广告标题22', '广告公司22', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044106342285031617.bmp', '0', '0', '1http://www.dotoyo.com', '4');
INSERT INTO `t_sys_ad` VALUES ('613', '广告标题23', '广告公司23', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044106452295031617.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('614', '广告标题24', '广告公司24', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13044106554425031617.bmp', '0', '0', '1http://www.dotoyo.com', '11');
INSERT INTO `t_sys_ad` VALUES ('615', '广告标题25', '广告公司25', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13112165874777211049.jpg', '0', '0', '1http://www.dotoyo.com', '3');
INSERT INTO `t_sys_ad` VALUES ('616', '广告标题26', '广告公司26', '141100', '140000', '017-1005-1003', '2011-05-03 15:48:00', '2011-08-17 15:48:00', null, '1', '0', 'http://www.dotoyo.com', '1111', '13112171422697211059.jpg', '0', '0', '1http://www.dotoyo.com', '120');
INSERT INTO `t_sys_ad` VALUES ('656', '广告', '广告', '120100', '120000', '017-1005-1001', '2011-07-21 10:56:00', '2011-08-17 10:56:00', null, '1', '0', 'http://www.dotoyo.com', '广告', '13112186086987211123.jpg', '0', '0', '广告', '100');
INSERT INTO `t_sys_ad` VALUES ('618', '热门招聘标题', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13112172271357211100.jpg', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('619', '热门招聘标题1', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112278165031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('620', '热门招聘标题2', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112278165031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('621', '热门招聘标题3', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112460065031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('622', '热门招聘标题4', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112460065031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('623', '热门招聘标题5', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112591155031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('624', '热门招聘标题6', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112680435031627.bmp', '0', '0', '热门招聘广告公司', '101');
INSERT INTO `t_sys_ad` VALUES ('625', '热门招聘标题7', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112760225031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('626', '热门招聘标题8', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112760225031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('627', '热门招聘标题9', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044112760225031627.bmp', '0', '0', '热门招聘广告公司', '1');
INSERT INTO `t_sys_ad` VALUES ('628', '热门招聘标题10', '热门招聘广告公司', '110100', '110000', '017-1005-1004', '2011-05-03 16:05:00', '2011-08-17 16:05:00', null, '1', '0', 'http://www.dotoyo.com', '1', '13044113107325031628.jpg', '0', '0', '热门招聘广告公司', '33');
INSERT INTO `t_sys_ad` VALUES ('629', '人才挖掘右边广告图', '大太阳公司', '110100', '110000', '017-1003-1001', '2011-05-03 18:51:00', '2011-08-17 18:51:00', null, '1', '0', 'http://www.dotoyo.com', '人才挖掘右边广告图', '13112132713057210954.jpg', '0', '0', 'http://www.dotoyo.com', '1');
INSERT INTO `t_sys_ad` VALUES ('630', '人才挖掘右边广告图1', '大太阳公司', '110100', '110000', '017-1003-1001', '2011-05-03 18:51:00', '2011-07-30 18:51:00', null, '1', '0', 'http://www.dotoyo.com', '人才挖掘右边广告图', '13044212369425031913.bmp', '0', '0', 'http://www.dotoyo.com', '1');
INSERT INTO `t_sys_ad` VALUES ('631', '人才挖掘右边广告图2', '大太阳公司', '110100', '110000', '017-1003-1001', '2011-05-03 18:51:00', '2011-08-27 18:51:00', null, '1', '0', 'http://www.dotoyo.com', '人才挖掘右边广告图', '13044211899085031913.bmp', '0', '0', 'http://www.dotoyo.com', '1');
INSERT INTO `t_sys_ad` VALUES ('648', '热门招聘o1', '热门招聘o1', '440300', '440000', '017-1005-1004', '2011-07-21 10:37:00', '2011-08-17 10:37:00', null, '1', '0', 'http://www.dotoyo.com', '11热门招聘o1', '13112174584527211104.jpg', '0', '0', '热门招聘o1', '200');
INSERT INTO `t_sys_ad` VALUES ('647', '沙龙右边图片', '大太阳', '440300', '440000', '017-1004-1001', '2011-07-21 09:31:00', '2011-08-17 09:31:00', null, '1', '0', 'http://www.dotoyo.com', '沙龙右边图片1', '13112161970117211043.jpg', '0', '0', '沙龙右边图片', '1');
INSERT INTO `t_sys_ad` VALUES ('646', '猎头首页广告', '大太阳公司', '440300', '440000', '017-1001-1001', '2011-07-21 09:20:00', '2011-08-20 09:20:00', null, '1', '2', 'http://www.dotoyo.com', '猎头首页广告', '13112131335797210952.swf', '0', '0', '猎头首页广告', '1');
INSERT INTO `t_sys_ad` VALUES ('635', '创业沙龙右边图片3', '大太阳', '110100', '110000', '017-1004-1001', '2011-05-03 19:06:00', '2011-08-17 19:06:00', null, '1', '0', 'http://www.dotoyo.com', '创业沙龙右边图片', '13044221064825031928.bmp', '0', '0', '创业沙龙右边图片', '1');
INSERT INTO `t_sys_ad` VALUES ('636', '创业沙龙右边图片4', '大太阳', '110100', '110000', '017-1004-1001', '2011-05-03 19:06:00', '2011-08-17 19:06:00', null, '1', '0', 'http://www.dotoyo.com', '创业沙龙右边图片', '13044221153145031928.bmp', '0', '0', '创业沙龙右边图片', '1');
INSERT INTO `t_sys_ad` VALUES ('658', '广告2', '广告', '120100', '120000', '017-1005-1001', '2011-07-21 10:56:00', '2011-08-17 10:56:00', null, '1', '0', 'http://www.dotoyo.com', '广告', '13112186086987211123.jpg', '0', '0', '广告', '100');
INSERT INTO `t_sys_ad` VALUES ('640', '未修复', '未修复', '120100', '120000', '017-1003-1001', '2011-07-20 18:54:00', '2011-07-30 18:54:00', null, '1', '0', 'http://www.dotoyo.com', '未修复（上传了之后页面样式错位了）\r\n', '13112152157317211026.jpg', '0', '0', '未修复（上传了之后页面样式错位了）', '1');
INSERT INTO `t_sys_ad` VALUES ('641', '未修复1', '未修复1', '110100', '110000', '017-1005-1001', '2011-07-20 19:00:00', '2011-08-17 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '未修复1', '13111612111737201926.jpg', '0', '0', '未修复1', '2');
INSERT INTO `t_sys_ad` VALUES ('642', '未修复2', '未修复2', '110100', '110000', '017-1005-1001', '2011-07-20 19:00:00', '2011-08-17 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '未修复1', '13111612111737201926.jpg', '0', '0', '未修复1', '2');
INSERT INTO `t_sys_ad` VALUES ('643', '未修复3', '未修复3', '110100', '110000', '017-1005-1001', '2011-07-20 19:00:00', '2011-08-17 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '未修复1', '13111612111737201926.jpg', '0', '0', '未修复1', '1');
INSERT INTO `t_sys_ad` VALUES ('644', '未修复4', '未修复4', '110100', '110000', '017-1005-1002', '2011-07-20 19:00:00', '2011-07-30 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '未修复1', '13111612111737201926.jpg', '0', '0', '未修复1', '1');
INSERT INTO `t_sys_ad` VALUES ('645', '未修复5', '未修复4', '110100', '110000', '017-1005-1003', '2011-07-20 19:00:00', '2011-07-30 19:00:00', null, '1', '0', 'http://www.dotoyo.com', '未修复1', '13111612111737201926.jpg', '0', '0', '未修复1', '1');

-- ----------------------------
-- Table structure for `t_sys_increment_advert_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_advert_setting`;
CREATE TABLE `t_sys_increment_advert_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `itemName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务项目',
  `advertising` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级017[017-1001 首页---第一个位置,017-1002首页---第二个位置,017-1003人才中心---第一个位置]',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_INCREMENT_ADVERT_SETTING_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_INCREMENT_ADVERT_SETTING_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告位服务设置';

-- ----------------------------
-- Records of t_sys_increment_advert_setting
-- ----------------------------
INSERT INTO `t_sys_increment_advert_setting` VALUES ('27', 'TC-001', null, '017-1001-1001', '543', '2011-04-21 12:27:19', '2011-04-21 12:27:19');

-- ----------------------------
-- Table structure for `t_sys_increment_hangcard_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_hangcard_setting`;
CREATE TABLE `t_sys_increment_hangcard_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `count_of_submit` int(10) NOT NULL COMMENT '证书提交个数（对应订单表服务1）',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_INCREMENT_HANGCARD_SETTING_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_INCREMENT_HANGCARD_SETTING_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='挂证服务设置';

-- ----------------------------
-- Records of t_sys_increment_hangcard_setting
-- ----------------------------
INSERT INTO `t_sys_increment_hangcard_setting` VALUES ('26', 'TC-005', '10', '543', '2011-04-25 18:56:22', '2011-04-25 18:56:22');

-- ----------------------------
-- Table structure for `t_sys_increment_huntcard_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_huntcard_setting`;
CREATE TABLE `t_sys_increment_huntcard_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `times_of_lookup` int(10) NOT NULL COMMENT '查看联系方式次数（对应订单表服务1）',
  `times_of_submit_certneeds` int(10) NOT NULL COMMENT '提交证书需求个数（对应订单表服务2）',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_INCREMENT_HUNTCARD_SETTING_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_INCREMENT_HUNTCARD_SETTING_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='挂证服务设置';

-- ----------------------------
-- Records of t_sys_increment_huntcard_setting
-- ----------------------------
INSERT INTO `t_sys_increment_huntcard_setting` VALUES ('24', 'TC-001', '1000', '1000', '543', '2011-04-21 12:22:20', '2011-04-21 12:22:20');
INSERT INTO `t_sys_increment_huntcard_setting` VALUES ('25', 'TC-0011', '10', '0', '543', '2011-07-20 17:51:21', '2011-07-20 17:51:21');

-- ----------------------------
-- Table structure for `t_sys_increment_recruit_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_recruit_setting`;
CREATE TABLE `t_sys_increment_recruit_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `times_of_public_position` int(10) NOT NULL COMMENT '发布职位次数（对应订单表服务1）',
  `times_of_lookup_blog` int(10) NOT NULL COMMENT '查看博站次数（对应订单表服务2）',
  `times_of_lookup_invite` int(10) NOT NULL COMMENT '邀请面试次数（对应订单表服务3）',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_INCREMENT_RECRUIT_SETTING_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_INCREMENT_RECRUIT_SETTING_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='招聘服务设置';

-- ----------------------------
-- Records of t_sys_increment_recruit_setting
-- ----------------------------
INSERT INTO `t_sys_increment_recruit_setting` VALUES ('22', 'TC-001', '1000', '1000', '1000', '543', '2011-04-21 12:23:26', '2011-04-21 12:23:26');
INSERT INTO `t_sys_increment_recruit_setting` VALUES ('23', 'fw003', '10', '10', '1', '543', '2011-04-22 12:06:10', '2011-04-22 12:06:19');
INSERT INTO `t_sys_increment_recruit_setting` VALUES ('24', 'TC-010', '100', '100', '100', '689', '2011-05-03 11:36:15', '2011-05-03 11:36:15');

-- ----------------------------
-- Table structure for `t_sys_increment_servicename_maintainance`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_servicename_maintainance`;
CREATE TABLE `t_sys_increment_servicename_maintainance` (
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '服务编码',
  `service_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '服务名称',
  `usable_days` int(4) NOT NULL COMMENT '可用天数',
  `service_intro` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务简介',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  `price` double NOT NULL COMMENT '价格',
  `priceStatus` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否面议（0：面议，1：非面议）',
  `serviceType` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '套餐类型（0：个人套餐，1：企业套餐）',
  PRIMARY KEY (`service_code`),
  KEY `FK_T_SYS_INCREMENT_SERVICENAME_MAINTAINANCE_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='增值服务名称维护';

-- ----------------------------
-- Records of t_sys_increment_servicename_maintainance
-- ----------------------------
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-001', '全能套餐', '1000', '全能套餐', '543', '2011-04-21 12:06:16', '2011-04-21 12:06:16', '1', '1', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-002', '人才挖掘套餐', '100', '1', '543', '2011-04-21 12:07:07', '2011-07-20 09:51:20', '0', '1', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-003', '招聘套餐', '100', '1', '543', '2011-04-21 12:07:44', '2011-04-21 12:07:44', '0', '0', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-004', '测试套餐使用时间', '1', '测试套餐使用时间1', '543', '2011-04-21 15:37:16', '2011-04-21 15:37:16', '0', '0', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('fw002', '测试服务价格', '10', '测试服务价格', '543', '2011-04-22 11:45:34', '2011-04-22 11:45:34', '0', '1', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('fw003', '测试服务价格2', '10', '测试服务价格2', '543', '2011-04-22 11:46:04', '2011-04-22 11:46:04', '10', '1', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('fw004', '测试服务价格3', '10', '测试服务价格3', '543', '2011-04-22 11:46:30', '2011-04-22 11:46:30', '0', '0', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('11', '11', '1', '11', '543', '2011-04-22 11:51:11', '2011-04-22 11:51:11', '1', '1', '0');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-005', '证书挂靠', '100', '000', '543', '2011-04-25 18:55:12', '2011-04-25 18:55:12', '0', '0', '0');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-010', '新增职位', '100', '东方网idpwqdpwqjdwqjdsdc 沃达丰物品佛我俄方单位', '689', '2011-05-03 11:35:09', '2011-05-03 11:35:09', '20000000', '1', '1');
INSERT INTO `t_sys_increment_servicename_maintainance` VALUES ('TC-0011', '查看证书次数', '1000', '查看证书次数10', '543', '2011-07-20 17:51:05', '2011-07-20 17:51:05', '0', '1', '1');

-- ----------------------------
-- Table structure for `t_sys_increment_talents_offline_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_talents_offline_setting`;
CREATE TABLE `t_sys_increment_talents_offline_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `times_of_search` int(10) NOT NULL COMMENT '可搜索的次数(对应订单表中服务1)',
  `fields_of_search` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级016[016-1001 行业筛选,016-1002 职位筛选,016-1003地区筛选,016-1004证书名称]',
  `operator` int(11) DEFAULT NULL COMMENT '操作人',
  `submit_date` datetime DEFAULT NULL COMMENT '创建、提交时间',
  `last_edit_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='线下人才挖掘服务字段设置';

-- ----------------------------
-- Records of t_sys_increment_talents_offline_setting
-- ----------------------------
INSERT INTO `t_sys_increment_talents_offline_setting` VALUES ('4', 'TC-001', '1000', '016-1001,016-1002,016-1003,016-1004,016-1005,016-1006,016-1007,016-1008,016-1009,016-1010,016-1011,016-1012,016-1013,016-1014,016-1015,016-1016,016-1017', '543', '2011-05-03 18:56:23', '2011-05-03 18:56:23');

-- ----------------------------
-- Table structure for `t_sys_increment_talents_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_increment_talents_setting`;
CREATE TABLE `t_sys_increment_talents_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `times_of_search` int(10) NOT NULL COMMENT '可搜索的次数(对应订单表中服务1)',
  `fields_of_search` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级016[016-1001 行业筛选,016-1002 职位筛选,016-1003地区筛选,016-1004证书名称]',
  `operator` int(11) NOT NULL COMMENT '操作人',
  `submit_date` datetime NOT NULL COMMENT '创建/提交时间',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_INCREMENT_TALENTS_SETTING_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_INCREMENT_TALENTS_SETTING_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='人才挖掘字段设置';

-- ----------------------------
-- Records of t_sys_increment_talents_setting
-- ----------------------------
INSERT INTO `t_sys_increment_talents_setting` VALUES ('51', 'TC-001', '1000', '016-1001,016-1002,016-1003,016-1004,016-1005,016-1006,016-1007,016-1008,016-1009,016-1010,016-1011,016-1012,016-1013,016-1014,016-1015,016-1016,016-1017', '543', '2011-04-21 12:21:02', '2011-04-21 12:21:02');
INSERT INTO `t_sys_increment_talents_setting` VALUES ('52', 'TC-004', '1000', '016-1001,016-1002,016-1003,016-1004,016-1005,016-1006,016-1007,016-1008,016-1009,016-1010,016-1011,016-1012,016-1013,016-1014,016-1015,016-1016,016-1017', '543', '2011-04-21 15:37:47', '2011-04-21 15:37:47');
INSERT INTO `t_sys_increment_talents_setting` VALUES ('53', 'TC-003', '100', '016-1001,016-1002,016-1003,016-1004', '543', '2011-07-20 09:45:41', '2011-07-20 09:45:41');
INSERT INTO `t_sys_increment_talents_setting` VALUES ('54', 'TC-002', '10', '016-1001,016-1002,016-1003,016-1004,016-1005,016-1006,016-1007,016-1008,016-1009,016-1010,016-1011,016-1012,016-1013,016-1014,016-1015,016-1016,016-1017', '543', '2011-07-20 09:51:02', '2011-07-20 09:51:12');

-- ----------------------------
-- Table structure for `t_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` int(11) NOT NULL COMMENT '操作人',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作动作',
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '访问IP',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `FK_T_SYS_LOG_OPERATOR` (`operator`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统日志';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES ('4466', '298', '??', '127.0.0.1', '2011-04-03 12:02:39');
INSERT INTO `t_sys_log` VALUES ('4467', '300', '登陆', '127.0.0.1', '2011-04-03 14:43:55');
INSERT INTO `t_sys_log` VALUES ('4468', '299', '登陆', '127.0.0.1', '2011-04-03 15:09:48');
INSERT INTO `t_sys_log` VALUES ('4469', '300', '登陆', '127.0.0.1', '2011-04-03 15:17:33');
INSERT INTO `t_sys_log` VALUES ('4470', '297', '登陆', '127.0.0.1', '2011-04-03 15:34:17');
INSERT INTO `t_sys_log` VALUES ('4471', '299', '登陆', '127.0.0.1', '2011-04-03 15:37:44');
INSERT INTO `t_sys_log` VALUES ('4472', '297', '登陆', '127.0.0.1', '2011-04-03 15:43:28');
INSERT INTO `t_sys_log` VALUES ('4473', '302', '退出', '127.0.0.1', '2011-04-03 15:44:40');
INSERT INTO `t_sys_log` VALUES ('4474', '299', '退出', '127.0.0.1', '2011-04-03 15:44:44');
INSERT INTO `t_sys_log` VALUES ('4475', '300', '退出', '127.0.0.1', '2011-04-03 15:51:54');
INSERT INTO `t_sys_log` VALUES ('4476', '303', '退出', '127.0.0.1', '2011-04-03 15:56:00');
INSERT INTO `t_sys_log` VALUES ('4477', '302', '登陆', '127.0.0.1', '2011-04-03 15:56:12');
INSERT INTO `t_sys_log` VALUES ('4478', '304', '退出', '127.0.0.1', '2011-04-03 16:07:41');
INSERT INTO `t_sys_log` VALUES ('4479', '305', '退出', '127.0.0.1', '2011-04-03 16:13:27');
INSERT INTO `t_sys_log` VALUES ('4480', '305', '登陆', '127.0.0.1', '2011-04-03 16:14:03');
INSERT INTO `t_sys_log` VALUES ('4481', '302', '登陆', '127.0.0.1', '2011-04-03 16:14:46');
INSERT INTO `t_sys_log` VALUES ('4482', '297', '登陆', '127.0.0.1', '2011-04-03 17:54:59');
INSERT INTO `t_sys_log` VALUES ('4483', '302', '登陆', '127.0.0.1', '2011-04-06 10:00:04');
INSERT INTO `t_sys_log` VALUES ('4484', '297', '登陆', '127.0.0.1', '2011-04-06 10:01:18');
INSERT INTO `t_sys_log` VALUES ('4485', '302', '退出', '127.0.0.1', '2011-04-06 10:02:54');
INSERT INTO `t_sys_log` VALUES ('4486', '302', '登陆', '127.0.0.1', '2011-04-06 10:23:00');
INSERT INTO `t_sys_log` VALUES ('4487', '302', '退出', '127.0.0.1', '2011-04-06 11:53:29');
INSERT INTO `t_sys_log` VALUES ('4488', '302', '登陆', '127.0.0.1', '2011-04-06 15:08:46');
INSERT INTO `t_sys_log` VALUES ('4489', '302', '退出', '127.0.0.1', '2011-04-06 15:21:19');
INSERT INTO `t_sys_log` VALUES ('4490', '302', '登陆', '127.0.0.1', '2011-04-06 15:39:35');
INSERT INTO `t_sys_log` VALUES ('4491', '301', '登陆', '127.0.0.1', '2011-04-06 15:53:13');
INSERT INTO `t_sys_log` VALUES ('4492', '302', '登陆', '127.0.0.1', '2011-04-06 17:11:21');
INSERT INTO `t_sys_log` VALUES ('4493', '302', '登陆', '127.0.0.1', '2011-04-06 18:25:52');
INSERT INTO `t_sys_log` VALUES ('4494', '301', '登陆', '127.0.0.1', '2011-04-07 09:56:33');
INSERT INTO `t_sys_log` VALUES ('4495', '303', '登陆', '127.0.0.1', '2011-04-07 09:59:27');
INSERT INTO `t_sys_log` VALUES ('4496', '303', '登陆', '127.0.0.1', '2011-04-07 10:07:12');
INSERT INTO `t_sys_log` VALUES ('4497', '303', '登陆', '127.0.0.1', '2011-04-07 10:18:36');
INSERT INTO `t_sys_log` VALUES ('4498', '301', '登陆', '127.0.0.1', '2011-04-07 10:21:48');
INSERT INTO `t_sys_log` VALUES ('4499', '303', '退出', '127.0.0.1', '2011-04-07 10:30:40');
INSERT INTO `t_sys_log` VALUES ('4500', '307', '退出', '127.0.0.1', '2011-04-07 10:32:29');
INSERT INTO `t_sys_log` VALUES ('4501', '301', '登陆', '127.0.0.1', '2011-04-07 10:34:17');
INSERT INTO `t_sys_log` VALUES ('4502', '301', '退出', '127.0.0.1', '2011-04-07 10:35:46');
INSERT INTO `t_sys_log` VALUES ('4503', '303', '退出', '127.0.0.1', '2011-04-07 10:39:34');
INSERT INTO `t_sys_log` VALUES ('4504', '310', '退出', '127.0.0.1', '2011-04-07 10:41:38');
INSERT INTO `t_sys_log` VALUES ('4505', '302', '登陆', '127.0.0.1', '2011-04-07 10:41:46');
INSERT INTO `t_sys_log` VALUES ('4506', '302', '退出', '127.0.0.1', '2011-04-07 10:42:29');
INSERT INTO `t_sys_log` VALUES ('4507', '309', '退出', '127.0.0.1', '2011-04-07 10:52:59');
INSERT INTO `t_sys_log` VALUES ('4508', '301', '登陆', '127.0.0.1', '2011-04-07 10:53:17');
INSERT INTO `t_sys_log` VALUES ('4509', '308', '退出', '127.0.0.1', '2011-04-07 11:01:45');
INSERT INTO `t_sys_log` VALUES ('4510', '311', '退出', '127.0.0.1', '2011-04-07 11:03:59');
INSERT INTO `t_sys_log` VALUES ('4511', '311', '登陆', '127.0.0.1', '2011-04-07 11:04:34');
INSERT INTO `t_sys_log` VALUES ('4512', '311', '退出', '127.0.0.1', '2011-04-07 11:20:50');
INSERT INTO `t_sys_log` VALUES ('4513', '301', '退出', '127.0.0.1', '2011-04-07 11:32:32');
INSERT INTO `t_sys_log` VALUES ('4514', '297', '登陆', '127.0.0.1', '2011-04-07 11:44:22');
INSERT INTO `t_sys_log` VALUES ('4515', '297', '登陆', '127.0.0.1', '2011-04-07 12:19:41');
INSERT INTO `t_sys_log` VALUES ('4516', '297', '登陆', '127.0.0.1', '2011-04-07 12:22:17');
INSERT INTO `t_sys_log` VALUES ('4517', '301', '登陆', '127.0.0.1', '2011-04-07 14:35:46');
INSERT INTO `t_sys_log` VALUES ('4518', '301', '登陆', '127.0.0.1', '2011-04-07 14:40:05');
INSERT INTO `t_sys_log` VALUES ('4519', '302', '登陆', '127.0.0.1', '2011-04-07 14:42:04');
INSERT INTO `t_sys_log` VALUES ('4520', '297', '登陆', '127.0.0.1', '2011-04-07 14:44:05');
INSERT INTO `t_sys_log` VALUES ('4521', '301', '退出', '127.0.0.1', '2011-04-07 14:51:00');
INSERT INTO `t_sys_log` VALUES ('4522', '314', '登陆', '127.0.0.1', '2011-04-07 14:52:03');
INSERT INTO `t_sys_log` VALUES ('4523', '315', '登陆', '127.0.0.1', '2011-04-07 14:55:56');
INSERT INTO `t_sys_log` VALUES ('4524', '315', '退出', '127.0.0.1', '2011-04-07 14:56:46');
INSERT INTO `t_sys_log` VALUES ('4525', '301', '登陆', '127.0.0.1', '2011-04-07 14:57:10');
INSERT INTO `t_sys_log` VALUES ('4526', '297', '登陆', '127.0.0.1', '2011-04-07 15:37:37');
INSERT INTO `t_sys_log` VALUES ('4527', '314', '登陆', '127.0.0.1', '2011-04-07 16:52:09');
INSERT INTO `t_sys_log` VALUES ('4528', '302', '登陆', '127.0.0.1', '2011-04-07 17:01:52');
INSERT INTO `t_sys_log` VALUES ('4529', '301', '登陆', '127.0.0.1', '2011-04-08 09:09:10');
INSERT INTO `t_sys_log` VALUES ('4530', '301', '登陆', '127.0.0.1', '2011-04-08 09:09:22');
INSERT INTO `t_sys_log` VALUES ('4531', '314', '登陆', '127.0.0.1', '2011-04-08 09:16:50');
INSERT INTO `t_sys_log` VALUES ('4532', '314', '登陆', '127.0.0.1', '2011-04-08 09:17:55');
INSERT INTO `t_sys_log` VALUES ('4533', '301', '登陆', '127.0.0.1', '2011-04-08 09:18:29');
INSERT INTO `t_sys_log` VALUES ('4534', '302', '登陆', '127.0.0.1', '2011-04-08 09:27:12');
INSERT INTO `t_sys_log` VALUES ('4535', '301', '登陆', '127.0.0.1', '2011-04-08 09:27:28');
INSERT INTO `t_sys_log` VALUES ('4536', '314', '退出', '127.0.0.1', '2011-04-08 09:29:27');
INSERT INTO `t_sys_log` VALUES ('4537', '301', '退出', '127.0.0.1', '2011-04-08 09:30:38');
INSERT INTO `t_sys_log` VALUES ('4538', '309', '登陆', '127.0.0.1', '2011-04-08 09:30:49');
INSERT INTO `t_sys_log` VALUES ('4539', '309', '退出', '127.0.0.1', '2011-04-08 09:34:54');
INSERT INTO `t_sys_log` VALUES ('4540', '301', '登陆', '127.0.0.1', '2011-04-08 09:35:13');
INSERT INTO `t_sys_log` VALUES ('4541', '301', '退出', '127.0.0.1', '2011-04-08 09:36:26');
INSERT INTO `t_sys_log` VALUES ('4542', '309', '登陆', '127.0.0.1', '2011-04-08 09:36:34');
INSERT INTO `t_sys_log` VALUES ('4543', '309', '退出', '127.0.0.1', '2011-04-08 09:38:07');
INSERT INTO `t_sys_log` VALUES ('4544', '301', '登陆', '127.0.0.1', '2011-04-08 09:38:20');
INSERT INTO `t_sys_log` VALUES ('4545', '301', '退出', '127.0.0.1', '2011-04-08 09:40:52');
INSERT INTO `t_sys_log` VALUES ('4546', '309', '登陆', '127.0.0.1', '2011-04-08 09:41:02');
INSERT INTO `t_sys_log` VALUES ('4547', '302', '登陆', '127.0.0.1', '2011-04-08 09:42:46');
INSERT INTO `t_sys_log` VALUES ('4548', '316', '登陆', '127.0.0.1', '2011-04-08 10:00:49');
INSERT INTO `t_sys_log` VALUES ('4549', '307', '登陆', '127.0.0.1', '2011-04-08 10:07:13');
INSERT INTO `t_sys_log` VALUES ('4550', '307', '登陆', '127.0.0.1', '2011-04-08 10:07:29');
INSERT INTO `t_sys_log` VALUES ('4551', '314', '登陆', '127.0.0.1', '2011-04-08 10:28:45');
INSERT INTO `t_sys_log` VALUES ('4552', '316', '登陆', '127.0.0.1', '2011-04-08 10:29:22');
INSERT INTO `t_sys_log` VALUES ('4553', '316', '登陆', '127.0.0.1', '2011-04-08 10:29:42');
INSERT INTO `t_sys_log` VALUES ('4554', '316', '登陆', '127.0.0.1', '2011-04-08 10:35:37');
INSERT INTO `t_sys_log` VALUES ('4555', '314', '登陆', '127.0.0.1', '2011-04-08 12:06:22');
INSERT INTO `t_sys_log` VALUES ('4556', '309', '登陆', '127.0.0.1', '2011-04-08 14:47:15');
INSERT INTO `t_sys_log` VALUES ('4557', '317', '登陆', '127.0.0.1', '2011-04-08 14:51:54');
INSERT INTO `t_sys_log` VALUES ('4558', '317', '退出', '127.0.0.1', '2011-04-08 14:53:21');
INSERT INTO `t_sys_log` VALUES ('4559', '301', '登陆', '127.0.0.1', '2011-04-08 14:54:26');
INSERT INTO `t_sys_log` VALUES ('4560', '309', '退出', '127.0.0.1', '2011-04-08 14:55:31');
INSERT INTO `t_sys_log` VALUES ('4561', '301', '登陆', '127.0.0.1', '2011-04-08 14:55:39');
INSERT INTO `t_sys_log` VALUES ('4562', '301', '退出', '127.0.0.1', '2011-04-08 14:56:37');
INSERT INTO `t_sys_log` VALUES ('4563', '317', '登陆', '127.0.0.1', '2011-04-08 14:56:47');
INSERT INTO `t_sys_log` VALUES ('4564', '317', '登陆', '127.0.0.1', '2011-04-08 14:57:35');
INSERT INTO `t_sys_log` VALUES ('4565', '314', '登陆', '127.0.0.1', '2011-04-08 15:02:15');
INSERT INTO `t_sys_log` VALUES ('4566', '307', '登陆', '127.0.0.1', '2011-04-08 15:35:37');
INSERT INTO `t_sys_log` VALUES ('4567', '302', '登陆', '127.0.0.1', '2011-04-08 15:48:25');
INSERT INTO `t_sys_log` VALUES ('4568', '318', '退出', '127.0.0.1', '2011-04-08 16:09:57');
INSERT INTO `t_sys_log` VALUES ('4569', '319', '退出', '127.0.0.1', '2011-04-08 16:11:27');
INSERT INTO `t_sys_log` VALUES ('4570', '309', '登陆', '127.0.0.1', '2011-04-08 16:11:38');
INSERT INTO `t_sys_log` VALUES ('4571', '315', '登陆', '127.0.0.1', '2011-04-08 16:21:21');
INSERT INTO `t_sys_log` VALUES ('4572', '302', '登陆', '127.0.0.1', '2011-04-08 16:29:46');
INSERT INTO `t_sys_log` VALUES ('4573', '302', '登陆', '127.0.0.1', '2011-04-08 17:12:20');
INSERT INTO `t_sys_log` VALUES ('4574', '307', '登陆', '127.0.0.1', '2011-04-08 17:33:49');
INSERT INTO `t_sys_log` VALUES ('4575', '301', '登陆', '127.0.0.1', '2011-04-08 18:46:36');
INSERT INTO `t_sys_log` VALUES ('4576', '301', '登陆', '127.0.0.1', '2011-04-08 18:46:59');
INSERT INTO `t_sys_log` VALUES ('4577', '302', '登陆', '127.0.0.1', '2011-04-09 09:47:45');
INSERT INTO `t_sys_log` VALUES ('4578', '302', '登陆', '127.0.0.1', '2011-04-09 11:52:40');
INSERT INTO `t_sys_log` VALUES ('4579', '301', '登陆', '127.0.0.1', '2011-04-11 08:58:13');
INSERT INTO `t_sys_log` VALUES ('4580', '301', '退出', '127.0.0.1', '2011-04-11 09:04:12');
INSERT INTO `t_sys_log` VALUES ('4581', '309', '登陆', '127.0.0.1', '2011-04-11 09:04:36');
INSERT INTO `t_sys_log` VALUES ('4582', '309', '退出', '127.0.0.1', '2011-04-11 09:12:06');
INSERT INTO `t_sys_log` VALUES ('4583', '301', '登陆', '127.0.0.1', '2011-04-11 09:12:50');
INSERT INTO `t_sys_log` VALUES ('4584', '314', '登陆', '127.0.0.1', '2011-04-11 09:40:55');
INSERT INTO `t_sys_log` VALUES ('4585', '301', '登陆', '127.0.0.1', '2011-04-11 09:51:58');
INSERT INTO `t_sys_log` VALUES ('4586', '301', '登陆', '127.0.0.1', '2011-04-11 09:53:10');
INSERT INTO `t_sys_log` VALUES ('4587', '301', '登陆', '127.0.0.1', '2011-04-11 09:55:07');
INSERT INTO `t_sys_log` VALUES ('4588', '302', '登陆', '127.0.0.1', '2011-04-11 09:55:44');
INSERT INTO `t_sys_log` VALUES ('4589', '301', '退出', '127.0.0.1', '2011-04-11 09:56:39');
INSERT INTO `t_sys_log` VALUES ('4590', '309', '登陆', '127.0.0.1', '2011-04-11 09:56:48');
INSERT INTO `t_sys_log` VALUES ('4591', '314', '登陆', '127.0.0.1', '2011-04-11 10:02:42');
INSERT INTO `t_sys_log` VALUES ('4592', '302', '退出', '127.0.0.1', '2011-04-11 10:09:05');
INSERT INTO `t_sys_log` VALUES ('4593', '302', '登陆', '127.0.0.1', '2011-04-11 10:09:17');
INSERT INTO `t_sys_log` VALUES ('4594', '302', '登陆', '127.0.0.1', '2011-04-11 10:10:56');
INSERT INTO `t_sys_log` VALUES ('4595', '302', '退出', '127.0.0.1', '2011-04-11 10:11:08');
INSERT INTO `t_sys_log` VALUES ('4596', '302', '登陆', '127.0.0.1', '2011-04-11 10:11:18');
INSERT INTO `t_sys_log` VALUES ('4597', '302', '登陆', '127.0.0.1', '2011-04-11 10:11:54');
INSERT INTO `t_sys_log` VALUES ('4598', '302', '登陆', '127.0.0.1', '2011-04-11 10:12:49');
INSERT INTO `t_sys_log` VALUES ('4599', '302', '登陆', '127.0.0.1', '2011-04-11 10:13:20');
INSERT INTO `t_sys_log` VALUES ('4600', '309', '退出', '127.0.0.1', '2011-04-11 10:19:51');
INSERT INTO `t_sys_log` VALUES ('4601', '301', '登陆', '127.0.0.1', '2011-04-11 10:19:59');
INSERT INTO `t_sys_log` VALUES ('4602', '314', '登陆', '127.0.0.1', '2011-04-11 10:23:48');
INSERT INTO `t_sys_log` VALUES ('4603', '302', '登陆', '127.0.0.1', '2011-04-11 10:57:37');
INSERT INTO `t_sys_log` VALUES ('4604', '314', '退出', '127.0.0.1', '2011-04-11 11:17:25');
INSERT INTO `t_sys_log` VALUES ('4605', '316', '登陆', '127.0.0.1', '2011-04-11 11:17:36');
INSERT INTO `t_sys_log` VALUES ('4606', '314', '登陆', '127.0.0.1', '2011-04-11 11:19:35');
INSERT INTO `t_sys_log` VALUES ('4607', '314', '登陆', '127.0.0.1', '2011-04-11 12:03:41');
INSERT INTO `t_sys_log` VALUES ('4608', '314', '登陆', '127.0.0.1', '2011-04-11 14:27:36');
INSERT INTO `t_sys_log` VALUES ('4609', '316', '登陆', '127.0.0.1', '2011-04-11 15:15:22');
INSERT INTO `t_sys_log` VALUES ('4610', '302', '登陆', '127.0.0.1', '2011-04-11 15:16:52');
INSERT INTO `t_sys_log` VALUES ('4611', '316', '退出', '127.0.0.1', '2011-04-11 15:21:30');
INSERT INTO `t_sys_log` VALUES ('4612', '314', '登陆', '127.0.0.1', '2011-04-11 15:21:42');
INSERT INTO `t_sys_log` VALUES ('4613', '314', '退出', '127.0.0.1', '2011-04-11 15:24:50');
INSERT INTO `t_sys_log` VALUES ('4614', '316', '登陆', '127.0.0.1', '2011-04-11 15:25:01');
INSERT INTO `t_sys_log` VALUES ('4615', '316', '退出', '127.0.0.1', '2011-04-11 15:28:45');
INSERT INTO `t_sys_log` VALUES ('4616', '314', '登陆', '127.0.0.1', '2011-04-11 15:29:11');
INSERT INTO `t_sys_log` VALUES ('4617', '302', '登陆', '127.0.0.1', '2011-04-11 15:49:40');
INSERT INTO `t_sys_log` VALUES ('4618', '302', '退出', '127.0.0.1', '2011-04-11 15:58:37');
INSERT INTO `t_sys_log` VALUES ('4619', '303', '登陆', '127.0.0.1', '2011-04-11 15:59:22');
INSERT INTO `t_sys_log` VALUES ('4620', '314', '登陆', '127.0.0.1', '2011-04-11 16:14:04');
INSERT INTO `t_sys_log` VALUES ('4621', '302', '退出', '127.0.0.1', '2011-04-11 16:39:24');
INSERT INTO `t_sys_log` VALUES ('4622', '307', '登陆', '127.0.0.1', '2011-04-11 16:39:36');
INSERT INTO `t_sys_log` VALUES ('4623', '302', '登陆', '127.0.0.1', '2011-04-11 18:55:52');
INSERT INTO `t_sys_log` VALUES ('4624', '302', '登陆', '127.0.0.1', '2011-04-11 18:56:15');
INSERT INTO `t_sys_log` VALUES ('4625', '301', '登陆', '127.0.0.1', '2011-04-12 09:01:52');
INSERT INTO `t_sys_log` VALUES ('4626', '302', '登陆', '127.0.0.1', '2011-04-12 09:16:55');
INSERT INTO `t_sys_log` VALUES ('4627', '314', '登陆', '127.0.0.1', '2011-04-12 09:24:07');
INSERT INTO `t_sys_log` VALUES ('4628', '314', '退出', '127.0.0.1', '2011-04-12 09:38:23');
INSERT INTO `t_sys_log` VALUES ('4629', '316', '登陆', '127.0.0.1', '2011-04-12 09:41:40');
INSERT INTO `t_sys_log` VALUES ('4630', '302', '退出', '127.0.0.1', '2011-04-12 10:41:48');
INSERT INTO `t_sys_log` VALUES ('4631', '302', '登陆', '127.0.0.1', '2011-04-12 10:42:01');
INSERT INTO `t_sys_log` VALUES ('4632', '316', '登陆', '127.0.0.1', '2011-04-12 11:11:57');
INSERT INTO `t_sys_log` VALUES ('4633', '302', '退出', '127.0.0.1', '2011-04-12 11:20:36');
INSERT INTO `t_sys_log` VALUES ('4634', '303', '登陆', '127.0.0.1', '2011-04-12 11:20:48');
INSERT INTO `t_sys_log` VALUES ('4635', '303', '退出', '127.0.0.1', '2011-04-12 11:22:00');
INSERT INTO `t_sys_log` VALUES ('4636', '302', '登陆', '127.0.0.1', '2011-04-12 11:22:11');
INSERT INTO `t_sys_log` VALUES ('4637', '302', '退出', '127.0.0.1', '2011-04-12 11:27:21');
INSERT INTO `t_sys_log` VALUES ('4638', '302', '登陆', '127.0.0.1', '2011-04-12 11:27:30');
INSERT INTO `t_sys_log` VALUES ('4639', '302', '退出', '127.0.0.1', '2011-04-12 11:33:16');
INSERT INTO `t_sys_log` VALUES ('4640', '302', '登陆', '127.0.0.1', '2011-04-12 11:33:23');
INSERT INTO `t_sys_log` VALUES ('4641', '303', '登陆', '127.0.0.1', '2011-04-12 11:55:06');
INSERT INTO `t_sys_log` VALUES ('4642', '302', '登陆', '127.0.0.1', '2011-04-12 11:58:24');
INSERT INTO `t_sys_log` VALUES ('4643', '303', '退出', '127.0.0.1', '2011-04-12 12:31:41');
INSERT INTO `t_sys_log` VALUES ('4644', '302', '登陆', '127.0.0.1', '2011-04-12 12:31:57');
INSERT INTO `t_sys_log` VALUES ('4645', '303', '登陆', '127.0.0.1', '2011-04-12 14:29:44');
INSERT INTO `t_sys_log` VALUES ('4646', '303', '退出', '127.0.0.1', '2011-04-12 14:29:53');
INSERT INTO `t_sys_log` VALUES ('4647', '307', '登陆', '127.0.0.1', '2011-04-12 14:30:08');
INSERT INTO `t_sys_log` VALUES ('4648', '314', '登陆', '127.0.0.1', '2011-04-12 15:32:26');
INSERT INTO `t_sys_log` VALUES ('4649', '307', '退出', '127.0.0.1', '2011-04-12 15:41:39');
INSERT INTO `t_sys_log` VALUES ('4650', '301', '登陆', '127.0.0.1', '2011-04-12 15:50:42');
INSERT INTO `t_sys_log` VALUES ('4651', '303', '登陆', '127.0.0.1', '2011-04-12 16:16:20');
INSERT INTO `t_sys_log` VALUES ('4652', '303', '退出', '127.0.0.1', '2011-04-12 16:23:52');
INSERT INTO `t_sys_log` VALUES ('4653', '302', '登陆', '127.0.0.1', '2011-04-12 16:23:59');
INSERT INTO `t_sys_log` VALUES ('4654', '302', '退出', '127.0.0.1', '2011-04-12 16:24:19');
INSERT INTO `t_sys_log` VALUES ('4655', '307', '登陆', '127.0.0.1', '2011-04-12 16:24:26');
INSERT INTO `t_sys_log` VALUES ('4656', '307', '退出', '127.0.0.1', '2011-04-12 16:24:37');
INSERT INTO `t_sys_log` VALUES ('4657', '302', '登陆', '127.0.0.1', '2011-04-12 16:24:55');
INSERT INTO `t_sys_log` VALUES ('4658', '301', '登陆', '127.0.0.1', '2011-04-12 16:26:18');
INSERT INTO `t_sys_log` VALUES ('4659', '302', '退出', '127.0.0.1', '2011-04-12 16:28:36');
INSERT INTO `t_sys_log` VALUES ('4660', '303', '登陆', '127.0.0.1', '2011-04-12 16:28:44');
INSERT INTO `t_sys_log` VALUES ('4661', '301', '登陆', '127.0.0.1', '2011-04-12 16:32:02');
INSERT INTO `t_sys_log` VALUES ('4662', '303', '退出', '127.0.0.1', '2011-04-12 16:37:45');
INSERT INTO `t_sys_log` VALUES ('4663', '302', '登陆', '127.0.0.1', '2011-04-12 16:37:54');
INSERT INTO `t_sys_log` VALUES ('4664', '302', '退出', '127.0.0.1', '2011-04-12 16:38:29');
INSERT INTO `t_sys_log` VALUES ('4665', '302', '登陆', '127.0.0.1', '2011-04-12 16:38:39');
INSERT INTO `t_sys_log` VALUES ('4666', '302', '退出', '127.0.0.1', '2011-04-12 16:39:31');
INSERT INTO `t_sys_log` VALUES ('4667', '302', '登陆', '127.0.0.1', '2011-04-12 16:39:40');
INSERT INTO `t_sys_log` VALUES ('4668', '302', '退出', '127.0.0.1', '2011-04-12 17:01:31');
INSERT INTO `t_sys_log` VALUES ('4669', '303', '登陆', '127.0.0.1', '2011-04-12 17:01:56');
INSERT INTO `t_sys_log` VALUES ('4670', '314', '登陆', '127.0.0.1', '2011-04-12 17:27:07');
INSERT INTO `t_sys_log` VALUES ('4671', '303', '退出', '127.0.0.1', '2011-04-12 17:31:24');
INSERT INTO `t_sys_log` VALUES ('4672', '303', '登陆', '127.0.0.1', '2011-04-12 17:31:56');
INSERT INTO `t_sys_log` VALUES ('4673', '303', '退出', '127.0.0.1', '2011-04-12 17:41:24');
INSERT INTO `t_sys_log` VALUES ('4674', '302', '登陆', '127.0.0.1', '2011-04-12 18:57:03');
INSERT INTO `t_sys_log` VALUES ('4675', '314', '登陆', '127.0.0.1', '2011-04-12 19:23:33');
INSERT INTO `t_sys_log` VALUES ('4676', '314', '登陆', '127.0.0.1', '2011-04-13 08:58:56');
INSERT INTO `t_sys_log` VALUES ('4677', '302', '登陆', '127.0.0.1', '2011-04-13 09:49:03');
INSERT INTO `t_sys_log` VALUES ('4678', '302', '登陆', '127.0.0.1', '2011-04-13 15:50:51');
INSERT INTO `t_sys_log` VALUES ('4679', '302', '退出', '127.0.0.1', '2011-04-13 16:28:54');
INSERT INTO `t_sys_log` VALUES ('4680', '302', '登陆', '127.0.0.1', '2011-04-13 17:42:20');
INSERT INTO `t_sys_log` VALUES ('4681', '302', '登陆', '127.0.0.1', '2011-04-13 18:16:03');
INSERT INTO `t_sys_log` VALUES ('4682', '302', '登陆', '127.0.0.1', '2011-04-13 18:56:28');
INSERT INTO `t_sys_log` VALUES ('4683', '301', '登陆', '127.0.0.1', '2011-04-14 09:19:07');
INSERT INTO `t_sys_log` VALUES ('4684', '301', '登陆', '127.0.0.1', '2011-04-14 09:36:15');
INSERT INTO `t_sys_log` VALUES ('4685', '314', '登陆', '127.0.0.1', '2011-04-14 09:49:08');
INSERT INTO `t_sys_log` VALUES ('4686', '301', '退出', '127.0.0.1', '2011-04-14 09:55:22');
INSERT INTO `t_sys_log` VALUES ('4687', '309', '登陆', '127.0.0.1', '2011-04-14 09:55:31');
INSERT INTO `t_sys_log` VALUES ('4688', '320', '退出', '127.0.0.1', '2011-04-14 10:30:54');
INSERT INTO `t_sys_log` VALUES ('4689', '321', '退出', '127.0.0.1', '2011-04-14 10:32:28');
INSERT INTO `t_sys_log` VALUES ('4690', '321', '登陆', '127.0.0.1', '2011-04-14 10:32:38');
INSERT INTO `t_sys_log` VALUES ('4691', '321', '登陆', '127.0.0.1', '2011-04-14 10:34:02');
INSERT INTO `t_sys_log` VALUES ('4692', '321', '登陆', '127.0.0.1', '2011-04-14 10:39:53');
INSERT INTO `t_sys_log` VALUES ('4693', '321', '退出', '127.0.0.1', '2011-04-14 10:43:23');
INSERT INTO `t_sys_log` VALUES ('4694', '303', '登陆', '127.0.0.1', '2011-04-14 10:43:37');
INSERT INTO `t_sys_log` VALUES ('4695', '301', '登陆', '127.0.0.1', '2011-04-14 10:48:12');
INSERT INTO `t_sys_log` VALUES ('4696', '301', '退出', '127.0.0.1', '2011-04-14 10:49:00');
INSERT INTO `t_sys_log` VALUES ('4697', '309', '登陆', '127.0.0.1', '2011-04-14 10:49:11');
INSERT INTO `t_sys_log` VALUES ('4698', '309', '登陆', '127.0.0.1', '2011-04-14 10:49:40');
INSERT INTO `t_sys_log` VALUES ('4699', '309', '退出', '127.0.0.1', '2011-04-14 10:50:16');
INSERT INTO `t_sys_log` VALUES ('4700', '303', '退出', '127.0.0.1', '2011-04-14 10:50:51');
INSERT INTO `t_sys_log` VALUES ('4701', '314', '登陆', '127.0.0.1', '2011-04-14 10:59:42');
INSERT INTO `t_sys_log` VALUES ('4702', '323', '退出', '127.0.0.1', '2011-04-14 11:10:17');
INSERT INTO `t_sys_log` VALUES ('4703', '309', '退出', '127.0.0.1', '2011-04-14 11:10:36');
INSERT INTO `t_sys_log` VALUES ('4704', '325', '退出', '127.0.0.1', '2011-04-14 11:11:54');
INSERT INTO `t_sys_log` VALUES ('4705', '302', '登陆', '127.0.0.1', '2011-04-14 11:22:22');
INSERT INTO `t_sys_log` VALUES ('4706', '302', '退出', '127.0.0.1', '2011-04-14 11:40:37');
INSERT INTO `t_sys_log` VALUES ('4707', '327', '退出', '127.0.0.1', '2011-04-14 11:42:06');
INSERT INTO `t_sys_log` VALUES ('4708', '302', '登陆', '127.0.0.1', '2011-04-14 11:42:15');
INSERT INTO `t_sys_log` VALUES ('4709', '327', '登陆', '127.0.0.1', '2011-04-14 12:01:02');
INSERT INTO `t_sys_log` VALUES ('4710', '316', '登陆', '127.0.0.1', '2011-04-14 12:03:28');
INSERT INTO `t_sys_log` VALUES ('4711', '316', '退出', '127.0.0.1', '2011-04-14 12:03:47');
INSERT INTO `t_sys_log` VALUES ('4712', '314', '登陆', '127.0.0.1', '2011-04-14 12:03:56');
INSERT INTO `t_sys_log` VALUES ('4713', '327', '退出', '127.0.0.1', '2011-04-14 12:06:52');
INSERT INTO `t_sys_log` VALUES ('4714', '307', '登陆', '127.0.0.1', '2011-04-14 12:07:00');
INSERT INTO `t_sys_log` VALUES ('4715', '302', '退出', '127.0.0.1', '2011-04-14 12:11:33');
INSERT INTO `t_sys_log` VALUES ('4716', '328', '退出', '127.0.0.1', '2011-04-14 12:11:57');
INSERT INTO `t_sys_log` VALUES ('4717', '328', '登陆', '127.0.0.1', '2011-04-14 12:12:10');
INSERT INTO `t_sys_log` VALUES ('4718', '328', '退出', '127.0.0.1', '2011-04-14 12:14:14');
INSERT INTO `t_sys_log` VALUES ('4719', '302', '登陆', '127.0.0.1', '2011-04-14 12:14:22');
INSERT INTO `t_sys_log` VALUES ('4720', '314', '登陆', '127.0.0.1', '2011-04-14 14:37:59');
INSERT INTO `t_sys_log` VALUES ('4721', '302', '登陆', '127.0.0.1', '2011-04-14 14:48:40');
INSERT INTO `t_sys_log` VALUES ('4722', '302', '登陆', '127.0.0.1', '2011-04-14 15:08:55');
INSERT INTO `t_sys_log` VALUES ('4723', '302', '登陆', '127.0.0.1', '2011-04-14 15:10:21');
INSERT INTO `t_sys_log` VALUES ('4724', '302', '登陆', '127.0.0.1', '2011-04-14 15:10:34');
INSERT INTO `t_sys_log` VALUES ('4725', '316', '登陆', '127.0.0.1', '2011-04-14 16:10:22');
INSERT INTO `t_sys_log` VALUES ('4726', '316', '退出', '127.0.0.1', '2011-04-14 16:19:54');
INSERT INTO `t_sys_log` VALUES ('4727', '314', '登陆', '127.0.0.1', '2011-04-14 16:20:03');
INSERT INTO `t_sys_log` VALUES ('4728', '327', '登陆', '127.0.0.1', '2011-04-14 17:31:23');
INSERT INTO `t_sys_log` VALUES ('4729', '329', '退出', '127.0.0.1', '2011-04-14 17:43:45');
INSERT INTO `t_sys_log` VALUES ('4730', '307', '登陆', '127.0.0.1', '2011-04-14 17:43:54');
INSERT INTO `t_sys_log` VALUES ('4731', '307', '退出', '127.0.0.1', '2011-04-14 17:44:48');
INSERT INTO `t_sys_log` VALUES ('4732', '329', '登陆', '127.0.0.1', '2011-04-14 17:44:55');
INSERT INTO `t_sys_log` VALUES ('4733', '302', '登陆', '127.0.0.1', '2011-04-14 17:55:37');
INSERT INTO `t_sys_log` VALUES ('4734', '302', '登陆', '127.0.0.1', '2011-04-14 17:55:49');
INSERT INTO `t_sys_log` VALUES ('4735', '329', '退出', '127.0.0.1', '2011-04-14 18:04:18');
INSERT INTO `t_sys_log` VALUES ('4736', '329', '登陆', '127.0.0.1', '2011-04-14 18:04:28');
INSERT INTO `t_sys_log` VALUES ('4737', '302', '退出', '127.0.0.1', '2011-04-14 18:04:33');
INSERT INTO `t_sys_log` VALUES ('4738', '330', '登陆', '127.0.0.1', '2011-04-14 18:13:29');
INSERT INTO `t_sys_log` VALUES ('4739', '330', '登陆', '127.0.0.1', '2011-04-14 18:19:35');
INSERT INTO `t_sys_log` VALUES ('4740', '302', '登陆', '127.0.0.1', '2011-04-14 18:45:32');
INSERT INTO `t_sys_log` VALUES ('4741', '302', '登陆', '127.0.0.1', '2011-04-14 18:46:24');
INSERT INTO `t_sys_log` VALUES ('4742', '302', '登陆', '127.0.0.1', '2011-04-14 18:46:48');
INSERT INTO `t_sys_log` VALUES ('4743', '302', '登陆', '127.0.0.1', '2011-04-14 18:47:25');
INSERT INTO `t_sys_log` VALUES ('4744', '302', '登陆', '127.0.0.1', '2011-04-14 18:47:59');
INSERT INTO `t_sys_log` VALUES ('4745', '302', '登陆', '127.0.0.1', '2011-04-14 18:48:29');
INSERT INTO `t_sys_log` VALUES ('4746', '302', '登陆', '127.0.0.1', '2011-04-14 18:49:04');
INSERT INTO `t_sys_log` VALUES ('4747', '302', '登陆', '127.0.0.1', '2011-04-14 18:49:23');
INSERT INTO `t_sys_log` VALUES ('4748', '302', '登陆', '127.0.0.1', '2011-04-14 18:49:42');
INSERT INTO `t_sys_log` VALUES ('4749', '302', '登陆', '127.0.0.1', '2011-04-14 18:50:22');
INSERT INTO `t_sys_log` VALUES ('4750', '302', '登陆', '127.0.0.1', '2011-04-14 18:52:06');
INSERT INTO `t_sys_log` VALUES ('4751', '302', '登陆', '127.0.0.1', '2011-04-14 18:54:22');
INSERT INTO `t_sys_log` VALUES ('4752', '302', '登陆', '127.0.0.1', '2011-04-14 18:56:21');
INSERT INTO `t_sys_log` VALUES ('4753', '303', '登陆', '127.0.0.1', '2011-04-14 18:58:36');
INSERT INTO `t_sys_log` VALUES ('4754', '303', '退出', '127.0.0.1', '2011-04-14 19:08:56');
INSERT INTO `t_sys_log` VALUES ('4755', '330', '登陆', '127.0.0.1', '2011-04-14 19:09:05');
INSERT INTO `t_sys_log` VALUES ('4756', '329', '登陆', '127.0.0.1', '2011-04-14 19:14:10');
INSERT INTO `t_sys_log` VALUES ('4757', '302', '登陆', '127.0.0.1', '2011-04-15 09:13:12');
INSERT INTO `t_sys_log` VALUES ('4758', '302', '登陆', '127.0.0.1', '2011-04-15 11:18:50');
INSERT INTO `t_sys_log` VALUES ('4759', '329', '登陆', '127.0.0.1', '2011-04-15 11:36:50');
INSERT INTO `t_sys_log` VALUES ('4760', '329', '登陆', '127.0.0.1', '2011-04-15 14:40:18');
INSERT INTO `t_sys_log` VALUES ('4761', '329', '退出', '127.0.0.1', '2011-04-15 14:40:29');
INSERT INTO `t_sys_log` VALUES ('4762', '329', '登陆', '127.0.0.1', '2011-04-15 14:40:42');
INSERT INTO `t_sys_log` VALUES ('4763', '329', '退出', '127.0.0.1', '2011-04-15 14:43:12');
INSERT INTO `t_sys_log` VALUES ('4764', '302', '登陆', '127.0.0.1', '2011-04-15 14:43:21');
INSERT INTO `t_sys_log` VALUES ('4765', '301', '登陆', '127.0.0.1', '2011-04-15 14:44:30');
INSERT INTO `t_sys_log` VALUES ('4766', '302', '退出', '127.0.0.1', '2011-04-15 15:38:48');
INSERT INTO `t_sys_log` VALUES ('4767', '330', '登陆', '127.0.0.1', '2011-04-15 15:38:59');
INSERT INTO `t_sys_log` VALUES ('4768', '330', '登陆', '127.0.0.1', '2011-04-15 15:41:13');
INSERT INTO `t_sys_log` VALUES ('4769', '330', '退出', '127.0.0.1', '2011-04-15 15:55:40');
INSERT INTO `t_sys_log` VALUES ('4770', '331', '登陆', '127.0.0.1', '2011-04-15 17:25:08');
INSERT INTO `t_sys_log` VALUES ('4771', '331', '登陆', '127.0.0.1', '2011-04-15 17:46:54');
INSERT INTO `t_sys_log` VALUES ('4772', '301', '登陆', '127.0.0.1', '2011-04-16 09:28:38');
INSERT INTO `t_sys_log` VALUES ('4773', '330', '登陆', '127.0.0.1', '2011-04-18 08:57:46');
INSERT INTO `t_sys_log` VALUES ('4774', '331', '登陆', '127.0.0.1', '2011-04-18 08:59:05');
INSERT INTO `t_sys_log` VALUES ('4775', '314', '登陆', '127.0.0.1', '2011-04-18 09:36:57');
INSERT INTO `t_sys_log` VALUES ('4776', '301', '登陆', '127.0.0.1', '2011-04-18 09:42:04');
INSERT INTO `t_sys_log` VALUES ('4777', '301', '退出', '127.0.0.1', '2011-04-18 09:45:49');
INSERT INTO `t_sys_log` VALUES ('4778', '309', '登陆', '127.0.0.1', '2011-04-18 09:56:40');
INSERT INTO `t_sys_log` VALUES ('4779', '309', '登陆', '127.0.0.1', '2011-04-18 10:02:26');
INSERT INTO `t_sys_log` VALUES ('4780', '331', '登陆', '127.0.0.1', '2011-04-18 10:24:40');
INSERT INTO `t_sys_log` VALUES ('4781', '329', '登陆', '127.0.0.1', '2011-04-18 11:01:43');
INSERT INTO `t_sys_log` VALUES ('4782', '331', '登陆', '127.0.0.1', '2011-04-18 11:02:56');
INSERT INTO `t_sys_log` VALUES ('4783', '329', '退出', '127.0.0.1', '2011-04-18 11:12:19');
INSERT INTO `t_sys_log` VALUES ('4784', '331', '退出', '127.0.0.1', '2011-04-18 11:13:43');
INSERT INTO `t_sys_log` VALUES ('4785', '332', '退出', '127.0.0.1', '2011-04-18 11:16:27');
INSERT INTO `t_sys_log` VALUES ('4786', '330', '登陆', '127.0.0.1', '2011-04-18 11:16:39');
INSERT INTO `t_sys_log` VALUES ('4787', '314', '登陆', '127.0.0.1', '2011-04-18 11:20:30');
INSERT INTO `t_sys_log` VALUES ('4788', '332', '登陆', '127.0.0.1', '2011-04-18 11:25:58');
INSERT INTO `t_sys_log` VALUES ('4789', '332', '退出', '127.0.0.1', '2011-04-18 11:26:58');
INSERT INTO `t_sys_log` VALUES ('4790', '316', '登陆', '127.0.0.1', '2011-04-18 11:36:19');
INSERT INTO `t_sys_log` VALUES ('4791', '333', '登陆', '127.0.0.1', '2011-04-18 11:48:38');
INSERT INTO `t_sys_log` VALUES ('4792', '314', '登陆', '127.0.0.1', '2011-04-18 14:31:41');
INSERT INTO `t_sys_log` VALUES ('4793', '331', '登陆', '127.0.0.1', '2011-04-18 14:57:02');
INSERT INTO `t_sys_log` VALUES ('4794', '331', '登陆', '127.0.0.1', '2011-04-18 14:57:33');
INSERT INTO `t_sys_log` VALUES ('4795', '329', '登陆', '127.0.0.1', '2011-04-18 16:33:37');
INSERT INTO `t_sys_log` VALUES ('4796', '330', '登陆', '127.0.0.1', '2011-04-18 16:35:24');
INSERT INTO `t_sys_log` VALUES ('4797', '314', '登陆', '127.0.0.1', '2011-04-18 16:46:30');
INSERT INTO `t_sys_log` VALUES ('4798', '329', '登陆', '127.0.0.1', '2011-04-18 17:38:00');
INSERT INTO `t_sys_log` VALUES ('4799', '314', '登陆', '127.0.0.1', '2011-04-18 18:09:14');
INSERT INTO `t_sys_log` VALUES ('4800', '331', '登陆', '127.0.0.1', '2011-04-18 18:18:19');
INSERT INTO `t_sys_log` VALUES ('4801', '330', '登陆', '127.0.0.1', '2011-04-18 19:00:32');
INSERT INTO `t_sys_log` VALUES ('4802', '316', '登陆', '127.0.0.1', '2011-04-19 09:19:21');
INSERT INTO `t_sys_log` VALUES ('4803', '302', '登陆', '127.0.0.1', '2011-04-19 09:20:02');
INSERT INTO `t_sys_log` VALUES ('4804', '314', '登陆', '127.0.0.1', '2011-04-19 10:44:51');
INSERT INTO `t_sys_log` VALUES ('4805', '314', '退出', '127.0.0.1', '2011-04-19 10:47:20');
INSERT INTO `t_sys_log` VALUES ('4806', '316', '登陆', '127.0.0.1', '2011-04-19 10:47:31');
INSERT INTO `t_sys_log` VALUES ('4807', '302', '登陆', '127.0.0.1', '2011-04-19 15:37:46');
INSERT INTO `t_sys_log` VALUES ('4808', '302', '登陆', '127.0.0.1', '2011-04-19 17:10:15');
INSERT INTO `t_sys_log` VALUES ('4809', '316', '登陆', '127.0.0.1', '2011-04-19 17:11:11');
INSERT INTO `t_sys_log` VALUES ('4810', '302', '退出', '127.0.0.1', '2011-04-19 18:07:10');
INSERT INTO `t_sys_log` VALUES ('4811', '329', '登陆', '127.0.0.1', '2011-04-19 18:07:19');
INSERT INTO `t_sys_log` VALUES ('4812', '316', '登陆', '127.0.0.1', '2011-04-19 18:10:10');
INSERT INTO `t_sys_log` VALUES ('4813', '329', '退出', '127.0.0.1', '2011-04-19 18:16:55');
INSERT INTO `t_sys_log` VALUES ('4814', '302', '登陆', '127.0.0.1', '2011-04-19 18:17:03');
INSERT INTO `t_sys_log` VALUES ('4815', '314', '登陆', '127.0.0.1', '2011-04-20 09:06:11');
INSERT INTO `t_sys_log` VALUES ('4816', '302', '登陆', '127.0.0.1', '2011-04-20 16:26:46');
INSERT INTO `t_sys_log` VALUES ('4817', '334', '退出', '127.0.0.1', '2011-04-20 19:08:59');
INSERT INTO `t_sys_log` VALUES ('4818', '302', '登陆', '127.0.0.1', '2011-04-20 19:09:07');
INSERT INTO `t_sys_log` VALUES ('4819', '302', '登陆', '127.0.0.1', '2011-04-20 19:09:20');
INSERT INTO `t_sys_log` VALUES ('4820', '302', '退出', '127.0.0.1', '2011-04-20 19:12:49');
INSERT INTO `t_sys_log` VALUES ('4821', '330', '登陆', '127.0.0.1', '2011-04-20 19:13:27');
INSERT INTO `t_sys_log` VALUES ('4822', '330', '退出', '127.0.0.1', '2011-04-20 19:13:58');
INSERT INTO `t_sys_log` VALUES ('4823', '328', '登陆', '127.0.0.1', '2011-04-20 19:14:06');
INSERT INTO `t_sys_log` VALUES ('4824', '328', '退出', '127.0.0.1', '2011-04-20 19:14:19');
INSERT INTO `t_sys_log` VALUES ('4825', '327', '登陆', '127.0.0.1', '2011-04-20 19:14:26');
INSERT INTO `t_sys_log` VALUES ('4826', '327', '退出', '127.0.0.1', '2011-04-20 19:14:46');
INSERT INTO `t_sys_log` VALUES ('4827', '326', '登陆', '127.0.0.1', '2011-04-20 19:15:19');
INSERT INTO `t_sys_log` VALUES ('4828', '302', '退出', '127.0.0.1', '2011-04-20 19:16:32');
INSERT INTO `t_sys_log` VALUES ('4829', '326', '登陆', '127.0.0.1', '2011-04-20 19:17:09');
INSERT INTO `t_sys_log` VALUES ('4830', '302', '登陆', '127.0.0.1', '2011-04-21 09:07:48');
INSERT INTO `t_sys_log` VALUES ('4831', '314', '登陆', '127.0.0.1', '2011-04-21 10:06:32');
INSERT INTO `t_sys_log` VALUES ('4832', '302', '登陆', '127.0.0.1', '2011-04-21 10:13:06');
INSERT INTO `t_sys_log` VALUES ('4833', '316', '登陆', '127.0.0.1', '2011-04-21 10:15:11');
INSERT INTO `t_sys_log` VALUES ('4834', '302', '登陆', '127.0.0.1', '2011-04-21 12:10:23');
INSERT INTO `t_sys_log` VALUES ('4835', '302', '登陆', '127.0.0.1', '2011-04-21 15:27:48');
INSERT INTO `t_sys_log` VALUES ('4836', '302', '登陆', '127.0.0.1', '2011-04-21 16:19:30');
INSERT INTO `t_sys_log` VALUES ('4837', '302', '退出', '127.0.0.1', '2011-04-21 16:23:40');
INSERT INTO `t_sys_log` VALUES ('4838', '311', '登陆', '127.0.0.1', '2011-04-21 16:24:05');
INSERT INTO `t_sys_log` VALUES ('4839', '311', '退出', '127.0.0.1', '2011-04-21 16:24:18');
INSERT INTO `t_sys_log` VALUES ('4840', '331', '登陆', '127.0.0.1', '2011-04-21 16:24:36');
INSERT INTO `t_sys_log` VALUES ('4841', '331', '退出', '127.0.0.1', '2011-04-21 16:56:55');
INSERT INTO `t_sys_log` VALUES ('4842', '303', '登陆', '127.0.0.1', '2011-04-21 17:02:53');
INSERT INTO `t_sys_log` VALUES ('4843', '303', '退出', '127.0.0.1', '2011-04-21 17:04:41');
INSERT INTO `t_sys_log` VALUES ('4844', '311', '登陆', '127.0.0.1', '2011-04-21 17:05:03');
INSERT INTO `t_sys_log` VALUES ('4845', '302', '登陆', '127.0.0.1', '2011-04-22 11:05:31');
INSERT INTO `t_sys_log` VALUES ('4846', '302', '登陆', '127.0.0.1', '2011-04-22 12:00:35');
INSERT INTO `t_sys_log` VALUES ('4847', '302', '退出', '127.0.0.1', '2011-04-22 12:01:10');
INSERT INTO `t_sys_log` VALUES ('4848', '330', '登陆', '127.0.0.1', '2011-04-22 12:01:19');
INSERT INTO `t_sys_log` VALUES ('4849', '330', '退出', '127.0.0.1', '2011-04-22 12:01:27');
INSERT INTO `t_sys_log` VALUES ('4850', '331', '登陆', '127.0.0.1', '2011-04-22 12:01:33');
INSERT INTO `t_sys_log` VALUES ('4851', '331', '退出', '127.0.0.1', '2011-04-22 12:01:38');
INSERT INTO `t_sys_log` VALUES ('4852', '302', '登陆', '127.0.0.1', '2011-04-22 12:01:51');
INSERT INTO `t_sys_log` VALUES ('4853', '302', '登陆', '127.0.0.1', '2011-04-22 14:36:50');
INSERT INTO `t_sys_log` VALUES ('4854', '302', '登陆', '127.0.0.1', '2011-04-22 16:02:09');
INSERT INTO `t_sys_log` VALUES ('4855', '302', '登陆', '127.0.0.1', '2011-04-22 16:23:39');
INSERT INTO `t_sys_log` VALUES ('4856', '302', '登陆', '127.0.0.1', '2011-04-22 16:38:50');
INSERT INTO `t_sys_log` VALUES ('4857', '329', '登陆', '127.0.0.1', '2011-04-22 16:48:51');
INSERT INTO `t_sys_log` VALUES ('4858', '302', '登陆', '127.0.0.1', '2011-04-22 18:06:05');
INSERT INTO `t_sys_log` VALUES ('4859', '302', '登陆', '127.0.0.1', '2011-04-22 18:22:16');
INSERT INTO `t_sys_log` VALUES ('4860', '302', '登陆', '127.0.0.1', '2011-04-23 13:46:36');
INSERT INTO `t_sys_log` VALUES ('4861', '302', '登陆', '127.0.0.1', '2011-04-23 13:46:57');
INSERT INTO `t_sys_log` VALUES ('4862', '331', '登陆', '127.0.0.1', '2011-04-25 09:07:52');
INSERT INTO `t_sys_log` VALUES ('4863', '302', '登陆', '127.0.0.1', '2011-04-25 11:54:32');
INSERT INTO `t_sys_log` VALUES ('4864', '329', '登陆', '127.0.0.1', '2011-04-25 12:08:24');
INSERT INTO `t_sys_log` VALUES ('4865', '331', '登陆', '127.0.0.1', '2011-04-25 15:09:12');
INSERT INTO `t_sys_log` VALUES ('4866', '329', '登陆', '127.0.0.1', '2011-04-25 18:19:40');
INSERT INTO `t_sys_log` VALUES ('4867', '331', '登陆', '127.0.0.1', '2011-04-25 18:20:58');
INSERT INTO `t_sys_log` VALUES ('4868', '331', '登陆', '127.0.0.1', '2011-04-25 18:21:17');
INSERT INTO `t_sys_log` VALUES ('4869', '331', '退出', '127.0.0.1', '2011-04-25 18:24:06');
INSERT INTO `t_sys_log` VALUES ('4870', '329', '登陆', '127.0.0.1', '2011-04-25 18:53:11');
INSERT INTO `t_sys_log` VALUES ('4871', '302', '登陆', '127.0.0.1', '2011-04-26 08:58:18');
INSERT INTO `t_sys_log` VALUES ('4872', '302', '登陆', '127.0.0.1', '2011-04-26 10:57:03');
INSERT INTO `t_sys_log` VALUES ('4873', '302', '登陆', '127.0.0.1', '2011-04-26 14:37:23');
INSERT INTO `t_sys_log` VALUES ('4874', '302', '登陆', '127.0.0.1', '2011-04-26 15:10:16');
INSERT INTO `t_sys_log` VALUES ('4875', '302', '退出', '127.0.0.1', '2011-04-26 17:43:42');
INSERT INTO `t_sys_log` VALUES ('4876', '329', '登陆', '127.0.0.1', '2011-04-26 17:43:52');
INSERT INTO `t_sys_log` VALUES ('4877', '329', '退出', '127.0.0.1', '2011-04-26 17:47:47');
INSERT INTO `t_sys_log` VALUES ('4878', '302', '登陆', '127.0.0.1', '2011-04-26 17:47:54');
INSERT INTO `t_sys_log` VALUES ('4879', '302', '退出', '127.0.0.1', '2011-04-26 17:48:37');
INSERT INTO `t_sys_log` VALUES ('4880', '329', '登陆', '127.0.0.1', '2011-04-26 17:48:46');
INSERT INTO `t_sys_log` VALUES ('4881', '302', '登陆', '127.0.0.1', '2011-04-26 17:49:58');
INSERT INTO `t_sys_log` VALUES ('4882', '302', '登陆', '127.0.0.1', '2011-04-26 18:13:45');
INSERT INTO `t_sys_log` VALUES ('4883', '302', '登陆', '127.0.0.1', '2011-04-27 08:56:35');
INSERT INTO `t_sys_log` VALUES ('4884', '329', '登陆', '127.0.0.1', '2011-04-27 09:41:33');
INSERT INTO `t_sys_log` VALUES ('4885', '329', '登陆', '127.0.0.1', '2011-04-27 09:41:53');
INSERT INTO `t_sys_log` VALUES ('4886', '302', '登陆', '127.0.0.1', '2011-04-27 10:56:32');
INSERT INTO `t_sys_log` VALUES ('4887', '329', '登陆', '127.0.0.1', '2011-04-27 11:05:29');
INSERT INTO `t_sys_log` VALUES ('4888', '331', '登陆', '127.0.0.1', '2011-04-27 11:06:37');
INSERT INTO `t_sys_log` VALUES ('4889', '329', '登陆', '127.0.0.1', '2011-04-27 11:09:01');
INSERT INTO `t_sys_log` VALUES ('4890', '302', '退出', '127.0.0.1', '2011-04-27 11:09:15');
INSERT INTO `t_sys_log` VALUES ('4891', '329', '登陆', '127.0.0.1', '2011-04-27 11:09:23');
INSERT INTO `t_sys_log` VALUES ('4892', '329', '退出', '127.0.0.1', '2011-04-27 11:09:35');
INSERT INTO `t_sys_log` VALUES ('4893', '331', '登陆', '127.0.0.1', '2011-04-27 11:09:43');
INSERT INTO `t_sys_log` VALUES ('4894', '331', '退出', '127.0.0.1', '2011-04-27 11:10:01');
INSERT INTO `t_sys_log` VALUES ('4895', '303', '登陆', '127.0.0.1', '2011-04-27 11:10:13');
INSERT INTO `t_sys_log` VALUES ('4896', '303', '退出', '127.0.0.1', '2011-04-27 11:10:24');
INSERT INTO `t_sys_log` VALUES ('4897', '331', '登陆', '127.0.0.1', '2011-04-27 11:10:37');
INSERT INTO `t_sys_log` VALUES ('4898', '331', '退出', '127.0.0.1', '2011-04-27 11:12:53');
INSERT INTO `t_sys_log` VALUES ('4899', '334', '登陆', '127.0.0.1', '2011-04-27 11:13:08');
INSERT INTO `t_sys_log` VALUES ('4900', '334', '退出', '127.0.0.1', '2011-04-27 11:14:18');
INSERT INTO `t_sys_log` VALUES ('4901', '331', '登陆', '127.0.0.1', '2011-04-27 11:14:28');
INSERT INTO `t_sys_log` VALUES ('4902', '331', '登陆', '127.0.0.1', '2011-04-27 11:19:23');
INSERT INTO `t_sys_log` VALUES ('4903', '331', '登陆', '127.0.0.1', '2011-04-27 11:20:00');
INSERT INTO `t_sys_log` VALUES ('4904', '331', '登陆', '127.0.0.1', '2011-04-27 11:22:50');
INSERT INTO `t_sys_log` VALUES ('4905', '331', '登陆', '127.0.0.1', '2011-04-27 11:23:51');
INSERT INTO `t_sys_log` VALUES ('4906', '310', '登陆', '127.0.0.1', '2011-04-27 11:30:16');
INSERT INTO `t_sys_log` VALUES ('4907', '310', '登陆', '127.0.0.1', '2011-04-27 11:30:41');
INSERT INTO `t_sys_log` VALUES ('4908', '331', '退出', '127.0.0.1', '2011-04-27 11:38:40');
INSERT INTO `t_sys_log` VALUES ('4909', '310', '登陆', '127.0.0.1', '2011-04-27 11:38:49');
INSERT INTO `t_sys_log` VALUES ('4910', '310', '退出', '127.0.0.1', '2011-04-27 11:39:07');
INSERT INTO `t_sys_log` VALUES ('4911', '331', '登陆', '127.0.0.1', '2011-04-27 11:39:15');
INSERT INTO `t_sys_log` VALUES ('4912', '331', '退出', '127.0.0.1', '2011-04-27 11:39:26');
INSERT INTO `t_sys_log` VALUES ('4913', '310', '登陆', '127.0.0.1', '2011-04-27 11:39:57');
INSERT INTO `t_sys_log` VALUES ('4914', '310', '登陆', '127.0.0.1', '2011-04-27 11:40:09');
INSERT INTO `t_sys_log` VALUES ('4915', '310', '退出', '127.0.0.1', '2011-04-27 11:40:30');
INSERT INTO `t_sys_log` VALUES ('4916', '331', '登陆', '127.0.0.1', '2011-04-27 11:40:38');
INSERT INTO `t_sys_log` VALUES ('4917', '331', '退出', '127.0.0.1', '2011-04-27 11:41:04');
INSERT INTO `t_sys_log` VALUES ('4918', '331', '登陆', '127.0.0.1', '2011-04-27 11:41:28');
INSERT INTO `t_sys_log` VALUES ('4919', '331', '退出', '127.0.0.1', '2011-04-27 11:41:36');
INSERT INTO `t_sys_log` VALUES ('4920', '323', '登陆', '127.0.0.1', '2011-04-27 11:41:51');
INSERT INTO `t_sys_log` VALUES ('4921', '331', '登陆', '127.0.0.1', '2011-04-27 11:42:23');
INSERT INTO `t_sys_log` VALUES ('4922', '303', '登陆', '127.0.0.1', '2011-04-27 11:43:49');
INSERT INTO `t_sys_log` VALUES ('4923', '303', '登陆', '127.0.0.1', '2011-04-27 11:44:12');
INSERT INTO `t_sys_log` VALUES ('4924', '303', '退出', '127.0.0.1', '2011-04-27 11:44:21');
INSERT INTO `t_sys_log` VALUES ('4925', '331', '登陆', '127.0.0.1', '2011-04-27 11:44:41');
INSERT INTO `t_sys_log` VALUES ('4926', '324', '登陆', '127.0.0.1', '2011-04-27 11:46:44');
INSERT INTO `t_sys_log` VALUES ('4927', '333', '登陆', '127.0.0.1', '2011-04-27 11:47:08');
INSERT INTO `t_sys_log` VALUES ('4928', '324', '登陆', '127.0.0.1', '2011-04-27 11:47:10');
INSERT INTO `t_sys_log` VALUES ('4929', '333', '登陆', '127.0.0.1', '2011-04-27 11:47:59');
INSERT INTO `t_sys_log` VALUES ('4930', '333', '退出', '127.0.0.1', '2011-04-27 11:48:22');
INSERT INTO `t_sys_log` VALUES ('4931', '331', '登陆', '127.0.0.1', '2011-04-27 11:48:30');
INSERT INTO `t_sys_log` VALUES ('4932', '331', '退出', '127.0.0.1', '2011-04-27 11:50:44');
INSERT INTO `t_sys_log` VALUES ('4933', '307', '登陆', '127.0.0.1', '2011-04-27 11:50:54');
INSERT INTO `t_sys_log` VALUES ('4934', '331', '登陆', '127.0.0.1', '2011-04-27 11:51:30');
INSERT INTO `t_sys_log` VALUES ('4935', '307', '退出', '127.0.0.1', '2011-04-27 11:51:54');
INSERT INTO `t_sys_log` VALUES ('4936', '325', '登陆', '127.0.0.1', '2011-04-27 11:52:05');
INSERT INTO `t_sys_log` VALUES ('4937', '325', '退出', '127.0.0.1', '2011-04-27 11:52:27');
INSERT INTO `t_sys_log` VALUES ('4938', '327', '登陆', '127.0.0.1', '2011-04-27 11:52:35');
INSERT INTO `t_sys_log` VALUES ('4939', '327', '退出', '127.0.0.1', '2011-04-27 11:52:54');
INSERT INTO `t_sys_log` VALUES ('4940', '331', '登陆', '127.0.0.1', '2011-04-27 11:52:59');
INSERT INTO `t_sys_log` VALUES ('4941', '331', '退出', '127.0.0.1', '2011-04-27 11:53:22');
INSERT INTO `t_sys_log` VALUES ('4942', '327', '登陆', '127.0.0.1', '2011-04-27 11:53:30');
INSERT INTO `t_sys_log` VALUES ('4943', '331', '登陆', '127.0.0.1', '2011-04-27 11:54:21');
INSERT INTO `t_sys_log` VALUES ('4944', '328', '登陆', '127.0.0.1', '2011-04-27 11:55:40');
INSERT INTO `t_sys_log` VALUES ('4945', '328', '退出', '127.0.0.1', '2011-04-27 11:55:44');
INSERT INTO `t_sys_log` VALUES ('4946', '332', '登陆', '127.0.0.1', '2011-04-27 11:55:57');
INSERT INTO `t_sys_log` VALUES ('4947', '332', '登陆', '127.0.0.1', '2011-04-27 11:56:12');
INSERT INTO `t_sys_log` VALUES ('4948', '332', '退出', '127.0.0.1', '2011-04-27 11:56:27');
INSERT INTO `t_sys_log` VALUES ('4949', '331', '登陆', '127.0.0.1', '2011-04-27 11:56:53');
INSERT INTO `t_sys_log` VALUES ('4950', '331', '退出', '127.0.0.1', '2011-04-27 11:57:15');
INSERT INTO `t_sys_log` VALUES ('4951', '333', '登陆', '127.0.0.1', '2011-04-27 11:57:26');
INSERT INTO `t_sys_log` VALUES ('4952', '333', '退出', '127.0.0.1', '2011-04-27 11:57:43');
INSERT INTO `t_sys_log` VALUES ('4953', '334', '登陆', '127.0.0.1', '2011-04-27 11:57:50');
INSERT INTO `t_sys_log` VALUES ('4954', '334', '退出', '127.0.0.1', '2011-04-27 11:58:01');
INSERT INTO `t_sys_log` VALUES ('4955', '308', '登陆', '127.0.0.1', '2011-04-27 11:58:09');
INSERT INTO `t_sys_log` VALUES ('4956', '308', '登陆', '127.0.0.1', '2011-04-27 11:58:24');
INSERT INTO `t_sys_log` VALUES ('4957', '308', '退出', '127.0.0.1', '2011-04-27 11:58:33');
INSERT INTO `t_sys_log` VALUES ('4958', '331', '登陆', '127.0.0.1', '2011-04-27 11:58:40');
INSERT INTO `t_sys_log` VALUES ('4959', '331', '退出', '127.0.0.1', '2011-04-27 11:58:56');
INSERT INTO `t_sys_log` VALUES ('4960', '308', '登陆', '127.0.0.1', '2011-04-27 11:59:16');
INSERT INTO `t_sys_log` VALUES ('4961', '308', '退出', '127.0.0.1', '2011-04-27 11:59:36');
INSERT INTO `t_sys_log` VALUES ('4962', '331', '登陆', '127.0.0.1', '2011-04-27 11:59:42');
INSERT INTO `t_sys_log` VALUES ('4963', '331', '退出', '127.0.0.1', '2011-04-27 12:00:53');
INSERT INTO `t_sys_log` VALUES ('4964', '324', '登陆', '127.0.0.1', '2011-04-27 12:01:10');
INSERT INTO `t_sys_log` VALUES ('4965', '324', '退出', '127.0.0.1', '2011-04-27 12:02:05');
INSERT INTO `t_sys_log` VALUES ('4966', '335', '退出', '127.0.0.1', '2011-04-27 12:02:47');
INSERT INTO `t_sys_log` VALUES ('4967', '331', '登陆', '127.0.0.1', '2011-04-27 12:02:55');
INSERT INTO `t_sys_log` VALUES ('4968', '331', '退出', '127.0.0.1', '2011-04-27 12:03:46');
INSERT INTO `t_sys_log` VALUES ('4969', '335', '登陆', '127.0.0.1', '2011-04-27 12:04:02');
INSERT INTO `t_sys_log` VALUES ('4970', '335', '退出', '127.0.0.1', '2011-04-27 12:04:17');
INSERT INTO `t_sys_log` VALUES ('4971', '331', '登陆', '127.0.0.1', '2011-04-27 12:04:25');
INSERT INTO `t_sys_log` VALUES ('4972', '331', '退出', '127.0.0.1', '2011-04-27 12:05:30');
INSERT INTO `t_sys_log` VALUES ('4973', '335', '登陆', '127.0.0.1', '2011-04-27 12:05:37');
INSERT INTO `t_sys_log` VALUES ('4974', '335', '退出', '127.0.0.1', '2011-04-27 12:06:25');
INSERT INTO `t_sys_log` VALUES ('4975', '331', '登陆', '127.0.0.1', '2011-04-27 12:06:33');
INSERT INTO `t_sys_log` VALUES ('4976', '331', '退出', '127.0.0.1', '2011-04-27 12:24:05');
INSERT INTO `t_sys_log` VALUES ('4977', '308', '登陆', '127.0.0.1', '2011-04-27 12:24:15');
INSERT INTO `t_sys_log` VALUES ('4978', '307', '登陆', '127.0.0.1', '2011-04-27 14:48:26');
INSERT INTO `t_sys_log` VALUES ('4979', '302', '登陆', '127.0.0.1', '2011-04-29 14:44:18');
INSERT INTO `t_sys_log` VALUES ('4980', '302', '登陆', '127.0.0.1', '2011-04-29 16:16:14');
INSERT INTO `t_sys_log` VALUES ('4981', '302', '登陆', '127.0.0.1', '2011-04-29 16:32:38');
INSERT INTO `t_sys_log` VALUES ('4982', '302', '退出', '127.0.0.1', '2011-04-29 16:36:05');
INSERT INTO `t_sys_log` VALUES ('4983', '302', '登陆', '127.0.0.1', '2011-04-29 16:37:18');
INSERT INTO `t_sys_log` VALUES ('4984', '325', '登陆', '127.0.0.1', '2011-04-29 16:39:50');
INSERT INTO `t_sys_log` VALUES ('4985', '325', '退出', '127.0.0.1', '2011-04-29 16:40:33');
INSERT INTO `t_sys_log` VALUES ('4986', '331', '登陆', '127.0.0.1', '2011-04-29 16:40:42');
INSERT INTO `t_sys_log` VALUES ('4987', '331', '退出', '127.0.0.1', '2011-04-29 16:42:15');
INSERT INTO `t_sys_log` VALUES ('4988', '331', '登陆', '127.0.0.1', '2011-04-29 16:42:44');
INSERT INTO `t_sys_log` VALUES ('4989', '331', '退出', '127.0.0.1', '2011-04-29 16:43:40');
INSERT INTO `t_sys_log` VALUES ('4990', '327', '登陆', '127.0.0.1', '2011-04-29 16:43:51');
INSERT INTO `t_sys_log` VALUES ('4991', '327', '退出', '127.0.0.1', '2011-04-29 16:44:36');
INSERT INTO `t_sys_log` VALUES ('4992', '331', '登陆', '127.0.0.1', '2011-04-29 16:44:44');
INSERT INTO `t_sys_log` VALUES ('4993', '331', '退出', '127.0.0.1', '2011-04-29 16:45:17');
INSERT INTO `t_sys_log` VALUES ('4994', '327', '登陆', '127.0.0.1', '2011-04-29 16:45:30');
INSERT INTO `t_sys_log` VALUES ('4995', '327', '退出', '127.0.0.1', '2011-04-29 16:47:59');
INSERT INTO `t_sys_log` VALUES ('4996', '331', '登陆', '127.0.0.1', '2011-04-29 16:48:08');
INSERT INTO `t_sys_log` VALUES ('4997', '302', '登陆', '127.0.0.1', '2011-04-29 18:20:34');
INSERT INTO `t_sys_log` VALUES ('4998', '336', '登陆', '127.0.0.1', '2011-05-03 11:31:09');
INSERT INTO `t_sys_log` VALUES ('4999', '331', '登陆', '127.0.0.1', '2011-05-03 12:12:01');
INSERT INTO `t_sys_log` VALUES ('5000', '336', '登陆', '127.0.0.1', '2011-05-03 14:41:24');
INSERT INTO `t_sys_log` VALUES ('5001', '336', '登陆', '127.0.0.1', '2011-05-03 15:39:39');
INSERT INTO `t_sys_log` VALUES ('5002', '331', '登陆', '127.0.0.1', '2011-05-03 17:22:20');
INSERT INTO `t_sys_log` VALUES ('5003', '331', '退出', '127.0.0.1', '2011-05-03 17:23:18');
INSERT INTO `t_sys_log` VALUES ('5004', '332', '登陆', '127.0.0.1', '2011-05-03 17:23:26');
INSERT INTO `t_sys_log` VALUES ('5005', '331', '登陆', '127.0.0.1', '2011-05-03 17:25:29');
INSERT INTO `t_sys_log` VALUES ('5006', '332', '退出', '127.0.0.1', '2011-05-03 17:36:14');
INSERT INTO `t_sys_log` VALUES ('5007', '303', '登陆', '127.0.0.1', '2011-05-03 17:36:22');
INSERT INTO `t_sys_log` VALUES ('5008', '336', '登陆', '127.0.0.1', '2011-05-03 18:00:02');
INSERT INTO `t_sys_log` VALUES ('5009', '336', '退出', '127.0.0.1', '2011-05-03 18:00:14');
INSERT INTO `t_sys_log` VALUES ('5010', '337', '登陆', '127.0.0.1', '2011-05-03 18:01:55');
INSERT INTO `t_sys_log` VALUES ('5011', '337', '登陆', '127.0.0.1', '2011-05-03 18:05:02');
INSERT INTO `t_sys_log` VALUES ('5012', '337', '退出', '127.0.0.1', '2011-05-03 18:07:32');
INSERT INTO `t_sys_log` VALUES ('5013', '316', '登陆', '127.0.0.1', '2011-05-03 18:07:45');
INSERT INTO `t_sys_log` VALUES ('5014', '316', '退出', '127.0.0.1', '2011-05-03 18:08:06');
INSERT INTO `t_sys_log` VALUES ('5015', '336', '登陆', '127.0.0.1', '2011-05-03 18:08:15');
INSERT INTO `t_sys_log` VALUES ('5016', '338', '登陆', '127.0.0.1', '2011-05-03 18:13:49');
INSERT INTO `t_sys_log` VALUES ('5017', '336', '退出', '127.0.0.1', '2011-05-03 18:14:39');
INSERT INTO `t_sys_log` VALUES ('5018', '336', '登陆', '127.0.0.1', '2011-05-03 18:14:49');
INSERT INTO `t_sys_log` VALUES ('5019', '331', '登陆', '127.0.0.1', '2011-05-03 18:51:48');
INSERT INTO `t_sys_log` VALUES ('5020', '331', '退出', '127.0.0.1', '2011-05-03 18:51:55');
INSERT INTO `t_sys_log` VALUES ('5021', '302', '登陆', '127.0.0.1', '2011-05-03 18:52:12');
INSERT INTO `t_sys_log` VALUES ('5022', '302', '退出', '127.0.0.1', '2011-05-03 18:52:29');
INSERT INTO `t_sys_log` VALUES ('5023', '331', '登陆', '127.0.0.1', '2011-05-03 18:52:37');
INSERT INTO `t_sys_log` VALUES ('5024', '331', '登陆', '127.0.0.1', '2011-05-03 18:56:43');
INSERT INTO `t_sys_log` VALUES ('5025', '338', '登陆', '127.0.0.1', '2011-05-03 19:00:44');
INSERT INTO `t_sys_log` VALUES ('5026', '338', '登陆', '127.0.0.1', '2011-05-03 19:03:19');
INSERT INTO `t_sys_log` VALUES ('5027', '338', '退出', '127.0.0.1', '2011-05-03 19:03:47');
INSERT INTO `t_sys_log` VALUES ('5028', '336', '登陆', '127.0.0.1', '2011-05-03 19:05:18');
INSERT INTO `t_sys_log` VALUES ('5029', '331', '登陆', '127.0.0.1', '2011-05-03 19:58:42');
INSERT INTO `t_sys_log` VALUES ('5030', '327', '登陆', '127.0.0.1', '2011-05-03 20:22:38');
INSERT INTO `t_sys_log` VALUES ('5031', '327', '退出', '127.0.0.1', '2011-05-03 20:22:50');
INSERT INTO `t_sys_log` VALUES ('5032', '331', '登陆', '127.0.0.1', '2011-05-03 20:22:57');
INSERT INTO `t_sys_log` VALUES ('5033', '303', '登陆', '127.0.0.1', '2011-05-04 10:12:53');
INSERT INTO `t_sys_log` VALUES ('5034', '336', '登陆', '127.0.0.1', '2011-05-04 10:18:20');
INSERT INTO `t_sys_log` VALUES ('5035', '338', '登陆', '127.0.0.1', '2011-05-04 10:34:05');
INSERT INTO `t_sys_log` VALUES ('5036', '331', '登陆', '127.0.0.1', '2011-05-04 10:47:11');
INSERT INTO `t_sys_log` VALUES ('5037', '331', '退出', '127.0.0.1', '2011-05-04 10:49:00');
INSERT INTO `t_sys_log` VALUES ('5038', '331', '登陆', '127.0.0.1', '2011-05-04 10:49:07');
INSERT INTO `t_sys_log` VALUES ('5039', '331', '登陆', '127.0.0.1', '2011-05-04 10:49:51');
INSERT INTO `t_sys_log` VALUES ('5040', '331', '登陆', '127.0.0.1', '2011-05-04 10:50:11');
INSERT INTO `t_sys_log` VALUES ('5041', '338', '登陆', '127.0.0.1', '2011-05-04 11:08:16');
INSERT INTO `t_sys_log` VALUES ('5042', '331', '登陆', '127.0.0.1', '2011-05-04 11:55:28');
INSERT INTO `t_sys_log` VALUES ('5043', '331', '登陆', '127.0.0.1', '2011-05-04 11:55:56');
INSERT INTO `t_sys_log` VALUES ('5044', '331', '退出', '127.0.0.1', '2011-05-04 11:58:22');
INSERT INTO `t_sys_log` VALUES ('5045', '331', '登陆', '127.0.0.1', '2011-05-04 11:58:30');
INSERT INTO `t_sys_log` VALUES ('5046', '331', '退出', '127.0.0.1', '2011-05-04 11:59:50');
INSERT INTO `t_sys_log` VALUES ('5047', '307', '登陆', '127.0.0.1', '2011-05-04 12:00:13');
INSERT INTO `t_sys_log` VALUES ('5048', '331', '退出', '127.0.0.1', '2011-05-04 12:00:47');
INSERT INTO `t_sys_log` VALUES ('5049', '307', '登陆', '127.0.0.1', '2011-05-04 12:00:54');
INSERT INTO `t_sys_log` VALUES ('5050', '307', '退出', '127.0.0.1', '2011-05-04 12:01:16');
INSERT INTO `t_sys_log` VALUES ('5051', '331', '登陆', '127.0.0.1', '2011-05-04 12:01:30');
INSERT INTO `t_sys_log` VALUES ('5052', '331', '退出', '127.0.0.1', '2011-05-04 12:02:39');
INSERT INTO `t_sys_log` VALUES ('5053', '307', '登陆', '127.0.0.1', '2011-05-04 12:02:47');
INSERT INTO `t_sys_log` VALUES ('5054', '307', '退出', '127.0.0.1', '2011-05-04 12:03:12');
INSERT INTO `t_sys_log` VALUES ('5055', '339', '退出', '127.0.0.1', '2011-05-04 12:04:34');
INSERT INTO `t_sys_log` VALUES ('5056', '339', '登陆', '127.0.0.1', '2011-05-04 12:04:43');
INSERT INTO `t_sys_log` VALUES ('5057', '339', '退出', '127.0.0.1', '2011-05-04 12:04:51');
INSERT INTO `t_sys_log` VALUES ('5058', '331', '登陆', '127.0.0.1', '2011-05-04 12:05:05');
INSERT INTO `t_sys_log` VALUES ('5059', '331', '退出', '127.0.0.1', '2011-05-04 12:05:34');
INSERT INTO `t_sys_log` VALUES ('5060', '339', '登陆', '127.0.0.1', '2011-05-04 12:05:54');
INSERT INTO `t_sys_log` VALUES ('5061', '339', '退出', '127.0.0.1', '2011-05-04 12:06:25');
INSERT INTO `t_sys_log` VALUES ('5062', '331', '登陆', '127.0.0.1', '2011-05-04 12:06:42');
INSERT INTO `t_sys_log` VALUES ('5063', '336', '登陆', '127.0.0.1', '2011-05-04 12:07:24');
INSERT INTO `t_sys_log` VALUES ('5064', '331', '退出', '127.0.0.1', '2011-05-04 12:08:18');
INSERT INTO `t_sys_log` VALUES ('5065', '339', '登陆', '127.0.0.1', '2011-05-04 12:08:31');
INSERT INTO `t_sys_log` VALUES ('5066', '339', '退出', '127.0.0.1', '2011-05-04 12:09:24');
INSERT INTO `t_sys_log` VALUES ('5067', '336', '登陆', '127.0.0.1', '2011-05-04 12:09:45');
INSERT INTO `t_sys_log` VALUES ('5068', '336', '退出', '127.0.0.1', '2011-05-04 12:13:14');
INSERT INTO `t_sys_log` VALUES ('5069', '331', '登陆', '127.0.0.1', '2011-05-04 12:13:21');
INSERT INTO `t_sys_log` VALUES ('5070', '331', '退出', '127.0.0.1', '2011-05-04 12:14:15');
INSERT INTO `t_sys_log` VALUES ('5071', '334', '登陆', '127.0.0.1', '2011-05-04 12:14:24');
INSERT INTO `t_sys_log` VALUES ('5072', '334', '退出', '127.0.0.1', '2011-05-04 12:15:06');
INSERT INTO `t_sys_log` VALUES ('5073', '331', '登陆', '127.0.0.1', '2011-05-04 12:15:24');
INSERT INTO `t_sys_log` VALUES ('5074', '331', '退出', '127.0.0.1', '2011-05-04 12:16:12');
INSERT INTO `t_sys_log` VALUES ('5075', '339', '登陆', '127.0.0.1', '2011-05-04 12:16:21');
INSERT INTO `t_sys_log` VALUES ('5076', '339', '退出', '127.0.0.1', '2011-05-04 12:16:32');
INSERT INTO `t_sys_log` VALUES ('5077', '331', '登陆', '127.0.0.1', '2011-05-04 12:16:40');
INSERT INTO `t_sys_log` VALUES ('5078', '331', '退出', '127.0.0.1', '2011-05-04 12:16:48');
INSERT INTO `t_sys_log` VALUES ('5079', '333', '登陆', '127.0.0.1', '2011-05-04 12:16:55');
INSERT INTO `t_sys_log` VALUES ('5080', '333', '退出', '127.0.0.1', '2011-05-04 12:17:15');
INSERT INTO `t_sys_log` VALUES ('5081', '331', '登陆', '127.0.0.1', '2011-05-04 12:17:23');
INSERT INTO `t_sys_log` VALUES ('5082', '331', '退出', '127.0.0.1', '2011-05-04 12:18:32');
INSERT INTO `t_sys_log` VALUES ('5083', '332', '登陆', '127.0.0.1', '2011-05-04 12:18:42');
INSERT INTO `t_sys_log` VALUES ('5084', '332', '退出', '127.0.0.1', '2011-05-04 12:19:09');
INSERT INTO `t_sys_log` VALUES ('5085', '331', '登陆', '127.0.0.1', '2011-05-04 12:19:15');
INSERT INTO `t_sys_log` VALUES ('5086', '329', '登陆', '127.0.0.1', '2011-05-04 12:20:26');
INSERT INTO `t_sys_log` VALUES ('5087', '329', '登陆', '127.0.0.1', '2011-05-04 12:20:56');
INSERT INTO `t_sys_log` VALUES ('5088', '329', '退出', '127.0.0.1', '2011-05-04 12:21:08');
INSERT INTO `t_sys_log` VALUES ('5089', '331', '登陆', '127.0.0.1', '2011-05-04 12:21:15');
INSERT INTO `t_sys_log` VALUES ('5090', '331', '退出', '127.0.0.1', '2011-05-04 12:21:30');
INSERT INTO `t_sys_log` VALUES ('5091', '328', '登陆', '127.0.0.1', '2011-05-04 12:21:42');
INSERT INTO `t_sys_log` VALUES ('5092', '328', '退出', '127.0.0.1', '2011-05-04 12:21:46');
INSERT INTO `t_sys_log` VALUES ('5093', '327', '登陆', '127.0.0.1', '2011-05-04 12:21:57');
INSERT INTO `t_sys_log` VALUES ('5094', '327', '退出', '127.0.0.1', '2011-05-04 12:22:19');
INSERT INTO `t_sys_log` VALUES ('5095', '327', '登陆', '127.0.0.1', '2011-05-04 12:23:05');
INSERT INTO `t_sys_log` VALUES ('5096', '327', '登陆', '127.0.0.1', '2011-05-04 12:23:18');
INSERT INTO `t_sys_log` VALUES ('5097', '327', '退出', '127.0.0.1', '2011-05-04 12:23:34');
INSERT INTO `t_sys_log` VALUES ('5098', '331', '登陆', '127.0.0.1', '2011-05-04 12:24:00');
INSERT INTO `t_sys_log` VALUES ('5099', '331', '登陆', '127.0.0.1', '2011-05-04 14:31:32');
INSERT INTO `t_sys_log` VALUES ('5100', '303', '登陆', '127.0.0.1', '2011-05-04 14:32:22');
INSERT INTO `t_sys_log` VALUES ('5101', '303', '登陆', '127.0.0.1', '2011-05-04 14:32:40');
INSERT INTO `t_sys_log` VALUES ('5102', '303', '退出', '127.0.0.1', '2011-05-04 14:33:16');
INSERT INTO `t_sys_log` VALUES ('5103', '307', '登陆', '127.0.0.1', '2011-05-04 14:33:24');
INSERT INTO `t_sys_log` VALUES ('5104', '307', '退出', '127.0.0.1', '2011-05-04 14:34:32');
INSERT INTO `t_sys_log` VALUES ('5105', '308', '登陆', '127.0.0.1', '2011-05-04 14:34:42');
INSERT INTO `t_sys_log` VALUES ('5106', '308', '退出', '127.0.0.1', '2011-05-04 14:35:29');
INSERT INTO `t_sys_log` VALUES ('5107', '310', '登陆', '127.0.0.1', '2011-05-04 14:35:36');
INSERT INTO `t_sys_log` VALUES ('5108', '331', '退出', '127.0.0.1', '2011-05-04 14:36:02');
INSERT INTO `t_sys_log` VALUES ('5109', '331', '登陆', '127.0.0.1', '2011-05-04 14:36:20');
INSERT INTO `t_sys_log` VALUES ('5110', '307', '登陆', '127.0.0.1', '2011-05-04 14:37:20');
INSERT INTO `t_sys_log` VALUES ('5111', '307', '退出', '127.0.0.1', '2011-05-04 14:52:43');
INSERT INTO `t_sys_log` VALUES ('5112', '340', '退出', '127.0.0.1', '2011-05-04 14:59:49');
INSERT INTO `t_sys_log` VALUES ('5113', '336', '登陆', '127.0.0.1', '2011-05-04 15:00:25');
INSERT INTO `t_sys_log` VALUES ('5114', '310', '登陆', '127.0.0.1', '2011-05-04 15:06:51');
INSERT INTO `t_sys_log` VALUES ('5115', '310', '登陆', '127.0.0.1', '2011-05-04 15:07:02');
INSERT INTO `t_sys_log` VALUES ('5116', '310', '退出', '127.0.0.1', '2011-05-04 15:07:25');
INSERT INTO `t_sys_log` VALUES ('5117', '331', '登陆', '127.0.0.1', '2011-05-04 15:07:32');
INSERT INTO `t_sys_log` VALUES ('5118', '331', '退出', '127.0.0.1', '2011-05-04 15:08:38');
INSERT INTO `t_sys_log` VALUES ('5119', '323', '登陆', '127.0.0.1', '2011-05-04 15:08:50');
INSERT INTO `t_sys_log` VALUES ('5120', '323', '退出', '127.0.0.1', '2011-05-04 15:09:06');
INSERT INTO `t_sys_log` VALUES ('5121', '331', '登陆', '127.0.0.1', '2011-05-04 15:09:15');
INSERT INTO `t_sys_log` VALUES ('5122', '331', '退出', '127.0.0.1', '2011-05-04 15:09:32');
INSERT INTO `t_sys_log` VALUES ('5123', '341', '退出', '127.0.0.1', '2011-05-04 15:10:38');
INSERT INTO `t_sys_log` VALUES ('5124', '331', '登陆', '127.0.0.1', '2011-05-04 15:10:46');
INSERT INTO `t_sys_log` VALUES ('5125', '331', '登陆', '127.0.0.1', '2011-05-04 15:15:30');
INSERT INTO `t_sys_log` VALUES ('5126', '331', '退出', '127.0.0.1', '2011-05-04 15:25:57');
INSERT INTO `t_sys_log` VALUES ('5127', '302', '登陆', '127.0.0.1', '2011-05-04 15:26:12');
INSERT INTO `t_sys_log` VALUES ('5128', '336', '登陆', '127.0.0.1', '2011-05-04 15:49:48');
INSERT INTO `t_sys_log` VALUES ('5129', '307', '登陆', '127.0.0.1', '2011-05-04 15:53:41');
INSERT INTO `t_sys_log` VALUES ('5130', '307', '退出', '127.0.0.1', '2011-05-04 15:54:18');
INSERT INTO `t_sys_log` VALUES ('5131', '307', '登陆', '127.0.0.1', '2011-05-04 15:54:25');
INSERT INTO `t_sys_log` VALUES ('5132', '334', '登陆', '127.0.0.1', '2011-05-04 15:55:07');
INSERT INTO `t_sys_log` VALUES ('5133', '334', '退出', '127.0.0.1', '2011-05-04 15:55:56');
INSERT INTO `t_sys_log` VALUES ('5134', '331', '登陆', '127.0.0.1', '2011-05-04 15:56:05');
INSERT INTO `t_sys_log` VALUES ('5135', '331', '登陆', '127.0.0.1', '2011-05-04 15:58:29');
INSERT INTO `t_sys_log` VALUES ('5136', '331', '退出', '127.0.0.1', '2011-05-04 16:00:51');
INSERT INTO `t_sys_log` VALUES ('5137', '341', '登陆', '127.0.0.1', '2011-05-04 16:01:01');
INSERT INTO `t_sys_log` VALUES ('5138', '302', '登陆', '127.0.0.1', '2011-05-04 16:28:05');
INSERT INTO `t_sys_log` VALUES ('5139', '302', '退出', '127.0.0.1', '2011-05-04 16:33:46');
INSERT INTO `t_sys_log` VALUES ('5140', '302', '登陆', '127.0.0.1', '2011-05-04 16:34:26');
INSERT INTO `t_sys_log` VALUES ('5141', '302', '登陆', '127.0.0.1', '2011-05-04 17:00:45');
INSERT INTO `t_sys_log` VALUES ('5142', '331', '登陆', '127.0.0.1', '2011-05-04 17:31:26');
INSERT INTO `t_sys_log` VALUES ('5143', '331', '登陆', '127.0.0.1', '2011-05-04 18:29:02');
INSERT INTO `t_sys_log` VALUES ('5144', '336', '登陆', '127.0.0.1', '2011-05-04 19:25:10');
INSERT INTO `t_sys_log` VALUES ('5145', '331', '退出', '127.0.0.1', '2011-05-04 19:55:21');
INSERT INTO `t_sys_log` VALUES ('5146', '302', '登陆', '127.0.0.1', '2011-05-04 20:01:00');
INSERT INTO `t_sys_log` VALUES ('5147', '340', '登陆', '127.0.0.1', '2011-05-05 10:48:27');
INSERT INTO `t_sys_log` VALUES ('5148', '331', '登陆', '127.0.0.1', '2011-05-06 09:54:02');
INSERT INTO `t_sys_log` VALUES ('5149', '331', '登陆', '127.0.0.1', '2011-05-06 11:13:22');
INSERT INTO `t_sys_log` VALUES ('5150', '302', '登陆', '127.0.0.1', '2011-05-06 11:25:26');
INSERT INTO `t_sys_log` VALUES ('5151', '302', '登陆', '127.0.0.1', '2011-05-06 11:25:43');
INSERT INTO `t_sys_log` VALUES ('5152', '302', '退出', '127.0.0.1', '2011-05-06 11:26:15');
INSERT INTO `t_sys_log` VALUES ('5153', '323', '登陆', '127.0.0.1', '2011-05-06 11:26:32');
INSERT INTO `t_sys_log` VALUES ('5154', '323', '退出', '127.0.0.1', '2011-05-06 11:40:59');
INSERT INTO `t_sys_log` VALUES ('5155', '342', '登陆', '127.0.0.1', '2011-05-06 11:42:06');
INSERT INTO `t_sys_log` VALUES ('5156', '342', '退出', '127.0.0.1', '2011-05-06 11:42:38');
INSERT INTO `t_sys_log` VALUES ('5157', '336', '登陆', '127.0.0.1', '2011-05-06 11:42:49');
INSERT INTO `t_sys_log` VALUES ('5158', '336', '退出', '127.0.0.1', '2011-05-06 11:43:40');
INSERT INTO `t_sys_log` VALUES ('5159', '343', '登陆', '127.0.0.1', '2011-05-06 11:43:55');
INSERT INTO `t_sys_log` VALUES ('5160', '343', '退出', '127.0.0.1', '2011-05-06 11:44:05');
INSERT INTO `t_sys_log` VALUES ('5161', '331', '登陆', '127.0.0.1', '2011-05-06 11:44:22');
INSERT INTO `t_sys_log` VALUES ('5162', '331', '退出', '127.0.0.1', '2011-05-06 11:44:52');
INSERT INTO `t_sys_log` VALUES ('5163', '344', '退出', '127.0.0.1', '2011-05-06 11:45:58');
INSERT INTO `t_sys_log` VALUES ('5164', '331', '登陆', '127.0.0.1', '2011-05-06 11:46:08');
INSERT INTO `t_sys_log` VALUES ('5165', '345', '登陆', '127.0.0.1', '2011-05-06 11:47:11');
INSERT INTO `t_sys_log` VALUES ('5166', '336', '登陆', '127.0.0.1', '2011-05-06 11:48:37');
INSERT INTO `t_sys_log` VALUES ('5167', '345', '退出', '127.0.0.1', '2011-05-06 11:53:22');
INSERT INTO `t_sys_log` VALUES ('5168', '315', '登陆', '127.0.0.1', '2011-05-06 11:53:32');
INSERT INTO `t_sys_log` VALUES ('5169', '331', '登陆', '127.0.0.1', '2011-05-06 11:54:31');
INSERT INTO `t_sys_log` VALUES ('5170', '336', '登陆', '127.0.0.1', '2011-05-06 11:55:07');
INSERT INTO `t_sys_log` VALUES ('5171', '336', '登陆', '127.0.0.1', '2011-05-06 12:04:36');
INSERT INTO `t_sys_log` VALUES ('5172', '347', '登陆', '127.0.0.1', '2011-05-06 14:49:00');
INSERT INTO `t_sys_log` VALUES ('5173', '346', '登陆', '127.0.0.1', '2011-05-06 14:49:15');
INSERT INTO `t_sys_log` VALUES ('5174', '346', '登陆', '127.0.0.1', '2011-05-06 15:17:34');
INSERT INTO `t_sys_log` VALUES ('5175', '347', '登陆', '127.0.0.1', '2011-05-06 15:17:43');
INSERT INTO `t_sys_log` VALUES ('5176', '347', '登陆', '127.0.0.1', '2011-05-06 15:18:07');
INSERT INTO `t_sys_log` VALUES ('5177', '347', '退出', '127.0.0.1', '2011-05-06 15:18:27');
INSERT INTO `t_sys_log` VALUES ('5178', '336', '登陆', '127.0.0.1', '2011-05-06 15:18:41');
INSERT INTO `t_sys_log` VALUES ('5179', '302', '登陆', '127.0.0.1', '2011-05-06 15:38:49');
INSERT INTO `t_sys_log` VALUES ('5180', '331', '登陆', '127.0.0.1', '2011-05-06 15:39:12');
INSERT INTO `t_sys_log` VALUES ('5181', '331', '退出', '127.0.0.1', '2011-05-06 15:39:53');
INSERT INTO `t_sys_log` VALUES ('5182', '331', '登陆', '127.0.0.1', '2011-05-06 15:40:15');
INSERT INTO `t_sys_log` VALUES ('5183', '332', '登陆', '127.0.0.1', '2011-05-06 15:40:51');
INSERT INTO `t_sys_log` VALUES ('5184', '332', '退出', '127.0.0.1', '2011-05-06 15:41:10');
INSERT INTO `t_sys_log` VALUES ('5185', '331', '登陆', '127.0.0.1', '2011-05-06 15:41:30');
INSERT INTO `t_sys_log` VALUES ('5186', '331', '退出', '127.0.0.1', '2011-05-06 15:41:47');
INSERT INTO `t_sys_log` VALUES ('5187', '325', '登陆', '127.0.0.1', '2011-05-06 15:41:59');
INSERT INTO `t_sys_log` VALUES ('5188', '325', '退出', '127.0.0.1', '2011-05-06 15:42:18');
INSERT INTO `t_sys_log` VALUES ('5189', '331', '登陆', '127.0.0.1', '2011-05-06 15:42:24');
INSERT INTO `t_sys_log` VALUES ('5190', '336', '登陆', '127.0.0.1', '2011-05-06 18:40:32');
INSERT INTO `t_sys_log` VALUES ('5191', '336', '登陆', '127.0.0.1', '2011-05-07 09:38:39');
INSERT INTO `t_sys_log` VALUES ('5192', '336', '登陆', '127.0.0.1', '2011-05-07 09:43:32');
INSERT INTO `t_sys_log` VALUES ('5193', '331', '登陆', '127.0.0.1', '2011-05-07 11:17:27');
INSERT INTO `t_sys_log` VALUES ('5194', '331', '登陆', '127.0.0.1', '2011-05-09 10:49:11');
INSERT INTO `t_sys_log` VALUES ('5195', '303', '登陆', '127.0.0.1', '2011-05-09 10:49:29');
INSERT INTO `t_sys_log` VALUES ('5196', '303', '退出', '127.0.0.1', '2011-05-09 10:49:44');
INSERT INTO `t_sys_log` VALUES ('5197', '312', '登陆', '127.0.0.1', '2011-05-09 10:50:28');
INSERT INTO `t_sys_log` VALUES ('5198', '312', '登陆', '127.0.0.1', '2011-05-09 10:50:51');
INSERT INTO `t_sys_log` VALUES ('5199', '348', '退出', '127.0.0.1', '2011-05-09 10:52:15');
INSERT INTO `t_sys_log` VALUES ('5200', '348', '登陆', '127.0.0.1', '2011-05-09 10:52:33');
INSERT INTO `t_sys_log` VALUES ('5201', '331', '登陆', '127.0.0.1', '2011-05-09 10:55:39');
INSERT INTO `t_sys_log` VALUES ('5202', '331', '登陆', '127.0.0.1', '2011-05-09 10:56:14');
INSERT INTO `t_sys_log` VALUES ('5203', '331', '登陆', '127.0.0.1', '2011-05-09 10:57:10');
INSERT INTO `t_sys_log` VALUES ('5204', '331', '登陆', '127.0.0.1', '2011-05-09 12:24:58');
INSERT INTO `t_sys_log` VALUES ('5205', '331', '登陆', '127.0.0.1', '2011-05-09 12:26:45');
INSERT INTO `t_sys_log` VALUES ('5206', '331', '登陆', '127.0.0.1', '2011-05-09 12:54:34');
INSERT INTO `t_sys_log` VALUES ('5207', '331', '登陆', '127.0.0.1', '2011-05-09 14:59:17');
INSERT INTO `t_sys_log` VALUES ('5208', '331', '登陆', '127.0.0.1', '2011-05-09 15:05:18');
INSERT INTO `t_sys_log` VALUES ('5209', '331', '登陆', '127.0.0.1', '2011-05-09 15:10:41');
INSERT INTO `t_sys_log` VALUES ('5210', '310', '登陆', '127.0.0.1', '2011-05-09 15:11:38');
INSERT INTO `t_sys_log` VALUES ('5211', '310', '登陆', '127.0.0.1', '2011-05-09 15:12:17');
INSERT INTO `t_sys_log` VALUES ('5212', '310', '退出', '127.0.0.1', '2011-05-09 15:15:04');
INSERT INTO `t_sys_log` VALUES ('5213', '308', '登陆', '127.0.0.1', '2011-05-09 15:15:21');
INSERT INTO `t_sys_log` VALUES ('5214', '308', '退出', '127.0.0.1', '2011-05-09 15:15:52');
INSERT INTO `t_sys_log` VALUES ('5215', '323', '登陆', '127.0.0.1', '2011-05-09 15:16:02');
INSERT INTO `t_sys_log` VALUES ('5216', '331', '退出', '127.0.0.1', '2011-05-09 15:21:29');
INSERT INTO `t_sys_log` VALUES ('5217', '331', '登陆', '127.0.0.1', '2011-05-09 15:24:11');
INSERT INTO `t_sys_log` VALUES ('5218', '331', '登陆', '127.0.0.1', '2011-05-09 15:48:24');
INSERT INTO `t_sys_log` VALUES ('5219', '331', '登陆', '127.0.0.1', '2011-05-09 15:49:28');
INSERT INTO `t_sys_log` VALUES ('5220', '331', '登陆', '127.0.0.1', '2011-05-09 15:49:36');
INSERT INTO `t_sys_log` VALUES ('5221', '302', '登陆', '127.0.0.1', '2011-05-09 15:50:10');
INSERT INTO `t_sys_log` VALUES ('5222', '331', '登陆', '127.0.0.1', '2011-05-09 15:50:32');
INSERT INTO `t_sys_log` VALUES ('5223', '331', '退出', '127.0.0.1', '2011-05-09 15:50:59');
INSERT INTO `t_sys_log` VALUES ('5224', '302', '登陆', '127.0.0.1', '2011-05-09 15:51:08');
INSERT INTO `t_sys_log` VALUES ('5225', '331', '登陆', '127.0.0.1', '2011-05-09 15:53:42');
INSERT INTO `t_sys_log` VALUES ('5226', '323', '登陆', '127.0.0.1', '2011-05-09 15:54:12');
INSERT INTO `t_sys_log` VALUES ('5227', '332', '登陆', '127.0.0.1', '2011-05-09 16:25:22');
INSERT INTO `t_sys_log` VALUES ('5228', '331', '??', '127.0.0.1', '2011-07-15 17:33:21');
INSERT INTO `t_sys_log` VALUES ('5229', '331', '??', '127.0.0.1', '2011-07-15 17:43:48');
INSERT INTO `t_sys_log` VALUES ('5230', '331', '??', '127.0.0.1', '2011-07-15 17:45:06');
INSERT INTO `t_sys_log` VALUES ('5231', '331', '??', '127.0.0.1', '2011-07-16 09:34:26');
INSERT INTO `t_sys_log` VALUES ('5232', '331', '??', '127.0.0.1', '2011-07-19 09:02:31');
INSERT INTO `t_sys_log` VALUES ('5233', '297', '??', '127.0.0.1', '2011-07-19 09:04:02');
INSERT INTO `t_sys_log` VALUES ('5234', '297', '??', '127.0.0.1', '2011-07-19 09:20:22');
INSERT INTO `t_sys_log` VALUES ('5235', '297', '??', '127.0.0.1', '2011-07-19 09:33:46');
INSERT INTO `t_sys_log` VALUES ('5236', '297', '??', '127.0.0.1', '2011-07-19 10:35:02');
INSERT INTO `t_sys_log` VALUES ('5237', '297', '??', '127.0.0.1', '2011-07-19 11:55:11');
INSERT INTO `t_sys_log` VALUES ('5238', '297', '??', '127.0.0.1', '2011-07-19 12:30:23');
INSERT INTO `t_sys_log` VALUES ('5239', '297', '??', '127.0.0.1', '2011-07-19 14:06:53');
INSERT INTO `t_sys_log` VALUES ('5240', '297', '??', '127.0.0.1', '2011-07-19 14:14:40');
INSERT INTO `t_sys_log` VALUES ('5241', '297', '??', '127.0.0.1', '2011-07-19 14:28:08');
INSERT INTO `t_sys_log` VALUES ('5242', '297', '登陆', '127.0.0.1', '2011-07-19 14:33:09');
INSERT INTO `t_sys_log` VALUES ('5243', '331', '登陆', '192.168.1.239', '2011-07-19 15:32:04');
INSERT INTO `t_sys_log` VALUES ('5244', '331', '登陆', '192.168.1.239', '2011-07-19 15:45:23');
INSERT INTO `t_sys_log` VALUES ('5245', '331', '登陆', '192.168.1.239', '2011-07-19 15:48:42');
INSERT INTO `t_sys_log` VALUES ('5246', '349', '退出', '192.168.1.168', '2011-07-19 16:25:16');
INSERT INTO `t_sys_log` VALUES ('5247', '349', '登陆', '192.168.1.168', '2011-07-19 16:25:33');
INSERT INTO `t_sys_log` VALUES ('5248', '349', '退出', '192.168.1.168', '2011-07-19 16:26:46');
INSERT INTO `t_sys_log` VALUES ('5249', '331', '登陆', '127.0.0.1', '2011-07-19 19:14:21');
INSERT INTO `t_sys_log` VALUES ('5250', '297', '登陆', '127.0.0.1', '2011-07-20 08:40:30');
INSERT INTO `t_sys_log` VALUES ('5251', '297', '登陆', '127.0.0.1', '2011-07-20 09:08:26');
INSERT INTO `t_sys_log` VALUES ('5252', '331', '登陆', '127.0.0.1', '2011-07-20 09:09:34');
INSERT INTO `t_sys_log` VALUES ('5253', '332', '登陆', '127.0.0.1', '2011-07-20 11:14:38');
INSERT INTO `t_sys_log` VALUES ('5254', '332', '退出', '127.0.0.1', '2011-07-20 11:19:55');
INSERT INTO `t_sys_log` VALUES ('5255', '303', '登陆', '127.0.0.1', '2011-07-20 11:20:15');
INSERT INTO `t_sys_log` VALUES ('5256', '331', '登陆', '127.0.0.1', '2011-07-20 12:57:45');
INSERT INTO `t_sys_log` VALUES ('5257', '307', '登陆', '127.0.0.1', '2011-07-20 15:09:16');
INSERT INTO `t_sys_log` VALUES ('5258', '331', '登陆', '127.0.0.1', '2011-07-20 16:36:42');
INSERT INTO `t_sys_log` VALUES ('5259', '331', '登陆', '127.0.0.1', '2011-07-20 16:49:56');
INSERT INTO `t_sys_log` VALUES ('5260', '307', '退出', '127.0.0.1', '2011-07-20 17:09:22');
INSERT INTO `t_sys_log` VALUES ('5261', '343', '登陆', '127.0.0.1', '2011-07-20 17:09:39');
INSERT INTO `t_sys_log` VALUES ('5262', '343', '退出', '127.0.0.1', '2011-07-20 17:19:37');
INSERT INTO `t_sys_log` VALUES ('5263', '331', '退出', '127.0.0.1', '2011-07-20 17:27:20');
INSERT INTO `t_sys_log` VALUES ('5264', '352', '退出', '127.0.0.1', '2011-07-20 17:29:48');
INSERT INTO `t_sys_log` VALUES ('5265', '351', '退出', '127.0.0.1', '2011-07-20 17:29:57');
INSERT INTO `t_sys_log` VALUES ('5266', '352', '登陆', '127.0.0.1', '2011-07-20 17:30:10');
INSERT INTO `t_sys_log` VALUES ('5267', '331', '登陆', '127.0.0.1', '2011-07-20 17:30:29');
INSERT INTO `t_sys_log` VALUES ('5268', '331', '退出', '127.0.0.1', '2011-07-20 17:51:44');
INSERT INTO `t_sys_log` VALUES ('5269', '353', '退出', '127.0.0.1', '2011-07-20 17:52:46');
INSERT INTO `t_sys_log` VALUES ('5270', '354', '登陆', '127.0.0.1', '2011-07-20 17:55:32');
INSERT INTO `t_sys_log` VALUES ('5271', '354', '登陆', '127.0.0.1', '2011-07-20 17:56:30');
INSERT INTO `t_sys_log` VALUES ('5272', '354', '登陆', '127.0.0.1', '2011-07-20 17:56:45');
INSERT INTO `t_sys_log` VALUES ('5273', '354', '退出', '127.0.0.1', '2011-07-20 17:57:44');
INSERT INTO `t_sys_log` VALUES ('5274', '331', '登陆', '127.0.0.1', '2011-07-20 17:57:58');
INSERT INTO `t_sys_log` VALUES ('5275', '331', '退出', '127.0.0.1', '2011-07-20 17:59:56');
INSERT INTO `t_sys_log` VALUES ('5276', '303', '登陆', '127.0.0.1', '2011-07-20 18:00:08');
INSERT INTO `t_sys_log` VALUES ('5277', '303', '退出', '127.0.0.1', '2011-07-20 18:00:14');
INSERT INTO `t_sys_log` VALUES ('5278', '321', '登陆', '127.0.0.1', '2011-07-20 18:00:36');
INSERT INTO `t_sys_log` VALUES ('5279', '321', '退出', '127.0.0.1', '2011-07-20 18:01:55');
INSERT INTO `t_sys_log` VALUES ('5280', '331', '登陆', '127.0.0.1', '2011-07-20 18:02:10');
INSERT INTO `t_sys_log` VALUES ('5281', '352', '退出', '127.0.0.1', '2011-07-20 18:29:56');
INSERT INTO `t_sys_log` VALUES ('5282', '307', '登陆', '127.0.0.1', '2011-07-20 18:30:04');
INSERT INTO `t_sys_log` VALUES ('5283', '307', '退出', '127.0.0.1', '2011-07-20 18:43:58');
INSERT INTO `t_sys_log` VALUES ('5284', '303', '登陆', '127.0.0.1', '2011-07-20 18:44:10');
INSERT INTO `t_sys_log` VALUES ('5285', '303', '退出', '127.0.0.1', '2011-07-20 18:44:55');
INSERT INTO `t_sys_log` VALUES ('5286', '302', '登陆', '127.0.0.1', '2011-07-20 18:45:08');
INSERT INTO `t_sys_log` VALUES ('5287', '302', '退出', '127.0.0.1', '2011-07-20 18:45:15');
INSERT INTO `t_sys_log` VALUES ('5288', '310', '登陆', '127.0.0.1', '2011-07-20 18:45:28');
INSERT INTO `t_sys_log` VALUES ('5289', '310', '退出', '127.0.0.1', '2011-07-20 18:46:25');
INSERT INTO `t_sys_log` VALUES ('5290', '335', '登陆', '127.0.0.1', '2011-07-20 18:46:32');
INSERT INTO `t_sys_log` VALUES ('5291', '335', '退出', '127.0.0.1', '2011-07-20 18:46:39');
INSERT INTO `t_sys_log` VALUES ('5292', '303', '登陆', '127.0.0.1', '2011-07-20 18:46:46');
INSERT INTO `t_sys_log` VALUES ('5293', '297', '登陆', '127.0.0.1', '2011-07-20 18:50:20');
INSERT INTO `t_sys_log` VALUES ('5294', '297', '退出', '127.0.0.1', '2011-07-20 18:51:43');
INSERT INTO `t_sys_log` VALUES ('5295', '303', '登陆', '127.0.0.1', '2011-07-20 18:51:59');
INSERT INTO `t_sys_log` VALUES ('5296', '314', '登陆', '127.0.0.1', '2011-07-21 10:06:10');
INSERT INTO `t_sys_log` VALUES ('5297', '314', '退出', '127.0.0.1', '2011-07-21 10:28:01');
INSERT INTO `t_sys_log` VALUES ('5298', '331', '登陆', '127.0.0.1', '2011-07-21 10:28:12');
INSERT INTO `t_sys_log` VALUES ('5299', '303', '登陆', '127.0.0.1', '2011-07-21 11:39:35');
INSERT INTO `t_sys_log` VALUES ('5300', '331', '退出', '127.0.0.1', '2011-07-21 11:57:53');
INSERT INTO `t_sys_log` VALUES ('5301', '355', '退出', '127.0.0.1', '2011-07-21 12:01:41');
INSERT INTO `t_sys_log` VALUES ('5302', '356', '退出', '127.0.0.1', '2011-07-21 12:04:17');
INSERT INTO `t_sys_log` VALUES ('5303', '331', '登陆', '127.0.0.1', '2011-07-21 12:04:31');
INSERT INTO `t_sys_log` VALUES ('5304', '331', '退出', '127.0.0.1', '2011-07-21 12:10:53');
INSERT INTO `t_sys_log` VALUES ('5305', '302', '登陆', '127.0.0.1', '2011-07-21 12:11:04');
INSERT INTO `t_sys_log` VALUES ('5306', '303', '登陆', '127.0.0.1', '2011-07-21 14:48:33');
INSERT INTO `t_sys_log` VALUES ('5307', '302', '登陆', '127.0.0.1', '2011-07-21 14:52:01');
INSERT INTO `t_sys_log` VALUES ('5308', '331', '登陆', '127.0.0.1', '2011-07-21 15:55:50');
INSERT INTO `t_sys_log` VALUES ('5309', '331', '登陆', '127.0.0.1', '2011-07-21 16:17:58');
INSERT INTO `t_sys_log` VALUES ('5310', '331', '退出', '127.0.0.1', '2011-07-21 16:21:35');
INSERT INTO `t_sys_log` VALUES ('5311', '303', '登陆', '127.0.0.1', '2011-07-21 16:21:54');
INSERT INTO `t_sys_log` VALUES ('5312', '331', '登陆', '127.0.0.1', '2011-07-22 09:19:08');
INSERT INTO `t_sys_log` VALUES ('5313', '303', '登陆', '127.0.0.1', '2011-08-04 10:22:35');
INSERT INTO `t_sys_log` VALUES ('5314', '309', '登陆', '127.0.0.1', '2011-08-05 10:37:30');
INSERT INTO `t_sys_log` VALUES ('5315', '307', '登陆', '127.0.0.1', '2011-08-05 10:43:56');
INSERT INTO `t_sys_log` VALUES ('5316', '307', '登陆', '127.0.0.1', '2011-08-05 12:18:39');
INSERT INTO `t_sys_log` VALUES ('5317', '333', '登陆', '127.0.0.1', '2011-08-09 15:34:15');
INSERT INTO `t_sys_log` VALUES ('5318', '333', '退出', '127.0.0.1', '2011-08-09 15:34:27');
INSERT INTO `t_sys_log` VALUES ('5319', '326', '登陆', '127.0.0.1', '2011-08-09 15:34:49');
INSERT INTO `t_sys_log` VALUES ('5320', '326', '退出', '127.0.0.1', '2011-08-09 15:40:31');
INSERT INTO `t_sys_log` VALUES ('5321', '307', '登陆', '127.0.0.1', '2011-08-09 15:40:50');
INSERT INTO `t_sys_log` VALUES ('5322', '333', '登陆', '127.0.0.1', '2011-08-16 14:46:22');
INSERT INTO `t_sys_log` VALUES ('5323', '332', '登陆', '127.0.0.1', '2011-08-16 17:08:59');
INSERT INTO `t_sys_log` VALUES ('5324', '332', '退出', '127.0.0.1', '2011-08-16 17:10:31');
INSERT INTO `t_sys_log` VALUES ('5325', '331', '登陆', '127.0.0.1', '2011-08-16 17:10:46');
INSERT INTO `t_sys_log` VALUES ('5326', '353', '登陆', '127.0.0.1', '2011-08-20 11:29:22');
INSERT INTO `t_sys_log` VALUES ('5327', '353', '退出', '127.0.0.1', '2011-08-20 11:29:30');
INSERT INTO `t_sys_log` VALUES ('5328', '331', '登陆', '127.0.0.1', '2011-08-20 11:29:41');
INSERT INTO `t_sys_log` VALUES ('5329', '331', '退出', '127.0.0.1', '2011-08-20 11:41:54');
INSERT INTO `t_sys_log` VALUES ('5330', '332', '登陆', '127.0.0.1', '2011-08-20 11:42:12');
INSERT INTO `t_sys_log` VALUES ('5331', '332', '退出', '127.0.0.1', '2011-08-20 11:55:19');
INSERT INTO `t_sys_log` VALUES ('5332', '307', '登陆', '127.0.0.1', '2011-08-20 11:55:39');
INSERT INTO `t_sys_log` VALUES ('5333', '357', '登陆', '127.0.0.1', '2012-05-21 16:50:15');
INSERT INTO `t_sys_log` VALUES ('5334', '357', '登陆', '127.0.0.1', '2012-05-25 15:38:17');
INSERT INTO `t_sys_log` VALUES ('5335', '308', '登陆', '127.0.0.1', '2012-05-29 16:48:23');
INSERT INTO `t_sys_log` VALUES ('5336', '307', '登陆', '127.0.0.1', '2012-06-20 12:39:14');
INSERT INTO `t_sys_log` VALUES ('5337', '727761', '登陆', '127.0.0.1', '2012-08-14 17:30:13');
INSERT INTO `t_sys_log` VALUES ('5338', '727761', '登陆', '127.0.0.1', '2012-08-15 09:45:13');
INSERT INTO `t_sys_log` VALUES ('5339', '727761', '登陆', '127.0.0.1', '2012-08-15 15:12:52');
INSERT INTO `t_sys_log` VALUES ('5340', '727761', '登陆', '127.0.0.1', '2012-08-16 12:34:19');
INSERT INTO `t_sys_log` VALUES ('5341', '727761', '登陆', '127.0.0.1', '2012-08-16 14:45:22');
INSERT INTO `t_sys_log` VALUES ('5342', '727761', '退出', '127.0.0.1', '2012-08-16 14:46:42');
INSERT INTO `t_sys_log` VALUES ('5343', '583795062', '登陆', '127.0.0.1', '2012-08-28 15:12:27');
INSERT INTO `t_sys_log` VALUES ('5344', '583795062', '退出', '127.0.0.1', '2012-08-28 15:13:04');

-- ----------------------------
-- Table structure for `t_sys_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_order`;
CREATE TABLE `t_sys_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单ID',
  `extensionFlag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '续期标志,0 可续期 ，1 正在续期 2 不能续期',
  `extensionDays` int(10) DEFAULT NULL COMMENT '续期天数',
  `startDate` datetime DEFAULT NULL COMMENT '服务开始日期',
  `endDate` datetime DEFAULT NULL COMMENT '服务结束日期',
  `service_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '增值服务',
  `itemCode` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '服务项目,[人才挖掘 1,挂证服务 2,猎证服务 3,招聘服务 4,广告位服务 5',
  `in_order` int(11) NOT NULL COMMENT '下单人',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '支付状态 0 待审核,1 已支付,2 没通过',
  `pay_date` datetime DEFAULT NULL COMMENT '确认支付日期',
  `order_date` datetime NOT NULL COMMENT '订单日期',
  `price` double NOT NULL COMMENT '订单价格',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `confirmor` int(11) DEFAULT NULL COMMENT '确认人',
  `operator` int(11) DEFAULT NULL COMMENT '操作人',
  `last_edit_date` datetime NOT NULL COMMENT '最后编辑/更新时间',
  `service1Remains` int(11) DEFAULT NULL COMMENT '服务1剩余次数',
  `service2Remains` int(11) DEFAULT NULL COMMENT '服务2剩余次数',
  `service3Remains` int(11) DEFAULT NULL COMMENT '服务3剩余次数',
  `priceStatus` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否面议（0：面议，1：非面议）',
  `resId` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '唯一订单ID',
  PRIMARY KEY (`id`),
  KEY `FK_T_SYS_ORDER_SERVICE_CODE` (`service_code`) USING BTREE,
  KEY `FK_T_SYS_ORDER_OPERATOR` (`operator`) USING BTREE,
  KEY `FK_T_SYS_ORDER_confirmor` (`confirmor`) USING BTREE,
  KEY `FK_T_SYS_ORDER_in_order` (`in_order`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=804 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单管理';

-- ----------------------------
-- Records of t_sys_order
-- ----------------------------
INSERT INTO `t_sys_order` VALUES ('709', '13033715326894211538', '0', null, '2011-04-21 15:39:47', '2011-04-22 15:39:47', 'TC-004', '1', '302', '1', '2011-04-21 15:39:47', '2011-04-21 15:38:52', '0', '1', '543', '543', '2011-04-21 15:38:52', '1000', null, null, '0', 'b771f5fa-2c91-4dee-9559-d7ce3756fe76');
INSERT INTO `t_sys_order` VALUES ('710', '13033716250304211540', '0', null, null, null, 'TC-004', '1', '302', '0', null, '2011-04-21 15:40:25', '0', '', null, null, '2011-04-21 15:40:25', '1000', null, null, '0', '78bbdb17-bb76-4be2-88c4-5c0f9db71a70');
INSERT INTO `t_sys_order` VALUES ('711', '13034451875944221206', '0', null, '2011-04-22 12:11:59', '2011-05-02 12:11:59', 'fw003', '4', '302', '1', '2011-04-22 12:11:59', '2011-04-22 12:06:27', '10', '1', '543', '543', '2011-04-22 12:06:27', '9', '9', '0', '1', 'b11b510b-034f-4beb-be7a-00ef0cfe454e');
INSERT INTO `t_sys_order` VALUES ('712', '13034452274344221207', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:07:07', '10', '1', null, '543', '2011-04-22 12:07:07', '10', '10', '1', '1', '69b162fe-0972-4aef-9321-6af44bbb2554');
INSERT INTO `t_sys_order` VALUES ('713', '13034452570004221207', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:07:37', '10', '1', null, '543', '2011-04-22 12:07:37', '10', '10', '1', '1', '78047ae4-4f33-47c6-969b-e742f8425ad5');
INSERT INTO `t_sys_order` VALUES ('714', '13034452694844221207', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:07:49', '10', '1', null, '543', '2011-04-22 12:07:49', '10', '10', '1', '1', '18e9aaa5-eea8-4df7-93eb-9cd15d7266db');
INSERT INTO `t_sys_order` VALUES ('715', '13034453572354221209', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:09:17', '10', '1', null, '543', '2011-04-22 12:09:17', '10', '10', '1', '1', 'c343fc7d-a742-48f9-9e48-7ce5e9246129');
INSERT INTO `t_sys_order` VALUES ('716', '13034453843954221209', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:09:44', '10', '1', null, '543', '2011-04-22 12:09:44', '10', '10', '1', '1', 'abd2d733-bfde-4d11-8e0c-a06cf2fa9572');
INSERT INTO `t_sys_order` VALUES ('717', '13034453900514221209', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:09:50', '10', '1', null, '543', '2011-04-22 12:09:50', '10', '10', '1', '1', 'b19d1cdc-262b-4b98-b92b-4055cf190eb6');
INSERT INTO `t_sys_order` VALUES ('718', '13034457359134221215', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:15:35', '10', '1', null, '543', '2011-04-22 12:15:35', '10', '10', '1', '1', '74033657-b096-452b-9f7a-ae449618f384');
INSERT INTO `t_sys_order` VALUES ('719', '13034457474054221215', '1', null, null, null, 'TC-004', '1', '302', '0', null, '2011-04-22 12:15:47', '0', '1', null, '543', '2011-04-22 12:15:47', '1000', null, null, '0', 'a1bc168d-2b9f-4e13-86b4-4818dbc8ae7f');
INSERT INTO `t_sys_order` VALUES ('720', '13034457516744221215', '1', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-22 12:15:51', '10', '1', null, '543', '2011-04-22 12:15:51', '10', '10', '1', '1', 'd14140bc-c275-4d17-a517-595fa5472883');
INSERT INTO `t_sys_order` VALUES ('721', '13034612906394221634', '0', null, '2011-04-22 16:35:02', '2014-01-16 16:35:02', 'TC-001', '5', '302', '1', '2011-04-22 16:35:02', '2011-04-22 16:34:50', '1', '0', '543', '543', '2011-04-22 16:34:50', '1000', '997', '993', '1', '18007839-3c21-4808-b91f-b1c859b93724');
INSERT INTO `t_sys_order` VALUES ('722', '13034612906394221634', '0', null, '2011-04-22 16:35:02', '2014-01-16 16:35:02', 'TC-001', '3', '302', '1', '2011-04-22 16:35:02', '2011-04-22 16:34:50', '1', '0', '543', '543', '2011-04-22 16:34:50', '1000', '997', '993', '1', '18007839-3c21-4808-b91f-b1c859b93724');
INSERT INTO `t_sys_order` VALUES ('723', '13034612906394221634', '0', null, '2011-04-22 16:35:02', '2014-01-16 16:35:02', 'TC-001', '4', '302', '1', '2011-04-22 16:35:02', '2011-04-22 16:34:50', '1', '0', '543', '543', '2011-04-22 16:34:50', '1000', '997', '993', '1', '18007839-3c21-4808-b91f-b1c859b93724');
INSERT INTO `t_sys_order` VALUES ('724', '13034612906394221634', '0', null, '2011-04-22 16:35:02', '2014-01-16 16:35:02', 'TC-001', '1', '302', '1', '2011-04-22 16:35:02', '2011-04-22 16:34:50', '1', '0', '543', '543', '2011-04-22 16:34:50', '1000', '997', '993', '1', '18007839-3c21-4808-b91f-b1c859b93724');
INSERT INTO `t_sys_order` VALUES ('725', '13037154021934251510', '0', null, '2011-04-25 15:10:12', '2014-01-19 15:10:12', 'TC-001', '5', '331', '1', '2011-04-25 15:10:12', '2011-04-25 15:10:02', '1', '122', '543', '543', '2011-04-25 15:10:02', '999', '1000', '992', '1', 'e5136751-c65d-428c-ae73-ba5f1e9a8072');
INSERT INTO `t_sys_order` VALUES ('726', '13037154021934251510', '0', null, '2011-04-25 15:10:12', '2014-01-19 15:10:12', 'TC-001', '3', '331', '1', '2011-04-25 15:10:12', '2011-04-25 15:10:02', '1', '122', '543', '543', '2011-04-25 15:10:02', '997', '999', '992', '1', 'e5136751-c65d-428c-ae73-ba5f1e9a8072');
INSERT INTO `t_sys_order` VALUES ('727', '13037154021934251510', '0', null, '2011-04-25 15:10:12', '2014-01-19 15:10:12', 'TC-001', '4', '331', '1', '2011-04-25 15:10:12', '2011-04-25 15:10:02', '1', '122', '543', '543', '2011-04-25 15:10:02', '994', '996', '980', '1', 'e5136751-c65d-428c-ae73-ba5f1e9a8072');
INSERT INTO `t_sys_order` VALUES ('728', '13037154021934251510', '0', null, '2011-04-25 15:10:12', '2014-01-19 15:10:12', 'TC-001', '1', '331', '1', '2011-04-25 15:10:12', '2011-04-25 15:10:02', '1', '122', '543', '543', '2011-04-25 15:10:02', '997', '1000', '992', '1', 'e5136751-c65d-428c-ae73-ba5f1e9a8072');
INSERT INTO `t_sys_order` VALUES ('729', '13037290010954251856', '0', null, '2011-04-25 18:57:21', '2011-08-03 18:57:21', 'TC-005', '2', '329', '1', '2011-04-25 18:57:21', '2011-04-25 18:56:41', '0', '', '543', '543', '2011-04-25 18:56:41', '10', null, null, '0', '21b27232-6195-40e6-8e10-e3c813be30a0');
INSERT INTO `t_sys_order` VALUES ('730', '13038102790904261731', '1', null, null, null, 'TC-001', '5', '302', '0', null, '2011-04-26 17:31:19', '1', '0', null, '543', '2011-04-26 17:31:19', '1000', '997', null, '1', '299d2c84-6834-49c5-b5d3-73b796ace3f4');
INSERT INTO `t_sys_order` VALUES ('731', '13038102790904261731', '1', null, null, null, 'TC-001', '3', '302', '0', null, '2011-04-26 17:31:19', '1', '0', null, '543', '2011-04-26 17:31:19', '1000', '1000', null, '1', '299d2c84-6834-49c5-b5d3-73b796ace3f4');
INSERT INTO `t_sys_order` VALUES ('732', '13038102790904261731', '1', null, null, null, 'TC-001', '4', '302', '0', null, '2011-04-26 17:31:19', '1', '0', null, '543', '2011-04-26 17:31:19', '1000', '1000', '1000', '1', '299d2c84-6834-49c5-b5d3-73b796ace3f4');
INSERT INTO `t_sys_order` VALUES ('733', '13038102790904261731', '1', null, null, null, 'TC-001', '1', '302', '0', null, '2011-04-26 17:31:19', '1', '0', null, '543', '2011-04-26 17:31:19', '1000', '997', null, '1', '299d2c84-6834-49c5-b5d3-73b796ace3f4');
INSERT INTO `t_sys_order` VALUES ('734', '13038103373464261732', '0', null, null, null, 'fw003', '4', '302', '0', null, '2011-04-26 17:32:17', '10', '', null, null, '2011-04-26 17:32:17', '10', '10', '1', '1', '503926ed-6e11-4dbe-a74d-0d2658785125');
INSERT INTO `t_sys_order` VALUES ('735', '13038131893704261819', '1', null, null, null, 'TC-005', '2', '329', '0', null, '2011-04-26 18:19:49', '0', '', null, '543', '2011-04-26 18:19:49', '10', null, null, '0', 'e00058ca-e055-48cf-b0ab-48fe1222eb6d');
INSERT INTO `t_sys_order` VALUES ('736', '13043933188455031128', '0', null, '2011-05-03 11:39:49', '2014-01-27 11:39:49', 'TC-001', '5', '336', '1', '2011-05-03 11:39:49', '2011-05-03 11:28:38', '1', '', '689', '689', '2011-05-03 11:28:38', null, null, null, '1', '3d8bd4c1-2242-4797-a7bc-6ee3f3317453');
INSERT INTO `t_sys_order` VALUES ('737', '13043933188455031128', '0', null, '2011-05-03 11:39:49', '2014-01-27 11:39:49', 'TC-001', '3', '336', '1', '2011-05-03 11:39:49', '2011-05-03 11:28:38', '1', '', '689', '689', '2011-05-03 11:28:38', '997', '996', null, '1', '3d8bd4c1-2242-4797-a7bc-6ee3f3317453');
INSERT INTO `t_sys_order` VALUES ('738', '13043933188455031128', '0', null, '2011-05-03 11:39:49', '2014-01-27 11:39:49', 'TC-001', '4', '336', '1', '2011-05-03 11:39:49', '2011-05-03 11:28:38', '1', '', '689', '689', '2011-05-03 11:28:38', '1000', '1000', '1000', '1', '3d8bd4c1-2242-4797-a7bc-6ee3f3317453');
INSERT INTO `t_sys_order` VALUES ('739', '13043933188455031128', '0', null, '2011-05-03 11:39:49', '2014-01-27 11:39:49', 'TC-001', '1', '336', '1', '2011-05-03 11:39:49', '2011-05-03 11:28:38', '1', '', '689', '689', '2011-05-03 11:28:38', '998', null, null, '1', '3d8bd4c1-2242-4797-a7bc-6ee3f3317453');
INSERT INTO `t_sys_order` VALUES ('740', '13043933232505031128', '0', null, '2011-05-03 11:39:45', '2011-05-04 11:39:45', 'TC-004', '1', '336', '1', '2011-05-03 11:39:45', '2011-05-03 11:28:43', '0', '', '689', '689', '2011-05-03 11:28:43', '1000', null, null, '0', 'a022ea1d-049f-4d97-9187-a143d515af74');
INSERT INTO `t_sys_order` VALUES ('741', '13043933422995031129', '0', null, '2011-05-03 11:39:42', '2011-05-13 11:39:42', 'fw003', '4', '336', '1', '2011-05-03 11:39:42', '2011-05-03 11:29:02', '10', '', '689', '689', '2011-05-03 11:29:02', '5', '9', '0', '1', '4bb6585e-7951-4dd4-9bf1-c89a06eb447d');
INSERT INTO `t_sys_order` VALUES ('742', '13043939300665031138', '0', null, '2011-05-03 11:39:39', '2011-08-11 11:39:39', 'TC-010', '4', '336', '1', '2011-05-03 11:39:39', '2011-05-03 11:38:50', '20000000', '', '689', '689', '2011-05-03 11:38:50', '100', '100', '93', '1', '8085c54a-cf06-40de-9842-98b10fa3baa8');
INSERT INTO `t_sys_order` VALUES ('743', '13044145532735031722', '0', null, null, null, 'TC-001', '5', '331', '0', null, '2011-05-03 17:22:33', '1', '', null, null, '2011-05-03 17:22:33', null, null, null, '1', 'fe1676e3-05f4-461b-b7e9-0e9d249983eb');
INSERT INTO `t_sys_order` VALUES ('744', '13044145532735031722', '0', null, null, null, 'TC-001', '3', '331', '0', null, '2011-05-03 17:22:33', '1', '', null, null, '2011-05-03 17:22:33', '1000', '1000', null, '1', 'fe1676e3-05f4-461b-b7e9-0e9d249983eb');
INSERT INTO `t_sys_order` VALUES ('745', '13044145532735031722', '0', null, null, null, 'TC-001', '4', '331', '0', null, '2011-05-03 17:22:33', '1', '', null, null, '2011-05-03 17:22:33', '1000', '1000', '1000', '1', 'fe1676e3-05f4-461b-b7e9-0e9d249983eb');
INSERT INTO `t_sys_order` VALUES ('746', '13044145532735031722', '0', null, null, null, 'TC-001', '1', '331', '0', null, '2011-05-03 17:22:33', '1', '', null, null, '2011-05-03 17:22:33', '1000', null, null, '1', 'fe1676e3-05f4-461b-b7e9-0e9d249983eb');
INSERT INTO `t_sys_order` VALUES ('747', '13044146125845031723', '0', null, null, null, 'TC-005', '2', '332', '0', null, '2011-05-03 17:23:32', '0', '', null, null, '2011-05-03 17:23:32', '10', null, null, '0', '16924db4-2631-4d1b-b072-bdaf4028ca97');
INSERT INTO `t_sys_order` VALUES ('748', '13044202312045031857', '0', null, '2011-05-03 18:57:22', '2014-01-27 18:57:22', 'TC-001', '5', '331', '1', '2011-05-03 18:57:22', '2011-05-03 18:57:11', '1', '11', '543', '543', '2011-05-03 18:57:11', null, null, null, '1', '3fb61ec9-dc24-4d00-8fec-d5047753fd5c');
INSERT INTO `t_sys_order` VALUES ('749', '13044202312045031857', '0', null, '2011-05-03 18:57:22', '2014-01-27 18:57:22', 'TC-001', '3', '331', '1', '2011-05-03 18:57:22', '2011-05-03 18:57:11', '1', '11', '543', '543', '2011-05-03 18:57:11', '1000', '1000', null, '1', '3fb61ec9-dc24-4d00-8fec-d5047753fd5c');
INSERT INTO `t_sys_order` VALUES ('750', '13044202312045031857', '0', null, '2011-05-03 18:57:22', '2014-01-27 18:57:22', 'TC-001', '4', '331', '1', '2011-05-03 18:57:22', '2011-05-03 18:57:11', '1', '11', '543', '543', '2011-05-03 18:57:11', '1000', '1000', '1000', '1', '3fb61ec9-dc24-4d00-8fec-d5047753fd5c');
INSERT INTO `t_sys_order` VALUES ('751', '13044202312045031857', '0', null, '2011-05-03 18:57:22', '2014-01-27 18:57:22', 'TC-001', '1', '331', '1', '2011-05-03 18:57:22', '2011-05-03 18:57:11', '1', '11', '543', '543', '2011-05-03 18:57:11', '1000', null, null, '1', '3fb61ec9-dc24-4d00-8fec-d5047753fd5c');
INSERT INTO `t_sys_order` VALUES ('752', '13044202312045031857', '0', null, '2011-05-03 18:57:22', '2014-01-27 18:57:22', 'TC-001', '0', '331', '1', '2011-05-03 18:57:22', '2011-05-03 18:57:11', '1', '11', '543', '543', '2011-05-03 18:57:11', '995', null, null, '1', '3fb61ec9-dc24-4d00-8fec-d5047753fd5c');
INSERT INTO `t_sys_order` VALUES ('753', '13044760898185041028', '0', null, '2011-05-04 10:29:21', '2014-01-28 10:29:21', 'TC-001', '5', '336', '1', '2011-05-04 10:29:21', '2011-05-04 10:28:09', '1', '5th45h46456', '689', '689', '2011-05-04 10:28:09', null, null, null, '1', '0b81de40-e001-4fb0-b6c1-73d0d7776976');
INSERT INTO `t_sys_order` VALUES ('754', '13044760898185041028', '0', null, '2011-05-04 10:29:21', '2014-01-28 10:29:21', 'TC-001', '3', '336', '1', '2011-05-04 10:29:21', '2011-05-04 10:28:09', '1', '5th45h46456', '689', '689', '2011-05-04 10:28:09', '1000', '1000', null, '1', '0b81de40-e001-4fb0-b6c1-73d0d7776976');
INSERT INTO `t_sys_order` VALUES ('755', '13044760898185041028', '0', null, '2011-05-04 10:29:21', '2014-01-28 10:29:21', 'TC-001', '4', '336', '1', '2011-05-04 10:29:21', '2011-05-04 10:28:09', '1', '5th45h46456', '689', '689', '2011-05-04 10:28:09', '1000', '1000', '1000', '1', '0b81de40-e001-4fb0-b6c1-73d0d7776976');
INSERT INTO `t_sys_order` VALUES ('756', '13044760898185041028', '0', null, '2011-05-04 10:29:21', '2014-01-28 10:29:21', 'TC-001', '1', '336', '1', '2011-05-04 10:29:21', '2011-05-04 10:28:09', '1', '5th45h46456', '689', '689', '2011-05-04 10:28:09', '1000', null, null, '1', '0b81de40-e001-4fb0-b6c1-73d0d7776976');
INSERT INTO `t_sys_order` VALUES ('757', '13044760898185041028', '0', null, '2011-05-04 10:29:21', '2014-01-28 10:29:21', 'TC-001', '0', '336', '1', '2011-05-04 10:29:21', '2011-05-04 10:28:09', '1', '5th45h46456', '689', '689', '2011-05-04 10:28:09', '999', null, null, '1', '0b81de40-e001-4fb0-b6c1-73d0d7776976');
INSERT INTO `t_sys_order` VALUES ('758', '13047383150225071118', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-05-07 11:18:35', '1', '11', null, '543', '2011-05-07 11:18:35', null, null, null, '0', '482d7018-bae9-49a0-b258-c5b698f388fb');
INSERT INTO `t_sys_order` VALUES ('759', '13047383150225071118', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-05-07 11:18:35', '1', '11', null, '543', '2011-05-07 11:18:35', '1000', '1000', null, '0', '482d7018-bae9-49a0-b258-c5b698f388fb');
INSERT INTO `t_sys_order` VALUES ('760', '13047383150225071118', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-05-07 11:18:35', '1', '11', null, '543', '2011-05-07 11:18:35', '1000', '1000', '1000', '0', '482d7018-bae9-49a0-b258-c5b698f388fb');
INSERT INTO `t_sys_order` VALUES ('761', '13047383150225071118', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-05-07 11:18:35', '1', '11', null, '543', '2011-05-07 11:18:35', '1000', null, null, '0', '482d7018-bae9-49a0-b258-c5b698f388fb');
INSERT INTO `t_sys_order` VALUES ('762', '13047383150225071118', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-05-07 11:18:35', '1', '11', null, '543', '2011-05-07 11:18:35', '1000', null, null, '0', '482d7018-bae9-49a0-b258-c5b698f388fb');
INSERT INTO `t_sys_order` VALUES ('763', '13047383177265071118', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-05-07 11:18:37', '1', '11', null, '543', '2011-05-07 11:18:37', null, null, null, '1', '71f41bca-7460-4f81-ac7f-ec8c76b066c8');
INSERT INTO `t_sys_order` VALUES ('764', '13047383177265071118', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-05-07 11:18:37', '1', '11', null, '543', '2011-05-07 11:18:37', '1000', '1000', null, '1', '71f41bca-7460-4f81-ac7f-ec8c76b066c8');
INSERT INTO `t_sys_order` VALUES ('765', '13047383177265071118', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-05-07 11:18:37', '1', '11', null, '543', '2011-05-07 11:18:37', '1000', '1000', '1000', '1', '71f41bca-7460-4f81-ac7f-ec8c76b066c8');
INSERT INTO `t_sys_order` VALUES ('766', '13047383177265071118', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-05-07 11:18:37', '1', '11', null, '543', '2011-05-07 11:18:37', '1000', null, null, '1', '71f41bca-7460-4f81-ac7f-ec8c76b066c8');
INSERT INTO `t_sys_order` VALUES ('767', '13047383177265071118', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-05-07 11:18:37', '1', '11', null, '543', '2011-05-07 11:18:37', '1000', null, null, '1', '71f41bca-7460-4f81-ac7f-ec8c76b066c8');
INSERT INTO `t_sys_order` VALUES ('768', '13107247758447151812', '0', null, '2011-07-15 18:13:16', '2014-04-10 18:13:16', 'TC-001', '5', '331', '1', '2011-07-15 18:13:16', '2011-07-15 18:12:55', '1', '123', '543', '543', '2011-07-15 18:12:55', null, null, null, '1', '0d4dd355-8942-4816-8d1e-34154393b659');
INSERT INTO `t_sys_order` VALUES ('769', '13107247758447151812', '0', null, '2011-07-15 18:13:16', '2014-04-10 18:13:16', 'TC-001', '3', '331', '1', '2011-07-15 18:13:16', '2011-07-15 18:12:55', '1', '123', '543', '543', '2011-07-15 18:12:55', '1000', '1000', null, '1', '0d4dd355-8942-4816-8d1e-34154393b659');
INSERT INTO `t_sys_order` VALUES ('770', '13107247758447151812', '0', null, '2011-07-15 18:13:16', '2014-04-10 18:13:16', 'TC-001', '4', '331', '1', '2011-07-15 18:13:16', '2011-07-15 18:12:55', '1', '123', '543', '543', '2011-07-15 18:12:55', '1000', '1000', '1000', '1', '0d4dd355-8942-4816-8d1e-34154393b659');
INSERT INTO `t_sys_order` VALUES ('771', '13107247758447151812', '0', null, '2011-07-15 18:13:16', '2014-04-10 18:13:16', 'TC-001', '1', '331', '1', '2011-07-15 18:13:16', '2011-07-15 18:12:55', '1', '123', '543', '543', '2011-07-15 18:12:55', '1000', null, null, '1', '0d4dd355-8942-4816-8d1e-34154393b659');
INSERT INTO `t_sys_order` VALUES ('772', '13107247758447151812', '0', null, '2011-07-15 18:13:16', '2014-04-10 18:13:16', 'TC-001', '0', '331', '1', '2011-07-15 18:13:16', '2011-07-15 18:12:55', '1', '123', '543', '543', '2011-07-15 18:12:55', '1000', null, null, '1', '0d4dd355-8942-4816-8d1e-34154393b659');
INSERT INTO `t_sys_order` VALUES ('773', '13107249680937151816', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-07-15 18:16:08', '1', '123', null, '543', '2011-07-15 18:16:08', null, null, null, '1', '67091bd7-54a9-4de2-895a-1ee1983aaf41');
INSERT INTO `t_sys_order` VALUES ('774', '13107249680937151816', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-07-15 18:16:08', '1', '123', null, '543', '2011-07-15 18:16:08', '1000', '1000', null, '1', '67091bd7-54a9-4de2-895a-1ee1983aaf41');
INSERT INTO `t_sys_order` VALUES ('775', '13107249680937151816', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-07-15 18:16:08', '1', '123', null, '543', '2011-07-15 18:16:08', '1000', '1000', '1000', '1', '67091bd7-54a9-4de2-895a-1ee1983aaf41');
INSERT INTO `t_sys_order` VALUES ('776', '13107249680937151816', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-07-15 18:16:08', '1', '123', null, '543', '2011-07-15 18:16:08', '1000', null, null, '1', '67091bd7-54a9-4de2-895a-1ee1983aaf41');
INSERT INTO `t_sys_order` VALUES ('777', '13107249680937151816', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-07-15 18:16:08', '1', '123', null, '543', '2011-07-15 18:16:08', '1000', null, null, '1', '67091bd7-54a9-4de2-895a-1ee1983aaf41');
INSERT INTO `t_sys_order` VALUES ('778', '13107249767717151816', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-07-15 18:16:16', '1', '123', null, '543', '2011-07-15 18:16:16', null, null, null, '0', '1fb2923a-d05c-45ad-a13c-a8dc21ac3793');
INSERT INTO `t_sys_order` VALUES ('779', '13107249767717151816', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-07-15 18:16:16', '1', '123', null, '543', '2011-07-15 18:16:16', '1000', '1000', null, '0', '1fb2923a-d05c-45ad-a13c-a8dc21ac3793');
INSERT INTO `t_sys_order` VALUES ('780', '13107249767717151816', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-07-15 18:16:16', '1', '123', null, '543', '2011-07-15 18:16:16', '1000', '1000', '1000', '0', '1fb2923a-d05c-45ad-a13c-a8dc21ac3793');
INSERT INTO `t_sys_order` VALUES ('781', '13107249767717151816', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-07-15 18:16:16', '1', '123', null, '543', '2011-07-15 18:16:16', '1000', null, null, '0', '1fb2923a-d05c-45ad-a13c-a8dc21ac3793');
INSERT INTO `t_sys_order` VALUES ('782', '13107249767717151816', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-07-15 18:16:16', '1', '123', null, '543', '2011-07-15 18:16:16', '1000', null, null, '0', '1fb2923a-d05c-45ad-a13c-a8dc21ac3793');
INSERT INTO `t_sys_order` VALUES ('783', '13107249885267151816', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-07-15 18:16:28', '1', '123', null, '543', '2011-07-15 18:16:28', null, null, null, '0', '9851564d-b0ea-423c-8c89-4be7fe0882f8');
INSERT INTO `t_sys_order` VALUES ('784', '13107249885267151816', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-07-15 18:16:28', '1', '123', null, '543', '2011-07-15 18:16:28', '1000', '1000', null, '0', '9851564d-b0ea-423c-8c89-4be7fe0882f8');
INSERT INTO `t_sys_order` VALUES ('785', '13107249885267151816', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-07-15 18:16:28', '1', '123', null, '543', '2011-07-15 18:16:28', '1000', '1000', '1000', '0', '9851564d-b0ea-423c-8c89-4be7fe0882f8');
INSERT INTO `t_sys_order` VALUES ('786', '13107249885267151816', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-07-15 18:16:28', '1', '123', null, '543', '2011-07-15 18:16:28', '1000', null, null, '0', '9851564d-b0ea-423c-8c89-4be7fe0882f8');
INSERT INTO `t_sys_order` VALUES ('787', '13107249885267151816', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-07-15 18:16:28', '1', '123', null, '543', '2011-07-15 18:16:28', '1000', null, null, '0', '9851564d-b0ea-423c-8c89-4be7fe0882f8');
INSERT INTO `t_sys_order` VALUES ('788', '13107249940797151816', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-07-15 18:16:34', '1', '123', null, '543', '2011-07-15 18:16:34', null, null, null, '0', 'b6be82b0-a293-4a5f-aafd-d538f2d7516e');
INSERT INTO `t_sys_order` VALUES ('789', '13107249940797151816', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-07-15 18:16:34', '1', '123', null, '543', '2011-07-15 18:16:34', '1000', '1000', null, '0', 'b6be82b0-a293-4a5f-aafd-d538f2d7516e');
INSERT INTO `t_sys_order` VALUES ('790', '13107249940797151816', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-07-15 18:16:34', '1', '123', null, '543', '2011-07-15 18:16:34', '1000', '1000', '1000', '0', 'b6be82b0-a293-4a5f-aafd-d538f2d7516e');
INSERT INTO `t_sys_order` VALUES ('791', '13107249940797151816', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-07-15 18:16:34', '1', '123', null, '543', '2011-07-15 18:16:34', '1000', null, null, '0', 'b6be82b0-a293-4a5f-aafd-d538f2d7516e');
INSERT INTO `t_sys_order` VALUES ('792', '13107249940797151816', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-07-15 18:16:34', '1', '123', null, '543', '2011-07-15 18:16:34', '1000', null, null, '0', 'b6be82b0-a293-4a5f-aafd-d538f2d7516e');
INSERT INTO `t_sys_order` VALUES ('793', '13107250281987151817', '1', null, null, null, 'TC-001', '5', '331', '0', null, '2011-07-15 18:17:08', '1', '123', null, '543', '2011-07-15 18:17:08', null, null, null, '0', '3cb79f9b-1708-4d06-a7b2-18f72a4b882a');
INSERT INTO `t_sys_order` VALUES ('794', '13107250281987151817', '1', null, null, null, 'TC-001', '3', '331', '0', null, '2011-07-15 18:17:08', '1', '123', null, '543', '2011-07-15 18:17:08', '1000', '1000', null, '0', '3cb79f9b-1708-4d06-a7b2-18f72a4b882a');
INSERT INTO `t_sys_order` VALUES ('795', '13107250281987151817', '1', null, null, null, 'TC-001', '4', '331', '0', null, '2011-07-15 18:17:08', '1', '123', null, '543', '2011-07-15 18:17:08', '1000', '1000', '1000', '0', '3cb79f9b-1708-4d06-a7b2-18f72a4b882a');
INSERT INTO `t_sys_order` VALUES ('796', '13107250281987151817', '1', null, null, null, 'TC-001', '1', '331', '0', null, '2011-07-15 18:17:08', '1', '123', null, '543', '2011-07-15 18:17:08', '1000', null, null, '0', '3cb79f9b-1708-4d06-a7b2-18f72a4b882a');
INSERT INTO `t_sys_order` VALUES ('797', '13107250281987151817', '1', null, null, null, 'TC-001', '0', '331', '0', null, '2011-07-15 18:17:08', '1', '123', null, '543', '2011-07-15 18:17:08', '1000', null, null, '0', '3cb79f9b-1708-4d06-a7b2-18f72a4b882a');
INSERT INTO `t_sys_order` VALUES ('798', '13111514573747201644', '0', null, '2011-07-20 16:45:09', '2011-10-28 16:45:09', 'TC-005', '2', '307', '1', '2011-07-20 16:45:09', '2011-07-20 16:44:17', '123', '12', '543', '543', '2011-07-20 16:44:17', '10', null, null, '1', '480ba88c-f4ea-43c3-bc88-ce35a7164ddd');
INSERT INTO `t_sys_order` VALUES ('799', '13111515247237201645', '1', null, null, null, 'TC-005', '2', '307', '0', null, '2011-07-20 16:45:24', '123', '12', null, '543', '2011-07-20 16:45:24', '10', null, null, '1', 'c0ff9bef-21e4-4b02-b4f9-21bed9742bb4');
INSERT INTO `t_sys_order` VALUES ('800', '13111556088247201753', '0', null, '2011-07-20 17:53:50', '2014-04-15 17:53:50', 'TC-0011', '3', '354', '1', '2011-07-20 17:53:50', '2011-07-20 17:53:28', '0', '12', '543', '543', '2011-07-20 17:53:28', '9', '0', null, '1', 'dac6a587-b232-41d9-a4b0-298ab3452a16');
INSERT INTO `t_sys_order` VALUES ('801', '13111588227867201847', '0', null, '2011-07-20 18:47:22', '2011-10-28 18:47:22', 'TC-005', '2', '303', '1', '2011-07-20 18:47:22', '2011-07-20 18:47:02', '0', '123', '543', '543', '2011-07-20 18:47:02', '9', null, null, '0', '7a3a0ae6-c1b7-4ed3-83ed-32bbc0760a10');
INSERT INTO `t_sys_order` VALUES ('802', '13112209473977211202', '0', null, null, null, 'TC-002', '1', '356', '0', null, '2011-07-21 12:02:27', '0', '', null, null, '2011-07-21 12:02:27', '10', null, null, '1', '91a8f029-b0fb-491f-8f3b-a9427a859c2f');
INSERT INTO `t_sys_order` VALUES ('803', '13128758803758091544', '1', null, null, null, 'TC-005', '2', '307', '0', null, '2011-08-09 15:44:40', '123', '12', null, '543', '2011-08-09 15:44:40', '10', null, null, '1', 'f544d2df-8a1c-4dbe-a02e-1e0529c9a0cd');

-- ----------------------------
-- Table structure for `t_sys_point`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_point`;
CREATE TABLE `t_sys_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '积分编码',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作行为',
  `point` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT '积分值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UN_T_SYS_POINT_POINT_CODE` (`code`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='积分设置';

-- ----------------------------
-- Records of t_sys_point
-- ----------------------------
INSERT INTO `t_sys_point` VALUES ('17', '1002', '上传文章', '2');
INSERT INTO `t_sys_point` VALUES ('18', '1003', '上传视频', '2');
INSERT INTO `t_sys_point` VALUES ('19', '1004', '上传图片', '1');
INSERT INTO `t_sys_point` VALUES ('20', '1001', '评论', '10');

-- ----------------------------
-- Table structure for `t_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名(Email)',
  `companyName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `industryType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '行业类型',
  `specializedType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '专业类型',
  `competency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职能',
  `provinceCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编码',
  `cityCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `areaCode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区编码',
  `metier` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专长',
  `education` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学历要求',
  `workingLife` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作年限',
  `age` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '年龄',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别:0 女;1 男',
  `langCapa` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '语言能力',
  `mastery` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '掌握程度',
  `computerGrade` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '计算机能',
  `isAdviser` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否是顾问:1 是;0 不是',
  `jobNature` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工作性质',
  `userInfoUpdateDate` datetime DEFAULT NULL COMMENT '用户资料更新日期',
  `categoryIndex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '星级指数',
  `expectedPosition` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '期望职位',
  `userType` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型:0:个人用户;1:企业用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`userName`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=469 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('407', 'hdc@dotoyo.com', '大太阳', '001-1001', '003-1001-1002', '002-1001', '110000', '110100', '', '??', '7', '20', '45', '0', '1', '1', '1', '1', '005-1002', '2011-04-03 10:29:15', null, '???', '0');
INSERT INTO `t_user_info` VALUES ('408', 'eric8952@163.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-03 12:01:33', null, '', '0');
INSERT INTO `t_user_info` VALUES ('409', 'qhy@dotoyo.com', '??', '001-1010', '003-1001-1015', '002-1002', '440000', '440100', '440115', '??', '4', '12', '36', '0', '1', '2', '2', '0', '005-1002', '2011-04-03 12:10:12', null, '??', '0');
INSERT INTO `t_user_info` VALUES ('410', 'cobo91ly@126.com', 'as', '001-1001', '003-1001-1001', '002-1027', '440000', '440300', '', 'asd', '7', '5', '20', '1', '0', '0', '3', '1', '005-1002', '2011-04-03 14:40:40', null, 'as', '1');
INSERT INTO `t_user_info` VALUES ('411', 'yq@dotoyo.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-03 14:37:51', null, '', '0');
INSERT INTO `t_user_info` VALUES ('412', 'kcoolks@126.com', '1', '001-1001', '003-1001-1001', '002-1030', '110000', '110100', '', '1', '2', '11', '11', '1', '2', '1', '1', '0', '005-1001', '2011-04-03 15:21:40', null, '11', '1');
INSERT INTO `t_user_info` VALUES ('413', 'gr@126.com', '1', '001-1001', '003-1001-1001', '002-1001', '', '', '', '11', '0', '', '11', '1', '0', '0', '0', '1', '005-1001', '2011-04-03 15:45:21', null, '11', '0');
INSERT INTO `t_user_info` VALUES ('414', 'dotoyo@dotoyo.com', '中邦国际', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-03 15:46:39', null, '', '0');
INSERT INTO `t_user_info` VALUES ('415', '1251765969@qq.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-03 16:08:20', null, '', '1');
INSERT INTO `t_user_info` VALUES ('416', 'qiye1@126.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-06 11:55:26', null, '', '1');
INSERT INTO `t_user_info` VALUES ('417', 'gr1@126.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 10:31:43', null, '', '0');
INSERT INTO `t_user_info` VALUES ('418', 'gr2@126.com', 'gr2', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 10:32:52', null, '', '0');
INSERT INTO `t_user_info` VALUES ('419', 'qy@dotoyo.com', '深圳', '001-1001', '003-1001-1001', '002-1001', '', '', '', '没有', '0', '', '不知道', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 10:36:30', null, '职位', '1');
INSERT INTO `t_user_info` VALUES ('420', 'gr3@126.com', 'gr3', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 10:39:56', null, '', '0');
INSERT INTO `t_user_info` VALUES ('421', 'qy@126.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 10:46:41', null, '', '1');
INSERT INTO `t_user_info` VALUES ('422', 'qy2@126.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '11', '0', '', '1', '1', '0', '0', '0', '0', '005-1001', '2011-04-07 11:21:43', null, '1', '1');
INSERT INTO `t_user_info` VALUES ('423', 'qy3@126.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_user_info` VALUES ('424', 'ly@dotoyo.com', 'dotoyo', '001-1006', '003-1001-1001', '002-1001', '440000', '440300', '', '说话', '7', '12', '30', '1', '4', '2', '3', '1', '005-1002', '2011-04-07 11:58:41', null, 'CIO', '1');
INSERT INTO `t_user_info` VALUES ('425', 'gr@dotoyo.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-07 14:51:16', null, '', '0');
INSERT INTO `t_user_info` VALUES ('426', '123@126.com', '234', '001-1009', '003-1001-1001', '002-1024', '440000', '440300', '', '工程监理', '4', '', '38', '1', '0', '2', '3', '1', '005-1002', '2011-04-08 09:31:04', null, '工程监理', '0');
INSERT INTO `t_user_info` VALUES ('427', 'qy2@dotoyo.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '上市', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-08 14:51:33', null, '所属', '1');
INSERT INTO `t_user_info` VALUES ('428', 'qy3@dotoyo.com', '深圳大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-08 16:09:53', null, '', '0');
INSERT INTO `t_user_info` VALUES ('429', 'qy4@dotoyo.com', '深圳大太阳网络科技有限公司1', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-08 16:10:29', null, '', '1');
INSERT INTO `t_user_info` VALUES ('430', 'qy4@126.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 09:51:12', null, '', '1');
INSERT INTO `t_user_info` VALUES ('431', 'qy5@126.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 10:32:18', null, '', '1');
INSERT INTO `t_user_info` VALUES ('432', 'qy99@dotoyo.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 10:50:52', null, '', '1');
INSERT INTO `t_user_info` VALUES ('433', 'gr4@126.com', '人才挖掘测试', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 10:51:57', null, '', '0');
INSERT INTO `t_user_info` VALUES ('434', 'ge99@dotoyo.com', '', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 11:10:54', null, '', '0');
INSERT INTO `t_user_info` VALUES ('435', 'gr5@126.com', '111', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 11:11:01', null, '', '0');
INSERT INTO `t_user_info` VALUES ('436', 'qy6@126.com', '1111', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 11:12:11', null, '', '1');
INSERT INTO `t_user_info` VALUES ('437', 'gr7@126.com', '测试人才搜索', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 11:41:21', null, '', '0');
INSERT INTO `t_user_info` VALUES ('438', 'gr8@126.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_user_info` VALUES ('439', 'gr9@126.com', '我的真实名字', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 17:39:19', null, '', '0');
INSERT INTO `t_user_info` VALUES ('440', 'qy9@126.com', '我的公司名字', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-14 18:04:59', null, '', '1');
INSERT INTO `t_user_info` VALUES ('441', 'dty@dotoyo.com', '大太阳网络科技有限公司', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-15 15:56:20', null, '', '1');
INSERT INTO `t_user_info` VALUES ('442', 'gr10@126.com', '个人名称', '001-1004', '003-1001-1001', '002-1002', '', '', '', '个人专长', '7', '100', '个人年龄', '0', '12', '3', '3', '0', '005-1002', '2011-04-18 11:16:05', null, '个人意向职位', '0');
INSERT INTO `t_user_info` VALUES ('443', 'gr11@126.com', '个人名次', '001-1002', '003-1001-1002', '002-1002', '440000', '440300', '', '个人专长', '7', '100', '个人年龄', '1', '12', '3', '3', '0', '005-1002', '2011-04-18 11:29:01', null, '个人意向职位', '0');
INSERT INTO `t_user_info` VALUES ('444', 'gr12@126.com', '公司名称', '001-1001', '003-1001-1001', '002-1001', '', '', '', '专长', '0', '', '年龄', '0', '0', '0', '0', '0', '005-1001', '2011-04-20 19:06:52', null, '意向职位', '0');
INSERT INTO `t_user_info` VALUES ('445', 'ceshi@126.com', '测试人', '001-1001', '003-1001-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-04-27 12:02:37', '1', '测试人的职位', '0');
INSERT INTO `t_user_info` VALUES ('446', '886@126.com', '深圳大太阳在线', '001-1001-1007', '003-1001-1001', '002-1002', '440000', '440300', '', '工程造价', '5', '', '38', '1', '0', '0', '0', '1', '005-1002', '2011-05-03 11:22:59', '1', '工程造价', '1');
INSERT INTO `t_user_info` VALUES ('447', 'aaa@dotoyo.com', '你好白', '001-1001', '003-1001', '002-1001', '440000', '440300', '', '工程造价', '5', '', '38', '1', '1', '2', '3', '1', '005-1002', '2011-05-03 18:01:29', '1', '工程监理', '0');
INSERT INTO `t_user_info` VALUES ('448', '234@126.com', '3464256', '001-1001-1004', '003-1001-1010', '002-1001', '440000', '440300', '', '去serta', '0', '', '42', '1', '0', '0', '0', '1', '005-1001', '2011-05-03 18:13:00', '1', '工程勘察', '0');
INSERT INTO `t_user_info` VALUES ('449', 'gr13@126.com', '我的名字', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-05-04 12:04:09', '4', '我的意向职位', '0');
INSERT INTO `t_user_info` VALUES ('450', 'nihao@126.com', '你好', '001-1001-1007', '003-1001-1015', '002-1001', '440000', '440100', '', '额大幅', '5', '', '35', '1', '1', '0', '0', '1', '005-1002', '2011-05-04 14:59:08', '1', '工程造价', '0');
INSERT INTO `t_user_info` VALUES ('451', 'gr14@126.com', '我的真实姓名1', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '1', '0', '0', '0', '0', '005-1001', '2011-05-04 15:10:21', '3', '我的意向职位1', '0');
INSERT INTO `t_user_info` VALUES ('452', 'pangge@126.com', 'pangge', '001-1002-1011', '003-1001', '002-1001', '440000', '440300', '', '工程造价', '0', '', '38', '1', '0', '0', '0', '1', '005-1001', '2011-05-06 11:41:44', '1', '工程监理', '0');
INSERT INTO `t_user_info` VALUES ('453', 'gr15@126.com', 'grxm', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-05-06 11:41:45', '1', 'grzhiwei', '0');
INSERT INTO `t_user_info` VALUES ('454', 'gr16@126.com', '1', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-05-06 11:45:20', '1', '1', '0');
INSERT INTO `t_user_info` VALUES ('455', 'sohu@126.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-05-06 11:46:51', '1', '', '0');
INSERT INTO `t_user_info` VALUES ('456', 'ge12@dotoyo.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-05-06 14:47:44', '1', '', '0');
INSERT INTO `t_user_info` VALUES ('457', 'haogaoxiao@126.com', '违法', '001-1001-1003', '003-1001', '002-1001', '', '', '', '工程造价', '0', '', '42', '0', '0', '0', '0', '1', '005-1001', '2011-05-06 14:48:12', '1', 'CIO', '0');
INSERT INTO `t_user_info` VALUES ('458', 'wzqy@126.com', '完整公司名称', '001-1001', '003-1001', '002-1001', '120000', '120200', '', '完整专长', '5', '2', '25', '0', '1', '2', '3', '1', '005-1002', '2011-05-09 10:52:11', '5', '完整意向职位', '0');
INSERT INTO `t_user_info` VALUES ('459', 'csqy@dotoyo.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_user_info` VALUES ('460', 'csqy1@dotoyo.com', 'sss', '001-1001', '003-1001', '002-1001', '', '', '', 'ss', '0', '', 'sss', '0', '0', '0', '0', '0', '005-1001', '2011-07-19 16:27:20', '1', 'ss', '0');
INSERT INTO `t_user_info` VALUES ('461', 'gr20@126.com', '我的真实姓名0720', '001-1001', '003-1001', '002-1001', '', '', '', '', '1', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-20 17:21:08', '5', '', '0');
INSERT INTO `t_user_info` VALUES ('462', 'gr21@126.com', '注册真实姓名', '001-1001', '003-1001', '002-1001', '', '', '', '注册专长', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-20 17:28:14', '4', '注册意向职位', '0');
INSERT INTO `t_user_info` VALUES ('463', 'qy10@126.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-20 17:52:20', '1', '', '0');
INSERT INTO `t_user_info` VALUES ('464', 'qy11@126.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-20 17:53:07', '1', '', '1');
INSERT INTO `t_user_info` VALUES ('465', 'xinzhuce@126.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-21 12:01:17', '1', '', '0');
INSERT INTO `t_user_info` VALUES ('466', 'zhuce123@126.com', '', '001-1001', '003-1001', '002-1001', '', '', '', '', '0', '', '', '0', '0', '0', '0', '0', '005-1001', '2011-07-21 12:02:03', '1', '', '1');
INSERT INTO `t_user_info` VALUES ('467', 'liangchao0209@sina.com', '11111大太阳', '001-1001-1009', '003-1001-1010', '002-1013', '440000', '440300', '', '建筑设计', '4', '4', '28', '1', '1', '2', '3', '1', '005-1002', '2012-05-21 15:31:55', '4', '建筑设计师', '0');
INSERT INTO `t_user_info` VALUES ('468', 'huangdc5@dotoyo.com', null, '001-1002-1001', '003-1002-1001', '002-1007', '30000', '35000', '350402', null, null, '8-99', '30-35', null, '008-5', '009-2', '011-3', '0', '005-1002', '2012-08-27 16:08:08', '', '结构工程师', '0');

-- ----------------------------
-- Table structure for `t_user_info_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info_copy`;
CREATE TABLE `t_user_info_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '用户名(Email)',
  `PASSWORD` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `companyName` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `categoryIndex` int(11) DEFAULT NULL COMMENT '星级指数',
  `competency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_info_copy
-- ----------------------------
