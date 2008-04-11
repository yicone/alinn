--�û���
CREATE TABLE [dbo].[AL_User] (
	[UserID] [varchar](16) Primary key NOT NULL ,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--����
CREATE TABLE [dbo].[AL_Ads] (
	[AdId] [varchar](16) Primary key NOT NULL ,
	[UserId] [varchar](16) null,--���λ������ID
	[WebId] [varchar](16) null,--������վ
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
--��վ��
CREATE TABLE [dbo].[AL_Webs] (
	[WebId] [varchar](16) Primary key NOT NULL ,
	[UserId] [varchar](16) null,--�����վ���û�ID
	[WebName] [nvarchar] (32) Null,--��վ����
	[WebUrl] [nvarchar] (128) Null,--��ַ
	[WebClass] [int] null,--��վ����ID
	[SexType] [tinyint] null,--�Ա����ͣ�0��ʾ���������еģ�1��ʾ����Ů����һ�£�2��ʾ������Ů��
	[AgeType] [tinyint] null,--�������ͣ�0��ʾ��18�����£�1��ʾ��18~25�꣬2��ʾ��25~45�꣬3��ʾ��45������
	[Employment][int] null,--ְҵ
	[Taste] [nvarchar] (60) null,--����
	[Description] [ntext] null--��վ����
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--��վ�����
CREATE TABLE [dbo].[AL_WebClass] (
	[ClassId][int] identity(1,1) Primary key NOT NULL ,
	[ClassName] [nvarchar] (20) null
) 
--ְҵ�����
CREATE TABLE [dbo].[AL_Employment] (
	[EmploymentId] [int] identity(1,1) Primary key NOT NULL ,
	[EmploymentName] [nvarchar] (20) null
)
--���ߴ��
CREATE TABLE [dbo].[AL_AdSize] (
	[SizeId] [int] identity(1,1) Primary key NOT NULL ,
	[Width] [int] null,--��
	[Height] [int] null,--��
)
--�������
CREATE TABLE [dbo].[AL_AdClass] (
	[AdClassId] [int] identity(1,1) Primary key NOT NULL ,
	[AdClassName] [nvarchar](10) null,--��������
	[ParentId] [int] null--����ID
)