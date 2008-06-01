--使用Microsoft SQL Server Management Studio Express	9.00.3042.00 "Generic Scripts..."创建
--上次导出时间：2008-5-23 12:48
--上述内容请勿覆盖，导出新版本时注意修改导出时间！	yicone


USE [Alinn]
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_Ad_GetModelByWhere]    Script Date: 05/23/2008 12:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询满足指定条件的对象信息
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[MY_AL_Ad_GetModelByWhere]
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT Top 1 AdId,AdGroupId,IsText,Title,Content,Url,UrlText,SizeId,AuditState,Img FROM AL_Ad WHERE  '+@strWhere
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[UP_GetEmploymentListByEmploymentIds]    Script Date: 05/23/2008 12:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: <Create Date,,>
-- Description:	通过职业类型的编号序列职业信息
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetEmploymentListByEmploymentIds] 
	@EmploymentIds nvarchar(100)
AS
BEGIN
	exec('select * from AL_employment where employmentid in (' + @EmploymentIds + ')')
END
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_Exists]    Script Date: 05/23/2008 12:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_Exists]
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_SiteClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_ADD]    Script Date: 05/23/2008 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_ADD]
@ClassId int output,
@ClassName nvarchar(40)

 AS 
	INSERT INTO AL_SiteClass(
	[ClassName]
	)VALUES(
	@ClassName
	)
	SET @ClassId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_Exists]    Script Date: 05/23/2008 12:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_User_Exists]
@UserID uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_User WHERE UserID=@UserID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_Update]    Script Date: 05/23/2008 12:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_Update]
@ClassId int,
@ClassName nvarchar(40)
 AS 
	UPDATE AL_SiteClass SET 
	[ClassName] = @ClassName
	WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_ADD]    Script Date: 05/23/2008 12:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_User_ADD]
@UserID uniqueidentifier output,	--yicone
@RoleID int,
@Email nvarchar(100),
@NickName nvarchar(100),
@UserPassword nvarchar(100),
@CompanyName nvarchar(400),
@CompanyAddress nvarchar(1000),
@LinkMan nvarchar(16),
@Telephone nvarchar(100),
@Mobile nvarchar(100),
@QQ nvarchar(100),
@Msn nvarchar(100),
@Introducer varchar(16),
@LastLoginTime datetime,
@LastLoginIP nvarchar(30),
@LoginTimes int,
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime

 AS 
	SET @UserId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)	-------------------------yicone！
	
	INSERT INTO AL_User(
	[RoleID],[Email],[NickName],[UserPassword],[CompanyName],[CompanyAddress],[LinkMan],[Telephone],[Mobile],[QQ],[Msn],[Introducer],[LastLoginTime],[LastLoginIP],[LoginTimes],[IsLocked],[ActiveCode],[RegTime]
	)VALUES(
	@RoleID,@Email,@NickName,@UserPassword,@CompanyName,@CompanyAddress,@LinkMan,@Telephone,@Mobile,@QQ,@Msn,@Introducer,@LastLoginTime,@LastLoginIP,@LoginTimes,@IsLocked,@ActiveCode,@RegTime
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_Delete]    Script Date: 05/23/2008 12:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_Delete]
@ClassId int
 AS 
	DELETE AL_SiteClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_GetModel]    Script Date: 05/23/2008 12:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_GetModel]
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_SiteClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_Delete]    Script Date: 05/23/2008 12:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_User_Delete]
@UserID uniqueidentifier
 AS 
	DELETE AL_User
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_SiteClass_GetList]    Script Date: 05/23/2008 12:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_SiteClass_GetList]
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_SiteClass
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_GetModel]    Script Date: 05/23/2008 12:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_User_GetModel]
@UserID uniqueidentifier
 AS 
	SELECT 
	UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime
	 FROM AL_User
	 WHERE UserID=@UserID
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_GetList]    Script Date: 05/23/2008 12:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_User_GetList]
 AS 
	SELECT 
	UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime
	 FROM AL_User
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_AdGroupPage]    Script Date: 05/23/2008 12:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
create procedure [dbo].[MY_AL_AdGroupPage]
(@startIndex int,
@endIndex int,
@doCount tinyint,
@userId varchar (300))
as
if(@docount=1)
select count(*) from AL_AdGroup where cast (userid as varchar(300))= @userId
else
begin
 with temptbl as (
SELECT ROW_NUMBER() OVER (ORDER BY AdGroupId desc)AS Row, AdGroupId,GroupName,KeyWords,Class from AL_AdGroup where cast (userid as varchar(300))= @userId)

SELECT * FROM temptbl where Row between @startIndex and @endIndex
end
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_Exists]    Script Date: 05/23/2008 12:40:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_Exists]
@EmploymentId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Employment WHERE EmploymentId=@EmploymentId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_ADD]    Script Date: 05/23/2008 12:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_ADD]
@EmploymentId int output,
@EmploymentName nvarchar(40)

 AS 
	INSERT INTO AL_Employment(
	[EmploymentName]
	)VALUES(
	@EmploymentName
	)
	SET @EmploymentId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_Update]    Script Date: 05/23/2008 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_Update]
@EmploymentId int,
@EmploymentName nvarchar(40)
 AS 
	UPDATE AL_Employment SET 
	[EmploymentName] = @EmploymentName
	WHERE EmploymentId=@EmploymentId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_Delete]    Script Date: 05/23/2008 12:40:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_Delete]
@EmploymentId int
 AS 
	DELETE AL_Employment
	 WHERE EmploymentId=@EmploymentId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_GetModel]    Script Date: 05/23/2008 12:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_GetModel]
