--使用Microsoft SQL Server Management Studio Express	9.00.3042.00 "Generic Scripts..."创建
--（导出设置需要选择包含触发器）
--注意：尽量使用上述工具全选导出，避免手动修改或添加变更部分！
--上述内容请勿覆盖，导出新版本时注意修改导出时间！	yicone

USE [Alinn]
GO
/****** Object:  Table [dbo].[AL_ZonePic]    Script Date: 06/03/2008 18:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_ZonePic](
	[ZoneId] [uniqueidentifier] NOT NULL,
	[ZonePic] [varchar](200) NULL,
 CONSTRAINT [PK_AL_ZonePic] PRIMARY KEY NONCLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位运行截图表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZonePic'
GO
/****** Object:  Table [dbo].[AL_News]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Content] [ntext] NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_News'
GO
/****** Object:  Table [dbo].[AL_User]    Script Date: 06/03/2008 18:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_User](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleID] [int] NULL CONSTRAINT [DF__AL_User__RoleID__17C286CF]  DEFAULT ((0)),
	[Email] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[CompanyAddress] [nvarchar](500) NULL,
	[LinkMan] [nvarchar](8) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[Msn] [nvarchar](50) NULL,
	[Introducer] [uniqueidentifier] NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIP] [nvarchar](15) NULL,
	[LoginTimes] [int] NULL,
	[IsLocked] [tinyint] NULL,
	[ActiveCode] [varchar](16) NULL,
	[RegTime] [datetime] NULL CONSTRAINT [DF__AL_User__RegTime__18B6AB08]  DEFAULT (getdate()),
	[School] [nvarchar](50) NULL,
	[Proxy] [nvarchar](50) NULL,
 CONSTRAINT [PK__AL_User__16CE6296] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID 默认为0:为个人会员,1:企业会员,2:系统管理员,3:客服人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'（同时做为登录用户名）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码（MD5加密）16位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'UserPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'CompanyAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LinkMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍人的用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Introducer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LoginTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否被锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'IsLocked'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱验证码（20080411新添加）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'ActiveCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'RegTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表（已激活）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User'
GO
/****** Object:  Table [dbo].[AL_Zone]    Script Date: 06/03/2008 18:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_Zone](
	[ZoneId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[ZoneName] [nvarchar](100) NULL,
	[SiteId] [uniqueidentifier] NULL,
	[MediaType] [tinyint] NULL,
	[InFirst] [tinyint] NULL,
	[SizeId] [int] NULL,
	[TransType] [tinyint] NULL,
	[ClassIds] [nvarchar](14) NULL,
	[Keywords] [nvarchar](272) NULL,
	[NeedAuditing] [tinyint] NULL,
	[AllowAdultAd] [tinyint] NULL,
	[Description] [ntext] NULL,
	[ZoneCode] [ntext] NULL,
	[WeekPrice] [decimal](10, 2) NULL,
	[RecommendWeekPrice] [decimal](10, 2) NULL,
	[ZoneState] [tinyint] NULL,
	[ZoneStyle] [nvarchar](100) NULL,
 CONSTRAINT [PK_AL_Zone] PRIMARY KEY NONCLUSTERED 
(
	[ZoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文字广告、图片广告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在首页' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'InFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位规格对应的编号，参考ZoneSize表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'SizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计费类型：按点击、按时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'TransType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属类目的编号序列，参考ZoneClass表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ClassIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需要审核广告 1:需要，0:不需要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'NeedAuditing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的广告位程序代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按时长付费的价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'WeekPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统推荐的按时长付费价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'RecommendWeekPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位的状态：1上架、2下架、0未激活、3拒绝' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位的外观的序列化信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone'
GO
/****** Object:  Table [dbo].[AL_OrderReport]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_OrderReport](
	[OrderReportId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[PV] [int] NULL,
	[PointNum] [int] NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告效果表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_OrderReport'
GO
/****** Object:  Table [dbo].[AL_SitePic]    Script Date: 06/03/2008 18:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_SitePic](
	[SiteId] [uniqueidentifier] NOT NULL,
	[Pic] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站截图表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SitePic'
GO
/****** Object:  Table [dbo].[AL_EmailInfo]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_EmailInfo](
	[InfoId] [uniqueidentifier] NOT NULL,
	[EmailSender] [nvarchar](200) NULL,
	[EmailReceiver] [nvarchar](200) NULL,
	[EmailSubject] [nvarchar](200) NULL,
	[EmailContent] [ntext] NULL,
	[EmailIsErgency] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[InfoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'同时做为登录用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo', @level2type=N'COLUMN',@level2name=N'EmailSender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否紧急' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo', @level2type=N'COLUMN',@level2name=N'EmailIsErgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件系统表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo'
GO
/****** Object:  Table [dbo].[AL_ZoneStat]    Script Date: 06/03/2008 18:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_ZoneStat](
	[ZoneStatId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NULL,
	[ZoneId] [uniqueidentifier] NOT NULL,
	[PV] [int] NULL CONSTRAINT [DF_AL_ZoneStat_PV]  DEFAULT ((0)),
	[ClickTime] [int] NULL CONSTRAINT [DF_AL_ZoneStat_ClickTime]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ZoneStatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位运行统计表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneStat'
GO
/****** Object:  Table [dbo].[AL_AdGroup]    Script Date: 06/03/2008 18:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_AdGroup](
	[AdGroupId] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](40) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Class] [nvarchar](14) NULL,
	[KeyWords] [nvarchar](136) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告组标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告组表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup'
GO
/****** Object:  Table [dbo].[AL_Site]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_Site](
	[SiteId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[SiteName] [nvarchar](32) NULL,
	[SiteUrl] [nvarchar](128) NULL,
	[SiteClass] [int] NULL,
	[SexType] [tinyint] NULL,
	[AgeType] [tinyint] NULL,
	[Employments] [varchar](100) NULL,
	[Taste] [nvarchar](60) NULL,
	[AuditState] [tinyint] NULL,
	[PV] [int] NULL,
	[VistersNum] [int] NULL,
	[Description] [ntext] NULL,
	[RegDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加网站的用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站分类ID，参考SiteClass表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标人群的性别分布，参考SexType表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SexType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标人群的年龄分布，参考AgeType表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'AgeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标人群的职业类型，参考Employment表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Employments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'爱好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Taste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每天的浏览量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'PV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每天的访问人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'VistersNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点提交到系统的日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site'
GO
/****** Object:  Table [dbo].[AL_SiteClass]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_SiteClass](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SiteClass'
GO
/****** Object:  Table [dbo].[AL_Employment]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_Employment](
	[EmploymentId] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmploymentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职业分布类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Employment'
GO
/****** Object:  Table [dbo].[AL_ZoneSize]    Script Date: 06/03/2008 18:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_ZoneSize](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeCode] [varchar](10) NULL,
	[SizeType] [int] NULL,
 CONSTRAINT [PK_AL_ZoneSize] PRIMARY KEY NONCLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'示例: ‘760x90’' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize', @level2type=N'COLUMN',@level2name=N'SizeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1：横幅 2：非横幅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize', @level2type=N'COLUMN',@level2name=N'SizeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位尺寸表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize'
GO
/****** Object:  Table [dbo].[AL_ZoneClass]    Script Date: 06/03/2008 18:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_ZoneClass](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneClass'
GO
/****** Object:  Table [dbo].[AL_Store]    Script Date: 06/03/2008 18:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_Store](
	[StoreId] [uniqueidentifier] NOT NULL,
	[ZoneId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位收藏表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Store'
GO
/****** Object:  Table [dbo].[AL_AgeType]    Script Date: 06/03/2008 18:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_AgeType](
	[AgeTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[AgeTypeText] [varchar](50) NULL,
 CONSTRAINT [PK_AL_AgeType] PRIMARY KEY CLUSTERED 
(
	[AgeTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄类型  0表示：18岁以下；1表示：18~25岁，2表示：25~45岁，3表示：45岁以上' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AgeType', @level2type=N'COLUMN',@level2name=N'AgeTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄分布类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AgeType'
GO
/****** Object:  Table [dbo].[AL_SexType]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_SexType](
	[SexTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[SexTypeText] [varchar](50) NULL,
 CONSTRAINT [PK_AL_SexType] PRIMARY KEY CLUSTERED 
(
	[SexTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别类型：0表示：多数是男的，1表示：男女基本一致，2表示多数是女的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SexType', @level2type=N'COLUMN',@level2name=N'SexTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别分布类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SexType'
GO
/****** Object:  Table [dbo].[AL_UserTemp]    Script Date: 06/03/2008 18:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AL_UserTemp](
	[RoleID] [int] NULL CONSTRAINT [DF__AL_UserTe__RoleI__5FB337D6]  DEFAULT ((0)),
	[Email] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[CompanyAddress] [nvarchar](500) NULL,
	[LinkMan] [nvarchar](8) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[Msn] [nvarchar](50) NULL,
	[Introducer] [varchar](16) NULL,
	[IsLocked] [tinyint] NULL,
	[ActiveCode] [varchar](16) NULL,
	[RegTime] [datetime] NULL CONSTRAINT [DF__AL_UserTe__RegTi__60A75C0F]  DEFAULT (getdate()),
	[RegIP] [nvarchar](15) NULL,
	[School] [nvarchar](50) NULL,
	[Proxy] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'未激活用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_UserTemp'
GO
/****** Object:  Table [dbo].[AL_Ad]    Script Date: 06/03/2008 18:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_Ad](
	[AdId] [uniqueidentifier] NOT NULL,
	[AdGroupId] [uniqueidentifier] NULL,
	[IsText] [tinyint] NULL,
	[Title] [nvarchar](40) NULL,
	[Content] [nvarchar](120) NULL,
	[Url] [nvarchar](1024) NULL,
	[UrlText] [nvarchar](256) NULL,
	[SizeId] [int] NULL,
	[AuditState] [tinyint] NULL DEFAULT ((0)),
	[Img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'AdGroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是文字广告 1:文字，0:图片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'IsText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文字广告标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告内容(如果是图片广告就是图片说明）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接网址（包括图片的链接网址）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'UrlText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'SizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片的地址（只在图片广告时有作用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad'
GO
/****** Object:  Table [dbo].[AL_Order]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_Order](
	[OrderId] [uniqueidentifier] NOT NULL,
	[OrderName] [nvarchar](200) NULL,
	[UserId] [uniqueidentifier] NULL,
	[AdId] [uniqueidentifier] NOT NULL,
	[ZoneId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AuditState] [tinyint] NULL,
	[PerPoint] [decimal](18, 0) NULL,
	[EverydayPrice] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[Payment] [tinyint] NULL DEFAULT ((0)),
	[PayId] int identity(1000000000,1),
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单名称，用来帮助广告主区分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'OrderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买广告用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告牌ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'AdId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'ZoneId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间（200804151003）（只针对包周广告）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间（200804151003）（只针对包周广告）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态，0为未审核，1为审核通过，2为审核拒绝，3为过期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每次点击费用，不得少于0.08元。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'PerPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每天点击的费用限额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'EverydayPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'需要支付费用（当为包周时为包周费用，为点击方式时为投入的费用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付状态，默认为0为未支付' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'Payment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'PayId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order'
GO
/****** Object:  Table [dbo].[AL_NewsClass]    Script Date: 06/03/2008 18:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AL_NewsClass](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_NewsClass'
GO
/****** Object:  Trigger [CheckOrder]    Script Date: 06/03/2008 18:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[CheckOrder] on [dbo].[AL_Order] for update 
as 

with temptbl as
(select * from AL_Order where AL_Order.OrderId=(select Inserted.OrderId from Inserted))
select * from AL_Order
if(((select inserted.PerPoint from inserted) is not null) and ((select temptbl.Price from temptbl)/(select temptbl.PerPoint from temptbl)<=(select PointNum from AL_AdReport)))
		update AL_Order set AuditState=3 where OrderId=(select Inserted.OrderId from Inserted)
else 
begin
	if((select inserted.EndDate from inserted)<getdate())
		update AL_Order set AuditState=3 where OrderId=(select Inserted.OrderId from Inserted)
end
GO
