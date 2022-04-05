/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : house_db

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 02/04/2022 16:22:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for t_areainfo
-- ----------------------------
DROP TABLE IF EXISTS `t_areainfo`;
CREATE TABLE `t_areainfo`  (
  `areaId` int(11) NOT NULL AUTO_INCREMENT COMMENT '??¼???',
  `areaName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_areainfo
-- ----------------------------
INSERT INTO `t_areainfo` VALUES (1, 'qwe');

-- ----------------------------
-- Table structure for t_buildinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_buildinginfo`;
CREATE TABLE `t_buildinginfo`  (
  `buildingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '¥?̱??',
  `areaObj` int(11) NOT NULL COMMENT '???????',
  `buildingName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '¥?????',
  `buildingPhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '¥??ͼƬ',
  PRIMARY KEY (`buildingId`) USING BTREE,
  INDEX `areaObj`(`areaObj`) USING BTREE,
  CONSTRAINT `t_buildinginfo_ibfk_1` FOREIGN KEY (`areaObj`) REFERENCES `t_areainfo` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_buildinginfo
-- ----------------------------
INSERT INTO `t_buildinginfo` VALUES (1, 1, 'qwea', 'upload/9fac2671-2cdb-458a-ac49-9e245a397a14.jpg');

-- ----------------------------
-- Table structure for t_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `t_guestbook`;
CREATE TABLE `t_guestbook`  (
  `guestBookId` int(11) NOT NULL AUTO_INCREMENT COMMENT '??¼???',
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???Ա??',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  `userObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?????',
  `addTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????ʱ?',
  PRIMARY KEY (`guestBookId`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  CONSTRAINT `t_guestbook_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_guestbook
-- ----------------------------
INSERT INTO `t_guestbook` VALUES (1, 'asda', 'sadcxzc', 'a', '2020-09-2');
INSERT INTO `t_guestbook` VALUES (2, 'asda', 'sadcxzc', 'w阿达', '2020-09-2');
INSERT INTO `t_guestbook` VALUES (3, 'asda', 'sadcxzc', 'aaa', '2020-09-2');

-- ----------------------------
-- Table structure for t_hourse
-- ----------------------------
DROP TABLE IF EXISTS `t_hourse`;
CREATE TABLE `t_hourse`  (
  `hourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '???ݱ??',
  `hourseName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  `buildingObj` int(11) NOT NULL COMMENT '????¥?',
  `housePhoto` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????ͼƬ',
  `hourseTypeObj` int(11) NOT NULL COMMENT '???????',
  `priceRangeObj` int(11) NOT NULL COMMENT '?۸???Χ',
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????',
  `price` float NOT NULL COMMENT '????(Ԫ/??)',
  `louceng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '¥??/??¥?',
  `zhuangxiu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'װ?',
  `caoxiang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `madeYear` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????',
  `connectPerson` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??ϵ?',
  `connectPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??ϵ?绰',
  `detail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??ϸ??Ϣ',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??ַ',
  `userInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`hourseId`) USING BTREE,
  INDEX `buildingObj`(`buildingObj`) USING BTREE,
  INDEX `hourseTypeObj`(`hourseTypeObj`) USING BTREE,
  INDEX `priceRangeObj`(`priceRangeObj`) USING BTREE,
  CONSTRAINT `t_hourse_ibfk_1` FOREIGN KEY (`buildingObj`) REFERENCES `t_buildinginfo` (`buildingId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_hourse_ibfk_2` FOREIGN KEY (`hourseTypeObj`) REFERENCES `t_hoursetype` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_hourse_ibfk_3` FOREIGN KEY (`priceRangeObj`) REFERENCES `t_pricerange` (`rangeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hourse
-- ----------------------------
INSERT INTO `t_hourse` VALUES (1, 'qwwq', 1, 'upload/NoImage.jpg', 1, 1, '11111', 1111, 'wqe', 'wqe', '南', '2000', '请问', '13767092182', '哇大大大', '万达广场', 'aaaa');
INSERT INTO `t_hourse` VALUES (2, 'qwwq', 1, 'upload/NoImage.jpg', 1, 1, '111111', 10000, 'wqe', '未装修', '北', '2000', '万家欣', '13767092182', '啊实打实的', '万达广场', NULL);

-- ----------------------------
-- Table structure for t_hoursetype
-- ----------------------------
DROP TABLE IF EXISTS `t_hoursetype`;
CREATE TABLE `t_hoursetype`  (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '???????',
  `typeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hoursetype
-- ----------------------------
INSERT INTO `t_hoursetype` VALUES (1, 'qwe');

-- ----------------------------
-- Table structure for t_newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_newsinfo`;
CREATE TABLE `t_newsinfo`  (
  `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '??¼???',
  `newsTitle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???',
  `newsContent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????',
  `newsDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????',
  PRIMARY KEY (`newsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_newsinfo
-- ----------------------------
INSERT INTO `t_newsinfo` VALUES (1, 'czxc', 'asd', '2022-03-02');

-- ----------------------------
-- Table structure for t_pricerange
-- ----------------------------
DROP TABLE IF EXISTS `t_pricerange`;
CREATE TABLE `t_pricerange`  (
  `rangeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '??¼???',
  `priceName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?۸????',
  PRIMARY KEY (`rangeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pricerange
-- ----------------------------
INSERT INTO `t_pricerange` VALUES (1, '100-1999');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo`  (
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user_name',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?Ա',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????',
  `cardNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????֤',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `photo` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??Ƭ',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??ͥ??ַ',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('a', 'aaaaaaa', 'a', '男', '2022-04-08', '31345642131', '阿萨德', 'upload/42c3026e-57dd-476d-910a-aa79a159c0d0.jpg', '阿', '29349568612qq.com', '', 0.00);
INSERT INTO `t_userinfo` VALUES ('aaa', 'asd', 'wqeqw', 'asd', '2022-04-07', '31345642131', '阿萨德', 'upload/914bca1c-e661-41e1-9ef2-02c965d4b0b4.jpg', 'asd', '2934956861@qq.com', NULL, NULL);
INSERT INTO `t_userinfo` VALUES ('aaaa', '123456', 'aaaa', '男', '2004-04-22', '12314324', 'dads', 'upload/60bea383-31ad-4037-9332-4256af57267b.jpg', 'qwe', '2294022962@qq.com', '13767092182', 1111.00);
INSERT INTO `t_userinfo` VALUES ('asd', 'qqqqqq', 'qw', 'man', '2022-04-05', '12314324', 'wadsad', 'upload/121a34c3-6501-45ee-beb1-c4a8d7ecef86.jpg', 'qwe', '2294022964@qq.com', NULL, NULL);
INSERT INTO `t_userinfo` VALUES ('w阿达', '123', 'qweds', '男', '2022-03-22', '31345642131', '阿萨德', 'upload/0c4a49aa-6a66-4d4c-8eb0-ce5215eb33c4.jpg', '爱上大地', '2934956861@qq.com', NULL, NULL);

-- ----------------------------
-- Table structure for t_wanthourseinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wanthourseinfo`;
CREATE TABLE `t_wanthourseinfo`  (
  `wantHourseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '??¼???',
  `userObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?????û?',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???',
  `position` int(11) NOT NULL COMMENT '???????',
  `hourseTypeObj` int(11) NOT NULL COMMENT '???????',
  `priceRangeObj` int(11) NOT NULL COMMENT '?۸???Χ',
  `price` float NOT NULL COMMENT '?????ܳ????',
  `lianxiren` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??ϵ?',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??ϵ?绰',
  `hourseId` int(11) NOT NULL COMMENT '房屋id',
  PRIMARY KEY (`wantHourseId`) USING BTREE,
  INDEX `userObj`(`userObj`) USING BTREE,
  INDEX `position`(`position`) USING BTREE,
  INDEX `hourseTypeObj`(`hourseTypeObj`) USING BTREE,
  INDEX `priceRangeObj`(`priceRangeObj`) USING BTREE,
  CONSTRAINT `t_wanthourseinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_wanthourseinfo_ibfk_2` FOREIGN KEY (`position`) REFERENCES `t_areainfo` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_wanthourseinfo_ibfk_3` FOREIGN KEY (`hourseTypeObj`) REFERENCES `t_hoursetype` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_wanthourseinfo_ibfk_4` FOREIGN KEY (`priceRangeObj`) REFERENCES `t_pricerange` (`rangeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wanthourseinfo
-- ----------------------------
INSERT INTO `t_wanthourseinfo` VALUES (1, 'a', 'dasd', 1, 1, 1, 5555, 'wangjuaxing1', '13767092182', 0);
INSERT INTO `t_wanthourseinfo` VALUES (2, 'a', '绉熸埧鐢宠', 1, 1, 1, 1220, 'a', '1376709282', 0);
INSERT INTO `t_wanthourseinfo` VALUES (11, 'a', '绉熸埧鐢宠', 1, 1, 1, 1220, 'a', '1376709282', 2);
INSERT INTO `t_wanthourseinfo` VALUES (12, 'a', 'sad', 1, 1, 1, 5555, 'wangjuaxing1', '13767092182', 1);

SET FOREIGN_KEY_CHECKS = 1;
