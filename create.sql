DROP DATABASE IF EXISTS memberManagement;

CREATE DATABASE memberManagement;

USE memberManagement;

 /*银行*/ 
 CREATE TABLE bank(
	id INT PRIMARY KEY AUTO_INCREMENT,
	bankName VARCHAR(20) ,/*银行名称*/
	`no` VARCHAR(20)  UNIQUE,/*银行卡号*/
	pwd VARCHAR(500) ,/*银行卡密码*/
	remainder DECIMAL(15,2),/*余额*/
	openUser VARCHAR(20),/*开户人*/
	/*加了2个字段*/
	papersNo VARCHAR(18),/*身份证*/
	telphone VARCHAR(20)/*开户电话号码号码*/

 );

 /*数据插入~银行表*/
INSERT INTO bank
VALUES(DEFAULT,'中国农业银行','4000000525','111111',13.23,'王一','430526198006050082','13040884952'),
      (DEFAULT,'中国建设银行','4000200425','111111',273.00,'王八','430526198006050082','13040884952'),
      (DEFAULT,'中国邮政银行','4000300525','111111',486.12,'陈三','430526198006050082','13040884952'),
      (DEFAULT,'中国农业银行','4000600525','111111',1773.23,'小明','430526198006050082','13040884952'),
      (DEFAULT,'中国邮政银行','4000300520','111111',4556.12,'李四','430526198006050082','13040884952'),
      (DEFAULT,'中国招商银行','4000400525','111111',588.11,'张三','430526198006050082','13040884952'),
      (DEFAULT,'中国招商银行','4000900525','111111',99958.11,'吴光','430526198006050082','13040884952');

/*角色表*/
CREATE TABLE role(
	id INT PRIMARY KEY AUTO_INCREMENT,/*id*/
	`no` VARCHAR(20)  UNIQUE,/*编号*/
	`name` VARCHAR(20),/*名称*/
	stats INT /*状态：1启用,0禁用*//*不需要*/
);

/*数据插入~角色表*/
INSERT INTO role(id,`no`,`name`,stats)
VALUES(DEFAULT,'001','admin',1),  /*系统管理员*/
      (DEFAULT,'003','supermember',1), /*超级会员*/
      (DEFAULT,'002','member',1); /*会员*/


/*用户表*/
CREATE TABLE users(
       id INT PRIMARY KEY AUTO_INCREMENT,/*用户编号*/
       userName VARCHAR(20) ,/*用户名*/
       pwd VARCHAR(500) ,/*密码*/
       pwd2 VARCHAR(500),/*支付密码*/
       `name` VARCHAR(20) ,/*真实姓名*/
       papersType VARCHAR(20) ,/*证件类型*/
       papersNo VARCHAR(18) ,/*证件号码*/
       telephoneNumber VARCHAR(20) ,/*联系电话*/
       email VARCHAR(30) ,/*电子邮件*/
       postalcode VARCHAR(6) ,/*邮政编码*/
       referee VARCHAR(20),/*推荐人*/
       nations VARCHAR(20),/*收货国家*/
       openBank VARCHAR(30),/*开户行*/
       openUserName VARCHAR(20),/*开户人*/
       openNo VARCHAR(20),/*开户卡号*/
       papersImgZ VARCHAR(50),/*证件照正面图片路径*/
       papersImgF VARCHAR(50),/*证件照反面图片路径*/
       bankCard VARCHAR(50),/*银行卡图片路径*/
       address VARCHAR(50),/*收货地址*/
       createTime DATETIME,/*创建时间*/
       modifyTime DATETIME,/*最后修改时间*/
       state INT, /*0禁用,1启用*/
       roleId INT,/*角色id*/
       remainder DECIMAL(15,2),/*余额*/
       CONSTRAINT `FK_users_roleId_role_id` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)/*roleId连接role表的id*/
);

