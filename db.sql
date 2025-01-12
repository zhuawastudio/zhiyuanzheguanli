/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - zhiyuanzheguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhiyuanzheguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zhiyuanzheguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/zhiyuanzheguanli/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/zhiyuanzheguanli/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/zhiyuanzheguanli/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-01 21:00:01'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-01 21:00:01'),(3,'huodongchengbanfang_types','企业行业',1,'化工行业',NULL,NULL,'2022-03-01 21:00:01'),(4,'huodongchengbanfang_types','企业行业',2,'计算机行业',NULL,NULL,'2022-03-01 21:00:01'),(5,'huodongchengbanfang_types','企业行业',3,'服务行业',NULL,NULL,'2022-03-01 21:00:01'),(6,'huodongxuanchuan_types','活动宣传类型',1,'活动宣传类型1',NULL,NULL,'2022-03-01 21:00:01'),(7,'huodongxuanchuan_types','活动宣传类型',2,'活动宣传类型2',NULL,NULL,'2022-03-01 21:00:01'),(8,'shangxia_types','上下架',1,'上架',NULL,NULL,'2022-03-01 21:00:01'),(9,'shangxia_types','上下架',2,'下架',NULL,NULL,'2022-03-01 21:00:01'),(10,'huodong_types','活动类型',1,'活动类型1',NULL,NULL,'2022-03-01 21:00:01'),(11,'huodong_types','活动类型',2,'活动类型2',NULL,NULL,'2022-03-01 21:00:02'),(12,'huodong_types','活动类型',3,'活动类型3',NULL,NULL,'2022-03-01 21:00:02'),(13,'huodong_collection_types','收藏表类型',1,'收藏',NULL,NULL,'2022-03-01 21:00:02'),(14,'huodong_baoming_yesno_types','审核状态',1,'待审核',NULL,NULL,'2022-03-01 21:00:02'),(15,'huodong_baoming_yesno_types','审核状态',2,'同意',NULL,NULL,'2022-03-01 21:00:02'),(16,'huodong_baoming_yesno_types','审核状态',3,'拒绝',NULL,NULL,'2022-03-01 21:00:02'),(17,'huodong_baoming_pingding_types','评定结果',1,'优',NULL,NULL,'2022-03-01 21:00:02'),(18,'huodong_baoming_pingding_types','评定结果',2,'良',NULL,NULL,'2022-03-01 21:00:02'),(19,'huodong_baoming_pingding_types','评定结果',3,'差',NULL,NULL,'2022-03-01 21:00:02'),(20,'forum_types','帖子类型',1,'帖子类型1',NULL,NULL,'2022-03-01 21:00:02'),(21,'forum_types','帖子类型',2,'帖子类型2',NULL,NULL,'2022-03-01 21:00:02'),(22,'forum_types','帖子类型',3,'帖子类型3',NULL,NULL,'2022-03-01 21:00:02'),(23,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-01 21:00:02'),(24,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-01 21:00:02');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `zhiyuanzhe_id` int(11) DEFAULT NULL COMMENT '志愿者',
  `huodongchengbanfang_id` int(11) DEFAULT NULL COMMENT '活动承办方',
  `tuanwei_id` int(11) DEFAULT NULL COMMENT '团委',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_types` int(11) DEFAULT NULL COMMENT '帖子类型',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`zhiyuanzhe_id`,`huodongchengbanfang_id`,`tuanwei_id`,`users_id`,`forum_content`,`super_ids`,`forum_types`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,NULL,NULL,'发布内容1',NULL,2,1,'2022-03-01 21:00:10','2022-03-01 21:00:10','2022-03-01 21:00:10'),(2,'帖子标题2',2,NULL,NULL,NULL,'发布内容2',NULL,1,1,'2022-03-01 21:00:10','2022-03-01 21:00:10','2022-03-01 21:00:10'),(3,'帖子标题3',3,NULL,NULL,NULL,'发布内容3',NULL,2,1,'2022-03-01 21:00:10','2022-03-01 21:00:10','2022-03-01 21:00:10'),(4,'帖子标题4',1,NULL,NULL,NULL,'发布内容4',NULL,2,1,'2022-03-01 21:00:10','2022-03-01 21:00:10','2022-03-01 21:00:10'),(5,'帖子标题5',2,NULL,NULL,NULL,'发布内容5',NULL,1,1,'2022-03-01 21:00:10','2022-03-01 21:00:10','2022-03-01 21:00:10'),(6,NULL,1,NULL,NULL,NULL,'s',5,NULL,2,'2022-03-01 21:22:58',NULL,'2022-03-01 21:22:58'),(7,NULL,3,NULL,NULL,NULL,'aa',5,NULL,2,'2022-03-02 09:28:48',NULL,'2022-03-02 09:28:48'),(8,NULL,3,NULL,NULL,NULL,'sss',3,NULL,2,'2022-03-02 09:30:38',NULL,'2022-03-02 09:30:38'),(9,NULL,NULL,NULL,NULL,6,'ssasa',5,NULL,2,'2022-03-02 09:32:13',NULL,'2022-03-02 09:32:13'),(10,NULL,NULL,NULL,3,NULL,'嘿嘿',5,NULL,2,'2022-03-02 09:35:47',NULL,'2022-03-02 09:35:47');

/*Table structure for table `huodong` */

DROP TABLE IF EXISTS `huodong`;

CREATE TABLE `huodong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `huodongchengbanfang_id` int(11) DEFAULT NULL COMMENT '活动承办方',
  `huodong_name` varchar(200) DEFAULT NULL COMMENT '活动名称  Search111 ',
  `huodong_photo` varchar(200) DEFAULT NULL COMMENT '活动照片',
  `huodong_types` int(11) DEFAULT NULL COMMENT '活动类型 Search111',
  `huodong_clicknum` int(11) DEFAULT NULL COMMENT '点击次数 ',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '是否上架 ',
  `huodong_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `huodong_content` text COMMENT '活动介绍',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动';

/*Data for the table `huodong` */

insert  into `huodong`(`id`,`huodongchengbanfang_id`,`huodong_name`,`huodong_photo`,`huodong_types`,`huodong_clicknum`,`shangxia_types`,`huodong_delete`,`huodong_content`,`create_time`) values (1,3,'活动名称1','http://localhost:8080/zhiyuanzheguanli/upload/huodong1.jpg',3,228,1,1,'活动介绍1','2022-03-01 21:00:10'),(2,3,'活动名称2','http://localhost:8080/zhiyuanzheguanli/upload/huodong2.jpg',2,378,1,1,'活动介绍2','2022-03-01 21:00:10'),(3,3,'活动名称3','http://localhost:8080/zhiyuanzheguanli/upload/huodong3.jpg',3,159,1,1,'活动介绍3','2022-03-01 21:00:10'),(4,1,'活动名称4','http://localhost:8080/zhiyuanzheguanli/upload/huodong4.jpg',3,265,1,1,'活动介绍4','2022-03-01 21:00:10'),(5,3,'活动名称5','http://localhost:8080/zhiyuanzheguanli/upload/huodong5.jpg',1,488,1,1,'活动介绍5','2022-03-01 21:00:10');

/*Table structure for table `huodong_baoming` */

DROP TABLE IF EXISTS `huodong_baoming`;

CREATE TABLE `huodong_baoming` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huodong_id` int(11) DEFAULT NULL COMMENT '活动',
  `zhiyuanzhe_id` int(11) DEFAULT NULL COMMENT '志愿者',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '报名时间',
  `huodong_baoming_yesno_types` int(11) DEFAULT NULL COMMENT '审核状态 Search111',
  `huodong_baoming_yesno_text` text COMMENT '审核意见',
  `fuwu_number` int(11) DEFAULT NULL COMMENT '服务时数(小时)',
  `huodong_baoming_pingding_types` int(11) DEFAULT NULL COMMENT '评定结果 Search111',
  `huodong_baoming_pingding_text` text COMMENT '评定意见',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='活动报名';

