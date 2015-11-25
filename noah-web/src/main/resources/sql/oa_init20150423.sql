 CREATE DATABASE IF NOT EXISTS`oa` DEFAULT CHARACTER SET utf8;

USE `oa`;

DROP TABLE IF EXISTS `t_oa_acessories`;

CREATE TABLE `t_oa_acessories` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `file_type` varchar(50) DEFAULT NULL COMMENT '附件类型',
  `file_id` varchar(64) DEFAULT NULL COMMENT '文档ID',
  `file_url` varchar(500) DEFAULT NULL COMMENT '附件地址',
  `file_name` varchar(100) DEFAULT NULL COMMENT '附件名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_oa_backlog`;

CREATE TABLE `t_oa_backlog` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `doc_id` varchar(64) DEFAULT NULL COMMENT '文单ID',
  `subject` varchar(500) DEFAULT NULL COMMENT '主题',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `flow_id` varchar(64) DEFAULT NULL COMMENT '流程ID',
  `flow_name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `name_space` varchar(100) DEFAULT NULL COMMENT '命名空间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_oa_dept`;

CREATE TABLE `t_oa_dept` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `pid` varchar(64) DEFAULT NULL COMMENT '上级部门ID',
  `pname` varchar(100) DEFAULT NULL COMMENT '上级部门名称',
  `dep_order` int(11) DEFAULT NULL COMMENT '顺序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_dept`(`id`,`name`,`pid`,`pname`,`dep_order`,`create_date`,`update_date`) values ('001','民政局',NULL,NULL,1,'2015-03-31 15:05:39','2015-03-31 15:05:39'),('001001','机要室','001','民政局',1,'2015-03-31 15:05:51','2015-03-31 15:05:51'),('3d7a19828c064ffda70e6791d52126ef','财务部',NULL,NULL,NULL,'2015-04-08 16:48:23','2015-04-08 16:48:23'),('401d92ea5fa94f9897f60353922cc3f4','省委',NULL,NULL,NULL,'2015-04-03 21:58:26','2015-04-03 21:58:26'),('6b32f9dc5a13433b8009724bf19f407b','党办',NULL,NULL,NULL,'2015-03-31 18:10:22','2015-03-31 18:10:22');

DROP TABLE IF EXISTS `t_oa_dictionary`;

CREATE TABLE `t_oa_dictionary` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `propertkey` varchar(300) DEFAULT NULL COMMENT '属性名称',
  `propertvalue` varchar(300) DEFAULT NULL COMMENT '属性值',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_dictionary`(`id`,`propertkey`,`propertvalue`,`create_date`,`update_date`) values ('407a57d0e3b24e2481002933a9a2a6d5','phonenumber','87293634','2015-05-08 22:59:59','2015-05-08 22:59:59'),('6b210c5391bb4f14846d2921c1cf1c6b','name','杨璐莎','2015-05-08 22:59:59','2015-05-08 22:59:59'),('7bc024722b5d4c929ed6aa9b337688db','Confidential','机要室','2015-05-08 22:59:59','2015-05-08 22:59:59'),('d101350773a14bbe8acbd4c43781cb11','phone','电话','2015-05-08 22:59:59','2015-05-08 22:59:59');


DROP TABLE IF EXISTS `t_oa_docform`;

CREATE TABLE `t_oa_docform` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `send_dep_id` varchar(100) DEFAULT NULL COMMENT '发文单位ID',
  `send_dep` varchar(100) DEFAULT NULL COMMENT '发文单位',
  `no` varchar(100) DEFAULT NULL COMMENT '发文编号',
  `content` varchar(1000) DEFAULT NULL COMMENT '发文内容',
  `remark` varchar(1000) DEFAULT NULL COMMENT '相关情况',
  `charge_man_id` varchar(64) DEFAULT NULL COMMENT '负责人ID',
  `charge_man` varchar(64) DEFAULT NULL COMMENT '负责人',
  `contractor_id` varchar(4) DEFAULT NULL COMMENT '承办人ID',
  `contractor` varchar(100) DEFAULT NULL COMMENT '承办人',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `quarter` int(11) DEFAULT NULL COMMENT '季度',
  `progress` varchar(500) DEFAULT NULL COMMENT '办理情况',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `publish_date` datetime DEFAULT NULL COMMENT '发文日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_oa_docrecdept`;

