/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : xiancai

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-06-24 14:59:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` char(20) CHARACTER SET utf8 NOT NULL,
  `adminPassword` char(20) CHARACTER SET utf8 NOT NULL,
  `adminImage` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for admin_copy
-- ----------------------------
DROP TABLE IF EXISTS `admin_copy`;
CREATE TABLE `admin_copy` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` char(20) CHARACTER SET utf8 NOT NULL,
  `adminPassword` char(20) CHARACTER SET utf8 NOT NULL,
  `adminImage` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin_copy
-- ----------------------------
INSERT INTO `admin_copy` VALUES ('1', 'shun', '1111', '\\1554821355989userlogo.png');

-- ----------------------------
-- Table structure for browsinghistory
-- ----------------------------
DROP TABLE IF EXISTS `browsinghistory`;
CREATE TABLE `browsinghistory` (
  `browseId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) NOT NULL,
  `goodName` char(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`browseId`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `browsinghistory_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of browsinghistory
-- ----------------------------

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `goodsId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for evaluateform
-- ----------------------------
DROP TABLE IF EXISTS `evaluateform`;
CREATE TABLE `evaluateform` (
  `evaluateId` int(11) NOT NULL AUTO_INCREMENT,
  `orderformId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `evaluatestatus` char(20) CHARACTER SET utf8 NOT NULL,
  `content` char(20) CHARACTER SET utf8 NOT NULL,
  `evaluateTime` date NOT NULL,
  PRIMARY KEY (`evaluateId`),
  KEY `orderformId` (`orderformId`),
  KEY `userId` (`userId`),
  CONSTRAINT `evaluateform_ibfk_1` FOREIGN KEY (`orderformId`) REFERENCES `orderform` (`orderformId`),
  CONSTRAINT `evaluateform_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of evaluateform
-- ----------------------------

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `information` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `feedback_ibfk_1` (`userId`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('5', '2', '	\r\n	1', '2019-06-23');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for goodcollection
-- ----------------------------
DROP TABLE IF EXISTS `goodcollection`;
CREATE TABLE `goodcollection` (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`),
  KEY `goodId` (`goodId`),
  KEY `userId` (`userId`),
  CONSTRAINT `goodcollection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `goodcollection_ibfk_2` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodcollection
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `goodName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `goodDescription` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `goodPrice` double(20,0) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `goodPricture` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `goodNum` int(11) DEFAULT NULL,
  `goodstate` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`goodId`),
  KEY `userId` (`userId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `goodtype` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goodstatus
-- ----------------------------
DROP TABLE IF EXISTS `goodstatus`;
CREATE TABLE `goodstatus` (
  `goodStatusId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `goodStatus` char(20) NOT NULL,
  PRIMARY KEY (`goodStatusId`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `goodstatus_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodstatus
-- ----------------------------

-- ----------------------------
-- Table structure for goodstore
-- ----------------------------
DROP TABLE IF EXISTS `goodstore`;
CREATE TABLE `goodstore` (
  `storeId` int(11) NOT NULL AUTO_INCREMENT,
  `storeName` char(20) CHARACTER SET utf8 NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`storeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `goodstore_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodstore
-- ----------------------------

-- ----------------------------
-- Table structure for goodtype
-- ----------------------------
DROP TABLE IF EXISTS `goodtype`;
CREATE TABLE `goodtype` (
  `typeId` int(11) NOT NULL,
  `typeName` char(24) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtype
-- ----------------------------
INSERT INTO `goodtype` VALUES ('1', '手机数码');
INSERT INTO `goodtype` VALUES ('2', '运动户外');
INSERT INTO `goodtype` VALUES ('3', '图书音像');
INSERT INTO `goodtype` VALUES ('4', '生活百货');
INSERT INTO `goodtype` VALUES ('5', '游戏装备');
INSERT INTO `goodtype` VALUES ('6', '生鲜水果');
INSERT INTO `goodtype` VALUES ('7', '宠物用品');
INSERT INTO `goodtype` VALUES ('8', '服饰配件');
INSERT INTO `goodtype` VALUES ('9', '乐器');
INSERT INTO `goodtype` VALUES ('10', '箱包');
INSERT INTO `goodtype` VALUES ('11', '健生器材');
INSERT INTO `goodtype` VALUES ('12', '电子产品');

-- ----------------------------
-- Table structure for greatform
-- ----------------------------
DROP TABLE IF EXISTS `greatform`;
CREATE TABLE `greatform` (
  `greatId` int(11) NOT NULL AUTO_INCREMENT,
  `evaluateId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `greatNumber` int(11) NOT NULL,
  `greatTime` date NOT NULL,
  PRIMARY KEY (`greatId`),
  KEY `evaluateId` (`evaluateId`),
  KEY `userId` (`userId`),
  CONSTRAINT `greatform_ibfk_1` FOREIGN KEY (`evaluateId`) REFERENCES `evaluateform` (`evaluateId`),
  CONSTRAINT `greatform_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of greatform
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `messageContent` char(50) CHARACTER SET utf8 NOT NULL,
  `sendTime` date NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `userId` (`userId`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `orderformId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `goodsPrice` double(20,0) NOT NULL,
  `goodsNum` int(11) NOT NULL,
  `userName` char(20) CHARACTER SET utf8 NOT NULL,
  `userTel` char(20) CHARACTER SET utf8 NOT NULL,
  `userAdd` char(20) CHARACTER SET utf8 NOT NULL,
  `buyTime` date NOT NULL,
  `getTime` date DEFAULT NULL,
  `formStatus` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `logisticsNumber` char(20) CHARACTER SET utf32 DEFAULT NULL,
  PRIMARY KEY (`orderformId`),
  KEY `goodId` (`goodId`),
  KEY `userId` (`userId`),
  CONSTRAINT `orderform_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`),
  CONSTRAINT `orderform_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orderform
-- ----------------------------

-- ----------------------------
-- Table structure for refurdform
-- ----------------------------
DROP TABLE IF EXISTS `refurdform`;
CREATE TABLE `refurdform` (
  `refurdformId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `refurdAmount` double NOT NULL,
  `refurdReason` char(20) NOT NULL,
  `applicationTime` date NOT NULL,
  `refurdNumber` char(20) NOT NULL,
  `refurdStatus` char(20) NOT NULL,
  PRIMARY KEY (`refurdformId`),
  KEY `userId` (`userId`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `refurdform_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `refurdform_ibfk_2` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refurdform
-- ----------------------------

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `goodnumber` int(11) NOT NULL,
  `total` double(20,0) NOT NULL,
  PRIMARY KEY (`carId`),
  KEY `userId` (`userId`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`),
  CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for storeconcern
-- ----------------------------
DROP TABLE IF EXISTS `storeconcern`;
CREATE TABLE `storeconcern` (
  `concernId` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`concernId`),
  KEY `userId` (`userId`),
  KEY `storeId` (`storeId`),
  CONSTRAINT `storeconcern_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `storeconcern_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `goodstore` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of storeconcern
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `userName` char(20) CHARACTER SET utf8 NOT NULL,
  `userPassword` char(20) CHARACTER SET utf8 NOT NULL,
  `userSchool` char(20) CHARACTER SET utf8 NOT NULL,
  `userImage` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `userWallet` double(50,2) DEFAULT NULL,
  `userPhone` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userConsignee` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userAdress` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userCode` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'zt', '123', '123', '\\15612590567586B7A0673617C4A09C852FA7438787522.png', '215.01', '13939934501', '张韬韬韬', '华信软件学院', '300310');
INSERT INTO `users` VALUES ('2', '张韬', '123', '天津理工大学', '\\15612585990566B7A0673617C4A09C852FA7438787522.png', '147.02', '123', '张韬韬韬', '华信软件学院4号楼', '300310');
