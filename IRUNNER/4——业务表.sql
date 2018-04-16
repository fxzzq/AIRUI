

-------------------------------------创建内部用户表-------------------------------------------------------------

drop table irunner.ir_right_user;
create table irunner.ir_right_user
(
	usid		int						primary key,											
	usname		varchar2(10)			not null,												
	passwd		varchar2(100)			not null,												
	ussex		char(4)						not null,												
	birthday	date					not null,												
	address		varchar2(100)			not null,												
	cellphone	number					not null,												
	joindate	date					default(sysdate)										
);
comment on column irunner.ir_right_user.usid is '用户编号，主键';
comment on column irunner.ir_right_user.usname is '用户名';
comment on column irunner.ir_right_user.passwd is '密码(MD5加密后入库)';
comment on column irunner.ir_right_user.ussex is '性别（0-女 、1-男）';
comment on column irunner.ir_right_user.birthday is '出生日期';
comment on column irunner.ir_right_user.address is '家庭住址';
comment on column irunner.ir_right_user.cellphone is '联系方式';
comment on column irunner.ir_right_user.joindate is '入职日期';


insert into irunner.ir_right_user values(1,'admin','21232f297a57a5a743894a0e4a801fc3','男',sysdate,'江苏南京','10000',default);
commit;
------------------------------------------------------------------------------------------------------------


------------------------------------创建角色表 -------------------------------------------------------------

drop table irunner.ir_right_role;
create table irunner.ir_right_role
(
	rid				int						primary key,												
	rname			varchar2(20)			not null,
	description		varchar2(4000)
);

comment on column irunner.ir_right_role.rid is '角色编号，主键';
comment on column irunner.ir_right_role.rname is '角色名';
comment on column irunner.ir_right_role.description is '角色权限描述';

insert into  irunner.IR_RIGHT_ROLE values(101,'超级管理员','====');
commit;

------------------------------------------------------------------------------------------------------------


--------------------------------------创建权限清单表--------------------------------------------------------

drop table irunner.ir_right_menu;
create table irunner.ir_right_menu
(
	meid			int					primary key,		
	memethod		varchar2(100)		not null,
	mname		varchar2(50)			not null
);

comment on column irunner.ir_right_menu.meid is '权限编号';
comment on column irunner.ir_right_menu.memethod is '可执行的方法';
comment on column irunner.ir_right_menu.mname is '权限名称';


--初始化菜单表
insert into irunner.ir_right_menu values (201,'MerchandiseController.queryTypeTree','查看类别');
insert into irunner.ir_right_menu values (202,'MerchandiseController.queryParentNodes','查看父节点');
insert into irunner.ir_right_menu values (203,'MerchandiseController.addType','添加类别');
insert into irunner.ir_right_menu values (204,'MerchandiseController.deleteSelectTypes','删除类别');
insert into irunner.ir_right_menu values (205,'MerchandiseController.updateType','修改类别');
insert into irunner.ir_right_menu values (206,'MerchandiseController.queryInfos','查看商品');
insert into irunner.ir_right_menu values (207,'MerchandiseController.queryInfoType','查看商品类别');
insert into irunner.ir_right_menu values (208,'MerchandiseController.insertInfo','添加商品');
insert into irunner.ir_right_menu values (209,'MerchandiseController.deleteInfos','删除商品');
insert into irunner.ir_right_menu values (210,'MerchandiseController.saveEditInfo','修改商品');
insert into irunner.ir_right_menu values (211,'MerchandiseController.queryInfosStock','查看库存');
insert into irunner.ir_right_menu values (212,'MerchandiseController.saveInfoStock','修改库存');
insert into irunner.ir_right_menu values (213,'MerchandiseController.addOrder','添加订单');
insert into irunner.ir_right_menu values (214,'MerchandiseController.queryOrders','查看订单');
insert into irunner.ir_right_menu values (215,'MerchandiseController.deleteOrders','删除订单');
insert into irunner.ir_right_menu values (216,'MerchandiseController.updateOrders','修改订单');
insert into irunner.ir_right_menu values (217,'SystemController.getTree','获取菜单树');
insert into irunner.ir_right_menu values (218,'UserController.register','注册用户');
insert into irunner.ir_right_menu values (219,'UserController.query','查看用户');
insert into irunner.ir_right_menu values (220,'UserController.deleteSelected','删除用户');
insert into irunner.ir_right_menu values (221,'UserController.updateUser','修改用户');
insert into irunner.ir_right_menu values (222,'UserController.getRoleCombobox','查看权限树');
insert into irunner.ir_right_menu values (223,'UserController.setManagerRole','设置管理员权限');
insert into irunner.ir_right_menu values (224,'UserController.querygljs','查看角色信息');
insert into irunner.ir_right_menu values (225,'UserController.queryMenus','查看权限');
insert into irunner.ir_right_menu values (226,'UserController.addRole','添加角色');
insert into irunner.ir_right_menu values (227,'UserController.deleteRole','删除角色');
insert into irunner.ir_right_menu values (228,'UserController.updateRole','修改角色');
insert into irunner.ir_right_menu values (229,'UserController.queryglqx','查看权限信息');
insert into irunner.ir_right_menu values (230,'UserController.addMenu','添加权限');
insert into irunner.ir_right_menu values (231,'UserController.deleteMenus','删除权限');
insert into irunner.ir_right_menu values (232,'SystemController.login','登陆系统');