@EmploymentId int
 AS 
	SELECT 
	EmploymentId,EmploymentName
	 FROM AL_Employment
	 WHERE EmploymentId=@EmploymentId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_User_Update]    Script Date: 05/23/2008 12:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UP_AL_User_Update]

@RoleID int,
@Email nvarchar(50),
@NickName nvarchar(50),
@UserPassword nvarchar(50),
@CompanyName nvarchar(200),
@CompanyAddress nvarchar(500),
@LinkMan nvarchar(8),
@Telephone nvarchar(50),
@Mobile nvarchar(50),
@QQ nvarchar(50),
@Msn nvarchar(50),
@Introducer varchar(16),
@LastLoginTime datetime,
@LastLoginIP nvarchar(15),
@LoginTimes int,
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime ,
@School varchar(50) ,
@Proxy varchar(50)
 AS 
	UPDATE AL_User SET 
	[RoleID] = @RoleID,[Email] = @Email,[NickName] = @NickName,[UserPassword] = @UserPassword,[CompanyName] = @CompanyName,[CompanyAddress] = @CompanyAddress,[LinkMan] = @LinkMan,[Telephone] = @Telephone,[Mobile] = @Mobile,[QQ] = @QQ,[Msn] = @Msn,[Introducer] = @Introducer,[LastLoginTime] = @LastLoginTime,[LastLoginIP] = @LastLoginIP,[LoginTimes] = @LoginTimes,[IsLocked] = @IsLocked,[ActiveCode] = @ActiveCode,[RegTime] = @RegTime,[School]=@School,[Proxy]=@Proxy
	WHERE email=@email
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Employment_GetList]    Script Date: 05/23/2008 12:40:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Employment_GetList]
 AS 
	SELECT 
	EmploymentId,EmploymentName
	 FROM AL_Employment
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_Exists]    Script Date: 05/23/2008 12:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_Exists]
@SiteId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Site WHERE SiteId=@SiteId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_Delete]    Script Date: 05/23/2008 12:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_Delete]
@SiteId uniqueidentifier
 AS 
	DELETE AL_Site
	 WHERE SiteId=@SiteId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_GetList]    Script Date: 05/23/2008 12:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_GetList]
 AS 
	SELECT 
	SiteId,UserId,SiteName,SiteUrl,SiteClass,SexType,AgeType,Employments,Taste,Description,AuditState
	 FROM AL_Site
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_Exists]    Script Date: 05/23/2008 12:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_Exists]
@AdId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Ads WHERE AdId=@AdId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_ADD]    Script Date: 05/23/2008 12:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_ADD]
@AdId uniqueidentifier,
@UserId uniqueidentifier,
@SiteId uniqueidentifier,
@IsWord tinyint,
@IsImg tinyint,
@Position tinyint,
@Size int,
@Type tinyint,
@Classes nvarchar(14),
@KeyWords nvarchar(272),
@TitleColor varchar(6),
@ContentColor nvarchar(600),
@UrlColor varchar(6),
@BorderColor varchar(6),
@BgColor varchar(6),
@Grounding varchar(6),
@BgImg nvarchar(100),
@Corner nvarchar(100),
@IsLocked tinyint,
@NeedCheck tinyint,
@Description ntext

 AS 
	INSERT INTO AL_Ads(
	[AdId],[UserId],[SiteId],[IsWord],[IsImg],[Position],[Size],[Type],[Classes],[KeyWords],[TitleColor],[ContentColor],[UrlColor],[BorderColor],[BgColor],[Grounding],[BgImg],[Corner],[IsLocked],[NeedCheck],[Description]
	)VALUES(
	@AdId,@UserId,@SiteId,@IsWord,@IsImg,@Position,@Size,@Type,@Classes,@KeyWords,@TitleColor,@ContentColor,@UrlColor,@BorderColor,@BgColor,@Grounding,@BgImg,@Corner,@IsLocked,@NeedCheck,@Description
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_Update]    Script Date: 05/23/2008 12:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_Update]
@AdId uniqueidentifier,
@UserId uniqueidentifier,
@SiteId uniqueidentifier,
@IsWord tinyint,
@IsImg tinyint,
@Position tinyint,
@Size int,
@Type tinyint,
@Classes nvarchar(14),
@KeyWords nvarchar(272),
@TitleColor varchar(6),
@ContentColor nvarchar(600),
@UrlColor varchar(6),
@BorderColor varchar(6),
@BgColor varchar(6),
@Grounding varchar(6),
@BgImg nvarchar(100),
@Corner nvarchar(100),
@IsLocked tinyint,
@NeedCheck tinyint,
@Description ntext
 AS 
	UPDATE AL_Ads SET 
	[UserId] = @UserId,[SiteId] = @SiteId,[IsWord] = @IsWord,[IsImg] = @IsImg,[Position] = @Position,[Size] = @Size,[Type] = @Type,[Classes] = @Classes,[KeyWords] = @KeyWords,[TitleColor] = @TitleColor,[ContentColor] = @ContentColor,[UrlColor] = @UrlColor,[BorderColor] = @BorderColor,[BgColor] = @BgColor,[Grounding] = @Grounding,[BgImg] = @BgImg,[Corner] = @Corner,[IsLocked] = @IsLocked,[NeedCheck] = @NeedCheck,[Description] = @Description
	WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_Delete]    Script Date: 05/23/2008 12:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_Delete]
@AdId uniqueidentifier
 AS 
	DELETE AL_Ads
	 WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_GetModel]    Script Date: 05/23/2008 12:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_GetModel]