/*Data for the table `huodong_baoming` */

insert  into `huodong_baoming`(`id`,`huodong_id`,`zhiyuanzhe_id`,`insert_time`,`huodong_baoming_yesno_types`,`huodong_baoming_yesno_text`,`fuwu_number`,`huodong_baoming_pingding_types`,`huodong_baoming_pingding_text`,`create_time`) values (1,1,3,'2022-03-01 21:00:10',2,NULL,3,1,'很好','2022-03-01 21:00:10'),(2,2,3,'2022-03-01 21:00:10',2,NULL,15,2,'wu','2022-03-01 21:00:10'),(3,3,1,'2022-03-01 21:00:10',3,NULL,NULL,NULL,NULL,'2022-03-01 21:00:10'),(4,4,3,'2022-03-01 21:00:10',2,'s',2,1,'很好','2022-03-01 21:00:10'),(5,5,2,'2022-03-01 21:00:10',2,'sss',8,4,'wu','2022-03-01 21:00:10'),(6,5,1,'2022-03-01 21:32:47',2,NULL,3,2,'很好','2022-03-01 21:32:47'),(7,5,3,'2022-03-02 09:16:37',2,'sss1111',15,1,'wu','2022-03-02 09:16:37'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,5,2,'2022-02-01 21:00:10',2,'sss',3,4,'wu','2022-02-01 21:00:10'),(10,5,1,'2022-02-01 21:00:10',2,'',4,2,'很好','2022-02-01 21:00:10'),(11,5,3,'2022-02-01 21:00:10',2,'sss1111',15,1,'wu','2022-02-01 21:00:10'),(13,3,3,'2022-03-02 09:30:45',2,'keyide',18,1,'该志愿者服务的很好','2022-03-02 09:30:45');

