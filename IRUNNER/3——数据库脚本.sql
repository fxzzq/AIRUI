/*=============================================================================*/

/*��Ϊ�Ĳ� */ 

/*��1����������ʱ��ռ�(ע�⣺C:\Project\OracleTableSpace\IRUNNER\ �ֶ�����·��)  */ 

create temporary tablespace IRUNNER_TEMP  

tempfile 'C:\Project\OracleTableSpace\IRUNNER\IRUNNER_TEMP.dbf' 

size 50m  

autoextend on  

next 50m maxsize 1024m  

extent management local;  

 

/*��2�����������ݱ�ռ�  */

create tablespace IRUNNER_DATA

logging  

datafile 'c:\Project\OracleTableSpace\IRUNNER\IRUNNER_DATA.dbf' 

size 50m  

autoextend on  

next 50m maxsize 1028m  

extent management local;  

 

/*��3���������û���ָ����ռ� ������root */

create user IRUNNER identified by root

default tablespace IRUNNER_DATA

temporary tablespace IRUNNER_TEMP;  

 

/*��4�������û�����Ȩ��  */

grant connect,resource,dba to IRUNNER; 

/*=====================================================================*/

--��DBA
------------------�����˵���----------------------------------------
DROP TABLE IRUNNER.NAV_TREE;

CREATE TABLE IRUNNER.NAV_TREE(
ID VARCHAR2(10) PRIMARY KEY,
TEXT VARCHAR2(100),
URL VARCHAR2(100) DEFAULT NULL,
STATE VARCHAR2(10) DEFAULT 'closed',
PID VARCHAR2(10)
);

COMMENT ON COLUMN IRUNNER.NAV_TREE.ID IS '�ڵ�ID';
COMMENT ON COLUMN IRUNNER.NAV_TREE.TEXT IS '�ڵ�����';
COMMENT ON COLUMN IRUNNER.NAV_TREE.URL IS '�ڵ��������ת·��';
COMMENT ON COLUMN IRUNNER.NAV_TREE.STATE IS '�ڵ�״̬���ڵ�״̬������open��closed';
COMMENT ON COLUMN IRUNNER.NAV_TREE.PID IS '���ڵ�';

INSERT INTO IRUNNER.NAV_TREE VALUES (1,'ϵͳ����',DEFAULT,DEFAULT,NULL);
INSERT INTO IRUNNER.NAV_TREE VALUES ('yhgl','�û�����',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('spgl','��Ʒ����',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('xsgl','���۹���',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('rzfx','��־����',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('rzgl','��־����',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('tjxt','�Ƽ�ϵͳ',DEFAULT,DEFAULT,1);
INSERT INTO IRUNNER.NAV_TREE VALUES ('xtgl','ϵͳ����',DEFAULT,DEFAULT,1);
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('glyh','�����û�','yhgl/glyh.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('gljs','�����ɫ','yhgl/gljs.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('glqx','����Ȩ��','yhgl/glqx.jsp','open','yhgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('hyyh','��Ա�û�',DEFAULT,'open','yhgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('cpxx','��Ʒ��Ϣ',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('cplb','��Ʒ���',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('pdwh','�̵�ά��',DEFAULT,'open','spgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('cggl','�ɹ�����',DEFAULT,'open','spgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('lssscx','��ʷ���۲�ѯ',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('lssstopn','��ʷ����TOPN',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('hygmmx','��Ա������ϸ',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('khdd','�ͻ�����',DEFAULT,'open','xsgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('zfxt','֧��ϵͳ',DEFAULT,'open','xsgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('jcfx','��������',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('lyfx','��Դ����',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sffx','�ܷ÷���',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('fkfx','�ÿͷ���',DEFAULT,'open','rzfx');
INSERT INTO IRUNNER.NAV_TREE VALUES ('zhljfx','ת��·������',DEFAULT,'open','rzfx');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('whrz','ά����־',DEFAULT,'open','rzgl');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('cnxh','����ϲ��',DEFAULT,'open','tjxt');
INSERT INTO IRUNNER.NAV_TREE VALUES ('djdzm','��Ҷ�����',DEFAULT,'open','tjxt');
----------------------------------------------------------------------------------
INSERT INTO IRUNNER.NAV_TREE VALUES ('xtcsh','ϵͳ��ʼ��',DEFAULT,'open','xtgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sjbf','���ݱ���',DEFAULT,'open','xtgl');
INSERT INTO IRUNNER.NAV_TREE VALUES ('sjhy','���ݻ�ԭ',DEFAULT,'open','xtgl');
COMMIT;






