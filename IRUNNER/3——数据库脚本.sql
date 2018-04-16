/*=============================================================================*/

/*分为四步 */ 

/*第1步：创建临时表空间(注意：C:\Project\OracleTableSpace\IRUNNER\ 手动创建路径)  */ 

create temporary tablespace IRUNNER_TEMP  

tempfile 'C:\Project\OracleTableSpace\IRUNNER\IRUNNER_TEMP.dbf' 

size 50m  

autoextend on  

next 50m maxsize 1024m  

extent management local;  

 

/*第2步：创建数据表空间  */

create tablespace IRUNNER_DATA

logging  

datafile 'c:\Project\OracleTableSpace\IRUNNER\IRUNNER_DATA.dbf' 

size 50m  

autoextend on  

next 50m maxsize 1028m  

extent management local;  

 

/*第3步：创建用户并指定表空间 密码是root */

create user IRUNNER identified by root

default tablespace IRUNNER_DATA

temporary tablespace IRUNNER_TEMP;  

 

/*第4步：给用户授予权限  */

grant connect,resource,dba to IRUNNER; 

/*=====================================================================*/

--用DBA
------------------导航菜单表----------------------------------------
DROP TABLE IRUNNER.NAV_TREE;

CREATE TABLE IRUNNER.NAV_TREE(
ID VARCHAR2(10) PRIMARY KEY,
TEXT VARCHAR2(100),
URL VARCHAR2(100) DEFAULT NULL,
STATE VARCHAR2(10) DEFAULT 'closed',
PID VARCHAR2(10)
);

COMMENT ON COLUMN IRUNNER.NAV_TREE.ID IS '节点ID';
COMMENT ON COLUMN IRUNNER.NAV_TREE.TEXT IS '节点名称';
COMMENT ON COLUMN IRUNNER.NAV_TREE.URL IS '节点点击后的跳转路径';
COMMENT ON COLUMN IRUNNER.NAV_TREE.STATE IS '节点状态，节点状态有两种open和closed';
COMMENT ON COLUMN IRUNNER.NAV_TREE.PID IS '父节点';

INSERT INTO IRUNNER.NAV_TREE VALUES (1,'系统导航',DEFAULT,DEFAULT,NULL);
INSERT INTO IRUNNER.NAV_TREE VALUES ('yhgl','用户管理',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('spgl','产品管理',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('xsgl','销售管理',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('rzfx','日志分析',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('rzgl','日志管理',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('tjxt','推荐系统',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('xtgl','系统管理',DEFAULT,DEFAULT,1);
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('glyh','管理用户','yhgl/glyh.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('gljs','管理角色','yhgl/gljs.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('glqx','管理权限','yhgl/glqx.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('hyyh','会员用户',DEFAULT,'open','yhgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('cpxx','产品信息',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('cplb','产品类别',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('pdwh','盘点维护',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('cggl','采购管理',DEFAULT,'open','spgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('lssscx','历史销售查询',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('lssstopn','历史销售TOPN',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('hygmmx','会员购买明细',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('khdd','客户订单',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('zfxt','支付系统',DEFAULT,'open','xsgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('jcfx','基础分析',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('lyfx','来源分析',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sffx','受访分析',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('fkfx','访客分析',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('zhljfx','转化路径分析',DEFAULT,'open','rzfx');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('whrz','维护日志',DEFAULT,'open','rzgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('cnxh','猜你喜欢',DEFAULT,'open','tjxt');
INSERT INTO IRUNNER.NAV_TREE VALUES ('djdzm','大家都在买',DEFAULT,'open','tjxt');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('xtcsh','系统初始化',DEFAULT,'open','xtgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sjbf','数据备份',DEFAULT,'open','xtgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sjhy','数据还原',DEFAULT,'open','xtgl');
COMMIT;