@AdId uniqueidentifier
 AS 
	SELECT 
	AdId,UserId,SiteId,IsWord,IsImg,Position,Size,Type,Classes,KeyWords,TitleColor,ContentColor,UrlColor,BorderColor,BgColor,Grounding,BgImg,Corner,IsLocked,NeedCheck,Description
	 FROM AL_Ads
	 WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ads_GetList]    Script Date: 05/23/2008 12:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/15 16:38:21
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ads_GetList]
 AS 
	SELECT 
	AdId,UserId,SiteId,IsWord,IsImg,Position,Size,Type,Classes,KeyWords,TitleColor,ContentColor,UrlColor,BorderColor,BgColor,Grounding,BgImg,Corner,IsLocked,NeedCheck,Description
	 FROM AL_Ads
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_DeleteWhere]    Script Date: 05/23/2008 12:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_DeleteWhere]
@StrWhere nvarchar(300)
 AS 
declare @sql nvarchar(500)
	set @sql='DELETE AL_Ad
	 WHERE ' +@StrWhere
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[UP_ZoneClass_GetZoneClassesByParentId]    Script Date: 05/23/2008 12:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到制定父ID的广告位分类 
--项目名称：Alinn
--说明：
--时间：2008/4/16 17:52:11
------------------------------------
CREATE PROCEDURE [dbo].[UP_ZoneClass_GetZoneClassesByParentId]
@ParentId int
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
	 WHERE ParentId=@ParentId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_GetZoneClassesByParentId]    Script Date: 05/23/2008 12:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到制定父ID的广告位分类 
--项目名称：Alinn
--说明：
--时间：2008/4/16 17:52:11
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_GetZoneClassesByParentId]
@ParentId int
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
	 WHERE ParentId=@ParentId
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_ZonePage]    Script Date: 05/23/2008 12:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MY_AL_ZonePage] 
(@startIndex int,
@endIndex int,
@docount bit,
@strWhere  NVarChar(500))
as
declare @sql varchar(2000)
if(@docount=1)
set @sql='
select count(AL_Zone.ZoneId) from AL_Zone left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId
left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId 
left join AL_User on AL_User.UserId=AL_Zone.UserId 
left join AL_ZoneSize on AL_ZoneSize.SizeId=AL_Zone.SizeId '+@strwhere
else
set @sql='
begin
 with temptbl as (
SELECT ROW_NUMBER() OVER (Order by AL_Zone.ZoneId) AS Row,AL_Zone.ZoneId,AL_Zone.ZoneName,AL_Zone.SiteId,AL_Zone.UserId
,AL_Zone.MediaType,AL_Zone.InFirst,AL_Zone.SizeId,AL_Zone.TransType,AL_Zone.ClassIds,AL_Zone.Keywords
,AL_Zone.NeedAuditing,AL_Zone.AllowAdultAd,AL_Zone.Description,AL_Zone.RecommendWeekPrice,AL_Zone.WeekPrice,AL_Site.SiteName,AL_ZonePic.ZonePic
,AL_User.QQ
,AL_ZoneSize.SizeCode
,cast(((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum) as money) as PricePerK,AL_Site.VistersNum
from AL_Zone  
left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId 
left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId 
left join AL_User on AL_User.UserId=AL_Zone.UserId 
left join AL_ZoneSize on AL_ZoneSize.SizeId=AL_Zone.SizeId
 '+@strwhere+')
 SELECT * FROM temptbl where Row between '+cast(@startIndex as varchar(10))+' and '+cast(@endIndex as varchar(10))+
' end'
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_GetListWhere]    Script Date: 05/23/2008 12:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询满足指定条件的数据 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_GetListWhere]
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT AL_Ad.AdId,AL_Ad.AdGroupId,AL_Ad.IsText,AL_Ad.Title,AL_Ad.Content,AL_Ad.Url,AL_Ad.UrlText,AL_Ad.AuditState,AL_Ad.Img,AL_ZoneSize.SizeCode FROM AL_Ad Left join AL_ZoneSize on AL_ZoneSize.SizeId=AL_Ad.SizeId WHERE AL_Ad.AdGroupId='''+@strWhere +''''
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_GetListWhere]    Script Date: 05/23/2008 12:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：Powered By FZF
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_GetListWhere]
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT AdGroupId,GroupName,UserId,Class,KeyWords FROM AL_AdGroup WHERE '+@strWhere
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[UP_GetZoneClassListByClassIds]    Script Date: 05/23/2008 12:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: <Create Date,,>
-- Description:	通过广告位分类的编号序列查询分类信息
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetZoneClassListByClassIds] 
	@ClassIds nvarchar(14)
AS
BEGIN
	exec('select * from AL_ZoneClass where classid in (' + @ClassIds + ')')
