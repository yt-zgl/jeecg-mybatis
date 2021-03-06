/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.0.96-community-nt : Database - jeecgmybatis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jeecgmybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jeecgmybatis`;

/*Table structure for table `jeecg_note` */

DROP TABLE IF EXISTS `jeecg_note`;

CREATE TABLE `jeecg_note` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL COMMENT '标题',
  `content` varchar(255) default NULL COMMENT '详细描述',
  `crtuser` varchar(255) default NULL,
  `crtuser_name` varchar(255) default NULL,
  `create_dt` datetime default NULL COMMENT '建创时间',
  `deleted` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_note` */

insert  into `jeecg_note`(`id`,`title`,`content`,`crtuser`,`crtuser_name`,`create_dt`,`deleted`) values (1,'12','12','','','2013-02-06 13:31:56',NULL);

/*Table structure for table `jeecg_person` */

DROP TABLE IF EXISTS `jeecg_person`;

CREATE TABLE `jeecg_person` (
  `id` varchar(36) NOT NULL,
  `age` int(11) NOT NULL COMMENT '年龄',
  `name` varchar(255) NOT NULL COMMENT '名字',
  `salary` decimal(19,2) default NULL COMMENT '工资',
  `createdt` datetime default NULL COMMENT '出生日期',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jeecg_person` */

insert  into `jeecg_person`(`id`,`age`,`name`,`salary`,`createdt`) values ('93c78b3e-d297-4a62-abd7-2acf6665df3d',20,'张三','1000.00','2013-02-13 14:50:01'),('e4dbf837-550e-4fbd-9766-15ed4079da4c',23,'李四','100.00','2013-02-20 13:33:02');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(50) default NULL COMMENT '菜单名称',
  `url` varchar(100) default NULL COMMENT '系统url',
  `parentId` int(10) default NULL COMMENT ' 父id 关联sys_menu.id',
  `deleted` int(1) NOT NULL default '0' COMMENT '是否删除,0=未删除，1=已删除',
  `createTime` datetime default NULL COMMENT '创建时间',
  `updateTime` datetime default NULL COMMENT '修改时间',
  `rank` int(11) NOT NULL default '0' COMMENT '排序',
  `actions` varchar(500) default '0' COMMENT '注册Action 按钮|分隔',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`url`,`parentId`,`deleted`,`createTime`,`updateTime`,`rank`,`actions`) values (1,'系统管理','',NULL,0,'2012-12-23 17:21:58','2013-01-10 22:30:50',1,''),(2,'菜单管理','/sysMenu/menu.shtml',1,0,'2012-12-23 18:18:32','2013-01-13 02:29:33',0,'dataList.do'),(3,'站点管理','',NULL,1,'2012-12-23 20:26:35','2012-12-23 21:16:51',1,''),(4,'站点信息管理','/siteMain/list.shtml',3,0,'2012-12-23 20:26:53','2013-01-13 01:24:47',0,'dataList.do|/siteType/typeListJson.do'),(5,'站点类型','/siteType/list.shtml',3,0,'2012-12-23 20:28:23','2013-01-13 01:20:46',0,'dataList.do'),(6,'系统用户管理','/sysUser/list.shtml',1,0,'2012-12-23 22:15:33','2013-02-18 11:42:46',0,'dataList.do'),(7,'角色管理','/sysRole/role.shtml',1,0,'2012-12-24 22:17:51','2013-01-13 01:15:00',0,'dataList.do|/sysMenu/getMenuTree.do'),(8,'系统用户授权','/sysUser/userRole.shtml',1,0,'2013-01-06 11:42:26','2013-02-18 11:43:19',0,'userList.do|/sysRole/loadRoleList.do'),(9,'业务功能','',NULL,0,'2013-02-09 10:42:42','2013-02-19 17:25:42',1,''),(10,'职员管理','/jeecgPerson/list.shtml',9,0,'2013-02-09 10:44:45','2013-02-20 13:32:26',1,'dataList.do'),(11,'1','2',NULL,1,'2013-02-18 11:37:01','2013-02-18 11:37:09',0,'2'),(12,'12','',NULL,1,'2013-02-18 11:37:20','2013-02-18 11:37:29',0,''),(13,'公告','/jeecgNote/list.shtml',9,0,'2013-02-19 17:24:36','2013-02-19 17:27:48',1,'dataList.do'),(14,'7777','777',NULL,1,'2013-02-20 10:55:26',NULL,0,''),(15,'77','77',NULL,1,'2013-02-20 11:01:08',NULL,77,'77');

/*Table structure for table `sys_menu_btn` */

DROP TABLE IF EXISTS `sys_menu_btn`;

CREATE TABLE `sys_menu_btn` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `menuid` int(11) NOT NULL COMMENT ' 菜单id关联 sys_menu.id',
  `btnName` varchar(30) default NULL COMMENT '按钮名称',
  `btnType` varchar(30) default NULL COMMENT '按钮类型，用于列表页显示的按钮',
  `actionUrls` varchar(250) default NULL COMMENT 'url注册，用"," 分隔 。用于权限控制UR',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu_btn` */

insert  into `sys_menu_btn`(`id`,`menuid`,`btnName`,`btnType`,`actionUrls`) values (5,2,'添加','add','save.do'),(6,2,'修改','edit','getId.do|save.do'),(7,2,'删除','remove','delete.do'),(8,6,'添加','add','save.do'),(9,6,'修改','edit','getId.do|save.do'),(10,6,'修改密码','editPwd','updatePwd.do'),(11,6,'删除','remove','delete.do'),(12,7,'添加','add','save.do'),(13,7,'修改','edit','getId.do|save.do'),(14,7,'删除','remove','delete.do'),(15,8,'授权','authRole','/sysUser/getUser.do|/sysUser/addUserRole.do'),(16,5,'添加','add','save.do'),(17,5,'修改','edit','getId.do|save.do'),(18,5,'删除','remove','delete.do'),(19,4,'添加','add','save.do'),(20,4,'修改','edit','getId.do|save.do'),(21,4,'删除','remove','delete.do'),(22,10,'添加','add','save.do'),(23,10,'修改','edit','getId.do|save.do'),(24,10,'删除','remove','delete.do'),(25,13,'添加','add','save.do'),(26,13,'修改','edit','getId.do|save.do'),(27,13,'删除','remove','delete.do');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(12) NOT NULL auto_increment COMMENT 'id主键',
  `roleName` varchar(30) default NULL COMMENT '角色名称',
  `createTime` datetime default NULL COMMENT '创建时间',
  `createBy` int(11) default NULL COMMENT '创建人',
  `updateTime` datetime default NULL COMMENT '修改时间',
  `updateBy` int(11) default NULL COMMENT '修改人',
  `state` int(1) default NULL COMMENT '状态0=可用 1=禁用',
  `descr` varchar(200) default NULL COMMENT '角色描述',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`roleName`,`createTime`,`createBy`,`updateTime`,`updateBy`,`state`,`descr`) values (1,'系统管理员','2013-01-05 16:07:00',NULL,'2013-02-19 17:31:13',NULL,0,NULL),(3,'管理员','2013-01-06 10:45:06',NULL,'2013-01-14 11:22:38',NULL,0,NULL),(18,'站点管理','2013-01-13 01:21:46',NULL,'2013-01-13 01:21:54',NULL,0,'站点管理'),(19,'测试管理员','2013-01-13 17:10:21',NULL,'2013-02-09 21:11:41',NULL,0,NULL);

