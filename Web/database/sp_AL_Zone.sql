/******************************************************************
* ������AL_Zone
* ʱ�䣺2008/4/21 22:57:47
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Exists]
GO
------------------------------------
--��;���Ƿ��Ѿ����� 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_Exists
@ZoneId uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_Zone WHERE ZoneId=@ZoneId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_ADD]
GO
------------------------------------
--��;������һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_ADD
@ZoneId uniqueidentifier output,		--yicone
@UserId uniqueidentifier,
@ZoneName nvarchar(100),
@SiteId uniqueidentifier,
@MediaType tinyint,
@InFirst tinyint,
@SizeId int,
@TransType tinyint,
@ClassIds nvarchar(14),
@Keywords nvarchar(272),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint,
@ZoneStyle nvarchar(100)

 AS 
	SET @ZoneId = CAST(CAST(NEWID() AS BINARY(10)) + CAST(GETDATE() AS BINARY(6)) AS UNIQUEIDENTIFIER)	-------------------------yicone��
 
	INSERT INTO AL_Zone(
	[ZoneId],[UserId],[ZoneName],[SiteId],[MediaType],[InFirst],[SizeId],[TransType],[ClassIds],[Keywords],[NeedAuditing],[AllowAdultAd],[Description],[ZoneCode],[WeekPrice],[RecommendWeekPrice],[ZoneState], [ZoneStyle]
	)VALUES(
	@ZoneId,@UserId,@ZoneName,@SiteId,@MediaType,@InFirst,@SizeId,@TransType,@ClassIds,@Keywords,@NeedAuditing,@AllowAdultAd,@Description,@ZoneCode,@WeekPrice,@RecommendWeekPrice,@ZoneState, @ZoneStyle
	)
	---Powered by fzf 2008.05.12 01:52
	Insert INTO AL_ZonePic(ZoneId,ZonePic)
	values(@ZoneId,'images/nopic.jpg')

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Update]
GO
------------------------------------
--��;���޸�һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_Update
@ZoneId uniqueidentifier,
@UserId uniqueidentifier,
@ZoneName nvarchar(100),
@SiteId uniqueidentifier,
@MediaType tinyint,
@InFirst tinyint,
@SizeId int,
@TransType tinyint,
@ClassIds nvarchar(14),
@Keywords nvarchar(272),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint,
@ZoneStyle nvarchar(100)
 AS 
	UPDATE AL_Zone SET 
	[UserId] = @UserId,[ZoneName] = @ZoneName,[SiteId] = @SiteId,[MediaType] = @MediaType,[InFirst] = @InFirst,[SizeId] = @SizeId,[TransType] = @TransType,[ClassIds] = @ClassIds,[Keywords] = @Keywords,[NeedAuditing] = @NeedAuditing,[AllowAdultAd] = @AllowAdultAd,[Description] = @Description,[ZoneCode] = @ZoneCode,[WeekPrice] = @WeekPrice,[RecommendWeekPrice] = @RecommendWeekPrice,[ZoneState] = @ZoneState, [ZoneStyle] = @ZoneStyle
	WHERE ZoneId=@ZoneId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Delete]
GO
------------------------------------
--��;��ɾ��һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_Delete
@ZoneId uniqueidentifier
 AS 
	DELETE AL_Zone
	 WHERE ZoneId=@ZoneId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_GetModel]
GO
------------------------------------
--��;���õ�ʵ��������ϸ��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_GetModel
@ZoneId uniqueidentifier
 AS 
	SELECT 
	AL_Zone.ZoneId,AL_Zone.UserId,AL_Zone.ZoneName,AL_Zone.SiteId,AL_Zone.MediaType,AL_Zone.InFirst,AL_Zone.SizeId,AL_Zone.TransType,AL_Zone.ClassIds,AL_Zone.Keywords,AL_Zone.NeedAuditing,AL_Zone.AllowAdultAd,AL_Zone.Description,AL_Zone.ZoneCode,AL_Zone.WeekPrice,AL_Zone.RecommendWeekPrice,AL_Zone.ZoneState,AL_Zone.ZoneStyle
	
	 FROM AL_Zone
	 WHERE ZoneId=@ZoneId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_GetList]
GO
------------------------------------
--��;����ѯ��¼��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_GetList
 AS 
	SELECT 
	ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState,ZoneStyle
	 FROM AL_Zone

GO