END
GO
/****** Object:  StoredProcedure [dbo].[UP_GetZoneInfoExtForZoneView]    Script Date: 05/23/2008 12:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	获取ZoneView页面需要的信息
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetZoneInfoExtForZoneView]
	-- Add the parameters for the stored procedure here
	@ZoneId uniqueidentifier
AS
BEGIN
select zoneid, 
al_zone.siteid as siteid, 
zonename, mediatype, 
infirst as infirstpage, 
transtype, [sizecode], keywords, 
[classids] as zoneclassids, 
al_zone.description as zonedesp,
sitename,
siteurl,
[classname] as siteclass,
sextypetext as sextype,
agetypetext as agetype,
employments as employmentids,
taste,
al_site.description as sitedesp
from al_zone 
join al_site on al_zone.siteid = al_site.siteid
join al_zonesize on al_zone.sizeid = al_zonesize.sizeid
join al_siteclass on al_site.siteclass = al_siteclass.classid
left join al_sextype on al_site.sextype = al_sextype.sextypeid
left join al_agetype on al_site.agetype = al_agetype.agetypeid
where zoneid = @ZoneId

END
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_Ad_ExistsBySizeAndGroupId]    Script Date: 05/23/2008 12:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：同一广告组下是否已经存在相同大小的广告
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[MY_AL_Ad_ExistsBySizeAndGroupId]
@sizeId int,
@adGroupId uniqueidentifier
AS

	SELECT top 1 AdId FROM AL_Ad WHERE AdGroupId=@adGroupId And SizeId=@sizeId And IsText=0
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_Delete]    Script Date: 05/23/2008 12:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_Delete]
@AdId uniqueidentifier
 AS 
	DELETE AL_Ad
	 WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_ADD]    Script Date: 05/23/2008 12:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_ADD]
@AdId uniqueidentifier,
@AdGroupId uniqueidentifier,
@IsText tinyint,
@Title nvarchar(80),
@Content nvarchar(240),
@Url nvarchar(2048),
@UrlText nvarchar(512),
@SizeId int,
@Img nvarchar(100)

 AS 
	SET @AdId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)
	INSERT INTO AL_Ad(
	[AdId],[AdGroupId],[IsText],[Title],[Content],[Url],[UrlText],[SizeId],[Img]
	)VALUES(
	@AdId,@AdGroupId,@IsText,@Title,@Content,@Url,@UrlText,@SizeId,@Img
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_Update]    Script Date: 05/23/2008 12:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_Update]
@AdId uniqueidentifier,
@Title nvarchar(80),
@Content nvarchar(240),
@Url nvarchar(2048),
@UrlText nvarchar(512),
@SizeId int,
@AuditState tinyint,
@Img nvarchar(100)
 AS 
	if @Img=null
	UPDATE AL_Ad SET 
	[Title] = @Title,[Content] = @Content,[Url] = @Url,[UrlText] = @UrlText,[SizeId]=@SizeId,AuditState=@AuditState
	WHERE AdId=@AdId 
	else
	UPDATE AL_Ad SET 
[Title] = @Title,[Content] = @Content,[Url] = @Url,[UrlText] = @UrlText,[SizeId]=@SizeId,AuditState=@AuditState,[Img] = @Img
	WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_Exists]    Script Date: 05/23/2008 12:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_Exists]
@AdId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Ad WHERE AdId=@AdId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_ShowOrderByUserId]    Script Date: 05/23/2008 12:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MY_AL_ShowOrderByUserId]
@UserId uniqueidentifier
as 
select top 1 AL_Order.OrderId,AL_Order.OrderName,AL_Order.UserId,AL_Order.AdId,AL_Order.ZoneId,AL_Order.StartDate,AL_Order.EndDate,AL_Order.AuditState,AL_Order.PerPoint,AL_Order.EverydayPrice,AL_Order.Price
,AL_Order.Payment,AL_Order.CreateDate,AL_Ad.Title
 from AL_Order left join AL_Ad on AL_Ad.AdId=AL_Order.AdId where AL_Order.UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_GetModel]    Script Date: 05/23/2008 12:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 21:10:54
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_GetModel]
@AdId uniqueidentifier
 AS 
	SELECT 
	AdId,AdGroupId,IsText,Title,Content,Url,UrlText,SizeId,AuditState,Img
	 FROM AL_Ad
	 WHERE AdId=@AdId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Ad_GetList]    Script Date: 05/23/2008 12:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Ad_GetList]
 AS 
	SELECT 
	AdId,AdGroupId,IsText,Title,Content,Url,UrlText,AuditState,Img
	 FROM AL_Ad
GO
/****** Object:  StoredProcedure [dbo].[UP_GetActiveOrder]    Script Date: 05/23/2008 12:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 20080425
-- Description:	获取活跃的订单
-- =============================================

CREATE PROCEDURE [dbo].[UP_GetActiveOrder]
	@ZoneId uniqueidentifier
AS
BEGIN
	select * from al_order where auditstate = 1 and zoneid = @zoneid
END
GO
/****** Object:  StoredProcedure [dbo].[MY_AL_Order_GetNO]    Script Date: 05/23/2008 12:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MY_AL_Order_GetNO]

as

begin

    declare @s nvarchar(28)

    set @s=(select right(1000+count(CreateDate)+1,8) from AL_Order)
	print @s
    return @s


end
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_Exists]    Script Date: 05/23/2008 12:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_Exists]
@OrderId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Order WHERE OrderId=@OrderId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_ADD]    Script Date: 05/23/2008 12:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:08:35
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_ADD]
@OrderId uniqueidentifier,
@OrderName nvarchar(2),
@UserId uniqueidentifier,
@AdId uniqueidentifier,
@ZoneId uniqueidentifier,
@StartDate datetime,
@EndDate datetime,
@AuditState tinyint,
@PerPoint decimal(18,0),
@EverydayPrice decimal(18,0),
@Price decimal(18,0)

 AS 
	SET @OrderId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)
	INSERT INTO AL_Order(
	[OrderId],[OrderName],[UserId],[AdId],[ZoneId],[StartDate],[EndDate],[AuditState],[PerPoint],[EverydayPrice],[Price]
	)VALUES(
	@OrderId,@OrderName,@UserId,@AdId,@ZoneId,@StartDate,@EndDate,@AuditState,@PerPoint,@EverydayPrice,@Price
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_Update]    Script Date: 05/23/2008 12:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_Update]
@OrderId uniqueidentifier,
@OrderName nvarchar(2),
@UserId uniqueidentifier,
@AdId uniqueidentifier,
@ZoneId uniqueidentifier,
@StartDate datetime,
@EndDate datetime,
@AuditState tinyint,
@PerPoint decimal(18,0),
@EverydayPrice decimal(18,0),
@Price decimal(18,0),
@Payment tinyint,
@CreateDate datetime
 AS 
	UPDATE AL_Order SET 
	[OrderName] = @OrderName,[UserId] = @UserId,[AdId] = @AdId,[ZoneId] = @ZoneId,[StartDate] = @StartDate,[EndDate] = @EndDate,[AuditState] = @AuditState,[PerPoint] = @PerPoint,[EverydayPrice] = @EverydayPrice,[Price] = @Price,[Payment] = @Payment,[CreateDate] = @CreateDate
	WHERE OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_Delete]    Script Date: 05/23/2008 12:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_Delete]
@OrderId uniqueidentifier
 AS 
	DELETE AL_Order
	 WHERE OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_GetModel]    Script Date: 05/23/2008 12:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_GetModel]
@OrderId uniqueidentifier
 AS 
	SELECT 
	OrderId,OrderName,UserId,AdId,ZoneId,StartDate,EndDate,AuditState,PerPoint,EverydayPrice,Price,Payment,CreateDate
	 FROM AL_Order
	 WHERE OrderId=@OrderId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Order_GetList]    Script Date: 05/23/2008 12:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Order_GetList]
 AS 
	SELECT 
	OrderId,OrderName,UserId,AdId,ZoneId,StartDate,EndDate,AuditState,PerPoint,EverydayPrice,Price,Payment,CreateDate
	 FROM AL_Order
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_ADD]    Script Date: 05/23/2008 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_ADD]
@ClassId int output,
@ClassName nvarchar(40)

 AS 
	INSERT INTO AL_NewsClass(
	[ClassName]
	)VALUES(
	@ClassName
	)
	SET @ClassId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_Update]    Script Date: 05/23/2008 12:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_Update]
@ClassId int,
@ClassName nvarchar(40)
 AS 
	UPDATE AL_NewsClass SET 
	[ClassName] = @ClassName
	WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_Delete]    Script Date: 05/23/2008 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_Delete]
@ClassId int
 AS 
	DELETE AL_NewsClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_GetModel]    Script Date: 05/23/2008 12:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_GetModel]
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_NewsClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_GetList]    Script Date: 05/23/2008 12:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_GetList]
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_NewsClass
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_NewsClass_Exists]    Script Date: 05/23/2008 12:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_NewsClass_Exists]
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_NewsClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_ADD]    Script Date: 05/23/2008 12:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_ADD]
@ZoneId uniqueidentifier output,		--yicone
@UserId uniqueidentifier,
@ZoneName nvarchar(100),
@SiteId uniqueidentifier,
@MediaType tinyint,
@InFirst tinyint,
@SizeId int,
@TransType tinyint,
@ClassIds nvarchar(14),
@Keywords nvarchar(272),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint,
@ZoneStyle nvarchar(100)

 AS 
	SET @ZoneId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)	-------------------------yicone！
 
	INSERT INTO AL_Zone(
	[ZoneId],[UserId],[ZoneName],[SiteId],[MediaType],[InFirst],[SizeId],[TransType],[ClassIds],[Keywords],[NeedAuditing],[AllowAdultAd],[Description],[ZoneCode],[WeekPrice],[RecommendWeekPrice],[ZoneState], [ZoneStyle]
	)VALUES(
	@ZoneId,@UserId,@ZoneName,@SiteId,@MediaType,@InFirst,@SizeId,@TransType,@ClassIds,@Keywords,@NeedAuditing,@AllowAdultAd,@Description,@ZoneCode,@WeekPrice,@RecommendWeekPrice,@ZoneState, @ZoneStyle
	)
	---Powered by fzf 2008.05.12 01:52
	Insert INTO AL_ZonePic(ZoneId,ZonePic)
	values(@ZoneId,'images/nopic.jpg')
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_ADD]    Script Date: 05/23/2008 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_ADD]
@NewsId int output,
@ClassId int,
@Title nvarchar(400),
@Content ntext,
@CreateDate datetime

 AS 
	INSERT INTO AL_News(
	[ClassId],[Title],[Content]
	)VALUES(
	@ClassId,@Title,@Content
	)
	SET @NewsId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_Exists]    Script Date: 05/23/2008 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_Exists]
@NewsId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_News WHERE NewsId=@NewsId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_Delete]    Script Date: 05/23/2008 12:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_Delete]
@NewsId int
 AS 
	DELETE AL_News
	 WHERE NewsId=@NewsId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_Update]    Script Date: 05/23/2008 12:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_Update]
@NewsId int,
@ClassId int,
@Title nvarchar(400),
@Content ntext,
@CreateDate datetime
 AS 
	UPDATE AL_News SET 
	[ClassId] = @ClassId,[Title] = @Title,[Content] = @Content,[CreateDate] = @CreateDate
	WHERE NewsId=@NewsId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_GetModel]    Script Date: 05/23/2008 12:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_GetModel]
@NewsId int
 AS 
	SELECT 
	NewsId,ClassId,Title,Content,CreateDate
	 FROM AL_News
	 WHERE NewsId=@NewsId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_News_GetList]    Script Date: 05/23/2008 12:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_News_GetList]
 AS 
	SELECT 
	NewsId,ClassId,Title,Content,CreateDate
	 FROM AL_News
GO
/****** Object:  StoredProcedure [dbo].[UP_GetIntroducerInfoExtForMyRecommendation]    Script Date: 05/23/2008 12:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: <Create Date,,>
-- Description:	列示我推荐的用户的信息，并统计其提交的网站个数
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetIntroducerInfoExtForMyRecommendation] 
	@UserId uniqueidentifier 
AS
BEGIN
	SET NOCOUNT ON;

    if object_id('tempdb..#temp') is not null
	drop table #temp

create table #temp(UserId uniqueidentifier, NickName nvarchar(50), SiteCount int, RegTime datetime)

declare @IntroducerId uniqueidentifier
declare @SiteCount int

declare  IntroducerId_cursor cursor for (select userid from al_user where Introducer = @userid)
open IntroducerId_cursor
fetch next from IntroducerId_cursor into @IntroducerId
while @@fetch_status<>-1
	begin
		set @SiteCount = (select count(siteid) from al_site where userid = @IntroducerId)
		insert into #temp select UserId, NickName, @SiteCount, RegTime from al_user where userid = @IntroducerId
		
		fetch next from IntroducerId_cursor into @IntroducerId
	end
close IntroducerId_cursor
deallocate IntroducerId_cursor

select * from #temp
END
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_GetModel]    Script Date: 05/23/2008 12:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_GetModel]
@ZoneId uniqueidentifier
 AS 
	SELECT 
	AL_Zone.ZoneId,AL_Zone.UserId,AL_Zone.ZoneName,AL_Zone.SiteId,AL_Zone.MediaType,AL_Zone.InFirst,AL_Zone.SizeId,AL_Zone.TransType,AL_Zone.ClassIds,AL_Zone.Keywords,AL_Zone.NeedAuditing,AL_Zone.AllowAdultAd,AL_Zone.Description,AL_Zone.ZoneCode,AL_Zone.WeekPrice,AL_Zone.RecommendWeekPrice,AL_Zone.ZoneState,AL_Zone.ZoneStyle
	
	 FROM AL_Zone
	 WHERE ZoneId=@ZoneId
GO
/****** Object:  StoredProcedure [dbo].[UP_GetZoneInfoExtForSiteManager]    Script Date: 05/23/2008 12:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	列式指定站点下的广告位信息

-- =============================================
CREATE PROCEDURE [dbo].[UP_GetZoneInfoExtForSiteManager]
	@SiteId uniqueidentifier
AS
BEGIN
select zoneid, zonename, SizeCode, weekprice, transtype, infirst, needauditing, 
SiteName,
al_zone.sizeid as SizeId,
al_zone.description as zonedesp,
classids,
keywords,
allowadultad,
recommendweekprice,
al_zone.siteid as siteid, 
siteurl, mediatype, zonestate 
from al_zone
join al_site 
on al_zone.siteid = al_site.siteid 
join al_zonesize on al_zone.sizeid = al_zonesize.sizeid
where al_zone.siteid = @SiteId
END
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_Exists]    Script Date: 05/23/2008 12:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_Exists]
@ZoneId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Zone WHERE ZoneId=@ZoneId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_Update]    Script Date: 05/23/2008 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_Update]
@ZoneId uniqueidentifier,
@UserId uniqueidentifier,
@ZoneName nvarchar(100),
@SiteId uniqueidentifier,
@MediaType tinyint,
@InFirst tinyint,
@SizeId int,
@TransType tinyint,
@ClassIds nvarchar(14),
@Keywords nvarchar(272),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint,
@ZoneStyle nvarchar(100)
 AS 
	UPDATE AL_Zone SET 
	[UserId] = @UserId,[ZoneName] = @ZoneName,[SiteId] = @SiteId,[MediaType] = @MediaType,[InFirst] = @InFirst,[SizeId] = @SizeId,[TransType] = @TransType,[ClassIds] = @ClassIds,[Keywords] = @Keywords,[NeedAuditing] = @NeedAuditing,[AllowAdultAd] = @AllowAdultAd,[Description] = @Description,[ZoneCode] = @ZoneCode,[WeekPrice] = @WeekPrice,[RecommendWeekPrice] = @RecommendWeekPrice,[ZoneState] = @ZoneState, [ZoneStyle] = @ZoneStyle
	WHERE ZoneId=@ZoneId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_Delete]    Script Date: 05/23/2008 12:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_Delete]
@ZoneId uniqueidentifier
 AS 
	DELETE AL_Zone
	 WHERE ZoneId=@ZoneId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Zone_GetList]    Script Date: 05/23/2008 12:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Zone_GetList]
 AS 
	SELECT 
	ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState,ZoneStyle
	 FROM AL_Zone
GO
/****** Object:  StoredProcedure [dbo].[UP_GetSiteInfoExtForSiteManager]    Script Date: 05/23/2008 12:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	列示网站，并统计网站下属的广告位
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetSiteInfoExtForSiteManager] 
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if object_id('tempdb..#temp') is not null
		drop table #temp

	create table #temp(siteid uniqueidentifier, sitename nvarchar(32), auditstate tinyint, zonecount int)

	declare @SiteId uniqueidentifier
	declare @ZoneCount int
	declare  siteid_cursor cursor for (select siteid from al_site where userid = @userid)
	open siteid_cursor
	fetch next from siteid_cursor into @SiteId
	while @@fetch_status<>-1
	begin
		set @ZoneCount = (select count(zoneid) from al_zone where userid = @userid and siteid = @siteid)
		insert into #temp select siteid, sitename, auditstate, @ZoneCount from al_site where siteid = @siteid
		
		fetch next from siteid_cursor into @SiteId
	end
	close siteid_cursor
	deallocate siteid_cursor

	select * from #temp
END
GO
/****** Object:  StoredProcedure [dbo].[UP_GetZoneStyle]    Script Date: 05/23/2008 12:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 20080425
-- Description:	获取广告位样式的相关字段
-- =============================================
CREATE PROCEDURE [dbo].[UP_GetZoneStyle]
	@ZoneId uniqueidentifier
AS
BEGIN
	select al_zone.sizeid as sizeid, sizecode, zonestyle from al_zone join al_zonesize on al_zone.sizeid = al_zonesize.sizeid
	where zoneid = @zoneid
END
GO
/****** Object:  StoredProcedure [dbo].[UP_GetZoneInfoExtForZone]    Script Date: 05/23/2008 12:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	获取ZONE.ASPX页面需要的广告位信息

-- =============================================
CREATE PROCEDURE [dbo].[UP_GetZoneInfoExtForZone]
	@ZoneId uniqueidentifier
AS
BEGIN
select zoneid, zonename, SizeCode, weekprice, transtype, infirst, needauditing, 
al_zone.sizeid as SizeId,
al_zone.description as zonedesp,
classids,
keywords,
allowadultad,
recommendweekprice,
al_zone.siteid as siteid, 
siteurl, mediatype, zonestate 
from al_zone
join al_site 
on al_zone.siteid = al_site.siteid 
join al_zonesize on al_zone.sizeid = al_zonesize.sizeid
where al_zone.zoneid = @ZoneId
END
GO
/****** Object:  StoredProcedure [dbo].[UP_CountClickTime]    Script Date: 05/23/2008 12:40:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UP_CountClickTime](@ZoneId uniqueidentifier, @ClickTime int OUTPUT) 
AS 
BEGIN 
	/* SET NOCOUNT ON */ 
	DECLARE @Today varchar(10); 
	DECLARE @Id uniqueidentifier; 
	DECLARE @NewId uniqueidentifier; 
	DECLARE @OldClickTime int;
	SET @Today = CONVERT(VARCHAR(10), GETDATE(), 120);
	SET @NewId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER);

	SELECT @Id = ZoneStatId FROM AL_ZoneStat
	WHERE ZoneId = @ZoneId AND CONVERT(VARCHAR(10), [Date], 120) = @Today 

	IF @Id IS NOT NULL 
		BEGIN
			SET @OldClickTime = (SELECT   ClickTime FROM AL_ZoneStat WHERE   ZoneStatId = @Id);
			UPDATE  AL_ZoneStat SET ClickTime = ClickTime + 1 WHERE   ZoneStatId = @Id;
			SET @ClickTime = @OldClickTime + 1; 
		END 
	ELSE 
		BEGIN
			INSERT INTO AL_ZoneStat(ZoneStatId, [Date], ZoneId, ClickTime) VALUES (@NewId, @Today, @ZoneId, 1);
			SET @ClickTime = 1; 
		END 
