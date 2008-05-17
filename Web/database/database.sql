USE [Alinn]
--�û���
if exists (select * from sysobjects where id = OBJECT_ID('[AL_User]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_User]

CREATE TABLE [dbo].[AL_User] (
	[UserID] [uniqueidentifier] Primary key NOT NULL ,
	[RoleID] [int] default(0) NULL ,--��ɫID���磺���˻�Ա����ҵ��Ա�ȣ�Ĭ��Ϊ0��ʾΪ���˻�Ա
	[Email] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--ͬʱ��Ϊ��¼�û���
	[NickName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--�ǳ�
	[UserPassword] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NULL ,--���루MD5���ܣ�16λ
	[CompanyName] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL ,--��ҵ����
	[CompanyAddress] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,--��ҵ��ַ
	[LinkMan] [nvarchar](8)  COLLATE Chinese_PRC_CI_AS NULL ,--��ϵ��
	[Telephone][nvarchar](50) NULL,--�绰
	[Mobile][nvarchar](50) NULL,--�ֻ�
	[QQ] [nvarchar] (50) NULL,--QQ
	[Msn] [nvarchar] (50) NULL,--MSN
	[Introducer] [varchar](16) null,--�Ƽ���
	[LastLoginTime] [datetime] NULL ,--�ϴε�¼ʱ��
	[LastLoginIP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,--�ϴε�¼IP
	[LoginTimes] [int] NULL ,--�û���¼����
	[IsLocked] [tinyint] NULL ,--�Ƿ�����
	[ActiveCode] [varchar] (16) null,--������֤�루20080411����ӣ�
	[RegTime] [datetime] NULL default(getdate())--�û�ע��ʱ��
) 

--���λ��
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Zone]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Zone]

CREATE TABLE [AL_Zone] (
[ZoneId] [uniqueidentifier]  NOT NULL,
[UserId] [uniqueidentifier]  NULL,
[ZoneName] [nvarchar]  (100) NULL,
[SiteId] [uniqueidentifier]  NULL,
[MediaType] [tinyint]  NULL,	--���ֹ�桢ͼƬ���
[InFirst] [tinyint]  NULL,		--�Ƿ�����ҳ
[SizeId] [int]  NULL,			--���λ����Ӧ�ı��
[TransType] [tinyint]  NULL,	--�Ʒ����ͣ����������ʱ��
[ClassIds] [nvarchar]  (14) NULL,	--��������ı������
[Keywords] [nvarchar]  (272) NULL,	
[NeedAuditing] [tinyint]  NULL,	--�Ƿ���Ҫ��˹��,1����Ҫ��0�ǲ���Ҫ
[AllowAdultAd] [tinyint]  NULL,	
[Description] [ntext]  NULL,	--���λ����
[ZoneCode] [ntext]  NULL,		--���ɵĹ��λ�������
[WeekPrice] [decimal]  (10,2) NULL,	--��ʱ�����ѵļ۸�
[RecommendWeekPrice] [decimal]  (10,2) NULL,	--ϵͳ�Ƽ��İ�ʱ�����Ѽ۸�
[ZoneState] [tinyint]  NULL,		--���λ��״̬��1�ϼܡ�2�¼ܡ�0δ���3�ܾ�
[ZoneStyle] [nvarchar](100) NULL)

ALTER TABLE [AL_Zone] WITH NOCHECK ADD  CONSTRAINT [PK_AL_Zone] PRIMARY KEY  NONCLUSTERED ( [ZoneId] )
GO
--���λ����ͼ
if exists (select * from sysobjects where id = OBJECT_ID('[AL_ZonePic]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_ZonePic]
CREATE TABLE [AL_ZonePic] (
[ZoneId] [uniqueidentifier] NOT NULL,
[ZonePic] varchar(200) null
)		
ALTER TABLE [AL_ZonePic] WITH NOCHECK ADD  CONSTRAINT [PK_AL_ZonePic] PRIMARY KEY  NONCLUSTERED ( [ZoneId] )
GO
--�����(��������������Լ�ҪͶ�Ź����飩
if exists (select * from sysobjects where id = OBJECT_ID('[AL_AdGroup]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_AdGroup]

CREATE TABLE [dbo].[AL_AdGroup] (
	[AdGroupId] [uniqueidentifier]  Primary key NOT NULL ,
	[GroupName] [nvarchar] (40) null,--��������
	[UserId]  [uniqueidentifier] null,--�û�ID
	[Class]  [nvarchar]  (14) NULL,--������
	[KeyWords] [nvarchar](136) null--�ؼ���
)
--�����ҪͶ�ŵĹ����
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Ad]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Ad]

CREATE TABLE [dbo].[AL_Ad] (
	[AdId] [uniqueidentifier]  Primary key NOT NULL ,
	[AdGroupId] [uniqueidentifier] null,--�����ID
	[IsText] tinyint null,--�Ƿ������ֹ�棬1Ϊ���֣�0ΪͼƬ
	[Title]	[nvarchar] (40) null,--���ֹ��
	[Content] [nvarchar](120) null,--�������(�����ͼƬ������ͼƬ˵����
	[Url] [nvarchar] (1024) null,--������ַ������ͼƬ��������ַ��
	[UrlText] [nvarchar](256) null,--��ʾ��ַ
	[SizeId] [int] null,--��С
	[AuditState] [tinyint] default(0) null,--���״̬
	[Img] [nvarchar] (50) null--ͼƬ�ĵ�ַ��ֻ��ͼƬ���ʱ�����ã�
)

--������
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Order]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Order]

CREATE TABLE [dbo].[AL_Order] (
	[OrderId] [uniqueidentifier]  Primary key NOT NULL ,
	[OrderName] [nvarchar](200) null,--�������ƣ������������������
	[UserId][uniqueidentifier]  ,--�������û�
	[AdId] [uniqueidentifier] not null,--�����ID
	[ZoneId][uniqueidentifier]  NOT NULL,--���λID
	[StartDate] datetime null,--��ʼʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[EndDate] datetime null,--����ʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[AuditState] [tinyint] null,--���״̬��0Ϊδ��ˣ�1Ϊ���ͨ����2Ϊ��˾ܾ���3Ϊ����
	[PerPoint] [decimal] null,--ÿ�ε�����ã���������0.08Ԫ��
	[EverydayPrice] [decimal] null,--ÿ�����ķ����޶�
	[Price] [decimal] null,--��Ҫ֧�����ã���Ϊ����ʱΪ���ܷ��ã�Ϊ�����ʽʱΪͶ��ķ��ã�
	[Payment] [tinyint] default(0),--֧��״̬��Ĭ��Ϊ0Ϊδ֧��
	[CreateDate] [datetime] default(getdate()) NULL--�����ύʱ��
)

--���Ч������
if exists (select * from sysobjects where id = OBJECT_ID('[AL_OrderReport]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_OrderReport]

CREATE TABLE [dbo].[AL_OrderReport] (
	[OrderReportId] [uniqueidentifier]  Primary key NOT NULL ,
	[Date] datetime null,--����
	[OrderId] [uniqueidentifier]  NOT NULL,
	[PV] [int] null,--���յ������
	[PointNum] [int] null,--�������
	[Price] [decimal] null--����
)
--��վ��
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Site]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Site]

CREATE TABLE [dbo].[AL_Site](
	[SiteId] [uniqueidentifier]  Primary key NOT NULL ,
	[UserId] [uniqueidentifier] NULL,			--�����վ���û�ID
	[SiteName] [nvarchar](32) NULL,				--��վ����
	[SiteUrl] [nvarchar](128) NULL,				--��ַ
	[SiteClass] [int] NULL,						--��վ����ID
	[SexType] [tinyint] NULL,					--�Ա����ͣ�0��ʾ���������еģ�1��ʾ����Ů����һ�£�2��ʾ������Ů��
	[AgeType] [tinyint] NULL,					--�������ͣ�0��ʾ��18�����£�1��ʾ��18~25�꣬2��ʾ��25~45�꣬3��ʾ��45������
	[Employments] [varchar](100) NULL,			--ְҵ
	[Taste] [nvarchar](60) NULL,				--����
	[AuditState] [tinyint] null,				--���״̬
	[PV] [int] null,							--ÿ��������
	[VistersNum] [int] null,					--ÿ��ķ�������
	[Description] [ntext] NULL				--��վ����

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--��վ����ͼ
if exists (select * from sysobjects where id = OBJECT_ID('[AL_SitePic]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_SitePic]

CREATE TABLE [dbo].[AL_SitePic] (
	[SiteId] [uniqueidentifier]  Primary key NOT NULL ,
	[Pic] [nvarchar] (200) 
) 
--��վ�����
if exists (select * from sysobjects where id = OBJECT_ID('[AL_SiteClass]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_SiteClass]

CREATE TABLE [dbo].[AL_SiteClass] (
	[ClassId][int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar] (20) null
) 

--ְҵ�����
if exists (select * from sysobjects where id = OBJECT_ID('[AL_Employment]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_Employment]

CREATE TABLE [dbo].[AL_Employment] (
	[EmploymentId] [int] identity(1,1) Primary key NOT NULL ,
	[EmploymentName] [nvarchar] (20) null
)

--���λ�ߴ��
if exists (select * from sysobjects where id = OBJECT_ID('[AL_ZoneSize]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_ZoneSize]

CREATE TABLE [AL_ZoneSize] (
[SizeId] [int]  IDENTITY (1, 1)  NOT NULL,
[SizeCode] [varchar]  (10) NULL,		--760x90
[SizeType] [int]  NULL)					--1����� 2��

ALTER TABLE [AL_ZoneSize] WITH NOCHECK ADD  CONSTRAINT [PK_AL_ZoneSize] PRIMARY KEY  NONCLUSTERED ( [SizeId] )

--�������
if exists (select * from sysobjects where id = OBJECT_ID('[AL_ZoneClass]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_ZoneClass]

CREATE TABLE [dbo].[AL_ZoneClass] (
	[ClassId] [int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar](50) null,--��������
	[ParentId] [int] null--����ID
)
--����ϵͳ
CREATE TABLE [dbo].[AL_News](
	[NewsId] int identity(1,1) primary key not null,
	[ClassId] int null,
	[Title] nvarchar(200) null,
	[Content] ntext null,
	[CreateDate] datetime default(getdate())
)
--���ŷ���
CREATE TABLE [dbo].[AL_NewsClass](
	[ClassId]  int identity(1,1) primary key not null,
	[ClassName] nvarchar(20) null
)
GO
--�ʼ�ϵͳ
Create Table [dbo].[AL_EmailInfo](
	[InfoId] [uniqueidentifier]  Primary key NOT NULL ,
	[EmailSender]	[nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,--ͬʱ��Ϊ��¼�û���
	[EmailReceiver][nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[EmailSubject][nvarchar] (200),
	[EmailContent] ntext null,
	[EmailIsErgency] [tenyint] null)--�Ƿ����

-------test
create table students
(
stuid int  identity (1,1),
name varchar(20),
sex varchar(20),
score int
)
insert into students(name,sex,score)
values('111','1',99)
insert into students(name,sex,score)
values('222','2',100)
insert into students(name,sex,score)
values('333','1',100)
insert into students(name,sex,score)
values('444','2',99)

select top 2 name,max(score) from students group by sex ,name
select top 2 name,max(score) from students group by sex,name

select top 2 name,max(score) from  students group by sex ,name


create table #tmp 
(
	stuid int,
    name varchar(10),
    sex  varchar(6),
    score int 
)
insert into #tmp values(1,'����','��',99)
insert into #tmp values(2,'����','Ů',100)
insert into #tmp values(3,'����','��',100)
insert into #tmp values(4,'����','Ů',99)
  select top 2 name,max(score) from  #tmp group by sex ,name