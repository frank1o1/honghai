/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 10.1.30-MariaDB : Database - honghai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`honghai` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `honghai`;

/*Table structure for table `fa_about` */

DROP TABLE IF EXISTS `fa_about`;

CREATE TABLE `fa_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '配图',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `fa_about` */

/*Table structure for table `fa_admin` */

DROP TABLE IF EXISTS `fa_admin`;

CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

/*Data for the table `fa_admin` */

insert  into `fa_admin`(`id`,`username`,`nickname`,`password`,`salt`,`avatar`,`email`,`loginfailure`,`logintime`,`createtime`,`updatetime`,`token`,`status`) values (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1547344803,1492186163,1547344803,'f0abf147-c5ce-4d91-a755-e29deb6c27f1','normal');

/*Table structure for table `fa_admin_log` */

DROP TABLE IF EXISTS `fa_admin_log`;

CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

/*Data for the table `fa_admin_log` */

insert  into `fa_admin_log`(`id`,`admin_id`,`username`,`url`,`title`,`content`,`ip`,`useragent`,`createtime`) values (1,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"996a8fbdf266e4606ca4e9448c66f5fe\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547209221),(2,1,'admin','/admin/auth/rule/edit/ids/85?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"banner\",\"title\":\"\\u9996\\u9875\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa fa-gear\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210079),(3,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210079),(4,1,'admin','/admin/auth/rule/multi/ids/3','','{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210092),(5,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210092),(6,1,'admin','/admin/auth/rule/multi/ids/66','','{\"action\":\"\",\"ids\":\"66\",\"params\":\"ismenu=0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210096),(7,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210096),(8,1,'admin','/admin/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"index\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210487),(9,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210487),(10,1,'admin','/admin/auth/rule/edit/ids/85?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"banner\",\"title\":\"\\u8f6e\\u64ad\\u56fe\\u7ba1\\u7406\",\"icon\":\"fa fa-gear\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210510),(11,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210510),(12,1,'admin','/admin/auth/rule/edit/ids/91?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"advantages\",\"title\":\"\\u4f18\\u52bf\\u4ecb\\u7ecd\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210526),(13,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210526),(14,1,'admin','/admin/auth/rule/edit/ids/97?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"index\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa fa-arrow-up\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"97\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210539),(15,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547210539),(16,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"1b8192dcfee212bc4fbcf5d5f8cedc65\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255512),(17,1,'admin','/admin/auth/rule/edit/ids/98?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"index\\/about\",\"title\":\"\\u5173\\u4e8e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"98\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255583),(18,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255583),(19,1,'admin','/admin/auth/rule/edit/ids/98?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"about\\/index\",\"title\":\"\\u5173\\u4e8e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"98\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255634),(20,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255634),(21,1,'admin','/admin/auth/rule/edit/ids/98?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"index\\/about\\/index\",\"title\":\"\\u5173\\u4e8e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"98\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255667),(22,1,'admin','/admin/auth/rule/edit/ids/98?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"index.about\",\"title\":\"\\u5173\\u4e8e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"98\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547255849),(23,1,'admin','/admin/auth/rule/edit/ids/104?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"\\u5173\\u4e8e\",\"title\":\"About\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"104\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256159),(24,1,'admin','/admin/auth/rule/edit/ids/104?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"97\",\"name\":\"about\",\"title\":\"\\u5173\\u4e8e\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"104\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256173),(25,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256173),(26,1,'admin','/admin/auth/rule/edit/ids/97?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"index\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa fa-home\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"97\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256215),(27,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256215),(28,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"simditor\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190111_beta\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256332),(29,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547256332),(30,1,'admin','/admin/ajax/upload','','{\"name\":\"u=4159165909,1334756567&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547257041),(31,1,'admin','/admin/auth/rule/edit/ids/109?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"service\",\"title\":\"\\u670d\\u52a1\\u4ecb\\u7ecd\",\"icon\":\"fa fa-server\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"109\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547257158),(32,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547257158),(33,1,'admin','/admin/auth/rule/edit/ids/115?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"document\",\"title\":\"\\u6848\\u4f8b\\u4ecb\\u7ecd\",\"icon\":\"fa fa-diamond\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"115\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547257907),(34,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547257907),(35,1,'admin','/admin/auth/rule/edit/ids/121?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"news\",\"title\":\"\\u65b0\\u95fb\\u52a8\\u6001\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258281),(36,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258282),(37,1,'admin','/admin/auth/rule/edit/ids/121?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"news\",\"title\":\"\\u65b0\\u95fb\\u52a8\\u6001\",\"icon\":\"fa fa-newspaper-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258300),(38,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258300),(39,1,'admin','/admin/addon/state','插件管理 禁用启用','{\"name\":\"simditor\",\"action\":\"disable\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258680),(40,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258680),(41,1,'admin','/admin/addon/state','插件管理 禁用启用','{\"name\":\"simditor\",\"action\":\"enable\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258718),(42,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258718),(43,1,'admin','/admin/addon/state','插件管理 禁用启用','{\"name\":\"simditor\",\"action\":\"disable\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258792),(44,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258792),(45,1,'admin','/admin/addon/uninstall','插件管理 卸载','{\"name\":\"simditor\",\"force\":\"0\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258794),(46,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258795),(47,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"tinymce\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190111_beta\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258802),(48,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258802),(49,1,'admin','/admin/addon/config?name=tinymce&dialog=1','插件管理 配置','{\"name\":\"tinymce\",\"dialog\":\"1\",\"row\":{\"language\":\"zh_CN\",\"toolbar\":\"1\",\"subDom\":\":button[type=submit],input[type=submit]\",\"plugins\":[\"\"]}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258824),(50,1,'admin','/admin/ajax/upload','','{\"name\":\"u=4159165909,1334756567&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547258848),(51,1,'admin','/admin/category/selectpage','','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"news_trends\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547259126),(52,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547259298),(53,1,'admin','/admin/auth/rule/del/ids/171','权限管理 菜单规则 删除','{\"action\":\"del\",\"ids\":\"171\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547261785),(54,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547261785),(55,1,'admin','/admin/auth/rule/edit/ids/134?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"title\":\"introduce\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547261796),(56,1,'admin','/admin/auth/rule/edit/ids/134?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"introduce\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547261805),(57,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547261806),(58,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"address\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.2\",\"faversion\":\"1.0.0.20190111_beta\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547262127),(59,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547262127),(60,1,'admin','/admin/auth/rule/edit/ids/184?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"contact\",\"title\":\"\\u8054\\u7cfb\\u6211\\u4eec\",\"icon\":\"fa fa-phone\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"184\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547262541),(61,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547262542),(62,1,'admin','/admin/auth/rule/add?dialog=1','权限管理 菜单规则 添加','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"connect\",\"title\":\"\\u8054\\u7cfb\\u6211\\u4eec\",\"icon\":\"fa fa-phone-square\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263062),(63,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263062),(64,1,'admin','/admin/auth/rule/edit/ids/184?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"196\",\"name\":\"contact\",\"title\":\"\\u57fa\\u672c\\u4fe1\\u606f\",\"icon\":\"fa fa-address-card-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"184\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263092),(65,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263092),(66,1,'admin','/admin/auth/rule/edit/ids/190?dialog=1','权限管理 菜单规则 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"196\",\"name\":\"link\",\"title\":\"\\u8054\\u7cfb\\u6a21\\u5757\",\"icon\":\"fa fa-link\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"190\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263115),(67,1,'admin','/admin/index/index','','{\"action\":\"refreshmenu\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263116),(68,1,'admin','/admin/addon/config?name=address&dialog=1','插件管理 配置','{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"amap\",\"location\":\"\\u5317\\u4eac\",\"zoom\":\"12\",\"lat\":\"39.919990\",\"lng\":\"116.456270\",\"baidukey\":\"hAeMFHmpyHa2ZjaCH9VVridl\",\"amapkey\":\"608d75903d29ad471362f8c58c550daf\",\"tencentkey\":\"608d75903d29ad471362f8c58c550daf\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263410),(69,1,'admin','/admin/addon/config?name=address&dialog=1','插件管理 配置','{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"tencent\",\"location\":\"\\u6df1\\u5733\",\"zoom\":\"12\",\"lat\":\"39.919990\",\"lng\":\"116.456270\",\"baidukey\":\"hAeMFHmpyHa2ZjaCH9VVridl\",\"amapkey\":\"608d75903d29ad471362f8c58c550daf\",\"tencentkey\":\"608d75903d29ad471362f8c58c550daf\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263571),(70,1,'admin','/admin/addon/config?name=address&dialog=1','插件管理 配置','{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"baidu\",\"location\":\"\\u6df1\\u5733\",\"zoom\":\"12\",\"lat\":\"39.919990\",\"lng\":\"116.456270\",\"baidukey\":\"hAeMFHmpyHa2ZjaCH9VVridl\",\"amapkey\":\"608d75903d29ad471362f8c58c550daf\",\"tencentkey\":\"608d75903d29ad471362f8c58c550daf\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547263776),(71,1,'admin','/admin/contact/add?dialog=1','联系我们 基本信息 添加','{\"dialog\":\"1\",\"row\":{\"email\":\"1363049691@qq.com\",\"mobile\":\"18932135697\",\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u5357\\u5c71\\u533a\\u9ad8\\u65b0\\u5357\\u4e5d\\u9053\",\"longitude\":\"113.948296\",\"latitude\":\"22.533573\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547264051),(72,1,'admin','/admin/addon/config?name=address&dialog=1','插件管理 配置','{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"amap\",\"location\":\"\\u6df1\\u5733\",\"zoom\":\"12\",\"lat\":\"39.919990\",\"lng\":\"116.456270\",\"baidukey\":\"hAeMFHmpyHa2ZjaCH9VVridl\",\"amapkey\":\"608d75903d29ad471362f8c58c550daf\",\"tencentkey\":\"608d75903d29ad471362f8c58c550daf\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547264096),(73,1,'admin','/admin/addon/config?name=address&dialog=1','插件管理 配置','{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"baidu\",\"location\":\"\\u6df1\\u5733\",\"zoom\":\"12\",\"lat\":\"39.919990\",\"lng\":\"116.456270\",\"baidukey\":\"hAeMFHmpyHa2ZjaCH9VVridl\",\"amapkey\":\"608d75903d29ad471362f8c58c550daf\",\"tencentkey\":\"608d75903d29ad471362f8c58c550daf\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547264173),(74,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0',1547264357),(75,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"162a3dfea729bc2482f2be4194251b99\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547300332),(76,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"09c4199980c4ab69aa27831aeb96b3f4\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547344803),(77,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345079),(78,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"123123124\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"1214214214244214214214\",\"content\":\"<p>1421111111111144444444422222222222222222222214142412<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345093),(79,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345118),(80,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"wqeqwqwrqwr\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qrqwrqwrwqrqrqrwq\",\"content\":\"<p>qrqwrwqrqwrqwrqwr<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345125),(81,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345133),(82,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qrqwrqwrqwrqwrqw\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qrqwrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr\",\"content\":\"<p>qwrqwrqwrqrqrqwrwqrwqrwqrqrqw<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345142),(83,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345155),(84,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qrqwrqwrqwrqwrqw\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qrwwwwwwwwwwwwwwwwwrq\",\"content\":\"<p>qwrrrrrrrrrrrrrrrrrrrrrr<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345161),(85,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345169),(86,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"wrqrwqrwqrqwrrwqrwqrwqrwqr\",\"content\":\"<p>qrqwrwrwqwrqwrwqrqw<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345177),(87,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345186),(88,1,'admin','/admin/service/add?dialog=1','服务介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qwewqeqwewqeqweqwe\",\"content\":\"<p>qweqwewqewqeqweqwe<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547345192),(89,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346496),(90,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qrqwrqwrqwrqwrqw\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qweqweqweqweqweqwe\",\"content\":\"<p>qwewqewqeqweqeqw<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346504),(91,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346528),(92,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"weqwewqewqewq\",\"content\":\"<p>qweqwewqewqewq<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346533),(93,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346541),(94,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"wqeqeqwewqewqeqweqw\",\"content\":\"<p>qweqwewqewqeqw<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346547),(95,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346554),(96,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qrqwrqwrqwrqwrqw\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qweqweqwewqeqw\",\"content\":\"<p>wqeqwewqewqewq<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346559),(97,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346567),(98,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"wqewqewqewqewq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"ewqewqewqeqwewq\",\"content\":\"<p>qwewqeqweqwewq<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346572),(99,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346578),(100,1,'admin','/admin/document/add?dialog=1','案例介绍 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qweqweqwewqewqewq\",\"content\":\"<p>wqeqwewqeqwewqe<\\/p>\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346583),(101,1,'admin','/admin/news/category/add?dialog=1','新闻动态 分类 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"name\":\"eqwewqeqw\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346783),(102,1,'admin','/admin/news/category/add?dialog=1','新闻动态 分类 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"name\":\"qwewqeqwewq\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346788),(103,1,'admin','/admin/news/category/add?dialog=1','新闻动态 分类 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"name\":\"fsdfdfdfds\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346793),(104,1,'admin','/admin/news/category/add?dialog=1','新闻动态 分类 添加','{\"dialog\":\"1\",\"row\":{\"weigh\":\"100\",\"name\":\"eqwewqeqweqw\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346796),(105,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346805),(106,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346815),(107,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"1\",\"title\":\"eqweqwewqe\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qwewqeqwewqewqeqw\",\"content\":\"<p>qeqweqwewqewqewqewq<\\/p>\",\"status_switch\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346823),(108,1,'admin','/admin/news/trends/multi/ids/1','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"1\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346827),(109,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346838),(110,1,'admin','/admin/news/trends/edit/ids/1?dialog=1','新闻动态 动态 编辑','{\"dialog\":\"1\",\"row\":{\"category_id\":\"1\",\"title\":\"eqweqwewqe\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"qwewqeqwewqewqeqw\",\"content\":\"<p>qeqweqwewqewqewqewq<\\/p>\",\"status_switch\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346842),(111,1,'admin','/admin/news/trends/multi/ids/1','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"1\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346847),(112,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346862),(113,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346868),(114,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"3\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"werewrewrew\",\"content\":\"<p>rewrewrewrewrw<\\/p>\",\"status_switch\":\"0\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346874),(115,1,'admin','/admin/news/trends/multi/ids/2','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346877),(116,1,'admin','/admin/news/trends/multi/ids/2','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346880),(117,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"3\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"3\",\"searchField\":[\"name\"]}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346883),(118,1,'admin','/admin/news/trends/multi/ids/2','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346889),(119,1,'admin','/admin/news/trends/multi/ids/2','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346906),(120,1,'admin','/admin/news/trends/multi/ids/2','新闻动态 动态 批量更新','{\"action\":\"\",\"ids\":\"2\",\"params\":\"status_switch=1\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346955),(121,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346959),(122,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"2\",\"title\":\"qrqwrqwrqwrqwrqw\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"asdsadsadasdasdas\",\"content\":\"<p>asdasdasdasdsadas<\\/p>\",\"status_switch\":\"0\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346968),(123,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346972),(124,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346981),(125,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"4\",\"title\":\"asdsadsadsad\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"dsadsadsadsadsad\",\"content\":\"<p>saddsadsadsadasdasd<\\/p>\",\"status_switch\":\"0\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346986),(126,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547346990),(127,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"2\",\"title\":\"qqqqqqqqqqqqqqqqqqqqq\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"gsdgsdgsdgdsgsdg\",\"content\":\"<p>gdsgdsgsdgsdgsdg<\\/p>\",\"status_switch\":\"0\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547347000),(128,1,'admin','/admin/news/category/index','新闻动态 分类 查看','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547347004),(129,1,'admin','/admin/ajax/upload','','{\"name\":\"u=967395617,3601302195&amp;fm=26&amp;gp=0.jpg\"}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547347013),(130,1,'admin','/admin/news/trends/add?dialog=1','新闻动态 动态 添加','{\"dialog\":\"1\",\"row\":{\"category_id\":\"2\",\"title\":\"sdgdsgdsgsdgsd\",\"image\":\"\\/uploads\\/20190113\\/613764965ee87efe9bc872433ff9273b.jpg\",\"summary\":\"sdgdsgdsgsdgsdgds\",\"content\":\"<p>sdgsdgsdgdsgsdgsd<\\/p>\",\"status_switch\":\"1\"}}','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',1547347023);

/*Table structure for table `fa_advantages` */

DROP TABLE IF EXISTS `fa_advantages`;

CREATE TABLE `fa_advantages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT '图标',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='优势介绍';