/*Table structure for table `huodong_collection` */

DROP TABLE IF EXISTS `huodong_collection`;

CREATE TABLE `huodong_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huodong_id` int(11) DEFAULT NULL COMMENT '活动',
  `zhiyuanzhe_id` int(11) DEFAULT NULL COMMENT '志愿者',
  `huodong_collection_types` int(11) DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='活动收藏';

/*Data for the table `huodong_collection` */

insert  into `huodong_collection`(`id`,`huodong_id`,`zhiyuanzhe_id`,`huodong_collection_types`,`insert_time`,`create_time`) values (1,1,3,1,'2022-03-01 21:00:10','2022-03-01 21:00:10'),(2,2,3,1,'2022-03-01 21:00:10','2022-03-01 21:00:10'),(3,3,3,1,'2022-03-01 21:00:10','2022-03-01 21:00:10'),(4,4,1,1,'2022-03-01 21:00:10','2022-03-01 21:00:10'),(5,5,2,1,'2022-03-01 21:00:10','2022-03-01 21:00:10'),(6,3,1,1,'2022-03-01 21:23:16','2022-03-01 21:23:16'),(7,4,3,1,'2022-03-02 09:28:55','2022-03-02 09:28:55');

/*Table structure for table `huodongchengbanfang` */

DROP TABLE IF EXISTS `huodongchengbanfang`;

CREATE TABLE `huodongchengbanfang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `huodongchengbanfang_name` varchar(200) DEFAULT NULL COMMENT '企业名称 Search111 ',
  `huodongchengbanfang_types` int(11) DEFAULT NULL COMMENT '企业行业 Search111 ',
  `huodongchengbanfang_phone` varchar(200) DEFAULT NULL COMMENT '企业联系方式',
  `huodongchengbanfang_photo` varchar(200) DEFAULT NULL COMMENT '企业照片',
  `huodongchengbanfang_content` text COMMENT '企业详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='活动承办方';

/*Data for the table `huodongchengbanfang` */

insert  into `huodongchengbanfang`(`id`,`username`,`password`,`huodongchengbanfang_name`,`huodongchengbanfang_types`,`huodongchengbanfang_phone`,`huodongchengbanfang_photo`,`huodongchengbanfang_content`,`create_time`) values (1,'a1','123456','企业名称1',3,'17703786901','http://localhost:8080/zhiyuanzheguanli/upload/huodongchengbanfang1.jpg','企业详情1','2022-03-01 21:00:10'),(2,'a2','123456','企业名称2',2,'17703786902','http://localhost:8080/zhiyuanzheguanli/upload/huodongchengbanfang2.jpg','企业详情2','2022-03-01 21:00:10'),(3,'a3','123456','企业名称3',3,'17703786903','http://localhost:8080/zhiyuanzheguanli/upload/huodongchengbanfang3.jpg','<p>企业详情3</p>','2022-03-01 21:00:10');

/*Table structure for table `huodongxuanchuan` */

DROP TABLE IF EXISTS `huodongxuanchuan`;

CREATE TABLE `huodongxuanchuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `huodongxuanchuan_name` varchar(200) DEFAULT NULL COMMENT '活动宣传名称 Search111  ',
  `huodongxuanchuan_photo` varchar(200) DEFAULT NULL COMMENT '活动宣传图片 ',
  `huodongxuanchuan_types` int(11) NOT NULL COMMENT '活动宣传类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '活动宣传发布时间 ',
  `huodongxuanchuan_content` text COMMENT '活动宣传详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动宣传';

/*Data for the table `huodongxuanchuan` */