CREATE TABLE `t_oa_docrecdept` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `dep_id` varchar(64) DEFAULT NULL COMMENT '部门ID',
  `dep_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `form_id` varchar(64) DEFAULT NULL COMMENT '公文单ID',
  `read_flag` tinyint(1) DEFAULT NULL COMMENT '已阅',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_oa_factaleader`;

CREATE TABLE `t_oa_factaleader` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `leadername` varchar(100) DEFAULT NULL COMMENT '领导名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `t_oa_factaleader`(`id`,`leadername`,`create_date`,`update_date`) values ('54847acda71a4319899e7147dc9ec417','李','2015-05-18 14:36:51','2015-05-18 14:36:51');


DROP TABLE IF EXISTS `t_oa_flow`;

CREATE TABLE `t_oa_flow` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `table_name` varchar(100) DEFAULT NULL COMMENT '数据表',
  `start_status` varchar(100) DEFAULT NULL COMMENT '开始状态',
  `end_status` varchar(100) DEFAULT NULL COMMENT '结束状态',
  `modify_status` varchar(100) DEFAULT NULL COMMENT '修改状态',
  `modify_flag` tinyint(1) DEFAULT NULL COMMENT '可以修改',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `name_space` varchar(100) DEFAULT NULL COMMENT '命名空间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_flow`(`id`,`name`,`table_name`,`start_status`,`end_status`,`modify_status`,`modify_flag`,`create_date`,`update_date`,`name_space`) values ('1389d4259e734e33acf7ce3f3d6910ea','收文流程','t_oa_recform','登记','审核','',0,'2015-04-22 15:37:51','2015-04-22 15:37:51','recform'),('9ca040a6762045c8a12325a3f03b4e32','发文流程','t_oa_sendform','拟稿','签发','草稿',1,'2015-04-22 15:38:42','2015-04-22 15:38:42','sendform');


DROP TABLE IF EXISTS `t_oa_flowadvice`;

CREATE TABLE `t_oa_flowadvice` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `doc_id` varchar(64) DEFAULT NULL COMMENT '文单ID',
  `advice` varchar(100) DEFAULT NULL COMMENT '意见',
  `user_id` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_oa_flowstep`;

CREATE TABLE `t_oa_flowstep` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `flow_id` varchar(64) DEFAULT NULL COMMENT '流程ID',
  `flow_name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `name` varchar(100) DEFAULT NULL COMMENT '步骤名称',
  `before_status` varchar(100) DEFAULT NULL COMMENT '处理前状态',
  `after_status` varchar(100) DEFAULT NULL COMMENT '处理后状态',
  `step_order` int(100) DEFAULT NULL COMMENT '步骤顺序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert  into `t_oa_flowstep`(`id`,`flow_id`,`flow_name`,`name`,`before_status`,`after_status`,`step_order`,`create_date`,`update_date`) values ('a42160668b834d3c82d3e6fa75a755d5','9ca040a6762045c8a12325a3f03b4e32','发文流程','核稿','审核','核稿',20,'2015-04-22 16:11:14','2015-04-22 16:11:14'),('c49ebd7f1071450981b2eb1915d4d92e','9ca040a6762045c8a12325a3f03b4e32','发文流程','签发','核稿','签发',30,'2015-04-22 16:11:38','2015-04-22 16:11:38'),('fc5509d8db0f4540ba7da359a19200a0','9ca040a6762045c8a12325a3f03b4e32','发文流程','审核','拟稿','审核',10,'2015-04-22 16:10:46','2015-04-22 16:10:46');


DROP TABLE IF EXISTS `t_oa_flowuser`;

