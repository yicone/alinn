--���������������
SET IDENTITY_INSERT [AL_ZoneClass] ON

insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(1, '����ʱ��',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(2,'����Ӳ��',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(3,'������',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(4,'�˶�����',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(5,'������ѵ',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(6,'��������',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(7,'���з���',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(8,'�������',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(9,'��վ����',3)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(10,'��̿���',3)

SET IDENTITY_INSERT [AL_ZoneClass] OFF

--����AD���������
insert into AL_AD(AdId,AdGroupId,Title) values('BF0A638B-42E0-4EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','���1')
insert into AL_AD(AdId,AdGroupId,Title) values('CF0A638B-43E0-3EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','���1')


insert into AL_Adgroup(groupname,userid,class,keywords,adgroupId)
values('dfdsf','936DA01F-9ABD-4D9D-80C7-02AF85C822A7',5,'4444','9363D71F-9ABD-4D9D-80C7-02AF85C822A7')

--���λ���������ȫ��
SET IDENTITY_INSERT [AL_ZoneSize] ON

INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 1,'760x90',1)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 2,'468x60',1)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 3,'250x60',1)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 4,'728x90',1)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 5,'950x90',1)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 6,'120x600',2)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 7,'120x240',2)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 8,'160x600',2)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 9,'180x250',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 10,'250x300',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 11,'360x190',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 12,'250x250',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 13,'200x200',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 14,'336x280',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 15,'300x250',3)
INSERT [AL_ZoneSize] ([SizeId],[SizeCode],[SizeType]) VALUES ( 16,'120x60',4)

SET IDENTITY_INSERT [AL_ZoneSize] OFF

--����λ���������
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07659','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07658','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07657','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07656','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07655','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07654','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07653','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07652','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07651','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07649','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07639','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')
insert into AL_Zone(ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,sizeid,transtype,classids,keywords,ZoneState,Description)
values('aF0A638B-43E1-1EFA-ADAB-9A8200C07629','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������ҳ���1','936DA01F-9ABD-4D9D-80C7-02AF85C822A8',1,1,1,1,1|2,'���ǹؼ���',1,'���ǽ���')



insert into AL_user(UserId,roleid,email) values('936DA01F-9ABD-4D9D-80C7-02AF85C822A7',1,'andylaufzf@163.com')


insert into AL_Site(SiteId,UserId,SiteName,SiteUrl,Description)
values('936DA01F-9ABD-4D9D-80C7-02AF85C822A8','936DA01F-9ABD-4D9D-80C7-02AF85C822A7','������','www.downke.cn','һ���������վ')

insert into AL_ZoneSize(SizeCode) values('760X80')

update AL_Site set VistersNum=345
update AL_Zone set weekprice=10.2
update AL_User set QQ='1303036'