if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MY_AL_Ad_GetModelByWhere]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MY_AL_Ad_GetModelByWhere]
GO
------------------------------------
--用途：查询满足指定条件的对象信息
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
CREATE PROCEDURE MY_AL_Ad_GetModelByWhere
@strWhere nvarchar (300)
 AS 
DECLARE @sql nvarchar(1000)
set @sql='SELECT Top 1 AdId,AdGroupId,IsText,Title,Content,Url,UrlText,SizeId,AuditState,Img FROM AL_Ad WHERE  '+@strWhere
exec(@sql)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MY_AL_Ad_ExistsBySizeAndGroupId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MY_AL_Ad_ExistsBySizeAndGroupId]
GO
------------------------------------
--用途：同一广告组下是否已经存在相同大小的广告
--项目名称：Alinn
--说明：
--时间：2008-4-20 22:48:37
------------------------------------
CREATE PROCEDURE MY_AL_Ad_ExistsBySizeAndGroupId
@sizeId int,
@adGroupId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Ad WHERE AdGroupId=@adGroupId And SizeId=@sizeId And IsText=0
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO