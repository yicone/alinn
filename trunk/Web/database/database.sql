--用户表
CREATE TABLE [dbo].[AL_User] (
	[UserID] [uniqueidentifier] Primary key NOT NULL ,
	[RoleID] [int] default(0) NULL ,--角色ID比如：个人会员、企业会员等，默认为0表示为个人会员
	[Email] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--同时做为登录用户名
	[NickName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--昵称
	[UserPassword] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,--密码（MD5加密）16位
	[CompanyName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL ,--企业名称
	[CompanyAddress] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,--企业地址
	[LinkMan] [nvarchar](8)  COLLATE Chinese_PRC_CI_AS NULL ,--联系人
	[Telephone][nvarchar](50) NULL,--电话
	[Mobile][nvarchar](50) NULL,--手机
	[QQ] [nvarchar] (50) NULL,--QQ
	[Msn] [nvarchar] (50) NULL,--MSN
	[Introducer] [varchar](16) null,--推荐人
	[LastLoginTime] [datetime] NULL ,--上次登录时间
	[LastLoginIP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,--上次登录IP
	[LoginTimes] [int] NULL ,--用户登录次数
	[IsLocked] [tinyint] NULL ,--是否被锁定
	[ActiveCode] [varchar] (16) null,--邮箱验证码（20080411新添加）
	[RegTime] [datetime] NULL default(getdate())--用户注册时间
) 
GO
--广告位表
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Zone]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Zone]

CREATE TABLE [AL_Zone] (
[ZoneId] [uniqueidentifier]  NOT NULL,
[UserId] [uniqueidentifier]  NULL,
[ZoneName] [nvarchar]  (100) NULL,
[SiteId] [uniqueidentifier]  NULL,
[MediaType] [tinyint]  NULL,	--文字广告、图片广告
[InFirst] [tinyint]  NULL,		--是否在首页
[SizeId] [int]  NULL,			--广告位规格对应的编号
[TransType] [tinyint]  NULL,	--计费类型：按点击、按时长
[ClassIds] [nvarchar]  (14) NULL,	--所属种类的编号序列
[Keywords] [nvarchar]  (272) NULL,
[TitleColor] [varchar]  (6) NULL,
[DescriptionColor] [nvarchar]  (12) NULL,
[LinkColor] [varchar]  (6) NULL,
[BorderColor] [varchar]  (6) NULL,
[BgColor] [varchar]  (6) NULL,
[Grounding] [varchar]  (6) NULL,
[BgImg] [nvarchar]  (100) NULL,
[CornerImg] [nvarchar]  (100) NULL,
[NeedAuditing] [tinyint]  NULL,	--是否需要审核广告
[AllowAdultAd] [tinyint]  NULL,	
[Description] [ntext]  NULL,	--广告位描述
[ZoneCode] [ntext]  NULL,		--生成的广告位程序代码
[WeekPrice] [decimal]  (10,2) NULL,	--按时长付费的价格
[RecommendWeekPrice] [decimal]  (10,2) NULL,	--系统推荐的按时长付费价格
[ZoneState] [tinyint]  NULL)		--广告位的状态：上架、下架、未激活、拒绝

ALTER TABLE [AL_Zone] WITH NOCHECK ADD  CONSTRAINT [PK_AL_Zone] PRIMARY KEY  NONCLUSTERED ( [ZoneId] )
GO
--广告组(广告主用来分类自己要投放广告的组）
CREATE TABLE [dbo].[AL_AdGroup] (
	[AdGroupId] [uniqueidentifier]  Primary key NOT NULL ,
	[GroupName] [nvarchar] (40) null,--广告组标题
	[UserId]  [uniqueidentifier] null,--用户ID
	[Class] [int] null,--广告分类
	[KeyWords] [nvarchar](136) null--关键字
)
--广告主要投放的广告牌
CREATE TABLE [dbo].[AL_Ad] (
	[AdId] [uniqueidentifier]  Primary key NOT NULL ,
	[AdGroupId] [uniqueidentifier] null,--广告组ID
	[Title]	[nvarchar] (40) null,--文字广告
	[Content] [nvarchar](120) null,--广告内容(如果是图片广告就是图片说明）
	[Url] [nvarchar] (1024) null,--链接网址（包括图片的链接网址）
	[UrlText] [nvarchar](256) null,--显示网址
	[SizeId] [int] null,--大小
	[AuditState] [tinyint] default(0) null,--审核状态
	[Img] [nvarchar] (50) null--图片的地址（只在图片广告时有作用）
)
--订单表
CREATE TABLE [dbo].[AL_Order] (
	[OrderId] [uniqueidentifier]  Primary key NOT NULL ,
	[OrderName] [nvarchar] null,--订单名称，用来帮助广告主区分
	[UserId][uniqueidentifier]  ,--购买广告用户
	[AdId] [uniqueidentifier] not null,--广告牌ID
	[StartDate] datetime null,--开始时间（200804151003）（只针对包周广告）
	[EndDate] datetime null,--结束时间（200804151003）（只针对包周广告）
	[AuditState] [tinyint] null,--审核状态
	[PerPoint] [decimal] null,--每次点击费用，不得少于0.08元。
	[EverydayPrice] [decimal] null,--每天点击的费用限额
	[Price] [decimal] null,--需要支付费用（当为包周时为包周费用，为点击方式时为投入的费用）
	[Payment] [tinyint] default(0),--支付状态，默认为0为未支付
	[CreateDate] [datetime] default(getdate()) NULL--订单提交时间
)
--广告效果报表
CREATE TABLE [dbo].[AL_OrderReport] (
	[OrderReportId] [uniqueidentifier]  Primary key NOT NULL ,
	[Date] datetime null,--日期
	[OrderId] [uniqueidentifier]  NOT NULL,
	[PV] [int] null,--当日的浏览量
	[PointNum] [int] null,--点击数量
	[Price] [decimal] null--费用
)
--网站表
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Site]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Site]

CREATE TABLE [dbo].[AL_Site](
	[SiteId] [uniqueidentifier]  Primary key NOT NULL ,
	[UserId] [uniqueidentifier] NULL,			--添加网站的用户ID
	[SiteName] [nvarchar](32) NULL,				--网站名称
	[SiteUrl] [nvarchar](128) NULL,				--网址
	[SiteClass] [int] NULL,						--网站分类ID
	[SexType] [tinyint] NULL,					--性别类型：0表示：多数是男的，1表示：男女基本一致，2表示多数是女的
	[AgeType] [tinyint] NULL,					--年龄类型：0表示：18岁以下；1表示：18~25岁，2表示：25~45岁，3表示：45岁以上
	[Employments] [varchar](100) NULL,			--职业
	[Taste] [nvarchar](60) NULL,				--爱好
	[AuditState] [tinyint] null,				--审核状态
	[PV] [int] null,							--每天的浏览量
	[VistersNum] [int] null,					--每天的访问人数
	[Description] [ntext] NULL				--网站介绍

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--网站分类表
CREATE TABLE [dbo].[AL_SiteClass] (
	[ClassId][int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar] (20) null
) 
GO

--职业分类表
CREATE TABLE [dbo].[AL_Employment] (
	[EmploymentId] [int] identity(1,1) Primary key NOT NULL ,
	[EmploymentName] [nvarchar] (20) null
)
GO

--广告位尺寸表
if exists (select * from sysobjects where id = OBJECT_ID('[AL_ZoneSize]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_ZoneSize]

CREATE TABLE [AL_ZoneSize] (
[SizeId] [int]  IDENTITY (1, 1)  NOT NULL,
[ZoneSize] [varchar]  (10) NULL,
[SizeType] [int]  NULL)

ALTER TABLE [AL_ZoneSize] WITH NOCHECK ADD  CONSTRAINT [PK_AL_ZoneSize] PRIMARY KEY  NONCLUSTERED ( [SizeId] )

--广告分类表
CREATE TABLE [dbo].[AL_ZoneClass] (
	[ClassId] [int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar](50) null,--分类名称
	[ParentId] [int] null--父类ID
)