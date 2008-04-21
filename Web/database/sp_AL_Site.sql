/******************************************************************
* 表名：AL_Site
* 时间：2008/4/13 1:33:05
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_Exists
@SiteId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Site WHERE SiteId=@SiteId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_ADD
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
	SET @SiteId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)	-------------------------手动添加！
	
	INSERT INTO AL_Site(
	[SiteId],[UserId],[SiteName],[SiteUrl],[SiteClass],[SexType],[AgeType],[Employments],[Taste],[Description],[AuditState]
	)VALUES(
	@SiteId,@UserId,@SiteName,@SiteUrl,@SiteClass,@SexType,@AgeType,@Employments,@Taste,@Description, @AuditState
	)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_Update
@SiteId uniqueidentifier,
@UserId varchar(16),
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_Delete
@SiteId uniqueidentifier
 AS 
	DELETE AL_Site
	 WHERE SiteId=@SiteId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_GetModel
@SiteId uniqueidentifier
 AS 
	SELECT 
	SiteId,UserId,SiteName,SiteUrl,SiteClass,SexType,AgeType,Employments,Taste,Description,AuditState
	 FROM AL_Site
	 WHERE SiteId=@SiteId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Site_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Site_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 1:33:05
------------------------------------
CREATE PROCEDURE UP_AL_Site_GetList
 AS 
	SELECT 
	SiteId,UserId,SiteName,SiteUrl,SiteClass,SexType,AgeType,Employments,Taste,Description,AuditState
	 FROM AL_Site

GO

