/*
SQLyog Ultimate v8.32 
MySQL - 5.5.40 : Database - a1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`a1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `a1`;

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `mation` varchar(20) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `序号` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`name`,`mation`,`times`,`address`,`amount`,`state`) values (3,'张三','鱼香肉丝2份',10,'未知','45','已完成'),(4,'bbb','红烧带鱼2份',10,'未知','76','已预定'),(5,'罗来洲','红烧带鱼5份',20,'湖南软件','190','已完成'),(6,'ccc','鱼香肉丝4份',20,'湖南软件','80','已预定'),(7,'aaa','鱼香肉丝3份',10,'未知','60','已预定'),(8,'蒋连桂','红烧带鱼2份',10,'湖南软件学院','76','已完成'),(9,'蒋连桂','时令鲜蔬20份',10,'aaaa','200','已完成'),(10,'段林康','红烧带鱼2份',10,'天眼','76','已预定'),(22,'未知','时令鲜蔬6份',10,'未知','60','已完成'),(23,'柳浩威','鱼香肉丝',10,'湖南软件','36','已订购'),(24,'柳浩威','鱼香肉丝',10,'湖南软件','36','已订购'),(25,'柳浩威','鱼香肉丝',10,'湖南软件','36','已订购');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