END
GO
/****** Object:  StoredProcedure [dbo].[UP_CountPV]    Script Date: 05/23/2008 12:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UP_CountPV]
	(@ZoneId uniqueidentifier, @PV int OUTPUT)
AS
BEGIN 
	/* SET NOCOUNT ON */ 
	DECLARE @Today varchar(10); 
	DECLARE @Id uniqueidentifier; 
	DECLARE @NewId uniqueidentifier; 
	DECLARE @OldPV int;
	SET @Today = CONVERT(VARCHAR(10), GETDATE(), 120);
	SET @NewId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER);

	SELECT @Id = ZoneStatId FROM AL_ZoneStat
	WHERE ZoneId = @ZoneId AND CONVERT(VARCHAR(10), [Date], 120) = @Today 

	IF @Id IS NOT NULL 
		BEGIN
			SET @OldPV = (SELECT   PV FROM AL_ZoneStat WHERE   ZoneStatId = @Id);
			UPDATE  AL_ZoneStat SET PV = PV + 1 WHERE   ZoneStatId = @Id;
			SET @PV = @OldPV + 1; 
		END 
	ELSE 
		BEGIN
			INSERT INTO AL_ZoneStat(ZoneStatId, [Date], ZoneId, PV) VALUES (@NewId, @Today, @ZoneId, 1);
			SET @PV = 1; 
		END 
