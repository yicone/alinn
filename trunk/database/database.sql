create database hot
--用户表
CREATE TABLE [dbo].[HOT_User] (
	[UserID] [int] identity(1,1) Primary key NOT NULL ,
	[RoleID] [int] default(0) NULL ,--角色ID比如：会员，VIP会员，管理员等
	[UserType] [smallint] NULL ,--用户类别：如企业用户，普通用户等
	[Group]	[smallint] null,--用户所在组ID
	[UserName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NickName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--昵称
	[RealName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--真实姓名
	[Sex] [tinyint] null,--性别
	[UserPassword] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,
	[Question] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Answer] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Email] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Address] [nvarchar] (1000) COLLATE Chinese_PRC_CI_AS NULL,
	[PostCode] [int] NULL,
	[Telephone][nvarchar](50) NULL,
	[Mobile][nvarchar](50) NULL,
	[QQ] [nvarchar] (50) NULL,
	[Msn] [nvarchar] (50) NULL,
	[UserFace] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[LastLoginTime] [datetime] NULL ,
	[LastLoginIP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[LoginTimes] [int] NULL ,--用户登录次数
	[UserPoint] [int] NULL default(0),--用户积分数
	[UserBooks] [int] NULL default(0),--用户图书保有量
	[ConsumePoint] [int] NULL ,--消费分数
	[UnreadMsg] [smallint] NULL ,
	[IsLocked] [tinyint] NULL ,--是否被锁定
	[Balance] [money] null,--帐户余额
	[UserSetting] [ntext] COLLATE Chinese_PRC_CI_AS NULL,--用户个人简介
	[RegTime] [datetime] NULL default(getdate()),--用户注册时间
	[LastLoginIP] [nvarchar](15),--最后登录IP
	[LastLoginTime] [datetime] NULL default(getdate())--用户最后登录时间
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--管理员表
CREATE TABLE [dbo].[HOT_Admin] (
	[AdminId][int] identity(1,1) Primary key NOT NULL ,
	[AdminName] [nvarchar](50) null,
	[UserName] [nvarchar](50) null,
	[Password] [nvarchar](32) null,
	[Purview] [int] null,--管理员级别：1代表超级管理员，2代表普通管理员
	[RoleName] [nvarchar](50) null,--角色名称
	[LastLoginIP] [nvarchar](15) null,
	[LastLoginTime][datetime] null,
	[LastLogoutTime][datetime] null,
	[LoginTimes] [int] null
)
--公告表
select * from my_announce
CREATE TABLE [dbo].[HOT_Announce] (
	[AnnounceId] [int] identity(1,1) Primary key NOT NULL ,
	[Title] [nvarchar](255) null,
	[Content] [ntext] null,
	[Author] [nvarchar](50) null,
	[IsSelected] [tinyint] null,
	[OutTime] [int] null,
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)
--网站总体配置
CREATE TABLE [dbo].[HOT_Config] (
	[SiteName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteUrl] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[WebmasterName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[WebmasterEmail] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Copyright] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[HitsOfHot] [int] NULL ,--设定点击多少次可以成为热点图书
	[EnableUserReg] [bit] NOT NULL ,--是否允许注册新用户
	[UserName_RegDisabled] [ntext] COLLATE Chinese_PRC_CI_AS NULL,--不允许注册的用户名
	[UserNumber] [int] default(0) NULL,
	[BookNumber] [int] default(0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--图书分类
CREATE TABLE [dbo].[HOT_BookClass](
	[BookClassId][int] identity(1,1) Primary key NOT NULL ,
	[SonId] [nvarchar] (50) null,--子类ID
	[ParentId] [int] null,--父类ID
	[BookClassName][nvarchar](100)COLLATE Chinese_PRC_CI_AS NOT NULL,
	[OrderId] [int],--排队参数
	[BookClassInfo] [nvarchar](300)COLLATE Chinese_PRC_CI_AS NULL,
	[IsDisabled] [tinyint] null--是否演示
)
--图书信息表
CREATE TABLE [dbo].[HOT_BookInf](
	[BookInfoId] [int] identity(1,1) Primary key NOT NULL ,
	[BookClassId] [int] NULL,--分类ID
	[BookName] [nvarchar](150)COLLATE Chinese_PRC_CI_AS NULL ,
	[KeyWords] [nvarchar](200)COLLATE Chinese_PRC_CI_AS NULL ,
	[ISBN] [nvarchar](100) NULL,
	[Author] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Translator] [nvarchar](100)COLLATE Chinese_PRC_CI_AS NULL ,--翻译
	[Investigator] [nvarchar](100)COLLATE Chinese_PRC_CI_AS NULL ,--校正
	[BookConcern] [int] NOT NULL,--出版社ID
	[BookSize] [nvarchar](20) NULL,--开本
	[PrintSheet][int] NULL,--印张
	[Words] [int] NULL,--字数
	[PublishYear] [DATETIME] NULL,--出版时间
	[Edition] [smallint] NULL,--出版次数
	[PrintTime][DATETIME] NULL,--印刷时间
	[PrintNum][smallint] NULL,--印刷次数
	[Number] [int] NULL,--印量
	[BookPrice][decimal] NULL,--定价
	[Pages] [int] NULL,--页数
	[Images] [NTEXT] NULL,--图片
	[CommentCount] [int] null,--访问次数
	[State] [smallint] DEFAULT(0) NOT NULL,--审核状态
	[Recommendation] [NTEXT] NULL,--编辑推荐
	[Content][NTEXT] NULL,--内容简介
	[List] [NTEXT] NULL,--目录
	[DownLoad] [varchar](300) NULL,--下载电子预览版
	[HasSell] [int] null,--存货量
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--出售图书表
CREATE TABLE [dbo].[HOT_SoldBook](
	[SoldBookId][int] identity(1,1) Primary key NOT NULL ,
	[BookId] int null,--图书ID
	[BindId] int null,--装订方式
	[Code] [nvarchar](20),--编号
	[Grade][int] null,--品相
	[BookPrice] [decimal] null,--出售价格
	[Stocks] [int] null,--库存数量
	[Weight] [float] null,--重量
	[Standard] [nvarchar](100) null,--图书规格
	[OnTop] [tinyint] null,--是否置顶
	[IsElite] [tinyint] null,--是否推荐
	[IsHot] [tinyint] null,--是否热点
	[EnableSale] [tinyint] null,--是否上架
	[Deleted] [tinyint] null,--是否删除
	[Hits] [int] null,--点击数量
	[Discout] [float] null,--折扣
	[PresentExp] [int] null,--赠送积分
	[Description] ntext null,
	[Images] [NTEXT] NULL,
	[UserId] [int] null,--添加用户ID
	[EditeDate] DATETIME  DEFAULT(GETDATE()) NOT NULL,
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--购物车
CREATE TABLE [dbo].[HOT_ShopCart](
	[ShopCartId] [int] identity(1,1) Primary key NOT NULL ,
	[UserId] int not null,
	[SoldBookId] int not null,
	[Quantity] int not null,
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)
--订单临时表
CREATE TABLE [dbo].[HOT_OrderItems](
	[ItemId][int] identity(1,1) Primary key NOT NULL ,--临时表ID
	[OrderId] int null,--步骤ID
)
--订单
CREATE TABLE [dbo].[HOT_Orders](
	[OrderId] [int] identity(1,1) Primary key NOT NULL ,
	[UserId] int not null,
	[SoldBookId] int not null,
	[Quantity] int not null,
	[Price] [decimal] not null,
	[Email] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Address] [nvarchar] (1000) COLLATE Chinese_PRC_CI_AS NULL,
	[PostCode] [smallint] NULL,
	[Telephone][nvarchar](50) NULL,
	[Mobile][nvarchar](50) NULL,
	[QQ] [nvarchar] (50) NULL,
	[BankId] [smallint] not NULL,
	[ExpressId] [smallint] not null,
	[ExpressPrice] [Decimal] not null,
	[Message] [Nvarchar](600) Null,--留言
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)
--装订表
CREATE TABLE [dbo].[HOT_Binding](
	[BindingId][int] identity(1,1) Primary key NOT NULL ,
	[Bind] [nvarchar](50) not null,
	[Description] ntext
)
--出版社表
CREATE TABLE [dbo].[HOT_BookConcern]
(
	[BookConcernId] [int] identity(1,1) Primary key NOT NULL ,
	[BookConcernName] [nvarchar](300) NOT NULL,
	[Area] [int] NOT NULL,
	[Letter] [char] NOT NULL,
	[Description] [nText] NULL,
	[Hits] [int] null,--点击数量
	[OnTop] [tinyint] null,--是否置顶
	[IsElite] [tinyint] null,--是否推荐
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--地区表
CREATE TABLE [dbo].[HOT_Area]
(	
	[AreaId][int] identity(1,1) Primary key NOT NULL ,
	[AreaName] [nvarchar](50) null,
	[Description] [ntext] null,
	[AddDate]DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--汇款方式
CREATE TABLE [dbo].[HOT_PaymentType](
	[TypeId] [int] identity(1,1) Primary key NOT NULL ,
	[TypeName] [nvarchar](50) Not NULL,
	[Discount] [float] null,--每种支付方式的折扣率
	[IsDefault] [tinyint] null,--是否是默认的支付方式
	[OrderId] [int] null,--排序
	[Description] [ntext] NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--送递
CREATE TABLE [dbo].[HOT_Express](
	[ExpressId] [int] identity(1,1) Primary key NOT NULL ,
	[ExpressName] [nvarchar](50) Not NULL,
	[Description] [ntext] NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--日志
CREATE TABLE [dbo].[HOT_Log](
	[LogId] [int] identity(1,1) Primary key NOT NULL ,
	[LogType] [int] null,
	[UserName] [nvarchar](50) null,
	[UserIP] [nvarchar](15) null,
	[LogContent] [nvarchar](255) null,
	[ScriptName] [nvarchar](255) null,
	[PostString] [ntext] null,
	[LogTime] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--用户注册触发器
CREATE TRIGGER AddUser_UserNumber
ON HOT_USER
FOR INSERT
AS
BEGIN
	UPDATE [HOT_Config] SET [UserNumber]=[UserNumber]+1
END

--加入测试数据
update  hot_user set
Address='北京市朝阳区孙河雷桥11号',PostCode=100012,Telephone='01084949051',Mobile='13488686989',qq=1363036,RealName='范占房'
INSERT INTO [HOT_Config]([UserNumber],[EnableUserReg])VALUES(1,0)
select * from HOT_User

--向图书分类中加入数据
insert into hot_bookclass(bookclassname,parentid) values('文学类',0)
insert into hot_bookclass(bookclassname,parentid) values('计算机类',0)
insert into hot_bookclass(bookclassname,parentid) values('JAVA',2)
insert into hot_bookclass(bookclassname,parentid) values('C#',2)
--向装订表中加入数据
insert into hot_binding(bind)values('平装')
insert into hot_binding(bind)values('精装')
insert into hot_binding(bind)values('线装')
insert into hot_binding(bind)values('仿线装')
--向图书信息中加入数据
insert into hot_bookinf(bookname,bookconcern)values('2222','2')
--向出售图书表里加入数据
insert into hot_soldbook([Code],[BookId],[Grade],[BookPrice],[Number])values('Z000000001',10,10,56,1)
--向出版社表加入数据
insert into hot_BookConcern(BookConcernName,Area,letter)
values('中华书局',1,'Z')
insert into hot_BookConcern(BookConcernName,Area,letter)
values('上海古籍',1,'S')
insert into hot_BookConcern(BookConcernName,Area,letter)
values('高等教育',1,'G')
--向地区表加入数据
insert into hot_area(areaname)values('中国大陆')
insert into hot_area(areaname)values('香港')
insert into hot_area(areaname)values('台湾')