commit;
------------------------------------------------------------------------------------------------------------


-------------------------------创建用户角色关系表-----------------------------------------------------------

drop table irunner.ir_right_userrole;
create table irunner.ir_right_userrole
(
	oid				int							primary key,												
	usid			int							not null,													
	rid				int							not null													
);

comment on column irunner.ir_right_userrole.oid is '主键';
comment on column irunner.ir_right_userrole.usid is '用户编号';
comment on column irunner.ir_right_userrole.rid is '角色编号';

insert into irunner.ir_right_userrole values (1,1,101);
commit;
------------------------------------------------------------------------------------------------------------


-------------------------------创建角色权限关系表-----------------------------------------------------------

drop table irunner.ir_right_rolemenu;
create table irunner.ir_right_rolemenu
(
	oid				int							primary key,													
	rsid			int							not null,													
	meid			int							not null													
);
comment on column irunner.ir_right_rolemenu.oid is '主键';
comment on column irunner.ir_right_rolemenu.rsid is '角色编号';
comment on column irunner.ir_right_rolemenu.meid is '权限编号';

insert into irunner.ir_right_rolemenu values (1,101,	201);
insert into irunner.ir_right_rolemenu values (2,101,	202);
insert into irunner.ir_right_rolemenu values (3,101,	203);
insert into irunner.ir_right_rolemenu values (4,101,	204);
insert into irunner.ir_right_rolemenu values (5,101,	205);
insert into irunner.ir_right_rolemenu values (6,101,	206);
insert into irunner.ir_right_rolemenu values (7,101,	207);
insert into irunner.ir_right_rolemenu values (8,101,	208);
insert into irunner.ir_right_rolemenu values (9,101,	209);
insert into irunner.ir_right_rolemenu values (10,101,	210);
insert into irunner.ir_right_rolemenu values (11,101,	211);
insert into irunner.ir_right_rolemenu values (12,101,	212);
insert into irunner.ir_right_rolemenu values (13,101,	213);
insert into irunner.ir_right_rolemenu values (14,101,	214);
insert into irunner.ir_right_rolemenu values (15,101,	215);
insert into irunner.ir_right_rolemenu values (16,101,	216);
insert into irunner.ir_right_rolemenu values (17,101,	217);
insert into irunner.ir_right_rolemenu values (18,101,	218);
insert into irunner.ir_right_rolemenu values (19,101,	219);
insert into irunner.ir_right_rolemenu values (20,101,	220);
insert into irunner.ir_right_rolemenu values (21,101,	221);
insert into irunner.ir_right_rolemenu values (22,101,	222);
insert into irunner.ir_right_rolemenu values (23,101,	223);
insert into irunner.ir_right_rolemenu values (24,101,	224);
insert into irunner.ir_right_rolemenu values (25,101,	225);
insert into irunner.ir_right_rolemenu values (26,101,	226);
insert into irunner.ir_right_rolemenu values (27,101,	227);
insert into irunner.ir_right_rolemenu values (28,101,	228);
insert into irunner.ir_right_rolemenu values (29,101,	229);
insert into irunner.ir_right_rolemenu values (30,101,	230);
insert into irunner.ir_right_rolemenu values (31,101,	231);
insert into irunner.ir_right_rolemenu values (32,101,	232);

commit;
----------------------------------------会员表------------------------------------------------------------------
drop table irunner.ir_proc_member;
create table irunner.ir_proc_member
(
id 					int 			primary key,
account 			varchar2(100) 	not null,
password 			varchar2(100) 	not null,
sex 				char(4) 		not null,
birth 				date,
phone 				varchar2(12),
address 			varchar2(100),
remaining 			number 			default 0
);

-------------------------------------商品类别表--------------------------------------------------------------
drop table irunner.ir_proc_type;
create table irunner.ir_proc_type
(
	ptid			int						primary key,											
	ptype			varchar2(50)			not null,												
	maintype		int,		
	state			varchar2(12)
);

comment on column irunner.ir_proc_type.ptid is '类别id';
comment on column irunner.ir_proc_type.ptype is '类别名称';
comment on column irunner.ir_proc_type.maintype is '父级id';
comment on column irunner.ir_proc_type.state is '节点状态 closed表示有子节点 null 表示没有';

insert into irunner.ir_proc_type values (0,'运动户外','','closed');
insert into irunner.ir_proc_type values (1,'鞋帽服饰','0','closed');
insert into irunner.ir_proc_type values (2,'体育用品','0','closed');
insert into irunner.ir_proc_type values (3,'健身器材','0','closed');
insert into irunner.ir_proc_type values (4,'足球鞋','1',null);
insert into irunner.ir_proc_type values (5,'篮球鞋','1',null);
insert into irunner.ir_proc_type values (6,'羽毛球','2',null);
insert into irunner.ir_proc_type values (7,'足球','2',null);
insert into irunner.ir_proc_type values (8,'篮球','2',null);
insert into irunner.ir_proc_type values (9,'乒乓球','2',null);
insert into irunner.ir_proc_type values (10,'跑步机','3',null);
insert into irunner.ir_proc_type values (11,'山地车','3',null);
insert into irunner.ir_proc_type values (12,'哑铃','3',null);
insert into irunner.ir_proc_type values (13,'运动护具','3',null);

