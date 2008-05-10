if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MY_AL_AdGroupPage]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[MY_AL_AdGroupPage]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-4-18 11:02:49
------------------------------------
create procedure MY_AL_AdGroupPage
(@startIndex int,
@endIndex int,
@doCount tinyint,
@userId varchar (300))
as
if(@docount=1)
select count(*) from AL_AdGroup where cast (userid as varchar(300))= @userId
else
begin
 with temptbl as (
SELECT ROW_NUMBER() OVER (ORDER BY AdGroupId desc)AS Row, AdGroupId,GroupName,KeyWords,Class from AL_AdGroup where cast (userid as varchar(300))= @userId)

SELECT * FROM temptbl where Row between @startIndex and @endIndex
end

GO
select * from AL_AdGroup
exec MY_AL_AdGroupPage 1,10,1,'936DA01F-9ABD-4D9D-80C7-02AF85C822A7'