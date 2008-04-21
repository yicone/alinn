/******************************************************************
* 表名：AL_Zone
* 时间：2008/4/21 22:57:47
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
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
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_ADD
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
@TitleColor varchar(6),
@DescriptionColor nvarchar(12),
@LinkColor varchar(6),
@BorderColor varchar(6),
@BgColor varchar(6),
@Grounding varchar(6),
@BgImg nvarchar(100),
@CornerImg nvarchar(100),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint

 AS 
	INSERT INTO AL_Zone(
	[ZoneId],[UserId],[ZoneName],[SiteId],[MediaType],[InFirst],[SizeId],[TransType],[ClassIds],[Keywords],[TitleColor],[DescriptionColor],[LinkColor],[BorderColor],[BgColor],[Grounding],[BgImg],[CornerImg],[NeedAuditing],[AllowAdultAd],[Description],[ZoneCode],[WeekPrice],[RecommendWeekPrice],[ZoneState]
	)VALUES(
	@ZoneId,@UserId,@ZoneName,@SiteId,@MediaType,@InFirst,@SizeId,@TransType,@ClassIds,@Keywords,@TitleColor,@DescriptionColor,@LinkColor,@BorderColor,@BgColor,@Grounding,@BgImg,@CornerImg,@NeedAuditing,@AllowAdultAd,@Description,@ZoneCode,@WeekPrice,@RecommendWeekPrice,@ZoneState
	)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
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
@TitleColor varchar(6),
@DescriptionColor nvarchar(12),
@LinkColor varchar(6),
@BorderColor varchar(6),
@BgColor varchar(6),
@Grounding varchar(6),
@BgImg nvarchar(100),
@CornerImg nvarchar(100),
@NeedAuditing tinyint,
@AllowAdultAd tinyint,
@Description ntext,
@ZoneCode ntext,
@WeekPrice decimal(10,2),
@RecommendWeekPrice decimal(10,2),
@ZoneState tinyint
 AS 
	UPDATE AL_Zone SET 
	[UserId] = @UserId,[ZoneName] = @ZoneName,[SiteId] = @SiteId,[MediaType] = @MediaType,[InFirst] = @InFirst,[SizeId] = @SizeId,[TransType] = @TransType,[ClassIds] = @ClassIds,[Keywords] = @Keywords,[TitleColor] = @TitleColor,[DescriptionColor] = @DescriptionColor,[LinkColor] = @LinkColor,[BorderColor] = @BorderColor,[BgColor] = @BgColor,[Grounding] = @Grounding,[BgImg] = @BgImg,[CornerImg] = @CornerImg,[NeedAuditing] = @NeedAuditing,[AllowAdultAd] = @AllowAdultAd,[Description] = @Description,[ZoneCode] = @ZoneCode,[WeekPrice] = @WeekPrice,[RecommendWeekPrice] = @RecommendWeekPrice,[ZoneState] = @ZoneState
	WHERE ZoneId=@ZoneId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
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
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_GetModel
@ZoneId uniqueidentifier
 AS 
	SELECT 
	ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,TitleColor,DescriptionColor,LinkColor,BorderColor,BgColor,Grounding,BgImg,CornerImg,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState
	 FROM AL_Zone
	 WHERE ZoneId=@ZoneId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_Zone_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_Zone_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008/4/21 22:57:47
------------------------------------
CREATE PROCEDURE UP_AL_Zone_GetList
 AS 
	SELECT 
	ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,TitleColor,DescriptionColor,LinkColor,BorderColor,BgColor,Grounding,BgImg,CornerImg,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState
	 FROM AL_Zone

GO

