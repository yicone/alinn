/******************************************************************
* 表名：AL_ZoneSize
* 时间：2008/4/22 0:22:20
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_Exists
@SizeId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_ZoneSize WHERE SizeId=@SizeId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_ADD
@SizeId int output,
@SizeCode varchar(10),
@SizeType int

 AS 
	INSERT INTO AL_ZoneSize(
	[SizeId],[SizeCode],[SizeType]
	)VALUES(
	@SizeId,@SizeCode,@SizeType
	)
	SET @SizeId = @@IDENTITY

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_Update
@SizeId int,
@SizeCode varchar(10),
@SizeType int
 AS 
	UPDATE AL_ZoneSize SET 
	[SizeCode] = @SizeCode,[SizeType] = @SizeType
	WHERE SizeId=@SizeId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_Delete
@SizeId int
 AS 
	DELETE AL_ZoneSize
	 WHERE SizeId=@SizeId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_GetModel
@SizeId int
 AS 
	SELECT 
	SizeId,SizeCode,SizeType
	 FROM AL_ZoneSize
	 WHERE SizeId=@SizeId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_ZoneSize_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_ZoneSize_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/22 0:22:20
------------------------------------
CREATE PROCEDURE UP_AL_ZoneSize_GetList
 AS 
	SELECT 
	SizeId,SizeCode,SizeType
	 FROM AL_ZoneSize

GO