END
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_GetList]    Script Date: 05/23/2008 12:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_GetList]
 AS 
	SELECT 
	AdGroupId,GroupName,UserId,Class,KeyWords
	 FROM AL_AdGroup
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_Exists]    Script Date: 05/23/2008 12:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_Exists]
@AdGroupId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_AdGroup WHERE AdGroupId=@AdGroupId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_ADD]    Script Date: 05/23/2008 12:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_ADD]
@AdGroupId uniqueidentifier,
@GroupName nvarchar(80),
@UserId uniqueidentifier,
@Class nvarchar(14),
@KeyWords nvarchar(272)

 AS 
	SET @AdGroupId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)
	INSERT INTO AL_AdGroup(
	[AdGroupId],[GroupName],[UserId],[Class],[KeyWords]
	)VALUES(
	@AdGroupId,@GroupName,@UserId,@Class,@KeyWords
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_Update]    Script Date: 05/23/2008 12:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_Update]
@AdGroupId uniqueidentifier,
@GroupName nvarchar(80),
@UserId uniqueidentifier,
@Class nvarchar(14),
@KeyWords nvarchar(272)
 AS 
	UPDATE AL_AdGroup SET 
	[GroupName] = @GroupName,[UserId] = @UserId,[Class] = @Class,[KeyWords] = @KeyWords
	WHERE AdGroupId=@AdGroupId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_Delete]    Script Date: 05/23/2008 12:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_Delete]
