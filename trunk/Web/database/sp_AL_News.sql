/******************************************************************
* 表名：AL_News
* 时间：2008-5-17 1:55:10
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_Exists
@NewsId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_News WHERE NewsId=@NewsId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_ADD
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_Update
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_Delete
@NewsId int
 AS 
	DELETE AL_News
	 WHERE NewsId=@NewsId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_GetModel
@NewsId int
 AS 
	SELECT 
	NewsId,ClassId,Title,Content,CreateDate
	 FROM AL_News
	 WHERE NewsId=@NewsId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_News_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_News_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-17 1:55:10
------------------------------------
CREATE PROCEDURE UP_AL_News_GetList
 AS 
	SELECT 
	NewsId,ClassId,Title,Content,CreateDate
	 FROM AL_News

GO

