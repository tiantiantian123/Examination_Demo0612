DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email    VARCHAR(255) UNIQUE,
  username VARCHAR(255),
  password VARCHAR(255),
  role     CHAR(1) COMMENT 't-teacher, a-administration'
);

INSERT INTO db_examination.admin VALUES (NULL, 'teacher@qq.com', 'teacher', '123', 't');
INSERT INTO db_examination.admin VALUES (NULL, 'administration@qq.com', 'administration', '123', 'a');

-- table student
DROP TABLE IF EXISTS db_examination.student;
CREATE TABLE db_examination.student (
  id         INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email      VARCHAR(255) UNIQUE,
  username   VARCHAR(255),
  password   VARCHAR(255),
  last_ip    VARCHAR(255),
  last_login DATETIME
);

SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.student;