@AdGroupId uniqueidentifier
 AS 
	DELETE AL_AdGroup
	 WHERE AdGroupId=@AdGroupId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_AdGroup_GetModel]    Script Date: 05/23/2008 12:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_AdGroup_GetModel]
@AdGroupId uniqueidentifier
 AS 
	SELECT 
	AdGroupId,GroupName,UserId,Class,KeyWords
	 FROM AL_AdGroup
	 WHERE AdGroupId=@AdGroupId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_GetModel]    Script Date: 05/23/2008 12:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_GetModel]
@SiteId uniqueidentifier
 AS 
	SELECT 
	SiteId,UserId,SiteName,SiteUrl,SiteClass,SexType,AgeType,Employments,Taste,Description,AuditState,RegDate
	 FROM AL_Site
	 WHERE SiteId=@SiteId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_ADD]    Script Date: 05/23/2008 12:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_ADD]
@SiteId uniqueidentifier output,
@UserId uniqueidentifier,
@SiteName nvarchar(64),
@SiteUrl nvarchar(256),
@SiteClass int,
@SexType tinyint,
@AgeType tinyint,
@Employments varchar(100),
@Taste nvarchar(120),
@Description ntext,
@AuditState tinyint

 AS 
	SET @SiteId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)
	DECLARE @RegDate datetime
	SET @RegDate = Getdate()
	
	INSERT INTO AL_Site(
	[SiteId],[UserId],[SiteName],[SiteUrl],[SiteClass],[SexType],[AgeType],[Employments],[Taste],[Description],[AuditState],[RegDate]
	)VALUES(
	@SiteId,@UserId,@SiteName,@SiteUrl,@SiteClass,@SexType,@AgeType,@Employments,@Taste,@Description, @AuditState,@RegDate
	)
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_Site_Update]    Script Date: 05/23/2008 12:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_Site_Update]
@SiteId uniqueidentifier,
@UserId uniqueidentifier,
@SiteName nvarchar(64),
@SiteUrl nvarchar(256),
@SiteClass int,
@SexType tinyint,
@AgeType tinyint,
@Employments varchar(100),
@Taste nvarchar(120),
@Description ntext,
@AuditState tinyint
 AS 
	UPDATE AL_Site SET 
	[UserId] = @UserId,[SiteName] = @SiteName,[SiteUrl] = @SiteUrl,[SiteClass] = @SiteClass,[SexType] = @SexType,[AgeType] = @AgeType,[Employments] = @Employments,[Taste] = @Taste,[Description] = @Description,[AuditState] = @AuditState
	WHERE SiteId=@SiteId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_Exists]    Script Date: 05/23/2008 12:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_Exists]
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_ZoneClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_ADD]    Script Date: 05/23/2008 12:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_ADD]
@ClassId int output,
@ClassName nvarchar(20),
@ParentId int

 AS 
	INSERT INTO AL_ZoneClass(
	[ClassName],[ParentId]
	)VALUES(
	@ClassName,@ParentId
	)
	SET @ClassId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_Update]    Script Date: 05/23/2008 12:40:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_Update]
