/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.6.26-log : Database - eva
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eva` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `eva`;

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

insert  into `t_eva_database`(`id`,`db_server`,`db_port`,`db_type`,`db_version`,`db_name`,`table_space`,`db_user`,`db_pw`,`remark`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','127.0.0.1','3306','mysql',NULL,'matrix',NULL,'root','root',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_index` */

DROP TABLE IF EXISTS `t_eva_index`;

CREATE TABLE `t_eva_index` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `index_x` varchar(100) DEFAULT NULL COMMENT '维度列',
  `index_y` varchar(100) DEFAULT NULL COMMENT '指标列',
  `func` varchar(50) DEFAULT NULL COMMENT '函数',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_index` */

insert  into `t_eva_index`(`id`,`qry_id`,`index_x`,`index_y`,`func`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','name','user_name','count',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_query` */

DROP TABLE IF EXISTS `t_eva_query`;

CREATE TABLE `t_eva_query` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `db_id` varchar(64) DEFAULT NULL COMMENT '数据库ID',
  `rep_id` varchar(100) DEFAULT NULL COMMENT '报表Id',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_query` */

insert  into `t_eva_query`(`id`,`db_id`,`rep_id`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','1',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_queryjoin` */

DROP TABLE IF EXISTS `t_eva_queryjoin`;

CREATE TABLE `t_eva_queryjoin` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `tb_name_l` varchar(100) DEFAULT NULL COMMENT '表名A',
  `col_l` varchar(100) DEFAULT NULL COMMENT '列A',
  `tb_name_r` varchar(100) DEFAULT NULL COMMENT '表名B',
  `col_r` varchar(100) DEFAULT NULL COMMENT '列B',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_queryjoin` */

insert  into `t_eva_queryjoin`(`id`,`qry_id`,`tb_name_l`,`col_l`,`tb_name_r`,`col_r`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','t_sys_user','dep_id','t_sys_dept','id',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_queryselect` */

DROP TABLE IF EXISTS `t_eva_queryselect`;

CREATE TABLE `t_eva_queryselect` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `tb_name` varchar(100) DEFAULT NULL COMMENT '表名',
  `alias` varchar(100) DEFAULT NULL COMMENT '随机别名',
  `col` varchar(100) DEFAULT NULL COMMENT '列',
  `remark` varchar(100) DEFAULT NULL COMMENT '注释',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_queryselect` */

insert  into `t_eva_queryselect`(`id`,`qry_id`,`tb_name`,`alias`,`col`,`remark`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','t_sys_user',NULL,'user_name',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','1','t_sys_dept',NULL,'name',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_querytable` */

DROP TABLE IF EXISTS `t_eva_querytable`;

CREATE TABLE `t_eva_querytable` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `tb_name` varchar(100) DEFAULT NULL COMMENT '表名',
  `alias` varchar(100) DEFAULT NULL COMMENT '随机别名',
  `remark` varchar(100) DEFAULT NULL COMMENT '注释',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_querytable` */

insert  into `t_eva_querytable`(`id`,`qry_id`,`tb_name`,`alias`,`remark`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','t_sys_user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','1','t_sys_dept',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_eva_querytime` */

DROP TABLE IF EXISTS `t_eva_querytime`;

CREATE TABLE `t_eva_querytime` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `tb_name` varchar(100) DEFAULT NULL COMMENT '表名',
  `col` varchar(100) DEFAULT NULL COMMENT '列',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_querytime` */

/*Table structure for table `t_eva_querywhere` */

DROP TABLE IF EXISTS `t_eva_querywhere`;

CREATE TABLE `t_eva_querywhere` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `qry_id` varchar(64) DEFAULT NULL COMMENT 'queryID',
  `tb_name` varchar(100) DEFAULT NULL COMMENT '表名',
  `col` varchar(100) DEFAULT NULL COMMENT '列',
  `formula` varchar(5) DEFAULT NULL COMMENT '公式',
  `val` varchar(100) DEFAULT NULL COMMENT '值',
  `col_type` varchar(50) DEFAULT NULL COMMENT '类型',
  `creater_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `creater_name` varchar(100) DEFAULT NULL COMMENT '创建人名',
  `updater_id` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `updater_name` varchar(100) DEFAULT NULL COMMENT '更新人名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_querywhere` */

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

insert  into `t_eva_report`(`id`,`name`,`remark`,`creater_id`,`creater_name`,`updater_id`,`updater_name`,`create_date`,`update_date`) values ('1','1','1','1','1','1','1',NULL,NULL);

/*Table structure for table `t_eva_reportdata` */

DROP TABLE IF EXISTS `t_eva_reportdata`;

