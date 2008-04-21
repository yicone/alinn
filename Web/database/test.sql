--向广告分类表插入数据
insert into AL_ZoneClass(ClassName,ParentId) values('潮流时尚',0)
insert into AL_ZoneClass(ClassName,ParentId) values('数码硬件',0)
insert into AL_ZoneClass(ClassName,ParentId) values('互联网',0)
insert into AL_ZoneClass(ClassName,ParentId) values('运动体育',0)
insert into AL_ZoneClass(ClassName,ParentId) values('教育培训',0)
insert into AL_ZoneClass(ClassName,ParentId) values('美容美发',1)
insert into AL_ZoneClass(ClassName,ParentId) values('流行服饰',1)
insert into AL_ZoneClass(ClassName,ParentId) values('美体减肥',1)
insert into AL_ZoneClass(ClassName,ParentId) values('网站建设',3)
insert into AL_ZoneClass(ClassName,ParentId) values('编程开发',3)
--向广告AD表插入数据
insert into AL_AD(AdId,AdGroupId,Title) values('BF0A638B-42E0-4EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','广告1')
insert into AL_AD(AdId,AdGroupId,Title) values('CF0A638B-43E0-3EFA-ADAB-9A8200C07659','9363D71F-9ABD-4D9D-80C7-02AF85C822A7','广告1')


insert into AL_Adgroup(groupname,userid,class,keywords,adgroupId)
values('dfdsf','936DA01F-9ABD-4D9D-80C7-02AF85C822A7',5,'4444','9363D71F-9ABD-4D9D-80C7-02AF85C822A7')
