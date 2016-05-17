DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email    VARCHAR(255) UNIQUE,
  username VARCHAR(255),
  password VARCHAR(255),
  role     CHAR(1) COMMENT 's-system, t-teacher, a-administration'
);

INSERT INTO db_examination.admin VALUES (NULL, 'system@qq.com', 'system', '13do3DeGj6b8Nxf0l3+J/ER05/yQzbHHPkaIhb4m01f+p0nj14OrJEIts4K2qZ3m', 's');

-- table student
DROP TABLE IF EXISTS db_examination.student;
CREATE TABLE db_examination.student (
  id         INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email      VARCHAR(255) UNIQUE,
  username   VARCHAR(255),
  password   VARCHAR(255),
  photo      VARCHAR(255),
  last_ip    VARCHAR(255),
  last_login DATETIME,
  class_id   INT(11) UNSIGNED
);

-- table class
DROP TABLE IF EXISTS db_examination.class;
CREATE TABLE db_examination.class (
  id          INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(255),
  schedule    VARCHAR(255),
  start_date  DATE,
  finish_date DATE
);


ALTER TABLE db_examination.student
ADD CONSTRAINT
  fk_student_class_id
FOREIGN KEY (class_id)
REFERENCES db_examination.class (id);


SELECT *
FROM db_examination.admin;
/*
SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.student;
*/