@ClassId int,
@ClassName nvarchar(20),
@ParentId int
 AS 
	UPDATE AL_ZoneClass SET 
	[ClassName] = @ClassName,[ParentId] = @ParentId
	WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_Delete]    Script Date: 05/23/2008 12:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_Delete]
@ClassId int
 AS 
	DELETE AL_ZoneClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_GetModel]    Script Date: 05/23/2008 12:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_GetModel]
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
	 WHERE ClassId=@ClassId
GO
/****** Object:  StoredProcedure [dbo].[UP_AL_ZoneClass_GetList]    Script Date: 05/23/2008 12:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE [dbo].[UP_AL_ZoneClass_GetList]
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
GO
/******************************************************************
* 表名：AL_Store
* 时间：2008-5-30 19:52:58
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_Exists
@StoreId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Store WHERE StoreId=@StoreId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_ADD
@StoreId uniqueidentifier,
@ZoneId uniqueidentifier,
@UserId uniqueidentifier,
@Date datetime

 AS 
	INSERT INTO AL_Store(
	[StoreId],[ZoneId],[UserId],[Date]
	)VALUES(
	@StoreId,@ZoneId,@UserId,@Date
	)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_Update
@StoreId uniqueidentifier,
@ZoneId uniqueidentifier,
@UserId uniqueidentifier,
@Date datetime
 AS 
	UPDATE AL_Store SET 
	[ZoneId] = @ZoneId,[UserId] = @UserId,[Date] = @Date
	WHERE StoreId=@StoreId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_Delete
@StoreId uniqueidentifier
 AS 
	DELETE AL_Store
	 WHERE StoreId=@StoreId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_GetModel
@StoreId uniqueidentifier
 AS 
	SELECT 
	StoreId,ZoneId,UserId,Date
	 FROM AL_Store
	 WHERE StoreId=@StoreId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Store_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Store_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-30 19:52:58
------------------------------------
CREATE PROCEDURE UP_AL_Store_GetList
 AS 
	SELECT 
	StoreId,ZoneId,UserId,Date
	 FROM AL_Store

GO

