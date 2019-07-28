-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NULL COMMENT '����',
  `realName` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `cardNumber` varchar(20)  NOT NULL COMMENT '���֤',
  `city` varchar(20)  NULL COMMENT '����',
  `photo` varchar(60)  NOT NULL COMMENT '��Ƭ',
  `address` varchar(20)  NULL COMMENT '��ͥ��ַ',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_areaInfo` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `areaName` varchar(20)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_buildingInfo` (
  `buildingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '¥�̱��',
  `areaObj` int(11) NOT NULL COMMENT '��������',
  `buildingName` varchar(20)  NOT NULL COMMENT '¥������',
  `buildingPhoto` varchar(60)  NOT NULL COMMENT '¥��ͼƬ',
  PRIMARY KEY (`buildingId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_hourse` (
  `hourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '���ݱ��',
  `hourseName` varchar(20)  NOT NULL COMMENT '��������',
  `buildingObj` int(11) NOT NULL COMMENT '����¥��',
  `housePhoto` varchar(60)  NOT NULL COMMENT '����ͼƬ',
  `hourseTypeObj` int(11) NOT NULL COMMENT '��������',
  `priceRangeObj` int(11) NOT NULL COMMENT '�۸�Χ',
  `area` varchar(20)  NOT NULL COMMENT '���',
  `price` float NOT NULL COMMENT '���(Ԫ/��)',
  `louceng` varchar(20)  NOT NULL COMMENT '¥��/��¥��',
  `zhuangxiu` varchar(20)  NOT NULL COMMENT 'װ��',
  `caoxiang` varchar(20)  NULL COMMENT '����',
  `madeYear` varchar(20)  NULL COMMENT '�������',
  `connectPerson` varchar(20)  NOT NULL COMMENT '��ϵ��',
  `connectPhone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `detail` varchar(500)  NULL COMMENT '��ϸ��Ϣ',
  `address` varchar(50)  NULL COMMENT '��ַ',
  PRIMARY KEY (`hourseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_hourseType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����',
  `typeName` varchar(20)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_priceRange` (
  `rangeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `priceName` varchar(20)  NOT NULL COMMENT '�۸�����',
  PRIMARY KEY (`rangeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_wantHourseInfo` (
  `wantHourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `userObj` varchar(20)  NOT NULL COMMENT '�����û�',
  `title` varchar(20)  NOT NULL COMMENT '����',
  `position` int(11) NOT NULL COMMENT '��������',
  `hourseTypeObj` int(11) NOT NULL COMMENT '��������',
  `priceRangeObj` int(11) NOT NULL COMMENT '�۸�Χ',
  `price` float NOT NULL COMMENT '����ܳ����',
  `lianxiren` varchar(20)  NOT NULL COMMENT '��ϵ��',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  PRIMARY KEY (`wantHourseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_guestBook` (
  `guestBookId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(40)  NOT NULL COMMENT '���Ա���',
  `content` varchar(200)  NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `addTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`guestBookId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_newsInfo` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `newsTitle` varchar(20)  NOT NULL COMMENT '����',
  `newsContent` varchar(200)  NOT NULL COMMENT '��������',
  `newsDate` varchar(20)  NULL COMMENT '��������',
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_buildingInfo ADD CONSTRAINT FOREIGN KEY (areaObj) REFERENCES t_areaInfo(areaId);
ALTER TABLE t_hourse ADD CONSTRAINT FOREIGN KEY (buildingObj) REFERENCES t_buildingInfo(buildingId);
ALTER TABLE t_hourse ADD CONSTRAINT FOREIGN KEY (hourseTypeObj) REFERENCES t_hourseType(typeId);
ALTER TABLE t_hourse ADD CONSTRAINT FOREIGN KEY (priceRangeObj) REFERENCES t_priceRange(rangeId);
ALTER TABLE t_wantHourseInfo ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_wantHourseInfo ADD CONSTRAINT FOREIGN KEY (position) REFERENCES t_areaInfo(areaId);
ALTER TABLE t_wantHourseInfo ADD CONSTRAINT FOREIGN KEY (hourseTypeObj) REFERENCES t_hourseType(typeId);
ALTER TABLE t_wantHourseInfo ADD CONSTRAINT FOREIGN KEY (priceRangeObj) REFERENCES t_priceRange(rangeId);
ALTER TABLE t_guestBook ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


