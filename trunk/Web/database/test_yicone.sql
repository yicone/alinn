USE [Alinn]

INSERT [AL_Site] ([SiteId],[UserId],[SiteName],[SiteUrl],[SiteClass],[SexType],[AgeType],[Employments],[Description],[AuditState]) VALUES ( '0dab1479-259d-4d2d-9f4c-9a7f00ddc0af','00000000-0000-0000-0000-000000000000','adf','sad',2,0,1,'2','sad',0)

INSERT [AL_Zone] ([ZoneId],[UserId],[ZoneName],[SiteId],[SizeId],[WeekPrice],[ZoneState]) VALUES ( '00000000-0000-0000-0000-000000000000','00000000-0000-0000-0000-000000000000','a','0dab1479-259d-4d2d-9f4c-9a7f00ddc0af',1,1.50,2)

SET IDENTITY_INSERT [AL_SiteClass] ON

INSERT [AL_SiteClass] ([ClassId],[ClassName]) VALUES ( 1,'fdefd')
INSERT [AL_SiteClass] ([ClassId],[ClassName]) VALUES ( 2,'aaa')
INSERT [AL_SiteClass] ([ClassId],[ClassName]) VALUES ( 3,'fdf')

SET IDENTITY_INSERT [AL_SiteClass] OFF

SET IDENTITY_INSERT [AL_Employment] ON

INSERT [AL_Employment] ([EmploymentId],[EmploymentName]) VALUES ( 1,'we')
INSERT [AL_Employment] ([EmploymentId],[EmploymentName]) VALUES ( 2,'dsaf')

SET IDENTITY_INSERT [AL_Employment] OFF

GO

