 /*创建表*/
CREATE TABLE t_emp(
    eid INT PRIMARY KEY AUTO_INCREMENT,-- 员工编号
    ename VARCHAR(20) NOT NULL,-- 员工姓名
    birthday TIMESTAMP ,-- 员工出生年月
    eaddress VARCHAR(50), -- 员工地址
    esalary FLOAT,-- 员工工资
    ephone CHAR(11),-- 员工联系方式
    esex CHAR(4)-- 员工性别
)

/*
增 INSERT INTO
删 DELETE FROM (表) where  
改 update (表) set 
查 select  from
*/

/*查询数据*/
SELECT * FROM t_emp;

SELECT * FROM t_stus 


/*插入数据*/
INSERT INTO t_emp(ename,birthday,eaddress,esalary,ephone,esex)VALUES('陈赵梅','2018-1-1','淮安','2000','18713450927','女');
INSERT INTO t_emp(ename,birthday,eaddress,esalary,ephone,esex)VALUES('袁信莉','2018-2-2','自贡','2111','18713453627','女');
INSERT INTO t_emp(ename,birthday,eaddress,esalary,ephone,esex)VALUES('孙婕','2018-3-3','徐州','2222','18751816026','女');
INSERT INTO t_emp(ename,birthday,eaddress,esalary,ephone,esex)VALUES('吴宝磊','2018-4-4','南通','2333','18751379633','男');

/*更新数据*/
UPDATE t_emp SET esalary="2333" WHERE eid="7"
/*删除数据*/
DELETE FROM t_emp WHERE ename="袁信莉"

/*聚合函数  统计函数*/

/*统计*/
SELECT COUNT(*) FROM t_emp

/*总和*/
SELECT SUM(esalary) FROM t_emp

/*平均值*/
SELECT AVG(esalary) FROM t_emp

/*最大值*/
SELECT MAX(esalary) FROM t_emp

/*最小值*/
SELECT MIN(esalary) FROM t_emp

/*and 和 两个条件同时满足*/
SELECT COUNT(*) FROM t_emp  WHERE ename="陈赵梅" AND esalary="2000"

/*增*/
INSERT INTO t_emp (ename,birthday,eaddress,esalary,ephone,esex)VALUES('曹琛','2018-4-4','菏泽','2555','19823720975','女')
/*查*/
`t_students`
/*删*/
DELETE FROM t_emp WHERE esalary="3333"
/*改*/
UPDATE t_emp SET esalary="2444" WHERE eid="8"

ALTER TABLE t_emp DROP eface

ALTER TABLE t_emp ADD eface VARCHAR(20)

SELECT eface FROM t_emp WHERE ename='陈赵梅'

ALTER TABLE t_emp ADD evideo VARCHAR(50)

ALTER TABLE t_emp ADD eaudio VARCHAR(50)

SELECT esex,eaddress,esalary+IFNULL(money,0) FROM t_emp WHERE ename='陈赵梅'

SELECT eaddress,ephone,esex,eface,evideo,eaudio,esalary+IFNULL(money,0) FROM t_emp WHERE ename=%s

SELECT * FROM t_students

INSERT INTO t_students(sname,spwd,birthday,sphone,sface,saddress,ssex)VALUES('袁信莉','111111','2018-10-12','18351865385','a2.png','自贡','女')
INSERT INTO t_students(sname,spwd,birthday,sphone,sface,saddress,ssex)VALUES('孙婕','222222','2018-11-12','18751816026','a3.png','徐州','女')
INSERT INTO t_students(sname,spwd,birthday,sphone,sface,saddress,ssex)VALUES('吴宝磊','333333','2018-9-12','18751379633','a4.png','南通','男')
INSERT INTO t_students(sname,spwd,birthday,sphone,sface,saddress,ssex)VALUES('王启明','444444','2018-8-12','18751815236','a5.png','宿迁','男')
INSERT INTO t_students(sname,spwd,birthday,sphone,sface,saddress,ssex)VALUES('路廷炜','555555','2003-8-12','18795912156','a5.png','扬州','女')

ALTER TABLE t_students ADD qqmail VARCHAR(50)