/*Data for the table `fa_advantages` */

/*Table structure for table `fa_attachment` */

DROP TABLE IF EXISTS `fa_attachment`;

CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

/*Data for the table `fa_attachment` */

insert  into `fa_attachment`(`id`,`admin_id`,`user_id`,`url`,`imagewidth`,`imageheight`,`imagetype`,`imageframes`,`filesize`,`mimetype`,`extparam`,`createtime`,`updatetime`,`uploadtime`,`storage`,`sha1`) values (1,1,0,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,1,0,'/uploads/20190112/7614295277c0c5c7b79667678dfa056f.jpg','500','461','jpg',0,52297,'image/jpeg','',1547257041,1547257041,1547257041,'local','4198f9ca6a5b9ed3b60703e1ecf8d158f235f0a5'),(3,1,0,'/uploads/20190112/7614295277c0c5c7b79667678dfa056f.jpg','500','461','jpg',0,52297,'image/jpeg','',1547258847,1547258847,1547258847,'local','4198f9ca6a5b9ed3b60703e1ecf8d158f235f0a5'),(4,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345079,1547345079,1547345079,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(5,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345118,1547345118,1547345118,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(6,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345133,1547345133,1547345133,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(7,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345154,1547345154,1547345154,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(8,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345169,1547345169,1547345169,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(9,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547345186,1547345186,1547345186,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(10,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346496,1547346496,1547346496,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(11,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346528,1547346528,1547346527,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(12,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346541,1547346541,1547346541,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(13,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346554,1547346554,1547346554,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(14,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346567,1547346567,1547346567,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(15,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346578,1547346578,1547346578,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(16,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346815,1547346815,1547346815,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(17,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346868,1547346868,1547346868,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(18,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547346981,1547346981,1547346981,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649'),(19,1,0,'/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','500','375','jpg',0,56522,'image/jpeg','',1547347013,1547347013,1547347013,'local','ecbdbff9a46e434fd24ee2e0c748030a70583649');

/*Table structure for table `fa_auth_group` */

DROP TABLE IF EXISTS `fa_auth_group`;

CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

/*Data for the table `fa_auth_group` */

insert  into `fa_auth_group`(`id`,`pid`,`name`,`rules`,`createtime`,`updatetime`,`status`) values (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');

/*Table structure for table `fa_auth_group_access` */

DROP TABLE IF EXISTS `fa_auth_group_access`;

CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

/*Data for the table `fa_auth_group_access` */

insert  into `fa_auth_group_access`(`uid`,`group_id`) values (1,1);

/*Table structure for table `fa_auth_rule` */

DROP TABLE IF EXISTS `fa_auth_rule`;

CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

/*Data for the table `fa_auth_rule` */

insert  into `fa_auth_rule`(`id`,`type`,`pid`,`name`,`title`,`icon`,`condition`,`remark`,`ismenu`,`createtime`,`updatetime`,`weigh`,`status`) values (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-list','','Category tips',0,1497429920,1547210092,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'user','User','fa fa-list','','',0,1516374729,1547210096,0,'normal'),(67,'file',66,'user/user','User','fa fa-user','','',1,1516374729,1516374729,0,'normal'),(68,'file',67,'user/user/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(70,'file',67,'user/user/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(71,'file',67,'user/user/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(73,'file',66,'user/group','User group','fa fa-users','','',1,1516374729,1516374729,0,'normal'),(74,'file',73,'user/group/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(76,'file',73,'user/group/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(77,'file',73,'user/group/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(79,'file',66,'user/rule','User rule','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),(80,'file',79,'user/rule/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(85,'file',97,'banner','轮播图管理','fa fa-gear','','',1,1547209364,1547210510,0,'normal'),(86,'file',85,'banner/index','查看','fa fa-circle-o','','',0,1547209364,1547210032,0,'normal'),(87,'file',85,'banner/add','添加','fa fa-circle-o','','',0,1547209364,1547210032,0,'normal'),(88,'file',85,'banner/edit','编辑','fa fa-circle-o','','',0,1547209364,1547210032,0,'normal'),(89,'file',85,'banner/del','删除','fa fa-circle-o','','',0,1547209364,1547210032,0,'normal'),(90,'file',85,'banner/multi','批量更新','fa fa-circle-o','','',0,1547209364,1547210032,0,'normal'),(91,'file',97,'advantages','优势介绍','fa fa-circle-o','','',1,1547210441,1547210526,0,'normal'),(92,'file',91,'advantages/index','查看','fa fa-circle-o','','',0,1547210441,1547210441,0,'normal'),(93,'file',91,'advantages/add','添加','fa fa-circle-o','','',0,1547210441,1547210441,0,'normal'),(94,'file',91,'advantages/edit','编辑','fa fa-circle-o','','',0,1547210441,1547210441,0,'normal'),(95,'file',91,'advantages/del','删除','fa fa-circle-o','','',0,1547210441,1547210441,0,'normal'),(96,'file',91,'advantages/multi','批量更新','fa fa-circle-o','','',0,1547210441,1547210441,0,'normal'),(97,'file',0,'index','首页','fa fa-home','','',1,1547210487,1547256215,0,'normal'),(98,'file',104,'about/index','查看','fa fa-circle-o','','',0,1547210763,1547256053,0,'normal'),(99,'file',98,'index/about/index','查看','fa fa-circle-o','','',0,1547210764,1547210764,0,'normal'),(100,'file',98,'index/about/add','添加','fa fa-circle-o','','',0,1547210764,1547210764,0,'normal'),(101,'file',98,'index/about/edit','编辑','fa fa-circle-o','','',0,1547210764,1547210764,0,'normal'),(102,'file',98,'index/about/del','删除','fa fa-circle-o','','',0,1547210764,1547210764,0,'normal'),(103,'file',98,'index/about/multi','批量更新','fa fa-circle-o','','',0,1547210764,1547210764,0,'normal'),(104,'file',97,'about','关于','fa fa-circle-o','','',1,1547256053,1547256173,0,'normal'),(105,'file',104,'about/add','添加','fa fa-circle-o','','',0,1547256053,1547256053,0,'normal'),(106,'file',104,'about/edit','编辑','fa fa-circle-o','','',0,1547256053,1547256053,0,'normal'),(107,'file',104,'about/del','删除','fa fa-circle-o','','',0,1547256053,1547256053,0,'normal'),(108,'file',104,'about/multi','批量更新','fa fa-circle-o','','',0,1547256053,1547256053,0,'normal'),(109,'file',0,'service','服务介绍','fa fa-server','','',1,1547257017,1547257158,0,'normal'),(110,'file',109,'service/index','查看','fa fa-circle-o','','',0,1547257017,1547257433,0,'normal'),(111,'file',109,'service/add','添加','fa fa-circle-o','','',0,1547257017,1547257433,0,'normal'),(112,'file',109,'service/edit','编辑','fa fa-circle-o','','',0,1547257017,1547257433,0,'normal'),(113,'file',109,'service/del','删除','fa fa-circle-o','','',0,1547257017,1547257433,0,'normal'),(114,'file',109,'service/multi','批量更新','fa fa-circle-o','','',0,1547257017,1547257433,0,'normal'),(115,'file',0,'document','案例介绍','fa fa-diamond','','',1,1547257860,1547257907,0,'normal'),(116,'file',115,'document/index','查看','fa fa-circle-o','','',0,1547257860,1547257860,0,'normal'),(117,'file',115,'document/add','添加','fa fa-circle-o','','',0,1547257860,1547257860,0,'normal'),(118,'file',115,'document/edit','编辑','fa fa-circle-o','','',0,1547257860,1547257860,0,'normal'),(119,'file',115,'document/del','删除','fa fa-circle-o','','',0,1547257860,1547257860,0,'normal'),(120,'file',115,'document/multi','批量更新','fa fa-circle-o','','',0,1547257860,1547257860,0,'normal'),(121,'file',0,'news','新闻动态','fa fa-newspaper-o','','',1,1547258256,1547258300,0,'normal'),(122,'file',121,'news/category','分类','fa fa-circle-o\r','','',1,1547258256,1547258256,0,'normal'),(123,'file',122,'news/category/index','查看','fa fa-circle-o','','',0,1547258256,1547258256,0,'normal'),(124,'file',122,'news/category/add','添加','fa fa-circle-o','','',0,1547258256,1547258256,0,'normal'),(125,'file',122,'news/category/edit','编辑','fa fa-circle-o','','',0,1547258256,1547258256,0,'normal'),(126,'file',122,'news/category/del','删除','fa fa-circle-o','','',0,1547258256,1547258256,0,'normal'),(127,'file',122,'news/category/multi','批量更新','fa fa-circle-o','','',0,1547258256,1547258256,0,'normal'),(128,'file',121,'news/trends','动态','fa fa-circle-o\r','','',1,1547259105,1547259105,0,'normal'),(129,'file',128,'news/trends/index','查看','fa fa-circle-o','','',0,1547259105,1547259105,0,'normal'),(130,'file',128,'news/trends/add','添加','fa fa-circle-o','','',0,1547259105,1547259105,0,'normal'),(131,'file',128,'news/trends/edit','编辑','fa fa-circle-o','','',0,1547259105,1547259105,0,'normal'),(132,'file',128,'news/trends/del','删除','fa fa-circle-o','','',0,1547259105,1547259105,0,'normal'),(133,'file',128,'news/trends/multi','批量更新','fa fa-circle-o','','',0,1547259105,1547259105,0,'normal'),(134,'file',0,'introduce','关于我们','fa fa-list','','',1,1547261440,1547261805,0,'normal'),(135,'file',134,'introduce/top','顶部介绍','fa fa-circle-o\r','','',1,1547261440,1547261440,0,'normal'),(136,'file',135,'introduce/top/index','查看','fa fa-circle-o','','',0,1547261440,1547261440,0,'normal'),(137,'file',135,'introduce/top/add','添加','fa fa-circle-o','','',0,1547261440,1547261440,0,'normal'),(138,'file',135,'introduce/top/edit','编辑','fa fa-circle-o','','',0,1547261440,1547261440,0,'normal'),(139,'file',135,'introduce/top/del','删除','fa fa-circle-o','','',0,1547261440,1547261440,0,'normal'),(140,'file',135,'introduce/top/multi','批量更新','fa fa-circle-o','','',0,1547261440,1547261440,0,'normal'),(141,'file',134,'introduce/block','顶部介绍模块','fa fa-circle-o\r','','',1,1547261462,1547261462,0,'normal'),(142,'file',141,'introduce/block/index','查看','fa fa-circle-o','','',0,1547261462,1547261462,0,'normal'),(143,'file',141,'introduce/block/add','添加','fa fa-circle-o','','',0,1547261462,1547261462,0,'normal'),(144,'file',141,'introduce/block/edit','编辑','fa fa-circle-o','','',0,1547261462,1547261462,0,'normal'),(145,'file',141,'introduce/block/del','删除','fa fa-circle-o','','',0,1547261462,1547261462,0,'normal'),(146,'file',141,'introduce/block/multi','批量更新','fa fa-circle-o','','',0,1547261462,1547261462,0,'normal'),(147,'file',134,'introduce/team','企业团队','fa fa-circle-o\r','','',1,1547261472,1547261472,0,'normal'),(148,'file',147,'introduce/team/index','查看','fa fa-circle-o','','',0,1547261472,1547261472,0,'normal'),(149,'file',147,'introduce/team/add','添加','fa fa-circle-o','','',0,1547261472,1547261472,0,'normal'),(150,'file',147,'introduce/team/edit','编辑','fa fa-circle-o','','',0,1547261472,1547261472,0,'normal'),(151,'file',147,'introduce/team/del','删除','fa fa-circle-o','','',0,1547261472,1547261472,0,'normal'),(152,'file',147,'introduce/team/multi','批量更新','fa fa-circle-o','','',0,1547261472,1547261472,0,'normal'),(153,'file',134,'introduce/member','成员介绍','fa fa-circle-o\r','','',1,1547261484,1547261484,0,'normal'),(154,'file',153,'introduce/member/index','查看','fa fa-circle-o','','',0,1547261484,1547261484,0,'normal'),(155,'file',153,'introduce/member/add','添加','fa fa-circle-o','','',0,1547261484,1547261484,0,'normal'),(156,'file',153,'introduce/member/edit','编辑','fa fa-circle-o','','',0,1547261484,1547261484,0,'normal'),(157,'file',153,'introduce/member/del','删除','fa fa-circle-o','','',0,1547261484,1547261484,0,'normal'),(158,'file',153,'introduce/member/multi','批量更新','fa fa-circle-o','','',0,1547261484,1547261484,0,'normal'),(159,'file',134,'introduce/videos','企业视频','fa fa-circle-o\r','','',1,1547261500,1547261500,0,'normal'),(160,'file',159,'introduce/videos/index','查看','fa fa-circle-o','','',0,1547261500,1547261500,0,'normal'),(161,'file',159,'introduce/videos/add','添加','fa fa-circle-o','','',0,1547261500,1547261500,0,'normal'),(162,'file',159,'introduce/videos/edit','编辑','fa fa-circle-o','','',0,1547261500,1547261500,0,'normal'),(163,'file',159,'introduce/videos/del','删除','fa fa-circle-o','','',0,1547261500,1547261500,0,'normal'),(164,'file',159,'introduce/videos/multi','批量更新','fa fa-circle-o','','',0,1547261500,1547261500,0,'normal'),(165,'file',134,'introduce/development','发展历程','fa fa-circle-o\r','','',1,1547261513,1547261513,0,'normal'),(166,'file',165,'introduce/development/index','查看','fa fa-circle-o','','',0,1547261513,1547261513,0,'normal'),(167,'file',165,'introduce/development/add','添加','fa fa-circle-o','','',0,1547261513,1547261513,0,'normal'),(168,'file',165,'introduce/development/edit','编辑','fa fa-circle-o','','',0,1547261513,1547261513,0,'normal'),(169,'file',165,'introduce/development/del','删除','fa fa-circle-o','','',0,1547261513,1547261513,0,'normal'),(170,'file',165,'introduce/development/multi','批量更新','fa fa-circle-o','','',0,1547261513,1547261513,0,'normal'),(178,'file',134,'introduce/series','历程介绍','fa fa-circle-o\r','','',1,1547261757,1547261757,0,'normal'),(179,'file',178,'introduce/series/index','查看','fa fa-circle-o','','',0,1547261757,1547261757,0,'normal'),(180,'file',178,'introduce/series/add','添加','fa fa-circle-o','','',0,1547261757,1547261757,0,'normal'),(181,'file',178,'introduce/series/edit','编辑','fa fa-circle-o','','',0,1547261757,1547261757,0,'normal'),(182,'file',178,'introduce/series/del','删除','fa fa-circle-o','','',0,1547261757,1547261757,0,'normal'),(183,'file',178,'introduce/series/multi','批量更新','fa fa-circle-o','','',0,1547261757,1547261757,0,'normal'),(184,'file',196,'contact','基本信息','fa fa-address-card-o','','',1,1547262500,1547263092,0,'normal'),(185,'file',184,'contact/index','查看','fa fa-circle-o','','',0,1547262500,1547262500,0,'normal'),(186,'file',184,'contact/add','添加','fa fa-circle-o','','',0,1547262500,1547262500,0,'normal'),(187,'file',184,'contact/edit','编辑','fa fa-circle-o','','',0,1547262500,1547262500,0,'normal'),(188,'file',184,'contact/del','删除','fa fa-circle-o','','',0,1547262500,1547262500,0,'normal'),(189,'file',184,'contact/multi','批量更新','fa fa-circle-o','','',0,1547262500,1547262500,0,'normal'),(190,'file',196,'link','联系模块','fa fa-link','','',1,1547262877,1547263115,0,'normal'),(191,'file',190,'link/index','查看','fa fa-circle-o','','',0,1547262877,1547262877,0,'normal'),(192,'file',190,'link/add','添加','fa fa-circle-o','','',0,1547262877,1547262877,0,'normal'),(193,'file',190,'link/edit','编辑','fa fa-circle-o','','',0,1547262877,1547262877,0,'normal'),(194,'file',190,'link/del','删除','fa fa-circle-o','','',0,1547262877,1547262877,0,'normal'),(195,'file',190,'link/multi','批量更新','fa fa-circle-o','','',0,1547262877,1547262877,0,'normal'),(196,'file',0,'connect','联系我们','fa fa-phone-square','','',1,1547263062,1547263062,0,'normal');

/*Table structure for table `fa_banner` */

DROP TABLE IF EXISTS `fa_banner`;

CREATE TABLE `fa_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='首页轮播图管理';

/*Data for the table `fa_banner` */

/*Table structure for table `fa_category` */

DROP TABLE IF EXISTS `fa_category`;

CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

/*Data for the table `fa_category` */

insert  into `fa_category`(`id`,`pid`,`type`,`name`,`nickname`,`flag`,`image`,`keywords`,`description`,`diyname`,`createtime`,`updatetime`,`weigh`,`status`) values (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1495262336,1499681850,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1495262391,1495262391,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1497015727,1497015727,12,'normal'),(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1497015738,1497015738,13,'normal');

/*Table structure for table `fa_config` */

DROP TABLE IF EXISTS `fa_config`;

CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

/*Data for the table `fa_config` */

insert  into `fa_config`(`id`,`name`,`group`,`title`,`tip`,`type`,`value`,`content`,`rule`,`extend`) values (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');

/*Table structure for table `fa_contact` */

DROP TABLE IF EXISTS `fa_contact`;

CREATE TABLE `fa_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='联系我们';

/*Data for the table `fa_contact` */

insert  into `fa_contact`(`id`,`email`,`mobile`,`address`,`longitude`,`latitude`) values (1,'1363049691@qq.com','18932135697','广东省深圳市南山区高新南九道','113.948296','22.533573');

/*Table structure for table `fa_document` */

DROP TABLE IF EXISTS `fa_document`;

CREATE TABLE `fa_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT '100' COMMENT '排序',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `summary` text COMMENT '简介',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='案例介绍';

/*Data for the table `fa_document` */

insert  into `fa_document`(`id`,`weigh`,`title`,`image`,`summary`,`content`) values (1,1,'qrqwrqwrqwrqwrqw','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qweqweqweqweqweqwe','<p>qwewqewqeqweqeqw</p>'),(2,2,'qqqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','weqwewqewqewq','<p>qweqwewqewqewq</p>'),(3,3,'qqqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','wqeqeqwewqewqeqweqw','<p>qweqwewqewqeqw</p>'),(4,4,'qrqwrqwrqwrqwrqw','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qweqweqwewqeqw','<p>wqeqwewqewqewq</p>'),(5,5,'wqewqewqewqewq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','ewqewqewqeqwewq','<p>qwewqeqweqwewq</p>'),(6,6,'qqqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qweqweqwewqewqewq','<p>wqeqwewqeqwewqe</p>');

/*Table structure for table `fa_ems` */

DROP TABLE IF EXISTS `fa_ems`;

CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

/*Data for the table `fa_ems` */

/*Table structure for table `fa_introduce_block` */

DROP TABLE IF EXISTS `fa_introduce_block`;

CREATE TABLE `fa_introduce_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT '100' COMMENT '排序',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `summary` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='顶部介绍模块';

/*Data for the table `fa_introduce_block` */

/*Table structure for table `fa_introduce_development` */

DROP TABLE IF EXISTS `fa_introduce_development`;

CREATE TABLE `fa_introduce_development` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `summary` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='发展历程';

/*Data for the table `fa_introduce_development` */

/*Table structure for table `fa_introduce_member` */

DROP TABLE IF EXISTS `fa_introduce_member`;

CREATE TABLE `fa_introduce_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT '100' COMMENT '排序',
  `name` varchar(5) DEFAULT NULL COMMENT '名字',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `post` varchar(20) DEFAULT NULL COMMENT '职位',
  `summary` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='成员介绍';

/*Data for the table `fa_introduce_member` */

/*Table structure for table `fa_introduce_series` */

DROP TABLE IF EXISTS `fa_introduce_series`;

CREATE TABLE `fa_introduce_series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `description` varchar(100) DEFAULT NULL COMMENT '介绍',
  `occur_date` date DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='历程介绍';

/*Data for the table `fa_introduce_series` */

/*Table structure for table `fa_introduce_team` */

DROP TABLE IF EXISTS `fa_introduce_team`;

CREATE TABLE `fa_introduce_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `summary` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='企业团队';

/*Data for the table `fa_introduce_team` */

/*Table structure for table `fa_introduce_top` */

DROP TABLE IF EXISTS `fa_introduce_top`;

CREATE TABLE `fa_introduce_top` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `summary` text COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='顶部介绍';

/*Data for the table `fa_introduce_top` */

/*Table structure for table `fa_introduce_videos` */

DROP TABLE IF EXISTS `fa_introduce_videos`;

CREATE TABLE `fa_introduce_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT NULL COMMENT '排序',
  `file` varchar(255) DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='企业视频';

/*Data for the table `fa_introduce_videos` */

/*Table structure for table `fa_link` */

DROP TABLE IF EXISTS `fa_link`;

CREATE TABLE `fa_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT NULL COMMENT '排序',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图标',
  `name` varchar(10) DEFAULT NULL COMMENT '联系人名称',
  `email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系人联系方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='联系模块';

/*Data for the table `fa_link` */

/*Table structure for table `fa_news_category` */

DROP TABLE IF EXISTS `fa_news_category`;

CREATE TABLE `fa_news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT '100' COMMENT '排序',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='分类';

/*Data for the table `fa_news_category` */

insert  into `fa_news_category`(`id`,`weigh`,`name`) values (1,1,'eqwewqeqw'),(2,2,'qwewqeqwewq'),(3,3,'fsdfdfdfds'),(4,4,'eqwewqeqweqw');

/*Table structure for table `fa_news_trends` */

DROP TABLE IF EXISTS `fa_news_trends`;

CREATE TABLE `fa_news_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL COMMENT '分类',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `summary` text COMMENT '简介',
  `content` text COMMENT '内容',
  `satus_switch` enum('0','1') DEFAULT '0' COMMENT '发布状态:0=未发布,1=发布',
  `createtime` int(10) DEFAULT NULL COMMENT '发表时间',
  `favor` int(10) DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='动态';

/*Data for the table `fa_news_trends` */

insert  into `fa_news_trends`(`id`,`category_id`,`title`,`image`,`summary`,`content`,`satus_switch`,`createtime`,`favor`) values (1,1,'eqweqwewqe','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qwewqeqwewqewqeqw','<p>qeqweqwewqewqewqewq</p>','1',1547346823,0),(2,3,'qqqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','werewrewrew','<p>rewrewrewrewrw</p>','1',1547346874,32),(3,2,'qrqwrqwrqwrqwrqw','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','asdsadsadasdasdas','<p>asdasdasdasdsadas</p>','1',1547346968,30),(4,4,'asdsadsadsad','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','dsadsadsadsadsad','<p>saddsadsadsadasdasd</p>','1',1547346986,17),(5,2,'qqqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','gsdgsdgsdgdsgsdg','<p>gdsgdsgsdgsdgsdg</p>','1',1547347000,0),(6,2,'sdgdsgdsgsdgsd','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','sdgdsgdsgsdgsdgds','<p>sdgsdgsdgdsgsdgsd</p>','1',1547347023,0);

/*Table structure for table `fa_service` */

DROP TABLE IF EXISTS `fa_service`;

CREATE TABLE `fa_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weigh` int(10) DEFAULT '100' COMMENT '排序',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `summary` text COMMENT '简介',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='服务介绍';

/*Data for the table `fa_service` */

insert  into `fa_service`(`id`,`weigh`,`title`,`image`,`summary`,`content`) values (1,1,'123123124','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','1214214214244214214214','<p>1421111111111144444444422222222222222222222214142412</p>'),(2,2,'wqeqwqwrqwr','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qrqwrqwrwqrqrqrwq','<p>qrqwrwqrqwrqwrqwr</p>'),(3,3,'qrqwrqwrqwrqwrqw','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qrqwrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','<p>qwrqwrqwrqrqrqwrwqrwqrwqrqrqw</p>'),(4,4,'qrqwrqwrqwrqwrqw','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qrwwwwwwwwwwwwwwwwwrq','<p>qwrrrrrrrrrrrrrrrrrrrrrr</p>'),(5,5,'qqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','wrqrwqrwqrqwrrwqrwqrwqrwqr','<p>qrqwrwrwqwrqwrwqrqw</p>'),(6,6,'qqqqqqqqqqqqqqqqqqqq','/uploads/20190113/613764965ee87efe9bc872433ff9273b.jpg','qwewqeqwewqeqweqwe','<p>qweqwewqewqeqweqwe</p>');

/*Table structure for table `fa_sms` */

DROP TABLE IF EXISTS `fa_sms`;

CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

/*Data for the table `fa_sms` */

/*Table structure for table `fa_test` */

DROP TABLE IF EXISTS `fa_test`;

CREATE TABLE `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

/*Data for the table `fa_test` */

insert  into `fa_test`(`id`,`admin_id`,`category_id`,`category_ids`,`week`,`flag`,`genderdata`,`hobbydata`,`title`,`content`,`image`,`images`,`attachfile`,`keywords`,`description`,`city`,`price`,`views`,`startdate`,`activitytime`,`year`,`times`,`refreshtime`,`createtime`,`updatetime`,`weigh`,`switch`,`status`,`state`) values (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,0,1,'normal','1');

/*Table structure for table `fa_user` */

DROP TABLE IF EXISTS `fa_user`;

CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

/*Data for the table `fa_user` */

insert  into `fa_user`(`id`,`group_id`,`username`,`nickname`,`password`,`salt`,`email`,`mobile`,`avatar`,`level`,`gender`,`birthday`,`bio`,`money`,`score`,`successions`,`maxsuccessions`,`prevtime`,`logintime`,`loginip`,`loginfailure`,`joinip`,`jointime`,`createtime`,`updatetime`,`token`,`status`,`verification`) values (1,1,'admin','admin','c13f62012fd6a8fdf06b3452a94430e5','rpR6Bv','admin@163.com','13888888888','/assets/img/avatar.png',0,0,'2017-04-15','','0.00',0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1516171614,'','normal','');

/*Table structure for table `fa_user_group` */

DROP TABLE IF EXISTS `fa_user_group`;

CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';

/*Data for the table `fa_user_group` */

insert  into `fa_user_group`(`id`,`name`,`rules`,`createtime`,`updatetime`,`status`) values (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');

/*Table structure for table `fa_user_money_log` */

DROP TABLE IF EXISTS `fa_user_money_log`;

CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';

/*Data for the table `fa_user_money_log` */

/*Table structure for table `fa_user_rule` */

DROP TABLE IF EXISTS `fa_user_rule`;

CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';

/*Data for the table `fa_user_rule` */

insert  into `fa_user_rule`(`id`,`pid`,`name`,`title`,`remark`,`ismenu`,`createtime`,`updatetime`,`weigh`,`status`) values (1,0,'index','前台','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API接口','',1,1516168062,1516168062,2,'normal'),(3,1,'user','会员模块','',1,1515386221,1516168103,12,'normal'),(4,2,'user','会员模块','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','登录','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','注册','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','会员中心','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','个人资料','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','登录','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','注册','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','会员中心','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','个人资料','',0,1516015012,1516015012,3,'normal');

/*Table structure for table `fa_user_score_log` */

DROP TABLE IF EXISTS `fa_user_score_log`;

CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';

/*Data for the table `fa_user_score_log` */

/*Table structure for table `fa_user_token` */

DROP TABLE IF EXISTS `fa_user_token`;

CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

/*Data for the table `fa_user_token` */

/*Table structure for table `fa_version` */

DROP TABLE IF EXISTS `fa_version`;

CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

/*Data for the table `fa_version` */

insert  into `fa_version`(`id`,`oldversion`,`newversion`,`packagesize`,`content`,`downloadurl`,`enforce`,`createtime`,`updatetime`,`weigh`,`status`) values (1,'1.1.1,2','1.2.1','20M','更新内容','https://www.fastadmin.net/download.html',1,1520425318,0,0,'normal');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
