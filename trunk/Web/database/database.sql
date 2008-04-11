--用户表
CREATE TABLE [dbo].[AL_User] (
	[UserID] [varchar](16) Primary key NOT NULL ,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--广告表
CREATE TABLE [dbo].[AL_Ads] (
	[AdId] [varchar](16) Primary key NOT NULL ,
	[UserId] [varchar](16) null,--广告位发布者ID
	[WebId] [varchar](16) null,--所属网站
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
--网站表
CREATE TABLE [dbo].[AL_Webs] (
	[WebId] [varchar](16) Primary key NOT NULL ,
	[UserId] [varchar](16) null,--添加网站的用户ID
	[WebName] [nvarchar] (32) Null,--网站名称
	[WebUrl] [nvarchar] (128) Null,--网址
	[WebClass] [int] null,--网站分类ID
	[SexType] [tinyint] null,--性别类型：0表示：多数是男的，1表示：男女基本一致，2表示多数是女的
	[AgeType] [tinyint] null,--年龄类型：0表示：18岁以下；1表示：18~25岁，2表示：25~45岁，3表示：45岁以上
	[Employment][int] null,--职业
	[Taste] [nvarchar] (60) null,--爱好
	[Description] [ntext] null--网站介绍
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--网站分类表
CREATE TABLE [dbo].[AL_WebClass] (
	[ClassId][int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar] (20) null
) 
--职业分类表
CREATE TABLE [dbo].[AL_Employment] (
	[EmploymentId] [int] identity(1,1) Primary key NOT NULL ,
	[EmploymentName] [nvarchar] (20) null
)
--广告尺寸表
CREATE TABLE [dbo].[AL_AdSize] (
	[SizeId] [int] identity(1,1) Primary key NOT NULL ,
	[Width] [int] null,--宽
	[Height] [int] null,--高
)
--广告分类表
CREATE TABLE [dbo].[AL_AdClass] (
	[AdClassId] [int] identity(1,1) Primary key NOT NULL ,
	[AdClassName] [nvarchar](10) null,--分类名称
	[ParentId] [int] null--父类ID
)