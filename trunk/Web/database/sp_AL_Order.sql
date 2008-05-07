/******************************************************************
* ������AL_Order
* ʱ�䣺2008-4-24 15:29:37
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_Exists]
GO
------------------------------------
--��;���Ƿ��Ѿ����� 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE UP_AL_Order_Exists
@OrderId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Order WHERE OrderId=@OrderId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_ADD]
GO
------------------------------------
--��;������һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:08:35
------------------------------------
CREATE PROCEDURE UP_AL_Order_ADD
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_Update]
GO
------------------------------------
--��;���޸�һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE UP_AL_Order_Update
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

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_Delete]
GO
------------------------------------
--��;��ɾ��һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE UP_AL_Order_Delete
@OrderId uniqueidentifier
 AS 
	DELETE AL_Order
	 WHERE OrderId=@OrderId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_GetModel]
GO
------------------------------------
--��;���õ�ʵ��������ϸ��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE UP_AL_Order_GetModel
@OrderId uniqueidentifier
 AS 
	SELECT 
	OrderId,OrderName,UserId,AdId,ZoneId,StartDate,EndDate,AuditState,PerPoint,EverydayPrice,Price,Payment,CreateDate
	 FROM AL_Order
	 WHERE OrderId=@OrderId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Order_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Order_GetList]
GO
------------------------------------
--��;����ѯ��¼��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-4-24 15:29:37
------------------------------------
CREATE PROCEDURE UP_AL_Order_GetList
 AS 
	SELECT 
	OrderId,OrderName,UserId,AdId,ZoneId,StartDate,EndDate,AuditState,PerPoint,EverydayPrice,Price,Payment,CreateDate
	 FROM AL_Order

GO