/*数据插入~用户表*/
INSERT INTO users VALUES
    (DEFAULT,'VIP1','111111','000000','王一','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国农业银行','王一','4000000525',NULL,NULL,NULL,'中国深圳市福田区',NOW(),NOW(),1,1,267.20),
    (DEFAULT,'VIP2','111111','000000','王八','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国建设银行','王八','4000200425',NULL,NULL,NULL,'中国深圳市福田区',NOW(),'2017-02-25',1,2,9927.20),
    (DEFAULT,'VIP3','111111','000000','陈三','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国邮政银行','陈三','4000300525',NULL,NULL,NULL,'中国深圳市福田区',NOW(),'2017-02-25',1,2,9927.20),
    (DEFAULT,'VIP4','111111','000000','小明','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国农业银行','小明','4000600525',NULL,NULL,NULL,'中国深圳市福田区','2017-02-25','2017-02-25',1,2,25657.20),
    (DEFAULT,'SVIP3','111111','000000','李四','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国邮政银行','李四','4000300520',NULL,NULL,NULL,'中国深圳市福田区','2017-02-25','2017-02-25',1,3,25657.20),
    (DEFAULT,'SVIP6','111111','000000','张三','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国招商银行','张三','4000400525',NULL,NULL,NULL,'中国深圳市福田区','2017-02-25','2017-02-25',1,3,29657.20),
    (DEFAULT,'SVIP10','111111','000000','吴光','身份证','430526198006050082','13040884952','cssb@163.com','518000','不摇碧莲','中国','中国招商银行','吴光','4000900525',NULL,NULL,NULL,'中国深圳市福田区','2017-02-25','2018-02-28',1,3,295657.20);

/*管理表*/
CREATE TABLE manage(
	id INT PRIMARY KEY AUTO_INCREMENT,/*编号*/
	`name` VARCHAR(20),/*名称*/
	icon VARCHAR(20)/*小图标*/
);

/*数据插入~管理表*/
INSERT INTO manage
VALUES(DEFAULT,'系统管理',NULL ),
      (DEFAULT,'会员管理',NULL ),
      (DEFAULT,'电子银行',NULL ),
      (DEFAULT,'购物管理',NULL ),
      (DEFAULT,'信息查询',NULL ),
      (DEFAULT,'资讯管理',NULL );

/*管理表项*/
CREATE TABLE manageItem(
	id INT PRIMARY KEY AUTO_INCREMENT,/*编号*/
	`name` VARCHAR(20),/*名称*/
	manageId INT, /*管理表编号*/
	/*2018/2/26 3:20修改*/
	title VARCHAR(20),/*鼠标悬浮显示的标题*/
	icon VARCHAR(20),/*小图标*/
	href VARCHAR(50),/*要跳转的路径*/
       CONSTRAINT `FK_manageItem_manageId_manage_id` FOREIGN KEY (`manageId`) REFERENCES `manage` (`id`)/*manageId连接manage的id*/
);

