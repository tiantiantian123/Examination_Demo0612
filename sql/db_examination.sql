DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- ----------------------- TABLE ------------------------
-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '管理员表';

-- table teacher
DROP TABLE IF EXISTS db_examination.teacher;
CREATE TABLE db_examination.teacher (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教师表';

-- table assistant
DROP TABLE IF EXISTS db_examination.assistant;
CREATE TABLE db_examination.assistant (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教务表';

INSERT INTO db_examination.admin
VALUES (NULL, 'admin@qq.com', 'admin', '13do3DeGj6b8Nxf0l3+J/ER05/yQzbHHPkaIhb4m01f+p0nj14OrJEIts4K2qZ3m');

-- table class
DROP TABLE IF EXISTS db_examination.class;
CREATE TABLE db_examination.class (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title      VARCHAR(255) NOT NULL
  COMMENT '班级名称',
  startDate  DATE         NOT NULL
  COMMENT '开班日期',
  finishDate DATE         NOT NULL
  COMMENT '结业日期'
)
  COMMENT '班级表';

-- table student
DROP TABLE IF EXISTS db_examination.student;
CREATE TABLE db_examination.student (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email      VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username   VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password   VARCHAR(255) NOT NULL
  COMMENT '密码',
  gender     CHAR(1)      NOT NULL
  COMMENT '性别',
  dob        DATE         NOT NULL
  COMMENT '出生日期',
  tel        VARCHAR(255) COMMENT '电话',
  education  VARCHAR(255) COMMENT '学历',
  major      VARCHAR(255) COMMENT '专业',
  academy    VARCHAR(255) COMMENT '毕业院校',
  graduation DATE COMMENT '毕业日期',
  training   VARCHAR(255) COMMENT '培训经历',
  experience VARCHAR(255) COMMENT '工作经验',
  photo      VARCHAR(255) NOT NULL
  COMMENT '照片',
  remark     VARCHAR(255) COMMENT '备注',
  lastIp     VARCHAR(255) NOT NULL
  COMMENT '最后登录IP',
  lastLogin  DATETIME     NOT NULL
  COMMENT '最后登录时间',
  classId    INT UNSIGNED COMMENT 'FK 班级ID'
)
  COMMENT '学生表';

-- table ip
DROP TABLE IF EXISTS db_examination.ip;
CREATE TABLE db_examination.ip (
  id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  start   INT UNSIGNED COMMENT '起始IP',
  end     INT UNSIGNED COMMENT '终止IP',
  address VARCHAR(255) COMMENT '地理位置'
)
  COMMENT 'IP表';

-- table course
DROP TABLE IF EXISTS db_examination.course;
CREATE TABLE db_examination.course (
  id    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '课程名称'
)
  COMMENT '课程表';

INSERT INTO db_examination.course VALUE (NULL, '网页设计基础');
INSERT INTO db_examination.course VALUE (NULL, 'Java SE 程序设计');
INSERT INTO db_examination.course VALUE (NULL, '数据库基础');
INSERT INTO db_examination.course VALUE (NULL, 'Java EE 程序设计');
INSERT INTO db_examination.course VALUE (NULL, 'Java EE 框架技术');
INSERT INTO db_examination.course VALUE (NULL, 'Android 应用开发');

-- table paper
DROP TABLE IF EXISTS db_examination.paper;
CREATE TABLE db_examination.paper (
  id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  time      INT(3) NOT NULL
  COMMENT '考试时间：分钟',
  courseId  INT UNSIGNED COMMENT 'FK 课程ID',
  teacherId INT UNSIGNED COMMENT 'FK 教师ID'
)
  COMMENT '试卷表';

-- table test
DROP TABLE IF EXISTS db_examination.test;
CREATE TABLE db_examination.test (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  question VARCHAR(2048) NOT NULL
  COMMENT '问题',
  optionA  VARCHAR(255) COMMENT 'A选项',
  optionB  VARCHAR(255) COMMENT 'B选项',
  optionC  VARCHAR(255) COMMENT 'C选项',
  optionD  VARCHAR(255) COMMENT 'D选项',
  answer   VARCHAR(2048) NOT NULL
  COMMENT '答案',
  score    INT(2)        NOT NULL
  COMMENT '分数',
  type     CHAR(1)       NOT NULL
  COMMENT '题型：x-选择题，t-填空题，j-简答题，b-编程题',
  paperId  INT UNSIGNED COMMENT 'FK 试卷ID'
)
  COMMENT '试题表';

-- table class_paper
DROP TABLE IF EXISTS db_examination.class_paper;
CREATE TABLE db_examination.class_paper (
  id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  classId     INT UNSIGNED COMMENT 'FK 班级ID',
  paperId     INT UNSIGNED COMMENT 'FK 试卷ID',
  time        DATETIME COMMENT '考试时间',
  assistantId INT UNSIGNED COMMENT 'FK 教务ID'
)
  COMMENT '班级-试卷关联表';

-- table student_test
DROP TABLE IF EXISTS db_examination.student_test;
CREATE TABLE db_examination.student_test (
  id        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT UNSIGNED COMMENT 'FK 学生ID',
  testId    INT UNSIGNED COMMENT 'FK 试题ID',
  answer    VARCHAR(2048) COMMENT '答案'
)
  COMMENT '学生-试题关联表';

-- ----------------------- INDEX ------------------------
CREATE INDEX ind_ip ON db_examination.ip (start, end);

-- ----------------------- FOREIGN KEY ------------------------
ALTER TABLE db_examination.student
  ADD CONSTRAINT
  fk_student_classId
FOREIGN KEY (classId)
REFERENCES db_examination.class (id);

ALTER TABLE db_examination.paper
  ADD CONSTRAINT
  fk_paper_courseId
FOREIGN KEY (courseId)
REFERENCES db_examination.course (id);

ALTER TABLE db_examination.paper
  ADD CONSTRAINT
  fk_paper_teacherId
FOREIGN KEY (teacherId)
REFERENCES db_examination.teacher (id);

ALTER TABLE db_examination.test
  ADD CONSTRAINT
  fk_test_paperId
FOREIGN KEY (paperId)
REFERENCES db_examination.paper (id);

ALTER TABLE db_examination.class_paper
  ADD CONSTRAINT
  fk_class_paper_classId
FOREIGN KEY (classId)
REFERENCES db_examination.class (id);

ALTER TABLE db_examination.class_paper
  ADD CONSTRAINT
  fk_class_paper_paperId
FOREIGN KEY (paperId)
REFERENCES db_examination.paper (id);

ALTER TABLE db_examination.class_paper
  ADD CONSTRAINT
  fk_class_paper_assistantId
FOREIGN KEY (assistantId)
REFERENCES db_examination.assistant (id);

ALTER TABLE db_examination.student_test
  ADD CONSTRAINT
  fk_student_test_studentId
FOREIGN KEY (studentId)
REFERENCES db_examination.student (id);

ALTER TABLE db_examination.student_test
  ADD CONSTRAINT
  fk_student_test_testId
FOREIGN KEY (testId)
REFERENCES db_examination.test (id);

-- ----------------------- SELECTION ------------------------
SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.teacher;

SELECT *
FROM db_examination.assistant;

SELECT *
FROM db_examination.student;

SELECT *
FROM db_examination.class;

SELECT *
FROM db_examination.ip;

SELECT *
FROM db_examination.course;

SELECT *
FROM db_examination.paper;

SELECT *
FROM db_examination.test;

SELECT *
FROM db_examination.class_paper;

SELECT *
FROM db_examination.student_test;

UPDATE db_examination.class_paper
SET time = '2016-06-02 8:30:00'
WHERE id = 1;