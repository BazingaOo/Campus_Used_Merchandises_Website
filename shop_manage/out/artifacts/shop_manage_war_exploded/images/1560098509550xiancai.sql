/*
Navicat MySQL Data Transfer

Source Server         : xiancai
Source Server Version : 50725
Source Host           : 39.105.229.163:3306
Source Database       : xiancai

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-06-01 16:26:49
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'shen', '1111', '\\1554821355989userlogo.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('6', '2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('4', '1', '??????', '????????????', '10', '3', '\\1555163325071eg2.png', '1', 'yishangjia');
INSERT INTO `goods` VALUES ('5', '1', '??????', '??????', '30', '4', '\\1555163457261eg6.png', '1', 'yishangjia');
INSERT INTO `goods` VALUES ('6', '1', '?????????', '??????', '12', '4', '\\1555163523160eg5.png', '3', 'yishangjia');
INSERT INTO `goods` VALUES ('7', '1', '??????', '????????????', '20', '4', '\\1555163571875eg4.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('8', '1', '??????', '??????', '1', '4', '\\1555163622422eg3.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('9', '1', '??????', '??????', '12', '8', '\\1555163698386eg11.png', '1', 'yishangjia');
INSERT INTO `goods` VALUES ('10', '1', '????????????', '??????', '12', '8', '\\1555163731890eg9.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('11', '1', '????????????', '????????????', '12', '8', '\\1555163769168eg12.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('16', '1', '?????????', '??????', '12', '8', '\\1555472104732eg10.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('17', '1', '??????', '??????', '12', '8', '\\1555495221224eg8.png', '1', 'yishangjia');
INSERT INTO `goods` VALUES ('21', '1', 'oppor9', '??????', '1100', '1', '\\1555515844752eg1.png', '1', 'yixiajia');
INSERT INTO `goods` VALUES ('22', '2', 'oppor11', '????????????????????????????????????', '1111', '1', '\\11555549048809eg.png', '1', 'yishangjia');
INSERT INTO `goods` VALUES ('24', '1', '??????', '??????', '1111', '8', '\\1555545474577eg13.png', '1', 'daishenhe');
INSERT INTO `goods` VALUES ('27', '2', '??????', '??????', '12', '4', '\\1555770283544eg17.png', '12', 'yishangjia');
INSERT INTO `goods` VALUES ('28', '2', '??????', '??????????????????', '12', '8', '\\1555567451432eg14.png', '2', 'yishangjia');
INSERT INTO `goods` VALUES ('30', '1', '??????', '???????????????????????????????????????175cm???????????????L', '50', '8', '\\1555547711821eg7.png', '1', 'yixiajia');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of goodstore
-- ----------------------------
INSERT INTO `goodstore` VALUES ('1', 'xsgoodstore', '1');

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
INSERT INTO `goodtype` VALUES ('1', '????????????');
INSERT INTO `goodtype` VALUES ('2', '????????????');
INSERT INTO `goodtype` VALUES ('3', '????????????');
INSERT INTO `goodtype` VALUES ('4', '????????????');
INSERT INTO `goodtype` VALUES ('5', '????????????');
INSERT INTO `goodtype` VALUES ('6', '????????????');
INSERT INTO `goodtype` VALUES ('7', '????????????');
INSERT INTO `goodtype` VALUES ('8', '????????????');
INSERT INTO `goodtype` VALUES ('9', '??????');
INSERT INTO `goodtype` VALUES ('10', '??????');
INSERT INTO `goodtype` VALUES ('11', '????????????');
INSERT INTO `goodtype` VALUES ('12', '????????????');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '?????????????????????????????????', '2019-03-28');
INSERT INTO `message` VALUES ('9', '1', '?????????????????????????????????', '2019-04-08');

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
  `userWallet` double(50,0) DEFAULT NULL,
  `userPhone` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userConsignee` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userAdress` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `userCode` char(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '???', '1111', '??????????????????', '\\1555244742360userlogo.png', '100', '1111111111', 'yy', '??????????????????', '30000');
INSERT INTO `users` VALUES ('2', 'shen', '1111', '??????????????????', '\\1555324607982user3.png', null, null, null, null, null);