CREATE TABLE `t_oa_flowuser` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `flow_id` varchar(64) DEFAULT NULL COMMENT '流程ID',
  `flow_name` varchar(100) DEFAULT NULL COMMENT '流程名称',
  `step_id` varchar(64) DEFAULT NULL COMMENT '步骤ID',
  `step_name` varchar(100) DEFAULT NULL COMMENT '步骤名称',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(64) DEFAULT NULL COMMENT '用户真名',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_flowuser`(`id`,`flow_id`,`flow_name`,`step_id`,`step_name`,`user_id`,`real_name`,`create_date`,`update_date`) values ('1fe612d976ec47f8aab84a1222964ea4','9ca040a6762045c8a12325a3f03b4e32','发文流程','a42160668b834d3c82d3e6fa75a755d5','核稿','77a896896e0c4348ba200ac912c89235','admin','2015-04-22 16:12:05','2015-04-22 16:12:05'),('e3afa8efaded496da8dac60e54a87d6c','9ca040a6762045c8a12325a3f03b4e32','发文流程','c49ebd7f1071450981b2eb1915d4d92e','签发','77a896896e0c4348ba200ac912c89235','admin','2015-04-22 16:12:10','2015-04-22 16:12:10'),('f1dfbfe8b2294a668bb0be6967f1ec4f','9ca040a6762045c8a12325a3f03b4e32','发文流程','fc5509d8db0f4540ba7da359a19200a0','审核','77a896896e0c4348ba200ac912c89235','admin','2015-04-22 16:12:15','2015-04-22 16:12:15');


DROP TABLE IF EXISTS `t_oa_message`;

CREATE TABLE `t_oa_message` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `from_id` varchar(64) DEFAULT NULL COMMENT '发送人ID',
  `from_name` varchar(100) DEFAULT NULL COMMENT '发送人',
  `to_id` varchar(64) DEFAULT NULL COMMENT '接收人ID',
  `to_name` varchar(100) DEFAULT NULL COMMENT '接收人',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `read_flag` tinyint(1) DEFAULT NULL COMMENT '已读',
  `url` varchar(500) DEFAULT NULL COMMENT '消息路径',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_oa_oplog`;

CREATE TABLE `t_oa_oplog` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(500) DEFAULT NULL COMMENT '来文标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_oa_processunit`;

CREATE TABLE `t_oa_processunit` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `unitname` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_processunit`(`id`,`unitname`,`create_date`,`update_date`) values ('1','监察科','2015-05-11 09:58:06','2015-05-11 09:58:06'),('2','审计局','2015-05-11 09:58:06','2015-05-11 09:58:06'),('3','民政局','2015-05-11 09:58:06','2015-05-11 09:58:06'),('4','机要室','2015-05-11 09:58:06','2015-05-11 09:58:06'),('5','财务部','2015-05-11 09:58:06','2015-05-11 09:58:06'),('6','省委','2015-05-11 09:58:06','2015-05-11 09:58:06'),('60d3b1f04e4b4bbd8f693ea774adca91','省办','2015-05-11 09:58:06','2015-05-11 09:58:06'),('7','党办','2015-05-11 09:58:06','2015-05-11 09:58:06');


DROP TABLE IF EXISTS `t_oa_recform`;

CREATE TABLE `t_oa_recform` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `dep_id` varchar(100) DEFAULT NULL COMMENT '来文单位ID',
  `dep_name` varchar(100) DEFAULT NULL COMMENT '来文单位',
  `no` varchar(100) DEFAULT NULL COMMENT '来文编号',
  `doc_no` varchar(100) DEFAULT NULL COMMENT '收文编号',  
  `title` varchar(500) DEFAULT NULL COMMENT '来文标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '来文内容',
  `remark` varchar(2000) DEFAULT NULL COMMENT '相关情况',
  `charge_man_id` varchar(64) DEFAULT NULL COMMENT '负责人ID',
  `charge_man` varchar(64) DEFAULT NULL COMMENT '负责人',
  `contractor_id` varchar(64) DEFAULT NULL COMMENT '承办人ID',
  `contractor` varchar(100) DEFAULT NULL COMMENT '承办人',
  `draft_advice` varchar(1000) DEFAULT NULL COMMENT '拟办意见',
  `submit_advice` varchar(1000) DEFAULT NULL COMMENT '呈办/阅意见',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `quarter` int(11) DEFAULT NULL COMMENT '季度',
  `progress` varchar(500) DEFAULT NULL COMMENT '办理情况',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `secret_class` varchar(20) DEFAULT NULL COMMENT '密级',
  `deadline` datetime DEFAULT NULL COMMENT '时限',
  `receiver_id` varchar(64) DEFAULT NULL COMMENT '收文人ID',
  `receiver` varchar(20) DEFAULT NULL COMMENT '收文人',
  `rec_type` varchar(20) DEFAULT NULL COMMENT '收文类型(阅文/办文)',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `press_handle` tinyint(1) DEFAULT NULL COMMENT '是否督办',
  `rec_count` int(11) DEFAULT NULL COMMENT '来文份数',
  `log_flag` tinyint(1) DEFAULT NULL COMMENT '已存待办',
  `do_time` datetime DEFAULT NULL COMMENT '办文时间',
  `do_status` varchar(50) DEFAULT NULL COMMENT '办文状态',
  `report_leader` varchar(200) DEFAULT NULL COMMENT '呈文领导',
  `do_department` varchar(200) DEFAULT NULL COMMENT '办文单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_oa_resource`;

