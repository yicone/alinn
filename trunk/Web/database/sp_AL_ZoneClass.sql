/******************************************************************
* 表名：AL_ZoneClass
* 时间：2008-4-21 11:19:01
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_Exists
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_ZoneClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_ADD
@ClassId int output,
@ClassName nvarchar(20),
@ParentId int

 AS 
	INSERT INTO AL_ZoneClass(
	[ClassId],[ClassName],[ParentId]
	)VALUES(
	@ClassId,@ClassName,@ParentId
	)
	SET @ClassId = @@IDENTITY

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_Update
@ClassId int,
@ClassName nvarchar(20),
@ParentId int
 AS 
	UPDATE AL_ZoneClass SET 
	[ClassName] = @ClassName,[ParentId] = @ParentId
	WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_Delete
@ClassId int
 AS 
	DELETE AL_ZoneClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_GetModel
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneClass_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneClass_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 11:19:01
------------------------------------
CREATE PROCEDURE UP_AL_ZoneClass_GetList
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass

GO

