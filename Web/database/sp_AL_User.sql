/******************************************************************
* ������AL_User
* ʱ�䣺2008-5-15 1:22:44
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_Exists]
GO
------------------------------------
--��;���Ƿ��Ѿ����� 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_Exists
@UserID uniqueidentifier
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_User WHERE UserID=@UserID 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_ADD]
GO
------------------------------------
--��;������һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_ADD
@UserID uniqueidentifier,
@RoleID int,
@Email nvarchar(100),
@NickName nvarchar(100),
@UserPassword nvarchar(100),
@CompanyName nvarchar(400),
@CompanyAddress nvarchar(1000),
@LinkMan nvarchar(16),
@Telephone nvarchar(100),
@Mobile nvarchar(100),
@QQ nvarchar(100),
@Msn nvarchar(100),
@Introducer varchar(16),
@LastLoginTime datetime,
@LastLoginIP nvarchar(30),
@LoginTimes int,
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime

 AS 
	INSERT INTO AL_User(
	[UserID],[RoleID],[Email],[NickName],[UserPassword],[CompanyName],[CompanyAddress],[LinkMan],[Telephone],[Mobile],[QQ],[Msn],[Introducer],[LastLoginTime],[LastLoginIP],[LoginTimes],[IsLocked],[ActiveCode],[RegTime]
	)VALUES(
	@UserID,@RoleID,@Email,@NickName,@UserPassword,@CompanyName,@CompanyAddress,@LinkMan,@Telephone,@Mobile,@QQ,@Msn,@Introducer,@LastLoginTime,@LastLoginIP,@LoginTimes,@IsLocked,@ActiveCode,@RegTime
	)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_Update]
GO
------------------------------------
--��;���޸�һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_Update
@UserID uniqueidentifier,
@RoleID int,
@Email nvarchar(100),
@NickName nvarchar(100),
@UserPassword nvarchar(100),
@CompanyName nvarchar(400),
@CompanyAddress nvarchar(1000),
@LinkMan nvarchar(16),
@Telephone nvarchar(100),
@Mobile nvarchar(100),
@QQ nvarchar(100),
@Msn nvarchar(100),
@Introducer varchar(16),
@LastLoginTime datetime,
@LastLoginIP nvarchar(30),
@LoginTimes int,
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime
 AS 
	UPDATE AL_User SET 
	[RoleID] = @RoleID,[Email] = @Email,[NickName] = @NickName,[UserPassword] = @UserPassword,[CompanyName] = @CompanyName,[CompanyAddress] = @CompanyAddress,[LinkMan] = @LinkMan,[Telephone] = @Telephone,[Mobile] = @Mobile,[QQ] = @QQ,[Msn] = @Msn,[Introducer] = @Introducer,[LastLoginTime] = @LastLoginTime,[LastLoginIP] = @LastLoginIP,[LoginTimes] = @LoginTimes,[IsLocked] = @IsLocked,[ActiveCode] = @ActiveCode,[RegTime] = @RegTime
	WHERE UserID=@UserID 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_Delete]
GO
------------------------------------
--��;��ɾ��һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_Delete
@UserID uniqueidentifier
 AS 
	DELETE AL_User
	 WHERE UserID=@UserID 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_GetModel]
GO
------------------------------------
--��;���õ�ʵ��������ϸ��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_GetModel
@UserID uniqueidentifier
 AS 
	SELECT 
	UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime
	 FROM AL_User
	 WHERE UserID=@UserID 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_User_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_User_GetList]
GO
------------------------------------
--��;����ѯ��¼��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-15 1:22:44
------------------------------------
CREATE PROCEDURE UP_AL_User_GetList
 AS 
	SELECT 
	UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime
	 FROM AL_User

GO

