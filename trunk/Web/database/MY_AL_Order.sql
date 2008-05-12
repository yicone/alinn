if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MY_AL_ShowOrderByUserId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MY_AL_ShowOrderByUserId]
GO
create procedure MY_AL_ShowOrderByUserId
@UserId uniqueidentifier
as 
select top 1 AL_Order.OrderId,AL_Order.OrderName,AL_Order.StartDate,AL_Order.EndDate,AL_Order.PerPoint,AL_Order.EverydayPrice,AL_Order.Price
,AL_Ad.Title
 from AL_Order left join AL_Ad on AL_Ad.AdId=AL_Order.AdId where AL_Order.UserId=@UserId