/*数据插入~管理表项*/
INSERT INTO manageItem
VALUES(DEFAULT,'用户管理',1,'用户管理',NULL,'/usermanagement'),
      (DEFAULT,'角色管理',1,'角色管理',NULL,NULL),
      (DEFAULT,'权限管理',1,'权限管理',NULL,NULL),
      (DEFAULT,'商品管理',1,'商品管理',NULL,'/commoditymanagement'),
      (DEFAULT,'商品套餐管理',1,'商品套餐管理',NULL,NULL),
      (DEFAULT,'基础信息',1,'基础信息',NULL,NULL),
      (DEFAULT,'数据字典',1,'数据字典',NULL,NULL),
      (DEFAULT,'注册新会员',2,'注册新会员',NULL,NULL),
      (DEFAULT,'新会员管理',2,'新会员管理',NULL,NULL),
      (DEFAULT,'修改本人资料',2,'修改本人资料',NULL,NULL),
      (DEFAULT,'修改本人密码',2,'修改本人密码',NULL,NULL),
      (DEFAULT,'汇款充值',3,'汇款充值',NULL,'/remittanc'),
      (DEFAULT,'基本账户',3,'基本账户',NULL,'/basicaccount'),
      (DEFAULT,'消费账户',3,'消费账户',NULL,NULL),
      (DEFAULT,'内部转账',3,'内部转账',NULL,'/nternaltransfer'),
      (DEFAULT,'申请提现',3,'申请提现',NULL,'/destoon_finance_cash'),
      (DEFAULT,'提现明细',3,'提现明细',NULL,'/tixianmingxi'),
      (DEFAULT,'报单购货',4,'报单购货',NULL,NULL),
      (DEFAULT,'确认激活',4,'确认激活',NULL,NULL),
      (DEFAULT,'重消购货',4,'重消购货',NULL,NULL),
      (DEFAULT,'辅消购货',4,'辅消购货',NULL,NULL),
      (DEFAULT,'购货管理',4,'购货管理',NULL,NULL),
      (DEFAULT,'奖励查询',5,'奖励查询',NULL,NULL),
      (DEFAULT,'推荐查询',5,'推荐查询',NULL,NULL),
      (DEFAULT,'区域查询',5,'区域查询',NULL,NULL),
      (DEFAULT,'操作须知',5,'操作须知',NULL,NULL),
      (DEFAULT,'公告管理',6,'公告管理',NULL,NULL),
      (DEFAULT,'资讯管理',6,'资讯管理',NULL,NULL),
      (DEFAULT,'下载中心',6,'下载中心',NULL,NULL),
      (DEFAULT,'留言管理',6,'留言管理',NULL,NULL);

/*权限表*/
CREATE TABLE root(
	id INT PRIMARY KEY AUTO_INCREMENT,/*编号*/
	manageItemId INT,/*管理表项编号*/
	roleId INT, /*角色编号*/
       CONSTRAINT `FK_root_manageItemId_manageItem_id` FOREIGN KEY (`manageItemId`) REFERENCES `manageItem` (`id`),/*manageItemId连接manageItem的id*/
       CONSTRAINT `FK_root_roleId_role_id` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)/*roleId连接role的id*/
);

/*数据插入~权限表*/
INSERT INTO root
VALUES(DEFAULT,1,1),
      (DEFAULT,2,1),
      (DEFAULT,3,1),
      (DEFAULT,4,1),
      (DEFAULT,5,1),
      (DEFAULT,6,1),
      (DEFAULT,7,1),
      (DEFAULT,8,1),
      (DEFAULT,9,1),
      (DEFAULT,10,1),
      (DEFAULT,11,1),
      (DEFAULT,12,1),
      (DEFAULT,13,1),
      (DEFAULT,14,1),
      (DEFAULT,15,1),
      (DEFAULT,16,1),
      (DEFAULT,17,1),
      (DEFAULT,18,1),
      (DEFAULT,19,1),
      (DEFAULT,20,1),
      (DEFAULT,21,1),
      (DEFAULT,22,1),
      (DEFAULT,23,1),
      (DEFAULT,24,1),
      (DEFAULT,25,1),
      (DEFAULT,26,1),
      (DEFAULT,27,1),
      (DEFAULT,28,1),
      (DEFAULT,29,1),
      (DEFAULT,30,1),
      (DEFAULT,8,2),
      (DEFAULT,9,2),
      (DEFAULT,10,2),
      (DEFAULT,11,2),
      (DEFAULT,12,2),
      (DEFAULT,13,2),
      (DEFAULT,14,2),
      (DEFAULT,15,2),
      (DEFAULT,16,2),
      (DEFAULT,17,2),
      (DEFAULT,18,2),
      (DEFAULT,19,2),
      (DEFAULT,20,2),
      (DEFAULT,21,2),
      (DEFAULT,22,2),
      (DEFAULT,23,2),
      (DEFAULT,24,2),
      (DEFAULT,25,2),
      (DEFAULT,26,2),
      (DEFAULT,27,2),
      (DEFAULT,28,2),
      (DEFAULT,29,2),
      (DEFAULT,30,2);