commit;
------------------------------------------------------------------------------------------------------------


-------------------------------商品信息表-------------------------------------------------------------------
drop table irunner.ir_proc_info;
create table irunner.ir_proc_info
(
	pid				int						primary key,													
	pname			varchar2(50)			not null,														
	pcode			varchar2(200)			not null,														
	price			number					not null,														
	pscript			varchar2(200)			default 0,																			
	ptid			int						not null ,							
	totalstock		int						default 0,																					
	virtualstock	int						default 0																					
);

comment on column irunner.ir_proc_info.pid			 is '产品id，主键';
comment on column irunner.ir_proc_info.pname		 is '产品名称';
comment on column irunner.ir_proc_info.pcode		 is '产品货号';
comment on column irunner.ir_proc_info.price		 is '产品价格';
comment on column irunner.ir_proc_info.pscript		 is '产品描述';
comment on column irunner.ir_proc_info.ptid		 	 is '产品类别';
comment on column irunner.ir_proc_info.totalstock	 is '总库存（产品使用）';
comment on column irunner.ir_proc_info.virtualstock  is '可用库存（购物车使用）';

insert into irunner.ir_proc_info values (1,'彪马/PUMA evoPOWER 4.3 男子 足球鞋','103586',199,'荧光黄01',4,0,0);
insert into irunner.ir_proc_info values (2,'彪马/PUMA evoPOWER 4.3 男子 足球鞋','103583',198,'火焰红02',4,0,0);
insert into irunner.ir_proc_info values (3,'SPALDING/斯伯丁 篮球','74-655Y',211,'PU材质 室内外兼用 比赛用球',8,0,0);
insert into irunner.ir_proc_info values (4,'SPALDING/斯伯丁 篮球','74-604Y',189,'PU材质 室内外兼用 红白蓝三色炫彩 7号球',8,0,0);
insert into irunner.ir_proc_info values (5,'耐克NIKE男子篮球鞋','860633-606',699,'ZOOM气垫 室内 红色 42码',5,0,0);
insert into irunner.ir_proc_info values (6,'NIKE AIR Foamposite One Copper 男子篮球鞋','314996-007',1999,'喷铜 喷泡 44.5',5,0,0);
commit;
------------------------------------------------------------------------------------------------------------


-----------------------------------货源订单信息表---------------------------------------------------------------
drop table irunner.ir_proc_proorder;
create table irunner.ir_proc_proorder
(
	id			int					primary key,
	proid		varchar2(100)		not null,	
	member_id   int  				not null,
	pid			int  				not null,														
	placetime	date 				default sysdate,																							
	closingtime	date,																							
	quantity	int 				default 0,																							
	orderstatu	char(3)				default 'N'																					
);
comment on column irunner.ir_proc_proorder.id			 	 is '主键';
comment on column irunner.ir_proc_proorder.proid			 is '订单编号,使用当天时间yyyyMMdd';
comment on column irunner.ir_proc_proorder.member_id 		 is '订单用户';
comment on column irunner.ir_proc_proorder.pid				 is '商品id，外键，关联ir_proc_info.pid';
comment on column irunner.ir_proc_proorder.placetime		 is '下单时间';
comment on column irunner.ir_proc_proorder.closingtime		 is '成交时间';
comment on column irunner.ir_proc_proorder.quantity		 	 is '订单数量';
comment on column irunner.ir_proc_proorder.orderstatu		 is '订单状态(Y为已成交订单,N为未成交订单)';
------------------------------------------------------------------------------------------------------------



----------------------------------购物车信息----------------------------------------------------------------
drop table irunner.ir_proc_shopping;
create table irunner.ir_proc_shopping
(
	id			int 			primary key,										
	order_id	varchar2(100) 	not null,											
	usid		int				not null,	
	pid			int				not null, 		
	order_count int				default 1,											
	jointime	date			default sysdate,									
	closetime	date,																
	statu		char(3)	default 'N'													
);

comment on column irunner.ir_proc_shopping.id				is '主键';
comment on column irunner.ir_proc_shopping.order_id			is '订单编号';
comment on column irunner.ir_proc_shopping.usid				is '用户id，外键，关联ir_right_user.usid';
comment on column irunner.ir_proc_shopping.pid				is '产品id，外键，关联proc_info.pid';
comment on column irunner.ir_proc_shopping.order_count 		is '订单数量';
comment on column irunner.ir_proc_shopping.jointime			is '加入购物车时间';
comment on column irunner.ir_proc_shopping.closetime		is '成交时间';
comment on column irunner.ir_proc_shopping.statu			is '订单状态(Y为已成交订单,N为未成交订单)';
------------------------------------------------------------------------------------------------------------














































