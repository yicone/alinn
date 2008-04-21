USE [Alinn]
GO
/****** Object:  StoredProcedure [dbo].[UP_ZoneInfoExt]    Script Date: 04/21/2008 22:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	列式指定站点下的广告位信息

--ZoneId, ZoneName, ZoneSize, WeekPrice, SiteId, SiteUrl, ZoneType, ZoneState
-- =============================================
CREATE PROCEDURE [dbo].[UP_ZoneInfoExt]
	-- Add the parameters for the stored procedure here
	@SiteId uniqueidentifier
AS
BEGIN
		select zoneid, zonename, zonesize, weekprice, al_zone.siteid as siteid, siteurl, mediatype, zonestate from al_zone
		join al_site 
		on al_zone.siteid = al_site.siteid join al_zonesize on al_zone.sizeid = al_zonesize.sizeid
		where al_zone.siteid = @SiteId
END

USE [Alinn]
GO
/****** Object:  StoredProcedure [dbo].[UP_SiteInfoExt]    Script Date: 04/21/2008 22:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		yicone
-- Create date: 
-- Description:	列示网站，并统计网站下属的广告位
-- =============================================
CREATE PROCEDURE [dbo].[UP_SiteInfoExt] 
	-- Add the parameters for the stored procedure here
	@UserId uniqueidentifier

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if object_id('tempdb..#temp') is not null
	begin 
		drop table #temp
	end
else
	begin
		select zoneid, sitename, auditstate, al_site.siteid into #temp from al_zone
		join al_site 
		on al_zone.siteid = al_site.siteid
		where al_site.UserId = @UserId

		select siteid, sitename, auditstate, count(zoneid) as ZoneCount from #temp 
		group by siteid,sitename,auditstate 
	end
END


USE [Alinn]
GO
/****** Object:  StoredProcedure [dbo].[UP_ZoneClass_GetZoneClassesByParentId]    Script Date: 04/21/2008 22:51:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------
--用途：得到制定父ID的广告位分类 
--项目名称：Alinn
--说明：
--时间：2008/4/16 17:52:11
------------------------------------
CREATE PROCEDURE [dbo].[UP_ZoneClass_GetZoneClassesByParentId]
@ParentId int
 AS 
	SELECT 
	ClassId,ClassName,ParentId
	 FROM AL_ZoneClass
	 WHERE ParentId=@ParentId