insert  into `huodongxuanchuan`(`id`,`huodongxuanchuan_name`,`huodongxuanchuan_photo`,`huodongxuanchuan_types`,`insert_time`,`huodongxuanchuan_content`,`create_time`) values (1,'活动宣传名称1','http://localhost:8080/zhiyuanzheguanli/upload/huodongxuanchuan1.jpg',1,'2022-03-01 21:00:10','活动宣传详情1','2022-03-01 21:00:10'),(2,'活动宣传名称2','http://localhost:8080/zhiyuanzheguanli/upload/huodongxuanchuan2.jpg',1,'2022-03-01 21:00:10','活动宣传详情2','2022-03-01 21:00:10'),(3,'活动宣传名称3','http://localhost:8080/zhiyuanzheguanli/upload/huodongxuanchuan3.jpg',1,'2022-03-01 21:00:10','活动宣传详情3','2022-03-01 21:00:10'),(4,'活动宣传名称4','http://localhost:8080/zhiyuanzheguanli/upload/huodongxuanchuan4.jpg',1,'2022-03-01 21:00:10','活动宣传详情4','2022-03-01 21:00:10'),(5,'活动宣传名称5','http://localhost:8080/zhiyuanzheguanli/upload/huodongxuanchuan5.jpg',1,'2022-03-01 21:00:10','活动宣传详情5','2022-03-01 21:00:10');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','4vcf9ka39nulsg0ilcx7h4vflb2fw38p','2022-03-01 21:02:44','2022-03-02 10:39:48'),(2,1,'a1','zhiyuanzhe','志愿者','y2xlr8q7yyerb7cxd1v9s0xgwlokfzzx','2022-03-01 21:22:53','2022-03-02 10:15:56'),(3,1,'a1','huodongchengbanfang','活动承办方','2omapvm25pmcuw14bsc7b0l4m501qy2j','2022-03-01 21:33:38','2022-03-02 10:04:57'),(4,2,'a2','huodongchengbanfang','活动承办方','kb90w422al1lbcliw80zm0zzirdk7tpd','2022-03-02 09:07:42','2022-03-02 10:07:43'),(5,3,'a3','huodongchengbanfang','活动承办方','a168pjapno1jc0d8td2jmyshfbi2kak1','2022-03-02 09:07:54','2022-03-02 10:33:07'),(6,2,'a2','zhiyuanzhe','志愿者','oa1zd3s9mkjlzi1zxkbk40okcw4xxtev','2022-03-02 09:16:11','2022-03-02 10:16:11'),(7,3,'a3','zhiyuanzhe','志愿者','p5t93x46ehpen5c66en2srxg4rwtycbz','2022-03-02 09:16:32','2022-03-02 10:36:22'),(8,3,'a3','tuanwei','团委','helqorxewe98p6qmjcbc8dlgpv35qcrp','2022-03-02 09:35:33','2022-03-02 10:35:34');

/*Table structure for table `tuanwei` */

DROP TABLE IF EXISTS `tuanwei`;

CREATE TABLE `tuanwei` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `tuanwei_name` varchar(200) DEFAULT NULL COMMENT '团委名称 Search111 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='团委';

/*Data for the table `tuanwei` */

insert  into `tuanwei`(`id`,`username`,`password`,`tuanwei_name`,`create_time`) values (1,'a1','123456','团委名称1','2022-03-01 21:00:10'),(2,'a2','123456','团委名称2','2022-03-01 21:00:10'),(3,'a3','123456','团委名称3','2022-03-01 21:00:10');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','admin','管理员','2021-04-27 14:51:13');

/*Table structure for table `zhiyuanzhe` */

DROP TABLE IF EXISTS `zhiyuanzhe`;

CREATE TABLE `zhiyuanzhe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `zhiyuanzhe_name` varchar(200) DEFAULT NULL COMMENT '志愿者姓名 Search111 ',
  `zhiyuanzhe_phone` varchar(200) DEFAULT NULL COMMENT '志愿者手机号',
  `zhiyuanzhe_id_number` varchar(200) DEFAULT NULL COMMENT '志愿者身份证号',
  `zhiyuanzhe_photo` varchar(200) DEFAULT NULL COMMENT '志愿者头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `zhiyuanzhe_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='志愿者';

/*Data for the table `zhiyuanzhe` */

insert  into `zhiyuanzhe`(`id`,`username`,`password`,`zhiyuanzhe_name`,`zhiyuanzhe_phone`,`zhiyuanzhe_id_number`,`zhiyuanzhe_photo`,`sex_types`,`zhiyuanzhe_email`,`create_time`) values (1,'a1','123456','志愿者姓名1','17703786901','410224199610232001','http://localhost:8080/zhiyuanzheguanli/upload/zhiyuanzhe1.jpg',2,'1@qq.com','2022-03-01 21:00:10'),(2,'a2','123456','志愿者姓名2','17703786902','410224199610232002','http://localhost:8080/zhiyuanzheguanli/upload/zhiyuanzhe2.jpg',2,'2@qq.com','2022-03-01 21:00:10'),(3,'a3','123456','志愿者姓名3','17703786903','410224199610232003','http://localhost:8080/zhiyuanzheguanli/upload/zhiyuanzhe3.jpg',2,'3@qq.com','2022-03-01 21:00:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
