/*
SQLyog Ultimate v10.51 
MySQL - 5.7.20-log : Database - flasktest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flasktest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `flasktest`;

/*Table structure for table `search_local_temp` */

DROP TABLE IF EXISTS `search_local_temp`;

CREATE TABLE `search_local_temp` (
  `uuid` varchar(36) NOT NULL COMMENT '唯一主键',
  `title` varchar(150) DEFAULT NULL COMMENT '文章标题',
  `url` varchar(2000) DEFAULT NULL COMMENT '文章地址',
  `summary` varchar(2000) DEFAULT NULL COMMENT '简介',
  `snapshot` varchar(2000) DEFAULT NULL COMMENT '快照地址',
  `img` varchar(2000) DEFAULT NULL COMMENT '图片地址',
  `shottime` varchar(50) DEFAULT NULL COMMENT '快照时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地录入时间',
  `create_user` varchar(50) DEFAULT 'wth' COMMENT '录入人',
  `search_keyword` varchar(200) DEFAULT NULL COMMENT '用户查询关键词',
  `search_plant` varchar(50) DEFAULT NULL COMMENT '采集的平台',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