CREATE TABLE `t_oa_resource` (
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


insert  into `t_oa_resource`(`id`,`name`,`url`,`pid`,`summary`,`res_order`,`create_date`,`update_date`) values ('18173042e65940aba3d3d2eeeb6cd9a7','收文登记','admin/recform/listdraft','3189248dfded4ae882959072f15d8709',NULL,10,'2015-04-05 20:48:36','2015-04-05 20:48:36'),('234e6799a9824ab0a44669753838aa48','流程步骤管理','admin/flowstep/list','c8101bf7bf4f49439926fabc585e3aff',NULL,60,'2015-04-05 23:07:16','2015-04-05 23:07:16'),('23f9f5e30efb446e8b99828f231801bf','用户管理','admin/user/list','c8101bf7bf4f49439926fabc585e3aff',NULL,30,'2015-04-05 23:05:51','2015-04-05 23:05:51'),('25e11f9651cf431ca4ba8dc2b57733d9','角色管理','admin/role/list','c8101bf7bf4f49439926fabc585e3aff',NULL,40,'2015-04-05 23:06:15','2015-04-05 23:06:15'),('30f0bd91adc140469206979162113e84','呈文领导','admin/factaleader/list','c8101bf7bf4f49439926fabc585e3aff',NULL,100,'2015-05-06 17:24:39','2015-05-06 17:24:39'),('3189248dfded4ae882959072f15d8709','公文管理','/','root',NULL,10,'2015-04-05 20:47:27','2015-04-05 20:47:27'),('3485b3580e774e5d849ee4ffcae47a9e','发文归档','admin/sendform/listrecord','3189248dfded4ae882959072f15d8709',NULL,80,'2015-04-22 10:01:02','2015-04-22 10:01:02'),('655f21e3ca584643a576b8fcbf91a293','流程用户管理','admin/flowuser/list','c8101bf7bf4f49439926fabc585e3aff',NULL,70,'2015-04-05 23:07:42','2015-04-05 23:07:42'),('67278d3a4111454988abe8f84f6cbe29','发文拟稿','admin/sendform/listsendform','3189248dfded4ae882959072f15d8709',NULL,60,'2015-04-22 09:58:20','2015-04-22 09:58:20'),('6b4c2fe55e3742bbae10658d59699c78','流程管理','admin/flow/list','c8101bf7bf4f49439926fabc585e3aff',NULL,50,'2015-04-05 23:06:53','2015-04-05 23:06:53'),('7f71879bcf2846f493ea48bb971a0d47','收文审核','admin/recform/listverify','3189248dfded4ae882959072f15d8709',NULL,30,'2015-04-05 23:03:29','2015-04-05 23:03:29'),('862017d2e2c4455c9d45a6e109b0d2a9','收文督办','admin/recform/listpress','3189248dfded4ae882959072f15d8709',NULL,40,'2015-04-05 23:04:02','2015-04-05 23:04:02'),('9e0fb0bd541745b3849f0c0cc8f5e091','用户消息数','admin/usermsgcount/list','c8101bf7bf4f49439926fabc585e3aff',NULL,80,'2015-04-07 10:57:36','2015-04-07 10:57:36'),('ac77ad3506a347b0992b2b037d02b88f','收文归档','admin/recform/listrecord','3189248dfded4ae882959072f15d8709',NULL,50,'2015-04-05 23:04:38','2015-04-05 23:04:38'),('b09bf68420b54d1fbd78ea86665a88c7','收文办文','admin/recform/listhandle','3189248dfded4ae882959072f15d8709',NULL,20,'2015-04-05 23:02:54','2015-04-05 23:02:54'),('c0721cac2b02490c9b40ad590af5de66','部门管理','admin/dept/list','c8101bf7bf4f49439926fabc585e3aff',NULL,10,'2015-04-05 20:49:06','2015-04-05 20:49:06'),('c0a6c2746fa2410384f4cac6e73a0a79','操作日志','admin/oplog/list','c8101bf7bf4f49439926fabc585e3aff',NULL,90,'2015-04-22 10:01:47','2015-04-22 10:01:47'),('c8101bf7bf4f49439926fabc585e3aff','系统管理','/','root',NULL,20,'2015-04-05 20:47:58','2015-04-05 20:47:58'),('cec849cb0d584e99b091514744e3d78a','办文单位','admin/processunit/list','c8101bf7bf4f49439926fabc585e3aff',NULL,110,'2015-05-06 17:29:20','2015-05-06 17:29:20'),('d5db85eb373d460282be2e15df6ab611','发文待办','admin/backlog/listflowsend','3189248dfded4ae882959072f15d8709',NULL,70,'2015-04-22 09:59:21','2015-04-22 09:59:21'),('ef6ffbc106d94ffd9594c337cd407103','资源管理','admin/resource/list','c8101bf7bf4f49439926fabc585e3aff',NULL,20,'2015-04-05 23:05:23','2015-04-05 23:05:23'),('ff82ceaf3a82492ab7810224efea1916','字典管理','admin/dictionary/list','c8101bf7bf4f49439926fabc585e3aff',NULL,110,'2015-05-08 11:02:56','2015-05-08 11:02:56');


DROP TABLE IF EXISTS `t_oa_role`;

CREATE TABLE `t_oa_role` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `summary` varchar(200) DEFAULT NULL COMMENT '介绍',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_role`(`id`,`name`,`summary`,`create_date`,`update_date`) values ('0328597e45cf4cb1a5af5cfcf152bcd0','发文拟稿',NULL,'2015-04-27 13:19:38','2015-04-27 13:19:38'),('0c26d262835f4b3aa15fa058b81b31fa','收文办文',NULL,'2015-04-05 23:46:06','2015-04-05 23:46:06'),('25ea24d421684be987921a8579c790eb','管理员','管理员','2015-03-31 15:07:02','2015-03-31 15:07:02'),('3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员',NULL,'2015-05-18 14:38:42','2015-05-18 14:38:42'),('5f8ff248593a48879f518640adc33fa0','收文登记',NULL,'2015-04-05 20:57:14','2015-04-05 20:57:14'),('7b80a1f7104c4f75968eaf53a586c80b','发文审核',NULL,'2015-04-27 13:19:49','2015-04-27 13:19:49'),('8002465d5fae4ebf9a25105f9ed37002','收文督办',NULL,'2015-04-27 13:19:29','2015-04-27 13:19:29'),('b4dec51ae40c430d83aced7d7039ff0e','收文审核',NULL,'2015-04-27 13:19:07','2015-04-27 13:19:07');


DROP TABLE IF EXISTS `t_oa_roleresource`;

CREATE TABLE `t_oa_roleresource` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `resource_id` varchar(64) DEFAULT NULL COMMENT '资源ID',
  `resource_name` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_roleresource`(`id`,`role_id`,`role_name`,`resource_id`,`resource_name`,`create_date`,`update_date`) values ('005f8d89c30540b581580592351969b9','25ea24d421684be987921a8579c790eb','管理员','ac77ad3506a347b0992b2b037d02b88f',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('05243de46c814e83823ca713d17eea6d','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','b09bf68420b54d1fbd78ea86665a88c7',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('1576f20893aa464f873b278c79184ec9','25ea24d421684be987921a8579c790eb','管理员','9e0fb0bd541745b3849f0c0cc8f5e091',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('160ca77ce02947c2a69db158f9ea36d2','b4dec51ae40c430d83aced7d7039ff0e','收文审核','7f71879bcf2846f493ea48bb971a0d47',NULL,'2015-04-27 13:21:07','2015-04-27 13:21:07'),('1daa1ba71bb84a9c90d83ca21abe82aa','25ea24d421684be987921a8579c790eb','管理员','67278d3a4111454988abe8f84f6cbe29',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('201c7bdac999499fa4371deaedc7be40','25ea24d421684be987921a8579c790eb','管理员','c0721cac2b02490c9b40ad590af5de66',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('20adef252a0b4c0ca5bbd118663ab9cc','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','18173042e65940aba3d3d2eeeb6cd9a7',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('245f310d677540d9abde1425f061b430','0328597e45cf4cb1a5af5cfcf152bcd0','发文拟稿','3485b3580e774e5d849ee4ffcae47a9e',NULL,'2015-04-27 13:20:30','2015-04-27 13:20:30'),('2712cedecf3945f8ac925dbe23a7d993','25ea24d421684be987921a8579c790eb','管理员','3485b3580e774e5d849ee4ffcae47a9e',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('29f35bb411b24024bc60408664613bca','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','23f9f5e30efb446e8b99828f231801bf',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('2ca547014d304e8eb3c29c34f483d845','25ea24d421684be987921a8579c790eb','管理员','6b4c2fe55e3742bbae10658d59699c78',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('3048596bd07a4e038289ce0eb90b4403','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','3189248dfded4ae882959072f15d8709',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('472d91bc262143e4bd3668c910a09530','7b80a1f7104c4f75968eaf53a586c80b','发文审核','d5db85eb373d460282be2e15df6ab611',NULL,'2015-04-27 13:20:57','2015-04-27 13:20:57'),('4a2167df783f462d905a731b88d0df3d','25ea24d421684be987921a8579c790eb','管理员','c8101bf7bf4f49439926fabc585e3aff',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('4ef042525af94eda880a951e24360632','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','c8101bf7bf4f49439926fabc585e3aff',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('4fdb3ec54fd0466f8db7698c6694984b','25ea24d421684be987921a8579c790eb','管理员','862017d2e2c4455c9d45a6e109b0d2a9',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('5096e5b7d8d94ec99d26f8bde92f254c','25ea24d421684be987921a8579c790eb','管理员','ef6ffbc106d94ffd9594c337cd407103',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('55acea66936046d68934dcbce5916834','25ea24d421684be987921a8579c790eb','管理员','ff82ceaf3a82492ab7810224efea1916',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('55c6e011e5514381867e544940a16e8f','5f8ff248593a48879f518640adc33fa0','收文登记','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:21:24','2015-04-27 13:21:24'),('5621d1acda424a38a809f941be78b176','7b80a1f7104c4f75968eaf53a586c80b','发文审核','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:20:57','2015-04-27 13:20:57'),('58c7332a0bc642d887ab082f44498f3e','0c26d262835f4b3aa15fa058b81b31fa','收文办文','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:21:15','2015-04-27 13:21:15'),('604c8909b601423dae48b52abcf63db3','b4dec51ae40c430d83aced7d7039ff0e','收文审核','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:21:07','2015-04-27 13:21:07'),('6178b8674cc74340940af4b0b9c3b401','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','25e11f9651cf431ca4ba8dc2b57733d9',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('640721e1f9c049a9991bd8c81c634b17','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','862017d2e2c4455c9d45a6e109b0d2a9',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('6db9110864b54111bfff144c29cfb79b','0328597e45cf4cb1a5af5cfcf152bcd0','发文拟稿','67278d3a4111454988abe8f84f6cbe29',NULL,'2015-04-27 13:20:30','2015-04-27 13:20:30'),('733a502283614e99ad9b2d33cf650db2','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','ff82ceaf3a82492ab7810224efea1916',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('7c831ce01d6a463db62b4fe339e52a54','5f8ff248593a48879f518640adc33fa0','收文登记','ac77ad3506a347b0992b2b037d02b88f',NULL,'2015-04-27 13:21:24','2015-04-27 13:21:24'),('7cdd2d219a7a4f66b0fbea40bee2916d','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','c0a6c2746fa2410384f4cac6e73a0a79',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('85b764ad01aa46a09333ca8dafc966c9','25ea24d421684be987921a8579c790eb','管理员','d5db85eb373d460282be2e15df6ab611',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('8eb3cfadf7cc4ee08c9901d602a85b6c','8002465d5fae4ebf9a25105f9ed37002','收文督办','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:20:43','2015-04-27 13:20:43'),('90633f7ec1c0435d94c152d542ec40db','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','ac77ad3506a347b0992b2b037d02b88f',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('93f3cf27921f42d9ba47ff58aefcbeda','25ea24d421684be987921a8579c790eb','管理员','18173042e65940aba3d3d2eeeb6cd9a7',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('a02c119665764690abcca9ddfc9bc904','25ea24d421684be987921a8579c790eb','管理员','23f9f5e30efb446e8b99828f231801bf',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('a28a474dae434801b92beac7b31ca807','8002465d5fae4ebf9a25105f9ed37002','收文督办','862017d2e2c4455c9d45a6e109b0d2a9',NULL,'2015-04-27 13:20:43','2015-04-27 13:20:43'),('a94a5bcff65944e9b632b03000dcb155','5f8ff248593a48879f518640adc33fa0','收文登记','18173042e65940aba3d3d2eeeb6cd9a7',NULL,'2015-04-27 13:21:24','2015-04-27 13:21:24'),('b47e4847042a41c28b14d1d9d5f7f5dc','25ea24d421684be987921a8579c790eb','管理员','cec849cb0d584e99b091514744e3d78a',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('b4d724f1af16468b9ff1bb195697ff19','0328597e45cf4cb1a5af5cfcf152bcd0','发文拟稿','3189248dfded4ae882959072f15d8709',NULL,'2015-04-27 13:20:30','2015-04-27 13:20:30'),('b6d2c1235590482f86141500e94650cf','25ea24d421684be987921a8579c790eb','管理员','3189248dfded4ae882959072f15d8709',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('cb43c1b9037f439bbe8d9e0f2906a30d','25ea24d421684be987921a8579c790eb','管理员','c0a6c2746fa2410384f4cac6e73a0a79',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('d46ae647519f426aa0d93c5be20655f7','25ea24d421684be987921a8579c790eb','管理员','b09bf68420b54d1fbd78ea86665a88c7',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('d6166d2089b84c1f8cbc72d8f1b02fde','25ea24d421684be987921a8579c790eb','管理员','25e11f9651cf431ca4ba8dc2b57733d9',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('d694df95f934467f8b3eb41d87a3ce94','0c26d262835f4b3aa15fa058b81b31fa','收文办文','b09bf68420b54d1fbd78ea86665a88c7',NULL,'2015-04-27 13:21:15','2015-04-27 13:21:15'),('dee3b01a968946078fa58b9d673a5711','25ea24d421684be987921a8579c790eb','管理员','234e6799a9824ab0a44669753838aa48',NULL,'2015-05-08 11:03:05','2015-05-08 11:03:05'),('df70f22c439b44babee68a331260a378','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','cec849cb0d584e99b091514744e3d78a',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('f0942629c9ec4280b9ffc30a33962bce','25ea24d421684be987921a8579c790eb','管理员','30f0bd91adc140469206979162113e84',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('f137c27e915947dcb2778f12bc4afaeb','25ea24d421684be987921a8579c790eb','管理员','655f21e3ca584643a576b8fcbf91a293',NULL,'2015-05-08 11:03:06','2015-05-08 11:03:06'),('f1bfc35954f14ef5a6b46ac2935f4584','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','30f0bd91adc140469206979162113e84',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('f330a1bd45f743f98ec84d0061a5447b','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','ef6ffbc106d94ffd9594c337cd407103',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('f36646f93d3b4c778d0b120afc41d091','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','9e0fb0bd541745b3849f0c0cc8f5e091',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04'),('fa9d679beba749aba4d26e2b3be0adf5','3b18e4c7cf9c412a9128ce4b33cfd5e6','收文管理员','c0721cac2b02490c9b40ad590af5de66',NULL,'2015-05-18 15:50:04','2015-05-18 15:50:04');


DROP TABLE IF EXISTS `t_oa_sendform`;

CREATE TABLE `t_oa_sendform` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `no` varchar(100) DEFAULT NULL COMMENT '发文编号',
  `draft_dep_id` varchar(100) DEFAULT NULL COMMENT '拟文单位ID',
  `draft_dep` varchar(100) DEFAULT NULL COMMENT '拟文单位',
  `draftor_id` varchar(100) DEFAULT NULL COMMENT '拟文人ID',
  `draftor_name` varchar(100) DEFAULT NULL COMMENT '拟文人',
  `main_dep_id` varchar(500) DEFAULT NULL COMMENT '发送单位ID',
  `main_dep` varchar(500) DEFAULT NULL COMMENT '发送单位',
  `sub_dep_id` varchar(500) DEFAULT NULL COMMENT '抄送单位ID',
  `sub_dep` varchar(500) DEFAULT NULL COMMENT '抄送单位',
  `print_count` int(11) DEFAULT NULL COMMENT '打印份数',
  `secret_class` varchar(100) DEFAULT NULL COMMENT '密级',
  `urgent_class` varchar(100) DEFAULT NULL COMMENT '紧急程度',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `quarter` int(11) DEFAULT NULL COMMENT '季度',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `log_flag` tinyint(1) DEFAULT NULL COMMENT '已存待办',
  `mobile` varchar(13) DEFAULT NULL COMMENT '联系电话',
  `open` varchar(100) DEFAULT NULL COMMENT '公开情况',
  `nuclear_draft` varchar(100) DEFAULT NULL COMMENT '处室核稿',
  `office_nuclear` varchar(100) DEFAULT NULL COMMENT '办公室核稿',
  `deadline` date DEFAULT NULL COMMENT '期限',
  `doc_legality` varchar(100) DEFAULT NULL COMMENT '规范性文件合法性检查',
  `attachment` varchar(500) DEFAULT NULL COMMENT '附件',
  `confidential_review` varchar(100) DEFAULT NULL COMMENT '机要室复核',
  `lead_instructions` varchar(100) DEFAULT NULL COMMENT '厅领导批示',
  `sign_unit` varchar(100) DEFAULT NULL COMMENT '会签单位',
  `issuer_instructions` varchar(500) DEFAULT NULL COMMENT '签发人批示',
  `content` varchar(500) DEFAULT NULL COMMENT '发文内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '相关情况',
  `charge_man_id` varchar(50) DEFAULT NULL COMMENT '负责人ID',
  `charge_man` varchar(50) DEFAULT NULL COMMENT '负责人',
  `contractor_id` varchar(50) DEFAULT NULL COMMENT '承办人ID',
  `contractor` varchar(50) DEFAULT NULL COMMENT '承办人',
  `draft_advice` varchar(100) DEFAULT NULL COMMENT '拟办意见',
  `submit_advice` varchar(100) DEFAULT NULL COMMENT '呈办/阅意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `t_oa_user`;

CREATE TABLE `t_oa_user` (
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


insert  into `t_oa_user`(`id`,`user_name`,`real_name`,`password`,`mobile`,`email`,`dep_id`,`create_date`,`update_date`) values ('181aa1c69ec3477a959f6306c060310c','zf','赵斐','2ec26b37d4572db4489b99d1c27d3a80','1','1','','2015-05-18 14:39:50','2015-05-18 14:39:50'),('77a896896e0c4348ba200ac912c89235','admin','admin','ceb4f32325eda6142bd65215f4c0f371','1','1','001','2015-04-08 21:42:55','2015-04-08 21:42:55'),('ba7366ac2e434fefb5084755494c53c6','yls','杨璐莎','1e4e8d636d087c056cd34b3c2b1cb95e','1','1','','2015-05-18 14:40:03','2015-05-18 14:40:03');


DROP TABLE IF EXISTS `t_oa_usermsgcount`;

CREATE TABLE `t_oa_usermsgcount` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `unread` int(11) DEFAULT NULL COMMENT '新消息数',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_usermsgcount`(`id`,`user_id`,`unread`,`create_date`,`update_date`) values ('22b09f16967d4d999bd670193c3284ce','ba7366ac2e434fefb5084755494c53c6',0,'2015-05-18 14:40:03','2015-05-18 14:40:03'),('4ef319e206e345388695b77095481640','77a896896e0c4348ba200ac912c89235',0,'2015-04-08 21:42:55','2015-04-30 18:05:00'),('ce73bda0b4344ef394e04a1c63ae4a8a','181aa1c69ec3477a959f6306c060310c',0,'2015-05-18 14:39:50','2015-05-18 14:39:50');


DROP TABLE IF EXISTS `t_oa_userrole`;

CREATE TABLE `t_oa_userrole` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `t_oa_userrole`(`id`,`user_id`,`real_name`,`role_id`,`role_name`,`create_date`,`update_date`) values ('231bc69bf57a438381c4a0a4accb184e','77a896896e0c4348ba200ac912c89235','admin','25ea24d421684be987921a8579c790eb',NULL,'2015-04-08 21:45:54','2015-04-08 21:45:54'),('e532713728fa4f27839b11ea24166f97','ba7366ac2e434fefb5084755494c53c6','杨璐莎','3b18e4c7cf9c412a9128ce4b33cfd5e6',NULL,'2015-05-18 14:40:09','2015-05-18 14:40:09'),('ed2ec15938154c4989283eb67df63521','181aa1c69ec3477a959f6306c060310c','赵斐','3b18e4c7cf9c412a9128ce4b33cfd5e6',NULL,'2015-05-18 14:40:14','2015-05-18 14:40:14');

