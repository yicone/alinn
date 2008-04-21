--�û���
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
GO
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
[TitleColor] [varchar]  (6) NULL,
[DescriptionColor] [nvarchar]  (12) NULL,
[LinkColor] [varchar]  (6) NULL,
[BorderColor] [varchar]  (6) NULL,
[BgColor] [varchar]  (6) NULL,
[Grounding] [varchar]  (6) NULL,
[BgImg] [nvarchar]  (100) NULL,
[CornerImg] [nvarchar]  (100) NULL,
[NeedAuditing] [tinyint]  NULL,	--�Ƿ���Ҫ��˹��
[AllowAdultAd] [tinyint]  NULL,	
[Description] [ntext]  NULL,	--���λ����
[ZoneCode] [ntext]  NULL,		--���ɵĹ��λ�������
[WeekPrice] [decimal]  (10,2) NULL,	--��ʱ�����ѵļ۸�
[RecommendWeekPrice] [decimal]  (10,2) NULL,	--ϵͳ�Ƽ��İ�ʱ�����Ѽ۸�
[ZoneState] [tinyint]  NULL)		--���λ��״̬���ϼܡ��¼ܡ�δ����ܾ�

ALTER TABLE [AL_Zone] WITH NOCHECK ADD  CONSTRAINT [PK_AL_Zone] PRIMARY KEY  NONCLUSTERED ( [ZoneId] )
GO
--�����(��������������Լ�ҪͶ�Ź����飩
CREATE TABLE [dbo].[AL_AdGroup] (
	[AdGroupId] [uniqueidentifier]  Primary key NOT NULL ,
	[GroupName] [nvarchar] (40) null,--��������
	[UserId]  [uniqueidentifier] null,--�û�ID
	[Class] [int] null,--������
	[KeyWords] [nvarchar](136) null--�ؼ���
)
--�����ҪͶ�ŵĹ����
CREATE TABLE [dbo].[AL_Ad] (
	[AdId] [uniqueidentifier]  Primary key NOT NULL ,
	[AdGroupId] [uniqueidentifier] null,--�����ID
	[Title]	[nvarchar] (40) null,--���ֹ��
	[Content] [nvarchar](120) null,--�������(�����ͼƬ������ͼƬ˵����
	[Url] [nvarchar] (1024) null,--������ַ������ͼƬ��������ַ��
	[UrlText] [nvarchar](256) null,--��ʾ��ַ
	[SizeId] [int] null,--��С
	[AuditState] [tinyint] default(0) null,--���״̬
	[Img] [nvarchar] (50) null--ͼƬ�ĵ�ַ��ֻ��ͼƬ���ʱ�����ã�
)
--������
CREATE TABLE [dbo].[AL_Order] (
	[OrderId] [uniqueidentifier]  Primary key NOT NULL ,
	[OrderName] [nvarchar] null,--�������ƣ������������������
	[UserId][uniqueidentifier]  ,--�������û�
	[AdId] [uniqueidentifier] not null,--�����ID
	[StartDate] datetime null,--��ʼʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[EndDate] datetime null,--����ʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[AuditState] [tinyint] null,--���״̬
	[PerPoint] [decimal] null,--ÿ�ε�����ã���������0.08Ԫ��
	[EverydayPrice] [decimal] null,--ÿ�����ķ����޶�
	[Price] [decimal] null,--��Ҫ֧�����ã���Ϊ����ʱΪ���ܷ��ã�Ϊ�����ʽʱΪͶ��ķ��ã�
	[Payment] [tinyint] default(0),--֧��״̬��Ĭ��Ϊ0Ϊδ֧��
	[CreateDate] [datetime] default(getdate()) NULL--�����ύʱ��
)
--���Ч������
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
GO

--��վ�����
CREATE TABLE [dbo].[AL_SiteClass] (
	[ClassId][int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar] (20) null
) 
GO

--ְҵ�����
CREATE TABLE [dbo].[AL_Employment] (
	[EmploymentId] [int] identity(1,1) Primary key NOT NULL ,
	[EmploymentName] [nvarchar] (20) null
)
GO

--���λ�ߴ��
if exists (select * from sysobjects where id = OBJECT_ID('[AL_ZoneSize]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [AL_ZoneSize]

CREATE TABLE [AL_ZoneSize] (
[SizeId] [int]  IDENTITY (1, 1)  NOT NULL,
[ZoneSize] [varchar]  (10) NULL,
[SizeType] [int]  NULL)

ALTER TABLE [AL_ZoneSize] WITH NOCHECK ADD  CONSTRAINT [PK_AL_ZoneSize] PRIMARY KEY  NONCLUSTERED ( [SizeId] )

--�������
CREATE TABLE [dbo].[AL_ZoneClass] (
	[ClassId] [int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar](50) null,--��������
	[ParentId] [int] null--����ID
)