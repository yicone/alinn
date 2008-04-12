/******************************************************************
* 表名：AL_Employment
* 时间：2008/4/13 0:05:15
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_Exists
@EmploymentId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Employment WHERE EmploymentId=@EmploymentId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_ADD
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_Update
@EmploymentId int,
@EmploymentName nvarchar(40)
 AS 
	UPDATE AL_Employment SET 
	[EmploymentName] = @EmploymentName
	WHERE EmploymentId=@EmploymentId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_Delete
@EmploymentId int
 AS 
	DELETE AL_Employment
	 WHERE EmploymentId=@EmploymentId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_GetModel
@EmploymentId int
 AS 
	SELECT 
	EmploymentId,EmploymentName
	 FROM AL_Employment
	 WHERE EmploymentId=@EmploymentId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Employment_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Employment_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/13 0:05:15
------------------------------------
CREATE PROCEDURE UP_AL_Employment_GetList
 AS 
	SELECT 
	EmploymentId,EmploymentName
	 FROM AL_Employment

GO

