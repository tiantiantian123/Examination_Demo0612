-- MySQL dump 10.13  Distrib 5.6.27, for osx10.8 (x86_64)
--
-- Host: localhost    Database: db_examination
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_examination`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_examination` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `db_examination`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@qq.com','admin','13do3DeGj6b8Nxf0l3+J/ER05/yQzbHHPkaIhb4m01f+p0nj14OrJEIts4K2qZ3m');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistant`
--

DROP TABLE IF EXISTS `assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assistant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant`
--

LOCK TABLES `assistant` WRITE;
/*!40000 ALTER TABLE `assistant` DISABLE KEYS */;
/*!40000 ALTER TABLE `assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '班级名称',
  `startDate` date NOT NULL COMMENT '开班日期',
  `finishDate` date NOT NULL COMMENT '结业日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'网页设计基础'),(2,'Java SE 程序设计'),(3,'数据库基础'),(4,'Java EE 程序设计'),(5,'Java EE 框架技术'),(6,'Android 应用开发');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `start` int(10) unsigned DEFAULT NULL COMMENT '起始IP',
  `end` int(10) unsigned DEFAULT NULL COMMENT '终止IP',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地理位置',
  PRIMARY KEY (`id`),
  KEY `ind_ip` (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='IP表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip`
--

LOCK TABLES `ip` WRITE;
/*!40000 ALTER TABLE `ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `time` int(3) NOT NULL COMMENT '考试时间：分钟',
  `courseId` int(10) unsigned DEFAULT NULL COMMENT 'FK 课程ID',
  `teacherId` int(10) unsigned DEFAULT NULL COMMENT 'FK 教师ID',
  PRIMARY KEY (`id`),
  KEY `fk_paper_courseId` (`courseId`),
  KEY `fk_paper_teacherId` (`teacherId`),
  CONSTRAINT `fk_paper_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_paper_teacherId` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,180,2,1);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `dob` date NOT NULL COMMENT '出生日期',
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学历',
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专业',
  `academy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '毕业院校',
  `graduation` date DEFAULT NULL COMMENT '毕业日期',
  `training` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '培训经历',
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '工作经验',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '照片',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `lastIp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后登录IP',
  `lastLogin` datetime NOT NULL COMMENT '最后登录时间',
  `classId` int(10) unsigned DEFAULT NULL COMMENT 'FK 班级ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_student_classId` (`classId`),
  CONSTRAINT `fk_student_classId` FOREIGN KEY (`classId`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'teacher@qq.com','teacher','2Q7cxOUWVlwbPV95UYszg+aRhLLa9nXhC69fh+VNKZRPr4JLetB1611ncZHiLxVl');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `question` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `optionA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'A选项',
  `optionB` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'B选项',
  `optionC` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'C选项',
  `optionD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'D选项',
  `answer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '答案',
  `score` int(2) NOT NULL COMMENT '分数',
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '题型：x-选择题，t-填空题，j-简答题，b-编程题',
  `paperId` int(10) unsigned DEFAULT NULL COMMENT 'FK 试卷ID',
  PRIMARY KEY (`id`),
  KEY `fk_test_paperId` (`paperId`),
  CONSTRAINT `fk_test_paperId` FOREIGN KEY (`paperId`) REFERENCES `paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'在Java编程中，Java编译器会将Java程序转换为','字节码','可执行代码','机器代码','机器代码','a',1,'x',1),(2,'下面可以作为变量名的是','continue','24hours','$500','**I**','c',1,'x',1),(3,'Java中整型类型包括','int, byte, char','int, short, long','int, float, double','int, long, boolean, String','b',1,'x',1),(4,'Java 应用程序中有且只能有一个main方法，该方法头的书写合法的是','public static void main()','public static void main(String[] args)','public static int main(String[] arg)','public void main(String arg[] )','b',1,'x',1),(5,'下面的哪个语句是正确的','String[] temp = new String {\"a\", \"z\"};','char[] temp = {\"b\", \"c\"};','String temp = {\"a\", \"b\", \"c\"};','String[] temp = {\"a\", \"b\", \"c\"};','d',1,'x',1),(6,'类A继承自类B,则A可从B继承得到的成员是','public和protected的成员','public和private的成员','protected和private的成员','缺省的和private的成员','b',1,'x',1),(7,'下列关于方法重载和方法覆盖的说法中,正确的是','重载是在一个类中,有多个重载的方法;覆盖是在继承体系中,子类覆盖了父类的方法','方法重载只要求方法名一样','方法覆盖可以发生在任意两个类之间','方法重载与方法覆盖是一回事','a',1,'x',1),(8,'一个类可以实现多个###','','','','','接口',1,'t',1),(9,'下列关于String类的说法中,正确的是','用符号“==”可以比较String对象的内容是否相同','String类的equals()方法可以比较String对象是否指向同一个引用','字符串(String)对象一旦创建,其内容还可以任意修改','String类的replace方法返回一个新的替换结果字符串,源字符串没有发生变化','d',1,'x',1),(10,'创建ArrayList类的一个对象,此类继承了List接口,下列哪个方法是正确的','ArrayList myList=new Object()','List myList=new ArrayList()','ArrayList myList=new List()','List myList=new List()','b',1,'x',1),(11,'简述几种Java语言访问限制修饰符的作用范围','','','','','私有权限(private) <br>\r\nprivate可以修饰数据成员,构造方法,方法成员,不能修饰类(此处指外部类,不考虑内部类)。被private修饰的成员,只能在定义它们的类中使用,在其他类中不能调用。<br>\r\n默认权限(default)<br>\r\n类,数据成员,构造方法,方法成员,都能够使用默认权限,即不写任何关键字。默认 权限即同包权限,同包权限的元素只能在定义它们的类中,以及同包的类中被调用。<br>\r\n受保护权限(protected) <br>\r\nprotected可以修饰数据成员,构造方法,方法成员,不能修饰类(此处指外部类,不考虑内部类)。被protected修饰的成员,能在定义它们的类中,同包的类中被调用。如果 有不同包的类想调用它们,那么这个类必须是定义它们的类的子类。<br>\r\n公共权限(public) <br>\r\npublic可以修饰类,数据成员,构造方法,方法成员。被public修饰的成员,可以在任何一个类中被调用,不管同包或不同包,是权限最大的一个修饰符。',6,'j',1),(12,'以你理解的方式,尽可能详细的论述Java语言面向对象程序设计的三大基本特性','','','','','面向对象程序设计的3个特性如下。<br>\r\n封装 数据封装是指将数据分成私用(Private)、保护(Protected)和公用(Public)等,实现 数据保密的目的。<br>\r\n继承<br>\r\n有了继承的关系后,父类(Super Class)中的数据(Data)或方法(Method)的子类(Subclass) 就可继承使用,子类的子类也可以继承使用,实现数据重复使用(Reuse)的目的。<br>\r\n多态<br>\r\n同样名称的方法,其程序代码不同。',6,'j',1),(13,'简要说明类与对象的关系,可以举例说明','','','','','类是抽象的,而对象是具体的, 类是一系列拥有相同属性和方法的对象的抽象出来的集合。 <br>\r\n比如说“人”就是一个类,是抽象的,你并不知道这个“人”到底是谁,做什么的,叫什么 名字, 而”你的邻居小张“就是一个对象,是实际存在的,你知道他的姓名,身高等等等等;',6,'j',1),(14,'在变量前面加上 static 和不加static 有什么区别','','','','','加static为类成员,不加static为对象成员。<br>\r\nStaitc成员分为静态方法、静态变量和静态块 <br>\r\n区别:<br>\r\n静态数据成员在类加载时分配空间并初始化;<br>\r\n静态方法通过类名调用,静态方法中不 能含有this、super关键字;<br>\r\n静态块是在类加载时执行,且只执行一次。<br>\r\n非静态数据成员在 创建对象时被分配空间并初始化;<br>\r\n非静态方法通过对象调用;非静态块在创建对象时会被执行。',6,'j',1),(15,'在 Java 语言中,“==”和 equals()方法有什么区别','','','','','==操作符专门用来比较两个变量的值是否相等,也就是用于比较变量所对应的内存中所 存储的数值是否相同,要比较两个基本类型的数据或两个引用变量是否相等,只能用== 操作符。<br>\r\nequals 方法是用于比较两个独立对象的内容是否相同',6,'j',1),(16,'编程实现 1 至 10 的阶乘之和。<br>\r\n􏰀提示 :阶乘是数学里的一种术语。<br>\r\n阶乘指从 1 乘以 2 乘以 3 乘以 4 一直乘到所要求的数。 <br>\r\n例如所要求的数是 4,则阶乘式是 1×2×3×4,得到的积是 24,24 就是 4 的阶乘。','','','','','',20,'b',1),(17,'使用 Java 语言打印出 99 乘法表<br>\r\n1*1=1<br>\r\n2*1=2 2*2=4<br>\r\n3*1=3 3*2=6 3*3=9<br>\r\n4*1=4 4*2=8 4*3=12 4*4=16 <br>\r\n5*1=5 5*2=10 5*3=15 5*4=20 5*5=25<br>\r\n 6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36 <br>\r\n7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49<br>\r\n8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64<br>\r\n9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81<br>\r\n\r\n\r\n\r\n\r\n','','','','','',20,'b',1),(18,'定义一个􏰁述长方体的类 Box,类中有三个整数类型的成员变量:长、宽、高。并完成 以下工作:<br>\r\n(1)、定义构造函数,初始化这三个变量。<br>\r\n(2)、定义一个方法,求出长方体的体积;<br>\r\n(3)、定义一个方法,求出长方体的表面积; <br>\r\n(4)、编写测试类,使用 Box 中的各个方法,并将其结果输出<br>','','','','','',20,'b',1);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-01  1:18:48