/*Table structure for table `sys_role_rel` */

DROP TABLE IF EXISTS `sys_role_rel`;

CREATE TABLE `sys_role_rel` (
  `roleId` int(11) NOT NULL COMMENT '角色主键 sys_role.id',
  `objId` int(11) NOT NULL COMMENT '关联主键 type=0管理sys_menu.id, type=1关联sys_user.id',
  `relType` int(1) default NULL COMMENT '关联类型 0=菜单,1=用户'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_rel` */

insert  into `sys_role_rel`(`roleId`,`objId`,`relType`) values (1,3,1),(18,4,0),(18,5,0),(18,19,2),(18,20,2),(18,16,2),(18,17,2),(18,5,1),(3,5,1),(3,8,0),(3,1,0),(3,2,0),(3,6,0),(3,7,0),(3,5,2),(3,8,2),(3,9,2),(3,12,2),(3,13,2),(3,15,2),(18,6,1),(3,6,1),(1,6,1),(19,6,1),(19,8,0),(19,1,0),(19,2,0),(19,6,0),(19,7,0),(19,7,2),(19,8,2),(19,10,2),(19,13,2),(19,15,2),(3,1,1),(18,1,1),(19,1,1),(1,1,1),(1,1,0),(1,2,0),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,13,0),(1,5,2),(1,6,2),(1,7,2),(1,8,2),(1,9,2),(1,10,2),(1,11,2),(1,12,2),(1,13,2),(1,14,2),(1,15,2),(1,22,2),(1,23,2),(1,24,2),(1,25,2),(1,26,2),(1,27,2);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id主键',
  `email` varchar(50) NOT NULL COMMENT '邮箱也是登录帐号',
  `pwd` varchar(50) default NULL COMMENT '登录密码',
  `nickName` varchar(50) default NULL COMMENT '昵称',
  `state` int(1) NOT NULL default '0' COMMENT '状态 0=可用,1=禁用',
  `loginCount` int(11) default NULL COMMENT '登录总次数',
  `loginTime` datetime default NULL COMMENT '最后登录时间',
  `deleted` int(1) NOT NULL default '0' COMMENT '删除状态 0=未删除,1=已删除',
  `createTime` datetime default NULL COMMENT '创建时间',
  `updateTime` datetime default NULL COMMENT '修改时间',
  `createBy` int(11) default NULL COMMENT '创建人',
  `updateBy` int(11) default NULL COMMENT '修改人',
  `superAdmin` int(1) NOT NULL default '0' COMMENT '是否超级管理员 0= 不是，1=是',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`email`,`pwd`,`nickName`,`state`,`loginCount`,`loginTime`,`deleted`,`createTime`,`updateTime`,`createBy`,`updateBy`,`superAdmin`) values (1,'admin@qq.com','C33367701511B4F6020EC61DED352059','系统管理员',0,246,'2015-07-30 11:10:55',0,'2012-12-23 23:01:15','2015-07-30 11:10:55',NULL,NULL,1),(5,'wolf@qq.com','E10ADC3949BA59ABBE56E057F20F883E','scott',0,71,'2013-02-09 10:29:42',0,'2013-01-07 12:30:10','2013-02-09 10:29:42',NULL,NULL,0),(6,'youke@qq.com',NULL,' 游客',0,NULL,NULL,0,'2013-01-13 03:41:32','2013-01-13 03:41:32',NULL,NULL,0),(12,'zhangdaihaoscot@163.com',NULL,NULL,0,NULL,NULL,0,'2013-02-20 11:24:28','2013-02-20 11:24:28',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
