DROP DATABASE IF EXISTS memberManagement;

CREATE DATABASE memberManagement;

USE memberManagement;

 /*银行*/ 
 CREATE TABLE bank(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,/*银行名称*/
	`no` VARCHAR(20) NOT NULL UNIQUE,/*银行卡号*/
	pwd VARCHAR(500) NOT NULL,/*银行卡密码*/
	remainder DECIMAL(15,2),/*余额*/
	openUser VARCHAR(20),/*开户人*/
	/*加了2个字段*/
	telphone VARCHAR(20),/*开户电话号码号码*/
	papersNo VARCHAR(18)/*身份证*/

 );
/*角色表*/
CREATE TABLE role(
	id INT PRIMARY KEY AUTO_INCREMENT,/*id*/
	`no` VARCHAR(20) NOT NULL UNIQUE,/*编号*/
	`name` VARCHAR(20),/*名称*/
	stats INT /*状态：1启用,0禁用*//*不需要*/
);

/*用户表*/
CREATE TABLE users(
       id INT PRIMARY KEY AUTO_INCREMENT,/*用户编号*/
       userName VARCHAR(20)NOT NULL,/*用户名*/
       pwd VARCHAR(500) NOT NULL,/*密码*/
       pwd2 VARCHAR(500),/*支付密码*/
       `name` VARCHAR(20)NOT NULL,/*真实姓名*/
       papersType VARCHAR(20) NOT NULL,/*证件类型*/
       papersNo VARCHAR(18) NOT NULL,/*证件号码*/
       telephoneNumber VARCHAR(20)NOT NULL,/*联系电话*/
       email VARCHAR(30) NOT NULL,/*电子邮件*/
       postalcode VARCHAR(6) NOT NULL,/*邮政编码*/
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


/*管理表*/
CREATE TABLE manage(
	id INT PRIMARY KEY AUTO_INCREMENT,/*编号*/
	`name` VARCHAR(20)/*名称*/
);
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
/*权限表*/
CREATE TABLE root(
	id INT PRIMARY KEY AUTO_INCREMENT,/*编号*/
	manageItemId INT,/*管理表项编号*/
	roleId INT, /*角色编号*/
       CONSTRAINT `FK_root_manageItemId_manageItem_id` FOREIGN KEY (`manageItemId`) REFERENCES `manageItem` (`id`),/*manageItemId连接manageItem的id*/
       CONSTRAINT `FK_root_roleId_role_id` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)/*roleId连接role的id*/
);
/*商品表*/
CREATE TABLE commodity(
	id INT PRIMARY KEY AUTO_INCREMENT,/*id*/
	`name` VARCHAR(50),/*商品名称*/
	commodityNo VARCHAR(20) NOT NULL UNIQUE,/*商品编号*/
	price DECIMAL(15,2),/*市场价*/
	discountPrice DECIMAL(15,2),/*优惠价*/
	stock INT ,/*库存*/
	unit VARCHAR(10),/*单位*/
	state INT,/*0下架,1上架*/
	spec  VARCHAR(200),/*规格*/
	illustrate VARCHAR(500),/*说明*/
	modifyTime DATETIME/*修改时间*/
);
/*商品套餐*/
CREATE TABLE commoditySetMeal(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50),/*套餐名称*/
	`no` VARCHAR(20) NOT NULL UNIQUE,/*套餐编号*/
	`type` VARCHAR(20),/*套餐类型*/
	price DECIMAL(15,2),/*零售价*/
	discountPrice DECIMAL(15,2),/*优惠价*/
	state INT ,/*状态:1上架,0下架*/
	illustrate VARCHAR(500)/*说明*/
);
/*商品套餐里的商品*/
CREATE TABLE commoditySetMealItems(
	id INT PRIMARY KEY AUTO_INCREMENT,
	commoditySetMealId INT ,/*套餐id*/
	commodityId INT ,/*商品id*/
	num INT,/*个数*/
        CONSTRAINT `FK_commoditySetMealItems_commoditySetMealId_commoditySetMeal_id` FOREIGN KEY (`commoditySetMealId`) REFERENCES `commoditySetMeal` (`id`),/*commoditySetMealId连接commoditySetMeal的id*/
        CONSTRAINT `FK_commoditySetMealItems_commodityId_commodity_id` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`)/*roleId连接commodity的id*/

);

/*订单*/
CREATE TABLE `order`(
	id INT KEY AUTO_INCREMENT,
	/*新增*/
	userid INT NOT NULL,/*用户编号*/
	commodityId INT NOT NULL,/*商品id*/

	orderNo VARCHAR(20) NOT NULL UNIQUE,/*订单号*/
	userName VARCHAR(20) NOT NULL,/*会员名称*/
	consignee VARCHAR(20) NOT NULL,/*收货人*/
	ordertime DATETIME NOT NULL,/*交易日期*/
	`type` VARCHAR(20) NOT NULL,/*交易类型*/
	price DECIMAL(15,2) NOT NULL,/*交易金额*/
        CONSTRAINT `FK_order_commodityId_commodity_id` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`),/*userid引用到users表的id*/
        CONSTRAINT `FK_order_userid_users_id` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)/*userid引用到users表的id*/

);

/*公告*/
CREATE TABLE proclamation(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200),/*标题*/
	createTime DATETIME ,/*创建时间*/
	beginTime DATETIME,/*开始时间*/
	endTime DATETIME,/*结算时间*/
	content VARCHAR(1000)/*内容*/
);


/*银行卡交易记录*/
CREATE TABLE bankTranRecords(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`no` VARCHAR(20) NOT NULL, /*交易卡号*/
	`type` VARCHAR(20) NOT NULL,/*交易类型*/
	/*新增*/
	price DECIMAL(15,2)NOT NULL,/*交易金额*/
	tranTime DATETIME NOT NULL/*交易时间*/
);

