if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MY_AL_ZonePage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MY_AL_ZonePage]
GO
create procedure MY_AL_ZonePage 
(@startIndex int,
@endIndex int,
@docount bit,
@strWhere  NVarChar(500))
as
declare @sql varchar(1000)
if(@docount=1)
set @sql='
select count(AL_Zone.ZoneId) from AL_Zone left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId
left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId 
left join AL_User on AL_User.UserId=AL_Zone.UserId 
left join AL_ZoneSize on AL_ZoneSize.SizeId=AL_Zone.SizeId '+@strwhere
else
set @sql='
begin
 with temptbl as (
SELECT ROW_NUMBER() OVER (ORDER BY ZoneId desc)AS Row,AL_Zone.ZoneId,AL_Zone.ZoneName,AL_Zone.SiteId,AL_Zone.UserId
,AL_Zone.MediaType,AL_Zone.InFirst,AL_Zone.SizeId,AL_Zone.TransType,AL_Zone.ClassIds,AL_Zone.Keywords
,AL_Zone.NeedAuditing,AL_Zone.AllowAdultAd,AL_Zone.Description,AL_Zone.RecommendWeekPrice,AL_Zone.WeekPrice,AL_Site.SiteName,AL_ZonePic.ZonePic
,AL_User.QQ
,AL_ZoneSize.SizeCode
,cast(((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum) as money) as PricePerK,AL_Site.VistersNum
from AL_Zone  
left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId 
left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId 
left join AL_User on AL_User.UserId=AL_Zone.UserId 
left join AL_ZoneSize on AL_ZoneSize.SizeId=AL_Zone.SizeId
 '+@strwhere+')
 SELECT * FROM temptbl where Row between '+cast(@startIndex as varchar(10))+' and '+cast(@endIndex as varchar(10))+
' end'
exec(@sql)



--实现对广告合法性的验证并更改验证字段值

create trigger CheckOrder on AL_Order for update 
as 

with temptbl as
(select * from AL_Order where AL_Order.OrderId=(select Inserted.OrderId from Inserted))
select * from AL_Order
if(((select inserted.PerPoint from inserted) is not null) and ((select temptbl.Price from temptbl)/(select temptbl.PerPoint from temptbl)<=(select PointNum from AL_AdReport)))
		update AL_Order set AuditState=3 where OrderId=(select Inserted.OrderId from Inserted)
else 
begin
	if((select inserted.EndDate from inserted)<getdate())
		update AL_Order set AuditState=3 where OrderId=(select Inserted.OrderId from Inserted)
end

