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
--广告表
CREATE TABLE [dbo].[AL_Zone] (
	[ZoneId] [uniqueidentifier] Primary key NOT NULL ,
	[UserId] [uniqueidentifier] null,--广告位发布者ID	
	[ZoneName] [nvarchar] (50) null,--广告位名字
	[SiteId] [uniqueidentifier] null,--所属网站
	[IsWord] [tinyint] null,--是否是文字广告
	[IsImg] [tinyint] null,--是否是图片或者Flash广告
	[Position] [tinyint] null,--广告位置，0为首页，1为不在首页
	[Size] [int] null,--广告尺寸
	[Type] [tinyint] null,--广告计费方式，0为按时长计费,1为按点击计费*
	[Classes] [nvarchar] (7) null,--广告分类，最多可选 两个分类例如：2|3
	[KeyWords] [nvarchar](136) null,--关键字
	--广告设置部分开始
	[TitleColor] [varchar] (6) null,--广告文字颜色
	[ContentColor] [nvarchar] (300) null,--广告描述（内容）
	[UrlColor] [varchar] (6) null,--链接颜色
	[BorderColor] [varchar] (6) null,--边框颜色
	[BgColor] [varchar](6) null,--背景颜色
	[Grounding] [varchar](6) null,--底色
	[BgImg] [nvarchar](50) null,--背景图片
	[Corner] [nvarchar](50) null,--转角图片
	--广告设置部分结束
	[IsLocked] [tinyint] null,--审核(经过管理员审核才可以出售此广告位)
	[NeedCheck] [tinyint] null,--此广告位是否需要站长审核才能投放？
	[Description] [ntext]--广告描述
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
	[Title]	[nvarchar] (40) null,--文字广告
	[Content] [nvarchar](120) null,--广告内容(如果是图片广告就是图片说明）
	[Url] [nvarchar] (1024) null,--链接网址（包括图片的链接网址）
	[UrlText] [nvarchar](256) null,--显示网址
	[Img] [nvarchar] (50) null--图片的地址（只在图片广告时有作用）
)
--订单表
CREATE TABLE [dbo].[AL_Order] (
	[OrderId] [uniqueidentifier]  Primary key NOT NULL ,
	[OrderName] [nvarchar] null,--订单名称，用来帮助广告主区分
	[UserId][uniqueidentifier]  ,--购买广告用户
	[AdId] [uniqueidentifier] not null,--广告牌ID
	[StartDate] [varchar] (12),--开始时间（200804151003）（只针对包周广告）
	[EndDate] [varchar](12),--结束时间（200804151003）（只针对包周广告）
	[AuditState] [tinyint] null,--审核状态
	[PerPoint] [decimal] null,--每次点击费用，不得少于0.08元。
	[EverydayPrice] [decimal] null,--每天点击的费用限额
	[Price] [decimal] null,--需要支付费用（当为包周时为包周费用，为点击方式时为投入的费用）
	[Payment] [tinyint] default(0),--支付状态，默认为0为未支付
	[SumPV] [int] null,--从投放开始的浏览量
	[PointNum] [int] null,--点击数量
	[CreateDate] NULL default(getdate())--订单提交时间
)
CREATE TABLE [dbo].[AL_OrderReport] (
	[
)
--网站表

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
	[AuditState] [tinyint] NULL,				--审核状态
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

--广告尺寸表
CREATE TABLE [dbo].[AL_AdSize] (
	[SizeId] [int] identity(1,1) Primary key NOT NULL ,
	[Width] [int] null,--宽
	[Height] [int] null--高
)
GO

--广告分类表
CREATE TABLE [dbo].[AL_ZoneClass] (
	[ClassId] [int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar](10) null,--分类名称
	[ParentId] [int] null--父类ID
)