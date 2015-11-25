/*
SQLyog Ultimate v10.42 
MySQL - 5.6.26-log : Database - eva
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_eva_database` */

DROP TABLE IF EXISTS `t_eva_database`;

CREATE TABLE `t_eva_database` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `db_server` varchar(100) DEFAULT NULL COMMENT '地址',
  `db_port` varchar(10) DEFAULT NULL COMMENT '端口',
  `db_type` varchar(10) DEFAULT NULL COMMENT '数据库类型',
  `db_version` varchar(10) DEFAULT NULL COMMENT '数据库版本',
  `db_name` varchar(20) DEFAULT NULL COMMENT '数据库',
  `table_space` varchar(20) DEFAULT NULL COMMENT '表空间',
  `db_user` varchar(100) DEFAULT NULL COMMENT '用户名',
  `db_pw` varchar(100) DEFAULT NULL COMMENT '密码',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_database` */

/*Table structure for table `t_eva_report` */

DROP TABLE IF EXISTS `t_eva_report`;

CREATE TABLE `t_eva_report` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '报表说明',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_report` */

/*Table structure for table `t_eva_reportdata` */

DROP TABLE IF EXISTS `t_eva_reportdata`;

CREATE TABLE `t_eva_reportdata` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `rep_id` varchar(100) DEFAULT NULL COMMENT '报表Id',
  `period_id` varchar(100) DEFAULT NULL COMMENT '报表周期Id',
  `key` varchar(100) DEFAULT NULL COMMENT '键',
  `val` int(11) DEFAULT NULL COMMENT '值',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_reportdata` */

/*Table structure for table `t_eva_reportperiod` */

DROP TABLE IF EXISTS `t_eva_reportperiod`;

CREATE TABLE `t_eva_reportperiod` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `rep_id` varchar(100) DEFAULT NULL COMMENT '报表Id',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_reportperiod` */

/*Table structure for table `t_eva_user` */

DROP TABLE IF EXISTS `t_eva_user`;

CREATE TABLE `t_eva_user` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(13) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `dep_id` varchar(64) DEFAULT NULL COMMENT '部门ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`,`user_name`),
  UNIQUE KEY `UNIQUE_USER_NAME` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_user` */

insert  into `t_eva_user`(`id`,`user_name`,`real_name`,`password`,`mobile`,`email`,`dep_id`,`create_date`,`update_date`) values ('77a896896e0c4348ba200ac912c89235','admin','admin','ceb4f32325eda6142bd65215f4c0f371','1','1','001','2015-04-08 21:42:55','2015-07-28 18:42:55');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