/*商品表*/
CREATE TABLE commodity(
	id INT PRIMARY KEY AUTO_INCREMENT,/*id*/
	`name` VARCHAR(50),/*商品名称*/
	commodityNo VARCHAR(20)  UNIQUE,/*商品编号*/
	price DECIMAL(15,2),/*市场价*/
	discountPrice DECIMAL(15,2),/*优惠价*/
	stock INT ,/*库存*/
	unit VARCHAR(10),/*单位*/
	state INT,/*0下架,1上架*/
	spec  VARCHAR(200),/*规格*/
	illustrate VARCHAR(500),/*说明*/
	modifyTime DATETIME/*修改时间*/
);

 /*数据插入~商品表*/
INSERT INTO commodity
VALUES(DEFAULT,'碧莲子','B01',10.00,9.00,1000,'株',1,'1粒/盒','碧莲子。清心火',NOW()),
      (DEFAULT,'碧莲叶','B02',10.00,9.00,1000,'叶',1,'1叶/盒','碧莲叶。提升吸收速率',NOW()),
      (DEFAULT,'碧莲花','B03',10.00,9.00,1000,'朵',1,'1朵/盒','碧莲花。清晰武道，明省自我',NOW()),
      (DEFAULT,'碧莲藕','B04',10.00,9.00,1000,'根',1,'1根/盒','碧莲藕。补充体能',NOW()),
      (DEFAULT,'十年不摇碧莲','SB01',100.00,99.00,1000,'株',1,'1株/盒','碧莲 莲花品种之一。清心火、强心降压功效;补脾止泻、养心益肾功效,服用者,刹那提升自身碧莲值，时效1小时',NOW()),
      (DEFAULT,'百年不摇碧莲','BB01',1000.00,999.00,100,'株',1,'1株/盒','碧莲 莲花品种之一。清心火、强心降压功效;补脾止泻、养心益肾功效,服用者,短暂提升自身碧莲值，时效1天',NOW()),
      (DEFAULT,'千年不摇碧莲','QB01',9000.00,999.00,10,'株',1,'1株/盒','碧莲 莲花品种之一。清心火、强心降压功效;补脾止泻、养心益肾功效,服用者,较长时间提升自身碧莲值，时效1个月',NOW()),
      (DEFAULT,'万年不摇碧莲','WB01',10000.00,9999.00,1,'株',1,'1株/盒','提升千年修为,服用者,很长时间提升自身碧莲值，时效10年',NOW()),
      (DEFAULT,'十万年不摇碧莲','SWB01',50000.00,40000.00,1,'株',1,'1株/盒','武极破空，直接飞升。秘；净莲碧胜成道宝物。服用者,极长时间提升自身碧莲值，时效一甲子',NOW()),
      (DEFAULT,'百万年不摇碧莲','BWB01',90000.00,80000.00,1,'株',1,'1株/盒','武达极致，无价之宝,服用者,半永久时间提升自身碧莲值，时效千年',NOW()),
      (DEFAULT,'混沌不摇碧莲','HDB-x',990000.00,990000.00,1,'株',1,'1株/盒','开天宝物，存在不明。长生不死，天下碧格尽归己身。据密史记载服用者,必永久提升自身碧莲值，时效亿兆年',NOW());

/*商品套餐*/
CREATE TABLE commoditySetMeal(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50),/*套餐名称*/
	`no` VARCHAR(20)  UNIQUE,/*套餐编号*/
	`type` VARCHAR(20),/*套餐类型*/
	price DECIMAL(15,2),/*零售价*/
	discountPrice DECIMAL(15,2),/*优惠价*/
	state INT ,/*状态:1上架,0下架*/
	illustrate VARCHAR(500)/*说明*/
);

/*数据插入~商品套餐表*/
INSERT INTO commoditySetMeal
VALUES(DEFAULT,'白碧套餐','V001-A','辅消购货',110.00,100.00,1,'春节特惠，开年促销,大众专属'),
      (DEFAULT,'黄碧套餐','V001-S','辅消购货',500.00,396.00,1,'春节特惠，开年促销,会员专属'),
      (DEFAULT,'紫碧套餐','Vs001-S','重消购货',1000.00,896.00,1,'紫金会员专属套餐,限购10个'),
      (DEFAULT,'黑碧套餐','SV001-A','重消购货',5000.00,4896.00,1,'黑晶会员专属套餐'),
      (DEFAULT,'红碧套餐','SV001-S','报单购货',10000.00,9896.00,1,'红晶会员专属套餐,仅限一次购买'),
      (DEFAULT,'彩碧套餐','XV000-S','报单购货',90000.00,89896.00,1,'彩晶会员前三者可购买');

