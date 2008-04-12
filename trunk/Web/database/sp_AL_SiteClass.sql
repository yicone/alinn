/******************************************************************
* 表名：AL_SiteClass
* 时间：2008/4/13 0:04:37
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_Exists
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_SiteClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_ADD
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_Update
@ClassId int,
@ClassName nvarchar(40)
 AS 
	UPDATE AL_SiteClass SET 
	[ClassName] = @ClassName
	WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_Delete
@ClassId int
 AS 
	DELETE AL_SiteClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_GetModel
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_SiteClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_SiteClass_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_SiteClass_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:04:37
------------------------------------
CREATE PROCEDURE UP_AL_SiteClass_GetList
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_SiteClass

GO

