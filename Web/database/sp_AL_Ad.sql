/******************************************************************
* 表名：AL_Ad
* 时间：2008-4-20 22:48:37
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_Exists
@AdId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Ad WHERE AdId=@AdId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_ADD
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
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_Update
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_Delete
@AdId uniqueidentifier
 AS 
	DELETE AL_Ad
	 WHERE AdId=@AdId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_DeleteWhere]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_DeleteWhere]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_DeleteWhere
@StrWhere nvarchar(300)
 AS 
declare @sql nvarchar(500)
	set @sql='DELETE AL_Ad
	 WHERE ' +@StrWhere
exec(@sql)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-4-21 21:10:54
------------------------------------
CREATE PROCEDURE UP_AL_Ad_GetModel
@AdId uniqueidentifier
 AS 
	SELECT 
	AdId,AdGroupId,IsText,Title,Content,Url,UrlText,SizeId,AuditState,Img
	 FROM AL_Ad
	 WHERE AdId=@AdId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE UP_AL_Ad_GetList
 AS 
	SELECT 
	AdId,AdGroupId,IsText,Title,Content,Url,UrlText,AuditState,Img
	 FROM AL_Ad

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Ad_GetListWhere]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Ad_GetListWhere]
GO
------------------------------------
--用途：查询满足指定条件的数据 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE UP_AL_Ad_GetListWhere
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT AdId,AdGroupId,IsText,Title,Content,Url,UrlText,SizeId,AuditState,Img FROM AL_Ad WHERE AdGroupId='''+@strWhere +''''
exec(@sql)
GO