--向广告分类表插入数据
SET IDENTITY_INSERT [AL_ZoneClass] ON

insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(1, '潮流时尚',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(2,'数码硬件',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(3,'互联网',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(4,'运动体育',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(5,'教育培训',0)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(6,'美容美发',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(7,'流行服饰',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(8,'美体减肥',1)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(9,'网站建设',3)
insert into AL_ZoneClass(ClassId, ClassName,ParentId) values(10,'编程开发',3)

SET IDENTITY_INSERT [AL_ZoneClass] OFF

--向广告AD表插入数据
insert into AL_AD(AdId,AdGroupId,Title) values('BF0A638B-42E0-4EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','广告1')
insert into AL_AD(AdId,AdGroupId,Title) values('CF0A638B-43E0-3EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','广告1')


insert into AL_Adgroup(groupname,userid,class,keywords,adgroupId)
values('dfdsf','936DA01F-9ABD-4D9D-80C7-02AF85C822A7',5,'4444','9363D71F-9ABD-4D9D-80C7-02AF85C822A7')

--广告位规格（数据已全）
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

--