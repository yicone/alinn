/* 此文件用以检查数据库中存在的错误数据，并加以简单修复 */

/* Zone */
--Check
select zoneid, zonename, siteid from al_zone where al_zone.siteid not in (select al_site.siteid from al_site)
--Fix
declare @siteid uniqueidentifier
set @siteid = (select top 1 siteid from al_site)	--使用任意的已存在的SiteId，替换Zone表中的无效SiteId
update al_zone set siteid = @siteid where al_zone.siteid not in (select al_site.siteid from al_site)



/* Site */
--Check
select * from al_site where (sextype is null) or (siteclass is null) or (agetype is null) or (employments is null)
--Fix
declare @sextype int
declare @siteclass int
declare @agetype int
declare @employments int
set @sextype = 2
set @agetype = 1
set @siteclass = 2
set @employments = 2
update al_site set sextype=@sextype, siteclass=@siteclass, agetype=@agetype, employments=@employments where (sextype is null) or (siteclass is null) or (agetype is null)