SELECT sname,sphone,sface,qqmail FROM t_students


SELECT * FROM t_emp


-- 统计每个年龄段的员工数量大于1的
SELECT SUBSTR(NOW(),1,4)-SUBSTR(birthday,1,4),COUNT(*)  FROM t_emp GROUP BY SUBSTR(NOW(),1,4)-SUBSTR(birthday,1,4) HAVING COUNT(*)>1

-- 统计每个年龄段的员工数量，数量按升序排序
SELECT SUBSTR(NOW(),1,4)-SUBSTR(birthday,1,4),COUNT(*) FROM t_emp GROUP BY SUBSTR(NOW(),1,4)-SUBSTR(birthday,1,4) ORDER BY COUNT(*) ASC 


-- 检查用户名唯一性
SELECT COUNT(*) FROM t_students WHERE sname='陈赵梅'

-- 三范式  设计表的规范

-- 1.表中的字段是最小单位，不能在分割 最小单位参照本地化
-- 2.在第一范式的基础上，表中的字段只参照一个主键
-- 必须要做表的实体拆分，拆分成员工表和部门表
-- 三种关系  一对一 ， 一对多（班级表和学生表，） ， 多对多（中间关系表 学生表和科目表用成绩表来联系）
-- 参照以上两个方式，


-- 学生表


CREATE TABLE t_stus
(
     sid INT PRIMARY KEY AUTO_INCREMENT, -- 学生编号
     sname VARCHAR(20) NOT NULL,  -- 学生姓名
     spwd VARCHAR(6) NOT NULL, -- 学生密码
     sbirth TIMESTAMP, -- 出生日期
     ssex CHAR(4), -- 性别
     saddress VARCHAR(10), -- 籍贯
     sphone VARCHAR(11), -- 联系方式
     sqq VARCHAR(20), -- qq号
     state INT,-- 正常 毕业 休学 退学
     cid INT ,
     rid INT  
   
)
SELECT * FROM t_stus;
ALTER TABLE t_stus ADD simg VARCHAR(20)
ALTER TABLE t_stus CHANGE COLUMN cid scid INT;
ALTER TABLE t_stus CHANGE COLUMN rid srrid INT;
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('陈赵梅','000000','2000-1-1','女','淮安','18751812593','1803825967@qq.com','0','1','1');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('曹琛','111111','2001-1-1','女','菏泽','18351869117','1798053280@qq.com','1','1','2');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('武豫','222222','2002-1-1','女','周口','18751812593','1803825967@qq.com','2','1','3');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('万慧琴','333333','2003-1-1','女','南通','18751812593','1803825967@qq.com','3','2','1');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('王启明','444444','2004-1-1','男','宿迁','18751812593','1803825967@qq.com','1','2','2');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('吴宝磊','555555','2005-1-1','男','南通','18751812593','1803825967@qq.com','2','2','3');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('王岚','666666','2006-1-1','女','淮安','18751812593','1803825967@qq.com','3','3','1');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('吴玲','777777','2007-1-1','女','盐城','18751812593','1803825967@qq.com','1','3','2');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('袁信莉','888888','2008-1-1','女','自贡','18751812593','1803825967@qq.com','2','3','3');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid)VALUES('李海帝','999999','2009-1-1','女','枣庄','18751812593','1803825967@qq.com','3','1','1');
SELECT * FROM t_stus;
SELECT * FROM t_role;
SELECT rname,COUNT(srrid) FROM t_stus RIGHT JOIN t_role ON srrid=rid GROUP BY rname;
SELECT COUNT(kid),sname  FROM (SELECT   * FROM  t_stus  WHERE  sname=?) tmp INNER  JOIN
t_score  ON tmp.sid=t_score.sid  GROUP  BY sname;
 
SELECT cname,COUNT(*) FROM t_stus RIGHT JOIN t_class ON scid=cid WHERE cname='python班';
 
