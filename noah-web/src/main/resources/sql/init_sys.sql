
DROP TABLE IF EXISTS `t_sys_dept`;

CREATE TABLE `t_sys_dept` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `pid` varchar(64) DEFAULT NULL COMMENT '上级部门ID',
  `pname` varchar(100) DEFAULT NULL COMMENT '上级部门名称',
  `dep_order` int(11) DEFAULT NULL COMMENT '顺序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_dept` */

/*Table structure for table `t_sys_oplog` */

DROP TABLE IF EXISTS `t_sys_oplog`;

CREATE TABLE `t_sys_oplog` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(500) DEFAULT NULL COMMENT '来文标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_oplog` */

insert  into `t_sys_oplog`(`id`,`title`,`content`,`user_name`,`real_name`,`create_date`,`update_date`) values ('115118cf4ff44c2abf28c8be6ee6b8c8','删除资源','资源ID：9e0fb0bd541745b3849f0c0cc8f5e091','admin','admin','2015-06-09 14:54:55','2015-06-09 14:54:55');

/*Table structure for table `t_sys_resource` */

DROP TABLE IF EXISTS `t_sys_resource`;

CREATE TABLE `t_sys_resource` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(500) DEFAULT NULL COMMENT '资源路径',
  `pid` varchar(64) DEFAULT NULL COMMENT '父ID',
  `summary` varchar(200) DEFAULT NULL COMMENT '介绍',
  `res_order` int(11) DEFAULT NULL COMMENT '顺序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_resource` */

insert  into `t_sys_resource`(`id`,`name`,`url`,`pid`,`summary`,`res_order`,`create_date`,`update_date`) values ('23f9f5e30efb446e8b99828f231801bf','用户管理','admin/user/list','c8101bf7bf4f49439926fabc585e3aff',NULL,30,'2015-04-05 23:05:51','2015-04-05 23:05:51'),('25e11f9651cf431ca4ba8dc2b57733d9','角色管理','admin/role/list','c8101bf7bf4f49439926fabc585e3aff',NULL,40,'2015-04-05 23:06:15','2015-04-05 23:06:15'),('c0721cac2b02490c9b40ad590af5de66','部门管理','admin/dept/list','c8101bf7bf4f49439926fabc585e3aff',NULL,10,'2015-04-05 20:49:06','2015-04-05 20:49:06'),('c0a6c2746fa2410384f4cac6e73a0a79','操作日志','admin/oplog/list','c8101bf7bf4f49439926fabc585e3aff',NULL,90,'2015-04-22 10:01:47','2015-04-22 10:01:47'),('c8101bf7bf4f49439926fabc585e3aff','系统管理','/','root',NULL,20,'2015-04-05 20:47:58','2015-04-05 20:47:58'),('ef6ffbc106d94ffd9594c337cd407103','资源管理','admin/resource/list','c8101bf7bf4f49439926fabc585e3aff',NULL,20,'2015-04-05 23:05:23','2015-04-05 23:05:23');

/*Table structure for table `t_sys_role` */

DROP TABLE IF EXISTS `t_sys_role`;

CREATE TABLE `t_sys_role` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `summary` varchar(200) DEFAULT NULL COMMENT '介绍',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_role` */

insert  into `t_sys_role`(`id`,`name`,`summary`,`create_date`,`update_date`) values ('25ea24d421684be987921a8579c790eb','管理员','管理员','2015-03-31 15:07:02','2015-03-31 15:07:02');

/*Table structure for table `t_sys_roleresource` */

DROP TABLE IF EXISTS `t_sys_roleresource`;

CREATE TABLE `t_sys_roleresource` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `resource_id` varchar(64) DEFAULT NULL COMMENT '资源ID',
  `resource_name` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_roleresource` */

insert  into `t_sys_roleresource`(`id`,`role_id`,`role_name`,`resource_id`,`resource_name`,`create_date`,`update_date`) values ('309f29471ad540e58c48899e9139a4bc','25ea24d421684be987921a8579c790eb','管理员','23f9f5e30efb446e8b99828f231801bf',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('401302261db44095a57be82698562ac2','25ea24d421684be987921a8579c790eb','管理员','25e11f9651cf431ca4ba8dc2b57733d9',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('a093c729c4004797a395afddb0a78426','25ea24d421684be987921a8579c790eb','管理员','c0721cac2b02490c9b40ad590af5de66',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('a87071949b874855a7cada175fdacbd6','25ea24d421684be987921a8579c790eb','管理员','ef6ffbc106d94ffd9594c337cd407103',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('aa524c7eb61a4526a1b2bb33a9da6da0','25ea24d421684be987921a8579c790eb','管理员','9e0fb0bd541745b3849f0c0cc8f5e091',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('b0b0e9b1b337481ab68c8fd8c65167a2','25ea24d421684be987921a8579c790eb','管理员','c0a6c2746fa2410384f4cac6e73a0a79',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44'),('eb53e6a22a0e430299db6a21c9a7353d','25ea24d421684be987921a8579c790eb','管理员','c8101bf7bf4f49439926fabc585e3aff',NULL,'2015-06-09 14:51:44','2015-06-09 14:51:44');

/*Table structure for table `t_sys_user` */

DROP TABLE IF EXISTS `t_sys_user`;

CREATE TABLE `t_sys_user` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(13) DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `dep_id` varchar(64) DEFAULT NULL COMMENT '部门ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_USER_NAME` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_user` */

insert  into `t_sys_user`(`id`,`user_name`,`real_name`,`password`,`mobile`,`email`,`dep_id`,`create_date`,`update_date`) values ('77a896896e0c4348ba200ac912c89235','admin','admin','ceb4f32325eda6142bd65215f4c0f371','1','1','001','2015-04-08 21:42:55','2015-04-08 21:42:55');

/*Table structure for table `t_sys_userrole` */

DROP TABLE IF EXISTS `t_sys_userrole`;

CREATE TABLE `t_sys_userrole` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sys_userrole` */

insert  into `t_sys_userrole`(`id`,`user_id`,`real_name`,`role_id`,`role_name`,`create_date`,`update_date`) values ('27a42abe1a614c21b79bc486a8a2b08f','77a896896e0c4348ba200ac912c89235','admin','25ea24d421684be987921a8579c790eb',NULL,'2015-06-09 14:52:05','2015-06-09 14:52:05');
