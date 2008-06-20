--ʹ��Microsoft SQL Server Management Studio Express	9.00.3042.00 "Generic Scripts..."����
--������������Ҫѡ�������������
--ע�⣺����ʹ����������ȫѡ�����������ֶ��޸Ļ���ӱ�����֣�
--�����������𸲸ǣ������°汾ʱע���޸ĵ���ʱ�䣡	yicone

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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ���н�ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZonePic'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ű�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_News'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɫID Ĭ��Ϊ0:Ϊ���˻�Ա,1:��ҵ��Ա,2:ϵͳ����Ա,3:�ͷ���Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͬʱ��Ϊ��¼�û�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ǳ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���루MD5���ܣ�16λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'UserPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'CompanyAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LinkMan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˵��û�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'Introducer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϴε�¼ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϴε�¼IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û���¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'LoginTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'IsLocked'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������֤�루20080411����ӣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'ActiveCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û�ע��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User', @level2type=N'COLUMN',@level2name=N'RegTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û����Ѽ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_User'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֹ�桢ͼƬ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�����ҳ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'InFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ����Ӧ�ı�ţ��ο�ZoneSize��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'SizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ʒ����ͣ����������ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'TransType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ�ı�����У��ο�ZoneClass��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ClassIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���Ҫ��˹�� 1:��Ҫ��0:����Ҫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'NeedAuditing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ɵĹ��λ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʱ�����ѵļ۸�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'WeekPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�Ƽ��İ�ʱ�����Ѽ۸�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'RecommendWeekPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ��״̬��1�ϼܡ�2�¼ܡ�0δ���3�ܾ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ����۵����л���Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone', @level2type=N'COLUMN',@level2name=N'ZoneStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Zone'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_OrderReport'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ��ͼ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SitePic'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͬʱ��Ϊ��¼�û���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo', @level2type=N'COLUMN',@level2name=N'EmailSender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo', @level2type=N'COLUMN',@level2name=N'EmailIsErgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ʼ�ϵͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_EmailInfo'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ����ͳ�Ʊ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneStat'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ؼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup', @level2type=N'COLUMN',@level2name=N'KeyWords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AdGroup'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����վ���û�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ����ID���ο�SiteClass��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SiteClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŀ����Ⱥ���Ա�ֲ����ο�SexType��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'SexType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŀ����Ⱥ������ֲ����ο�AgeType��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'AgeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŀ����Ⱥ��ְҵ���ͣ��ο�Employment��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Employments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Taste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ÿ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'PV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ÿ��ķ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'VistersNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'վ���ύ��ϵͳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Site'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��վ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SiteClass'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְҵ�ֲ����ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Employment'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʾ��: ��760x90��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize', @level2type=N'COLUMN',@level2name=N'SizeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1����� 2���Ǻ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize', @level2type=N'COLUMN',@level2name=N'SizeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ�ߴ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneSize'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_ZoneClass'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λ�ղر�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Store'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������  0��ʾ��18�����£�1��ʾ��18~25�꣬2��ʾ��25~45�꣬3��ʾ��45������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AgeType', @level2type=N'COLUMN',@level2name=N'AgeTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ֲ����ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_AgeType'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ա����ͣ�0��ʾ���������еģ�1��ʾ����Ů����һ�£�2��ʾ������Ů��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SexType', @level2type=N'COLUMN',@level2name=N'SexTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ա�ֲ����ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_SexType'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'δ�����û���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_UserTemp'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'AdGroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ������ֹ�� 1:���֣�0:ͼƬ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'IsText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֹ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������(�����ͼƬ������ͼƬ˵����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ַ������ͼƬ��������ַ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʾ��ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'UrlText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��С' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'SizeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ�ĵ�ַ��ֻ��ͼƬ���ʱ�����ã�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad', @level2type=N'COLUMN',@level2name=N'Img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Ad'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ƣ������������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'OrderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������û�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'AdId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'ZoneId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʼʱ�䣨200804151003����ֻ��԰��ܹ�棩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ�䣨200804151003����ֻ��԰��ܹ�棩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���״̬��0Ϊδ��ˣ�1Ϊ���ͨ����2Ϊ��˾ܾ���3Ϊ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'AuditState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ÿ�ε�����ã���������0.08Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'PerPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ÿ�����ķ����޶�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'EverydayPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ֧�����ã���Ϊ����ʱΪ���ܷ��ã�Ϊ�����ʽʱΪͶ��ķ��ã�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֧��״̬��Ĭ��Ϊ0Ϊδ֧��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'Payment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֧������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'PayId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ύʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_Order'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ŷ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AL_NewsClass'
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