CREATE TABLE `t_eva_reportdata` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `rep_id` varchar(100) DEFAULT NULL COMMENT '报表Id',
  `period_id` varchar(100) DEFAULT NULL COMMENT '报表周期Id',
  `rep_key` varchar(100) DEFAULT NULL COMMENT '键',
  `rep_val` decimal(11,2) DEFAULT NULL COMMENT '值',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_reportdata` */

insert  into `t_eva_reportdata`(`id`,`rep_id`,`period_id`,`rep_key`,`rep_val`,`create_date`) values ('067f4b2b5eb9471d80fbf43a1cc695f0','1','e8fc1439bfe241a095846e0f4f39e730','民政厅','1.00',NULL),('1','1','1','新城区','14.00',NULL),('2','1','1','未央区','20.00',NULL),('2a5dad2d5a144d40ab99fc483f821979','1','705a49f6112c43adbfde9ffc5d8fcffe','民政厅','1.00',NULL),('2b6db6195f4440828b7361186bd0f894','1','6b7c7b3f99a3482db8619e6f251b69fe','机要室','1.00',NULL),('32456451ad8546bb836f65c5dc37cfc5','1','65c7bd06a20444cca49a13f3166fe885','机要室','1.00',NULL),('3314d1c04c8f47d0aa68f8c768cbc060','1','6b7c7b3f99a3482db8619e6f251b69fe','民政厅','1.00',NULL),('41301d913cb84c32917633d024b12f5a','1','233f3f1a67e54b5e97742dc08792d025','民政厅','1.00',NULL),('5bf087a3563049a3a305ea5bb21480b5','1','ff8d0af2f7104813971c7db83428798d','机要室','1.00',NULL),('60b6a8da02b1455383c1dfc52fd4d520','1','c0ee1f5191c64ec8bffbe306bc6331e0','民政厅','1.00',NULL),('619e9d28faa14bf59bfd4355e7f7d521','1','e8fc1439bfe241a095846e0f4f39e730','机要室','1.00',NULL),('6388959d12a14edf9e4a41216383af04','1','233f3f1a67e54b5e97742dc08792d025','机要室','1.00',NULL),('6675d089ab684cde9d88527dbc3dac02','1','c0ee1f5191c64ec8bffbe306bc6331e0','机要室','1.00',NULL),('6715c423dcc74d6b865ea2dbb8a43d7d','1','65c7bd06a20444cca49a13f3166fe885','民政厅','1.00',NULL),('764fe026f0e44381b9c6f260b4c01d38','1','c18e558f7d4b4c62a2ce8ded6cbd6be3','民政厅','1.00',NULL),('796622c88da34b4f9085d4124dcb63aa','1','3f291f5b565f482ca55689763e2d5841','民政厅','1.00',NULL),('815f35673b634981b3c8709ace07a66b','1','b521f302084c414ca336e1432491ba5a','民政厅','1.00',NULL),('9a781ab198b2480dbcc4d0a96a003e93','1','32b81515be52489a9301b29f7b7380a7','机要室','1.00',NULL),('bfdd62a177fb4941ae6eb6fb26dd7ce9','1','32b81515be52489a9301b29f7b7380a7','民政厅','1.00',NULL),('c6a5df404e3d4f0199893af5a9d41eb7','1','ff8d0af2f7104813971c7db83428798d','民政厅','1.00',NULL),('d0b108ee8807400d891b0c4301f278ab','1','c18e558f7d4b4c62a2ce8ded6cbd6be3','机要室','1.00',NULL),('d6cba06611b140da9cc3709d42422f9e','1','b521f302084c414ca336e1432491ba5a','机要室','1.00',NULL),('dccbcf2f83a64acc91be84df2aab27ab','1','c7e6e471b40e4b098cd815f795ba7372','民政厅','1.00',NULL),('e245317de4264aacb1690ec0338b6f45','1','c7e6e471b40e4b098cd815f795ba7372','机要室','1.00',NULL),('fe2d3bd43a0f424d82ac79d2b3b27d04','1','3f291f5b565f482ca55689763e2d5841','机要室','1.00',NULL);

/*Table structure for table `t_eva_reportperiod` */

DROP TABLE IF EXISTS `t_eva_reportperiod`;

CREATE TABLE `t_eva_reportperiod` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `rep_id` varchar(100) DEFAULT NULL COMMENT '报表Id',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_eva_reportperiod` */

insert  into `t_eva_reportperiod`(`id`,`rep_id`,`year`,`month`,`start_date`,`end_date`,`create_date`,`update_date`) values ('1','1',2015,1,NULL,NULL,NULL,NULL),('11def386b2e34b1db1edb278b8d9428c','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('1dca8d8f85924d09bdbf9c37d17b62d9','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('233f3f1a67e54b5e97742dc08792d025','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('235febcd4e644ca0bf00c9827a948f6d','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('29b46c0fed7443238a19ea2d5ef2910c','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('32b81515be52489a9301b29f7b7380a7','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('35a61a2b52904a64a3958cf96f7c0703','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('39c9acd3963a461ba55897cd7b332beb','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('3f291f5b565f482ca55689763e2d5841','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('5c6df80ed35b45fa976934f28f02f847','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('65c7bd06a20444cca49a13f3166fe885','1',2015,9,'2015-09-09 00:00:00','2015-09-10 00:00:00',NULL,NULL),('6b7c7b3f99a3482db8619e6f251b69fe','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('6c5ff4d01a794012a2037c859eb5f3a6','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('705a49f6112c43adbfde9ffc5d8fcffe','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('75a8025ba451468b9d363b35a20dc10c','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('8a5730b47f2b4a0fae028b018b898ffc','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('8db9d8d0c0ef405f9f8c4aaa02046d4b','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('b521f302084c414ca336e1432491ba5a','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('c0ee1f5191c64ec8bffbe306bc6331e0','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('c18e558f7d4b4c62a2ce8ded6cbd6be3','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('c7e6e471b40e4b098cd815f795ba7372','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('d05b34245740490da68afeb74c1eb2e4','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('dc51078923654395aa77753d4fe8bacf','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('dfb2851bc48d4d3ebc4c551237dbf345','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('e1a34f339efb4f59b220ff819a74d5e0','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('e1b56857f66b4fbba0575a991d504b56','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('e8fc1439bfe241a095846e0f4f39e730','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('f1b671809227481789e1c333d6188da2','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('fc5fa2b97b5648d5a65547165657bf75','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('fe2f345b1a0840319c3ffbbe8f7d9467','1',2015,9,'2015-09-07 00:00:00','2015-09-08 00:00:00',NULL,NULL),('ff8d0af2f7104813971c7db83428798d','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL),('ffe89b7b2581482faa5bf17091db06d6','1',2015,8,'2015-08-01 00:00:00','2015-09-01 00:00:00',NULL,NULL);

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
