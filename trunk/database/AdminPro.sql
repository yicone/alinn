if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOT_Admin_CheckAdmin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[HOT_Admin_CheckAdmin]
GO
------------------------------------
--用途：是否存在此用户
--项目名称：HOTBOOK
--说明：
--时间：2008-3-12 16:25:33
------------------------------------
CREATE PROCEDURE HOT_Admin_CheckAdmin
@AdminName varchar(50),
@Password varchar(20)
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM HOT_Admin WHERE AdminName=@AdminName And Password=@Password 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

exec HOT_Admin_CheckAdmin 'aiai','9b92572a7ac68c586f176365b6cfab4c'
select * FROM HOT_Admin WHERE AdminName='aiai' And Password='9b92572a7ac68c586f176365b6cfab4c' 
