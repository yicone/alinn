create database hot
--�û���
CREATE TABLE [dbo].[HOT_User] (
	[UserID] [int] identity(1,1) Primary key NOT NULL ,
	[RoleID] [int] default(0) NULL ,--��ɫID���磺��Ա��VIP��Ա������Ա��
	[UserType] [smallint] NULL ,--�û��������ҵ�û�����ͨ�û���
	[Group]	[smallint] null,--�û�������ID
	[UserName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[NickName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--�ǳ�
	[RealName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,--��ʵ����
	[Sex] [tinyint] null,--�Ա�
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
	[LoginTimes] [int] NULL ,--�û���¼����
	[UserPoint] [int] NULL default(0),--�û�������
	[UserBooks] [int] NULL default(0),--�û�ͼ�鱣����
	[ConsumePoint] [int] NULL ,--���ѷ���
	[UnreadMsg] [smallint] NULL ,
	[IsLocked] [tinyint] NULL ,--�Ƿ�����
	[Balance] [money] null,--�ʻ����
	[UserSetting] [ntext] COLLATE Chinese_PRC_CI_AS NULL,--�û����˼��
	[RegTime] [datetime] NULL default(getdate()),--�û�ע��ʱ��
	[LastLoginIP] [nvarchar](15),--����¼IP
	[LastLoginTime] [datetime] NULL default(getdate())--�û�����¼ʱ��
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--����Ա��
CREATE TABLE [dbo].[HOT_Admin] (
	[AdminId][int] identity(1,1) Primary key NOT NULL ,
	[AdminName] [nvarchar](50) null,
	[UserName] [nvarchar](50) null,
	[Password] [nvarchar](32) null,
	[Purview] [int] null,--����Ա����1����������Ա��2������ͨ����Ա
	[RoleName] [nvarchar](50) null,--��ɫ����
	[LastLoginIP] [nvarchar](15) null,
	[LastLoginTime][datetime] null,
	[LastLogoutTime][datetime] null,
	[LoginTimes] [int] null
)
--�����
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
--��վ��������
CREATE TABLE [dbo].[HOT_Config] (
	[SiteName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[SiteUrl] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[WebmasterName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[WebmasterEmail] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Copyright] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[HitsOfHot] [int] NULL ,--�趨������ٴο��Գ�Ϊ�ȵ�ͼ��
	[EnableUserReg] [bit] NOT NULL ,--�Ƿ�����ע�����û�
	[UserName_RegDisabled] [ntext] COLLATE Chinese_PRC_CI_AS NULL,--������ע����û���
	[UserNumber] [int] default(0) NULL,
	[BookNumber] [int] default(0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--ͼ�����
CREATE TABLE [dbo].[HOT_BookClass](
	[BookClassId][int] identity(1,1) Primary key NOT NULL ,
	[SonId] [nvarchar] (50) null,--����ID
	[ParentId] [int] null,--����ID
	[BookClassName][nvarchar](100)COLLATE Chinese_PRC_CI_AS NOT NULL,
	[OrderId] [int],--�ŶӲ���
	[BookClassInfo] [nvarchar](300)COLLATE Chinese_PRC_CI_AS NULL,
	[IsDisabled] [tinyint] null--�Ƿ���ʾ
)
--ͼ����Ϣ��
CREATE TABLE [dbo].[HOT_BookInf](
	[BookInfoId] [int] identity(1,1) Primary key NOT NULL ,
	[BookClassId] [int] NULL,--����ID
	[BookName] [nvarchar](150)COLLATE Chinese_PRC_CI_AS NULL ,
	[KeyWords] [nvarchar](200)COLLATE Chinese_PRC_CI_AS NULL ,
	[ISBN] [nvarchar](100) NULL,
	[Author] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Translator] [nvarchar](100)COLLATE Chinese_PRC_CI_AS NULL ,--����
	[Investigator] [nvarchar](100)COLLATE Chinese_PRC_CI_AS NULL ,--У��
	[BookConcern] [int] NOT NULL,--������ID
	[BookSize] [nvarchar](20) NULL,--����
	[PrintSheet][int] NULL,--ӡ��
	[Words] [int] NULL,--����
	[PublishYear] [DATETIME] NULL,--����ʱ��
	[Edition] [smallint] NULL,--�������
	[PrintTime][DATETIME] NULL,--ӡˢʱ��
	[PrintNum][smallint] NULL,--ӡˢ����
	[Number] [int] NULL,--ӡ��
	[BookPrice][decimal] NULL,--����
	[Pages] [int] NULL,--ҳ��
	[Images] [NTEXT] NULL,--ͼƬ
	[CommentCount] [int] null,--���ʴ���
	[State] [smallint] DEFAULT(0) NOT NULL,--���״̬
	[Recommendation] [NTEXT] NULL,--�༭�Ƽ�
	[Content][NTEXT] NULL,--���ݼ��
	[List] [NTEXT] NULL,--Ŀ¼
	[DownLoad] [varchar](300) NULL,--���ص���Ԥ����
	[HasSell] [int] null,--�����
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--����ͼ���
CREATE TABLE [dbo].[HOT_SoldBook](
	[SoldBookId][int] identity(1,1) Primary key NOT NULL ,
	[BookId] int null,--ͼ��ID
	[BindId] int null,--װ����ʽ
	[Code] [nvarchar](20),--���
	[Grade][int] null,--Ʒ��
	[BookPrice] [decimal] null,--���ۼ۸�
	[Stocks] [int] null,--�������
	[Weight] [float] null,--����
	[Standard] [nvarchar](100) null,--ͼ����
	[OnTop] [tinyint] null,--�Ƿ��ö�
	[IsElite] [tinyint] null,--�Ƿ��Ƽ�
	[IsHot] [tinyint] null,--�Ƿ��ȵ�
	[EnableSale] [tinyint] null,--�Ƿ��ϼ�
	[Deleted] [tinyint] null,--�Ƿ�ɾ��
	[Hits] [int] null,--�������
	[Discout] [float] null,--�ۿ�
	[PresentExp] [int] null,--���ͻ���
	[Description] ntext null,
	[Images] [NTEXT] NULL,
	[UserId] [int] null,--����û�ID
	[EditeDate] DATETIME  DEFAULT(GETDATE()) NOT NULL,
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--���ﳵ
CREATE TABLE [dbo].[HOT_ShopCart](
	[ShopCartId] [int] identity(1,1) Primary key NOT NULL ,
	[UserId] int not null,
	[SoldBookId] int not null,
	[Quantity] int not null,
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)
--������ʱ��
CREATE TABLE [dbo].[HOT_OrderItems](
	[ItemId][int] identity(1,1) Primary key NOT NULL ,--��ʱ��ID
	[OrderId] int null,--����ID
)
--����
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
	[Message] [Nvarchar](600) Null,--����
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)
--װ����
CREATE TABLE [dbo].[HOT_Binding](
	[BindingId][int] identity(1,1) Primary key NOT NULL ,
	[Bind] [nvarchar](50) not null,
	[Description] ntext
)
--�������
CREATE TABLE [dbo].[HOT_BookConcern]
(
	[BookConcernId] [int] identity(1,1) Primary key NOT NULL ,
	[BookConcernName] [nvarchar](300) NOT NULL,
	[Area] [int] NOT NULL,
	[Letter] [char] NOT NULL,
	[Description] [nText] NULL,
	[Hits] [int] null,--�������
	[OnTop] [tinyint] null,--�Ƿ��ö�
	[IsElite] [tinyint] null,--�Ƿ��Ƽ�
	[AddDate] DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--������
CREATE TABLE [dbo].[HOT_Area]
(	
	[AreaId][int] identity(1,1) Primary key NOT NULL ,
	[AreaName] [nvarchar](50) null,
	[Description] [ntext] null,
	[AddDate]DATETIME  DEFAULT(GETDATE()) NOT NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--��ʽ
CREATE TABLE [dbo].[HOT_PaymentType](
	[TypeId] [int] identity(1,1) Primary key NOT NULL ,
	[TypeName] [nvarchar](50) Not NULL,
	[Discount] [float] null,--ÿ��֧����ʽ���ۿ���
	[IsDefault] [tinyint] null,--�Ƿ���Ĭ�ϵ�֧����ʽ
	[OrderId] [int] null,--����
	[Description] [ntext] NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--�͵�
CREATE TABLE [dbo].[HOT_Express](
	[ExpressId] [int] identity(1,1) Primary key NOT NULL ,
	[ExpressName] [nvarchar](50) Not NULL,
	[Description] [ntext] NULL
)ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--��־
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
--�û�ע�ᴥ����
CREATE TRIGGER AddUser_UserNumber
ON HOT_USER
FOR INSERT
AS
BEGIN
	UPDATE [HOT_Config] SET [UserNumber]=[UserNumber]+1
END

--�����������
update  hot_user set
Address='�����г������������11��',PostCode=100012,Telephone='01084949051',Mobile='13488686989',qq=1363036,RealName='��ռ��'
INSERT INTO [HOT_Config]([UserNumber],[EnableUserReg])VALUES(1,0)
select * from HOT_User

--��ͼ������м�������
insert into hot_bookclass(bookclassname,parentid) values('��ѧ��',0)
insert into hot_bookclass(bookclassname,parentid) values('�������',0)
insert into hot_bookclass(bookclassname,parentid) values('JAVA',2)
insert into hot_bookclass(bookclassname,parentid) values('C#',2)
--��װ�����м�������
insert into hot_binding(bind)values('ƽװ')
insert into hot_binding(bind)values('��װ')
insert into hot_binding(bind)values('��װ')
insert into hot_binding(bind)values('����װ')
--��ͼ����Ϣ�м�������
insert into hot_bookinf(bookname,bookconcern)values('2222','2')
--�����ͼ������������
insert into hot_soldbook([Code],[BookId],[Grade],[BookPrice],[Number])values('Z000000001',10,10,56,1)
--���������������
insert into hot_BookConcern(BookConcernName,Area,letter)
values('�л����',1,'Z')
insert into hot_BookConcern(BookConcernName,Area,letter)
values('�Ϻ��ż�',1,'S')
insert into hot_BookConcern(BookConcernName,Area,letter)
values('�ߵȽ���',1,'G')
--��������������
insert into hot_area(areaname)values('�й���½')
insert into hot_area(areaname)values('���')
insert into hot_area(areaname)values('̨��')