SELECT * FROM t_state;
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('路廷炜','999999','2009-1-1','女','扬州','18751812593','1803825967@qq.com','3','1','1','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('刘伟益','999999','2009-1-1','男','南京','18751812593','1803825967@qq.com','3','1','2','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('李杰','999999','2009-1-1','男','淮安','18751812593','1803825967@qq.com','3','1','2','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('李保卫','999999','2009-1-1','男','扬州','18751812593','1803825967@qq.com','3','1','2','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('刘杰','999999','2009-1-1','男','无锡','18751812593','1803825967@qq.com','3','1','2','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('毛博士','999999','2009-1-1','男','泰州','18751812593','1803825967@qq.com','3','1','2','/images/a7.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('董浩','999999','2009-1-1','男','镇江','18751812593','1803825967@qq.com','3','1','2','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('易林','999999','2009-1-1','男','四川','18751812593','1803825967@qq.com','3','1','3','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('万雪松','999999','2009-1-1','男','扬州','18751812593','1803825967@qq.com','3','1','3','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('赵斌','999999','2009-1-1','男','呼和浩特','18751812593','1803825967@qq.com','3','2','1','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('张松浩','999999','2009-1-1','男','扬州','18751812593','1803825967@qq.com','3','2','2','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('吴忠','999999','2009-1-1','男','宿迁','18751812593','1803825967@qq.com','3','2','2','/images/a7.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('任元浩','999999','2009-1-1','男','徐州','18751812593','1803825967@qq.com','3','2','2','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('李玉','999999','2009-1-1','男','徐州','18751812593','1803825967@qq.com','3','2','2','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('张克蓬','999999','2009-1-1','男','连云港','18751812593','1803825967@qq.com','3','2','2','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('刘年科','999999','2009-1-1','男','淮安','18751812593','1803825967@qq.com','3','2','2','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('范广亚','999999','2009-1-1','男','苏州','18751812593','1803825967@qq.com','3','2','3','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('仇峣峣','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','2','3','/images/a7.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('许辉','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','3','1','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('曹梦伟','999999','2009-1-1','男','苏州','18751812593','1803825967@qq.com','3','3','2','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('韦杰','999999','2009-1-1','男','常州','18751812593','1803825967@qq.com','3','3','2','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('郑新鹏','999999','2009-1-1','男','河南','18751812593','1803825967@qq.com','3','3','2','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('刘伟','999999','2009-1-1','男','南京','18751812593','1803825967@qq.com','3','3','2','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('刘雪松','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','3','2','/images/a7.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('郑凯','999999','2009-1-1','男','连云港','18751812593','1803825967@qq.com','3','3','2','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('周旭','999999','2009-1-1','男','镇江','18751812593','1803825967@qq.com','3','3','3','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('蔡磊','999999','2009-1-1','男','安徽','18751812593','1803825967@qq.com','3','3','3','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('罗彬溶','999999','2009-1-1','男','四川','18751812593','1803825967@qq.com','3','4','1','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('尉希晨','999999','2009-1-1','男','河南','18751812593','1803825967@qq.com','3','4','2','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('王玉凯','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','4','2','/images/a7.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('王蕾震','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','4','2','/images/a2.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('詹柠吉','999999','2009-1-1','男','贵州','18751812593','1803825967@qq.com','3','4','2','/images/a3.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('潘玉卓','999999','2009-1-1','男','南京','18751812593','1803825967@qq.com','3','4','2','/images/a4.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('李大洋','999999','2009-1-1','男','山东','18751812593','1803825967@qq.com','3','4','2','/images/a5.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('沈家正','999999','2009-1-1','男','宿迁','18751812593','1803825967@qq.com','3','4','3','/images/a6.png','fenye1.html');
INSERT INTO t_stus(sname,spwd,sbirth,ssex,saddress,sphone,sqq,state,scid,srrid,simg,surl)VALUES('孙金童','999999','2009-1-1','男','南京','18751812593','1803825967@qq.com','3','4','3','/images/a7.png','fenye1.html');





SELECT state FROM t_stus WHERE sname='陈赵梅' AND spwd='000000'
SELECT ssex,COUNT(*) FROM t_stus GROUP BY ssex;

CREATE TABLE t_nouse
(
    nid INT PRIMARY KEY AUTO_INCREMENT,
    nname VARCHAR(20) NOT NULL
)
INSERT INTO t_nouse(nname)VALUES('学生名单');

SELECT * FROM t_nouse;
-- 班级表
CREATE TABLE t_class
(
    cid INT PRIMARY KEY AUTO_INCREMENT, -- 班级编号
    cname VARCHAR(20) NOT NULL, -- 班级名称
    cqq VARCHAR(20)  -- 班级qq
    
)

INSERT INTO t_class(cname,cqq)VALUES('java班','12345678');
INSERT INTO t_class(cname,cqq)VALUES('javascript班','12345678');
INSERT INTO t_class(cname,cqq)VALUES('python班','12345678');
INSERT INTO t_class(cname,cqq)VALUES('微信小程序班','12345678');

SELECT * FROM t_class;

ALTER TABLE t_class ADD curl VARCHAR(20)

SELECT * FROM t_stus;

ALTER TABLE t_stus ADD surl VARCHAR(20)
SELECT cid,cname FROM t_class WHERE cid(SELECT cid FROM t_stus WHERE scid=cid)

SELECT cid,cname FROM t_class
SELECT sname FROM t_stu WHERE cid=1;
-- 角色表
CREATE TABLE t_role
(
    rid INT PRIMARY KEY AUTO_INCREMENT, -- 角色编号
    rname VARCHAR(10) NOT NULL -- 角色名称
    
)
SELECT * FROM t_stu
SELECT * FROM t_role

INSERT INTO t_role(rid,rname)VALUES(1,"班长");
INSERT INTO t_role(rid,rname)VALUES(2,"学生");
INSERT INTO t_role(rid,rname)VALUES(3,"课代表");

SELECT rid,COUNT(*) FROM t_stu GROUP BY rid=1
SELECT sname,rid FROM t_stu 
SELECT * FROM t_role 

SELECT rname,COUNT(rname)  FROM (SELECT  * FROM  t_stu,t_role  WHERE scid=rid) t_role  GROUP  BY  rname

-- 学生表里将学生以职务分组
SELECT rname,COUNT(*) FROM t_stu WHERE rid=(SELECT * FROM t_role)
-- 科目表
CREATE TABLE t_lesson
(
   lid INT PRIMARY KEY AUTO_INCREMENT,-- 科目编号
   lname VARCHAR(10) NOT NULL,-- 科目名称
 )
 -- 成绩表
 CREATE TABLE t_result
 (
     rid INT PRIMARY KEY AUTO_INCREMENT,-- 成绩编号
     rname VARCHAR(20) NOT NULL,-- 成绩名称
     rscore VARCHAR(100) NOT NULL,-- 成绩分数
 )
 SELECT * FROM t_emp;
 SELECT COUNT(*) FROM t_emp WHERE ename="陈赵梅" AND epwd="111111";
 
SELECT * FROM t_project



-- 第二个项目的数据
-- android,python,java项目

CREATE TABLE t_newmenu
(
   nid INT PRIMARY KEY AUTO_INCREMENT,
   nname VARCHAR(20) NOT NULL,
   nurl VARCHAR(20),
   nstates INT,
   nimgpath VARCHAR(20)
)
SELECT * FROM t_newmenu

INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('娱乐','a1.html','1','a1.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('财经','a2.html','1','a2.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('政治','a3.html','1','a3.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('美食','a4.html','1','a4.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('军事','a5.html','1','a5.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('科技','a6.html','1','a6.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('养生','a7.html','1','a7.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('国际','a8.html','1','a8.png');
INSERT INTO t_newmenu(nname,nurl,nstates,nimgpath)VALUES('体育','a9.html','1','a9.png');

CREATE TABLE t_gdpGroup
(
   gid INT PRIMARY KEY AUTO_INCREMENT,
   gyear YEAR,
   gdata FLOAT(4,2)
   
)
SELECT * FROM t_gdpGroup

ALTER TABLE t_gdpGroup ADD COLUMN gname VARCHAR(20);


-- alter table t_gdp add column gyear year
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2007,03.55);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2008,04.60);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2009,05.11);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2010,06.10);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2011,07.57);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2012,08.56);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2013,09.61);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2014,10.58);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2015,11.06);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2016,11.19);
INSERT INTO t_gdpGroup(gyear,gdata)VALUES(2017,12.24);



CREATE TABLE t_country
(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(20),
    cyear YEAR,
    cgdp FLOAT(8,2),
    cpeople INT,
    carea INT,
    cheritage INT,
    cnobeier INT,
    cshool INT 
)
SELECT * FROM t_country;

INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("中国",2018,854026.71,1383327321,973,52,2,2595);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("美国",2018,195558.74,324459463,914,23,377,3281);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("日本",2018,043421.60,127484450,364,21,28,985);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("德国",2018,035954.06,82114224,348,42,108,364);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("英国",2018,032322.81,66181585,241,31,130,842);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("印度",2018,026074.09,1339180127,297,36,10,4001);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("法国",2018,025865.68,64979548,547,43,69,562);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("意大利",2018,019329.38,59359900,294,53,20,424);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("加拿大",2018,016823.68,36624199,909,18,26,964);
INSERT INTO t_country(cname,cyear,cgdp,cpeople,carea,cheritage,cnobeier,cshool)VALUES("韩国",2018,015458.10,50982212,120,12,1,153);

CREATE TABLE t_china
(
   zid INT PRIMARY KEY AUTO_INCREMENT,
   zname VARCHAR(20), -- 省份名字
   zpeople INT, -- 人口数量
   zgdp FLOAT(2,1), -- gdp增长率
   zhappy FLOAT(3,2),-- 幸福指数
   zwuran FLOAT(3,1),-- 空气质量优良率
   ztielu FLOAT(4,1),-- 各省铁路密度排名
   zschool INT -- 大学数量
)

SELECT * FROM t_china;

INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('江苏',8029,7.2,0.21,79.2,261.0,166);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('北京',2170,6.7,0.15,62.1,746.7,91);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('上海',2418,6.9,0.07,70.4,738.1,64);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('广东',11169,7.5,0.21,99.2,223.7,147);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('湖南',6860,8.0,0.42,89.6,214.8,123);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('浙江',5657,7.8,0.15,94.2,230.1,107);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('山东',10005,7.4,0.34,88.1,327.0,144);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('河南',9559,7.8,0.39,65.8,311.4,129);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('四川',8302,8.1,0.16,98.4,82.6,109);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('江西',4622,8.9,0.44,91.4,221.7,98);
INSERT INTO t_china(zname,zpeople,zgdp,zhappy,zwuran,ztielu,zschool)VALUES('云南',4802,9.5,0.18,100.0,76.1,72);



-- 20个报表

-- 1.中国2007-2017年GDP的增长率
SELECT gyear,gdata FROM t_gdpGroup ORDER BY gdata ASC;

-- 2.2018年世界各国的GDP排行
SELECT cname,cgdp FROM t_country ORDER BY cgdp ASC;

-- 3.世界各国的人口排行
SELECT cname,cpeople FROM t_country ORDER BY cpeople ASC ;

-- 4.世界各国的领土面积排行
SELECT cname,carea FROM t_country ORDER BY carea ASC;

-- 5.世界各国的非物质文化遗产数量排行
SELECT cname,cheritage FROM t_country ORDER BY cheritage ASC ;

-- 6.世界各国的获得诺贝尔的人数排行
SELECT cname,cnobeier FROM t_country ORDER BY cnobeier ASC ;

-- 7.世界各国的大学数量排行
SELECT cname,cshool FROM t_country ORDER BY cshool ASC;

-- 8.各省的人口数量排名
SELECT zname,zpeople FROM t_china ORDER BY zpeople ASC;

-- 9.各省的GDP增长率排名
SELECT zname,zgdp FROM t_china ORDER BY zgdp ASC;

-- 10.各省的幸福指数排名
SELECT zname,zhappy FROM t_china ORDER BY zhappy ASC;

-- 11.各省的空气质量排名
SELECT zname,zwuran FROM t_china ORDER BY zwuran ASC;

-- 12.各省的铁路密度排名
SELECT zname,ztielu FROM t_china ORDER BY ztielu ASC;

-- 13.各省的高校数量排名
SELECT zname,zschool FROM t_china ORDER BY zschool ASC;

