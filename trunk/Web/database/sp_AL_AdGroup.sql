/******************************************************************
* 表名：AL_AdGroup
* 时间：2008-4-18 11:02:49
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_Exists
@AdGroupId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_AdGroup WHERE AdGroupId=@AdGroupId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_ADD
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_Update
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_Delete
@AdGroupId uniqueidentifier
 AS 
	DELETE AL_AdGroup
	 WHERE AdGroupId=@AdGroupId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_GetModel
@AdGroupId uniqueidentifier
 AS 
	SELECT 
	AdGroupId,GroupName,UserId,Class,KeyWords
	 FROM AL_AdGroup
	 WHERE AdGroupId=@AdGroupId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_GetList
 AS 
	SELECT 
	AdGroupId,GroupName,UserId,Class,KeyWords
	 FROM AL_AdGroup

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_AdGroup_GetListWhere]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_AdGroup_GetListWhere]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：Powered By FZF
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_AdGroup_GetListWhere
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT AdGroupId,GroupName,UserId,Class,KeyWords FROM AL_AdGroup WHERE '+@strWhere
exec(@sql)

GO
