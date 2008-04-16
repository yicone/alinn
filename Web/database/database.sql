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
--����
CREATE TABLE [dbo].[AL_Zone] (
	[ZoneId] [uniqueidentifier] Primary key NOT NULL ,
	[UserId] [uniqueidentifier] null,--���λ������ID	
	[ZoneName] [nvarchar] (50) null,--���λ����
	[SiteId] [uniqueidentifier] null,--������վ
	[IsWord] [tinyint] null,--�Ƿ������ֹ��
	[IsImg] [tinyint] null,--�Ƿ���ͼƬ����Flash���
	[Position] [tinyint] null,--���λ�ã�0Ϊ��ҳ��1Ϊ������ҳ
	[Size] [int] null,--���ߴ�
	[Type] [tinyint] null,--���Ʒѷ�ʽ��0Ϊ��ʱ���Ʒ�,1Ϊ������Ʒ�*
	[Classes] [nvarchar] (7) null,--�����࣬����ѡ �����������磺2|3
	[KeyWords] [nvarchar](136) null,--�ؼ���
	--������ò��ֿ�ʼ
	[TitleColor] [varchar] (6) null,--���������ɫ
	[ContentColor] [nvarchar] (300) null,--������������ݣ�
	[UrlColor] [varchar] (6) null,--������ɫ
	[BorderColor] [varchar] (6) null,--�߿���ɫ
	[BgColor] [varchar](6) null,--������ɫ
	[Grounding] [varchar](6) null,--��ɫ
	[BgImg] [nvarchar](50) null,--����ͼƬ
	[Corner] [nvarchar](50) null,--ת��ͼƬ
	--������ò��ֽ���
	[IsLocked] [tinyint] null,--���(��������Ա��˲ſ��Գ��۴˹��λ)
	[NeedCheck] [tinyint] null,--�˹��λ�Ƿ���Ҫվ����˲���Ͷ�ţ�
	[Description] [ntext]--�������
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
	[Title]	[nvarchar] (40) null,--���ֹ��
	[Content] [nvarchar](120) null,--�������(�����ͼƬ������ͼƬ˵����
	[Url] [nvarchar] (1024) null,--������ַ������ͼƬ��������ַ��
	[UrlText] [nvarchar](256) null,--��ʾ��ַ
	[Img] [nvarchar] (50) null--ͼƬ�ĵ�ַ��ֻ��ͼƬ���ʱ�����ã�
)
--������
CREATE TABLE [dbo].[AL_Order] (
	[OrderId] [uniqueidentifier]  Primary key NOT NULL ,
	[OrderName] [nvarchar] null,--�������ƣ������������������
	[UserId][uniqueidentifier]  ,--�������û�
	[AdId] [uniqueidentifier] not null,--�����ID
	[StartDate] [varchar] (12),--��ʼʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[EndDate] [varchar](12),--����ʱ�䣨200804151003����ֻ��԰��ܹ�棩
	[AuditState] [tinyint] null,--���״̬
	[PerPoint] [decimal] null,--ÿ�ε�����ã���������0.08Ԫ��
	[EverydayPrice] [decimal] null,--ÿ�����ķ����޶�
	[Price] [decimal] null,--��Ҫ֧�����ã���Ϊ����ʱΪ���ܷ��ã�Ϊ�����ʽʱΪͶ��ķ��ã�
	[Payment] [tinyint] default(0),--֧��״̬��Ĭ��Ϊ0Ϊδ֧��
	[SumPV] [int] null,--��Ͷ�ſ�ʼ�������
	[PointNum] [int] null,--�������
	[CreateDate] NULL default(getdate())--�����ύʱ��
)
CREATE TABLE [dbo].[AL_OrderReport] (
	[
)
--��վ��

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
	[AuditState] [tinyint] NULL,				--���״̬
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

--���ߴ��
CREATE TABLE [dbo].[AL_AdSize] (
	[SizeId] [int] identity(1,1) Primary key NOT NULL ,
	[Width] [int] null,--��
	[Height] [int] null--��
)
GO

--�������
CREATE TABLE [dbo].[AL_ZoneClass] (
	[ClassId] [int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar](10) null,--��������
	[ParentId] [int] null--����ID
)