/*商品套餐里的商品*/
CREATE TABLE commoditySetMealItems(
	id INT PRIMARY KEY AUTO_INCREMENT,
	commoditySetMealId INT ,/*套餐id*/
	commodityId INT ,/*商品id*/
	num INT,/*个数*/
        CONSTRAINT `FK_commoditySetMealItems_commoditySetMealId_commoditySetMeal_id` FOREIGN KEY (`commoditySetMealId`) REFERENCES `commoditySetMeal` (`id`),/*commoditySetMealId连接commoditySetMeal的id*/
        CONSTRAINT `FK_commoditySetMealItems_commodityId_commodity_id` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`)/*roleId连接commodity的id*/

);

/*数据插入~商品套餐里的商品表*/
INSERT INTO commoditySetMealItems
VALUES(DEFAULT,1,1,3),
      (DEFAULT,1,2,3),
      (DEFAULT,1,3,1),
      (DEFAULT,1,4,3),
      (DEFAULT,1,5,2),
      (DEFAULT,2,1,3),
      (DEFAULT,2,4,3),
      (DEFAULT,2,6,2),
      (DEFAULT,3,6,1),
      (DEFAULT,3,1,2),
      (DEFAULT,3,4,2),
      (DEFAULT,4,7,1),
      (DEFAULT,4,6,3),
      (DEFAULT,5,8,2),
      (DEFAULT,5,3,3),
      (DEFAULT,6,9,1),
      (DEFAULT,6,3,1);


/*订单*/
CREATE TABLE `order`(
	id INT KEY AUTO_INCREMENT,
	/*新增*/
	userid INT ,/*用户编号*/
	commodityId INT ,/*商品id*/
	orderNo VARCHAR(20)  UNIQUE,/*订单号*/
	userName VARCHAR(20) ,/*会员名称*/
	consignee VARCHAR(20) ,/*收货人*/
	ordertime DATETIME ,/*交易日期*/
	`type` VARCHAR(20) ,/*交易类型*/
	price DECIMAL(15,2) ,/*交易金额*/
        CONSTRAINT `FK_order_commodityId_commodity_id` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`),/*commodityId引用到commodity表的id*/
        CONSTRAINT `FK_order_userid_users_id` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)/*userid引用到users表的id*/

);

/*数据插入~订单表*/
INSERT INTO `order`
VALUE(DEFAULT,1,1,'v-01','VIP1','王一',NOW(),'报单购货',9.00),
     (DEFAULT,1,2,'v-02','VIP1','王一',NOW(),'重消购货',9.00),
     (DEFAULT,1,2,'v-03','VIP1','王一',NOW(),'重消购货',9.00),
     (DEFAULT,2,7,'v-04','VIP2','王八',NOW(),'重消购货',999.00),
     (DEFAULT,2,6,'v-05','VIP2','王八',NOW(),'重消购货',999.00),
     (DEFAULT,3,7,'v-06','VIP3','陈三',NOW(),'重消购货',999.00),
     (DEFAULT,4,6,'v-07','VIP4','小明',NOW(),'报单购货',999.00),
     (DEFAULT,5,5,'sv-03','SVIP3','李四',NOW(),'重消购货',999.00),
     (DEFAULT,6,5,'sv-04','SVIP6','张三',NOW(),'重消购货',999.00),
     (DEFAULT,6,7,'sv-05','SVIP6','张三',NOW(),'重消购货',999.00),
     (DEFAULT,7,8,'sv-06','SVIP10','吴光',NOW(),'报单购货',9999.00),
     (DEFAULT,7,8,'sv-07','SVIP10','吴光',NOW(),'报单购货',9999.00),
     (DEFAULT,7,1,'sv-08','SVIP10','吴光',NOW(),'报单购货',9.00);

/*公告*/
CREATE TABLE proclamation(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),/*标题*/
	createTime DATETIME ,/*创建时间*/
	beginTime DATETIME,/*开始时间*/
	endTime DATETIME,/*结算时间*/
	content VARCHAR(1000)/*内容*/
);

/*数据插入~公告表*/
INSERT INTO proclamation
VALUE(DEFAULT,'会员卡更新公告',NOW(),NOW(),NOW(),'
          积分规则

会员等级  	一笔订单内，积分抵扣金额的最高比例
普通会员 	不超过40%
银 会 员 	不超过60%
金 会 员 	不超过80%
白金会员 	无限制
钻石会员
皇冠会员
'),
(DEFAULT,'官方网站系统升级维护公告',NOW(),NOW(),NOW(),'
尊贵的会员们：

为了能给您提供更全面的服务、更美好的体验，网站于 2017年7月30日1:00~8月1日6:00 进行系统升级维护，在该时间段内，网站的国际国内访问会受到限制，为此给您带来的不变与困扰，我们深表歉意！

感谢您一直以来对飞行总动员航空网的关注与支持，我们将竭诚为您提供专业化的服务！

如有疑问，请发邮件至shanghai@cssbybl.com,我们将会第一时间回复您！
');


/*银行卡交易记录*/
CREATE TABLE bankTranRecords(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`no` VARCHAR(20) , /*交易卡号*/
	`type` VARCHAR(20) ,/*交易类型*/
	/*新增*/
	tranTime DATETIME ,/*交易时间*/
	price DECIMAL(15,2),/*交易金额*/
	title VARCHAR (200),/*摘要*/
	orderNo VARCHAR (20)/*订单号*/

);
/*数据插入~银行卡交易记录表*/
INSERT INTO bankTranRecords
VALUE(DEFAULT,'4000000525','网络消费',NOW(),1000.00,NULL,NULL),
     (DEFAULT,'4000200425','网络消费',NOW(),20000.00,NULL,NULL),
     (DEFAULT,'4000300525','网络消费',NOW(),20.00,NULL,NULL),
     (DEFAULT,'4000300525','网络消费',NOW(),512.00,NULL,NULL),
     (DEFAULT,'4000300525','网络消费',NOW(),124.00,NULL,NULL),
     (DEFAULT,'4000900525','网络消费',NOW(),123.00,NULL,NULL),
     (DEFAULT,'4000900525','网络消费',NOW(),456.00,NULL,NULL),
     (DEFAULT,'4000400525','网络消费',NOW(),2454.00,NULL,NULL),
     (DEFAULT,'4000900525','网络消费',NOW(),143.00,NULL,NULL),
     (DEFAULT,'4000400525','网络消费',NOW(),2154.00,NULL,NULL),
     (DEFAULT,'4000900525','网络消费',NOW(),498464.00,NULL,NULL);

CREATE TABLE tranRecords(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tranType VARCHAR(20) ,/*交易类型*/
  title VARCHAR (200),/*摘要*/
  tranTime DATETIME,/*交易时间*/
  price DECIMAL(15,2),/*交易金额*/
  remainder DECIMAL(15,2),/*当前用户余额*/
  userid INT ,/*用户编号*/
  CONSTRAINT `FK_tranRecords_userid_users_id` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)/*commodityId引用到commodity表的id*/
);
INSERT INTO tranRecords VALUES(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,2),
(DEFAULT,'提现','提现',NOW(),50,100,5),
(DEFAULT,'提现','提现',NOW(),50,100,2),
(DEFAULT,'提现','提现',NOW(),50,100,3),
(DEFAULT,'提现','提现',NOW(),50,100,4),
(DEFAULT,'提现','提现',NOW(),50,100,3),
(DEFAULT,'提现','提现',NOW(),50,100,5),
(DEFAULT,'提现','提现',NOW(),50,100,2),
(DEFAULT,'提现','提现',NOW(),50,100,4),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1),
(DEFAULT,'提现','提现',NOW(),50,100,1);