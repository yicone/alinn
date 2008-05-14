/******************************************************************
* 表名：AL_UserTemp
* 时间：2008-5-15 1:25:14
******************************************************************/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_Exists]
GO
------------------------------------
--用途：是否已经存在 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_Exists
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
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime,
@RegIP nvarchar(30)
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_UserTemp WHERE RoleID=@RoleID and Email=@Email and NickName=@NickName and UserPassword=@UserPassword and CompanyName=@CompanyName and CompanyAddress=@CompanyAddress and LinkMan=@LinkMan and Telephone=@Telephone and Mobile=@Mobile and QQ=@QQ and Msn=@Msn and Introducer=@Introducer and IsLocked=@IsLocked and ActiveCode=@ActiveCode and RegTime=@RegTime and RegIP=@RegIP 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_ADD]
GO
------------------------------------
--用途：增加一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_ADD
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
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime,
@RegIP nvarchar(30)

 AS 
	INSERT INTO AL_UserTemp(
	[RoleID],[Email],[NickName],[UserPassword],[CompanyName],[CompanyAddress],[LinkMan],[Telephone],[Mobile],[QQ],[Msn],[Introducer],[IsLocked],[ActiveCode],[RegTime],[RegIP]
	)VALUES(
	@RoleID,@Email,@NickName,@UserPassword,@CompanyName,@CompanyAddress,@LinkMan,@Telephone,@Mobile,@QQ,@Msn,@Introducer,@IsLocked,@ActiveCode,@RegTime,@RegIP
	)

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_Update]
GO
------------------------------------
--用途：修改一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_Update
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
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime,
@RegIP nvarchar(30)
 AS 
	UPDATE AL_UserTemp SET 
	[RoleID] = @RoleID,[Email] = @Email,[NickName] = @NickName,[UserPassword] = @UserPassword,[CompanyName] = @CompanyName,[CompanyAddress] = @CompanyAddress,[LinkMan] = @LinkMan,[Telephone] = @Telephone,[Mobile] = @Mobile,[QQ] = @QQ,[Msn] = @Msn,[Introducer] = @Introducer,[IsLocked] = @IsLocked,[ActiveCode] = @ActiveCode,[RegTime] = @RegTime,[RegIP] = @RegIP
	WHERE RoleID=@RoleID and Email=@Email and NickName=@NickName and UserPassword=@UserPassword and CompanyName=@CompanyName and CompanyAddress=@CompanyAddress and LinkMan=@LinkMan and Telephone=@Telephone and Mobile=@Mobile and QQ=@QQ and Msn=@Msn and Introducer=@Introducer and IsLocked=@IsLocked and ActiveCode=@ActiveCode and RegTime=@RegTime and RegIP=@RegIP 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_Delete]
GO
------------------------------------
--用途：删除一条记录 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_Delete
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
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime,
@RegIP nvarchar(30)
 AS 
	DELETE AL_UserTemp
	 WHERE RoleID=@RoleID and Email=@Email and NickName=@NickName and UserPassword=@UserPassword and CompanyName=@CompanyName and CompanyAddress=@CompanyAddress and LinkMan=@LinkMan and Telephone=@Telephone and Mobile=@Mobile and QQ=@QQ and Msn=@Msn and Introducer=@Introducer and IsLocked=@IsLocked and ActiveCode=@ActiveCode and RegTime=@RegTime and RegIP=@RegIP 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_GetModel]
GO
------------------------------------
--用途：得到实体对象的详细信息 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_GetModel
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
@IsLocked tinyint,
@ActiveCode varchar(16),
@RegTime datetime,
@RegIP nvarchar(30)
 AS 
	SELECT 
	RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,IsLocked,ActiveCode,RegTime,RegIP
	 FROM AL_UserTemp
	 WHERE RoleID=@RoleID and Email=@Email and NickName=@NickName and UserPassword=@UserPassword and CompanyName=@CompanyName and CompanyAddress=@CompanyAddress and LinkMan=@LinkMan and Telephone=@Telephone and Mobile=@Mobile and QQ=@QQ and Msn=@Msn and Introducer=@Introducer and IsLocked=@IsLocked and ActiveCode=@ActiveCode and RegTime=@RegTime and RegIP=@RegIP 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_UserTemp_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_UserTemp_GetList]
GO
------------------------------------
--用途：查询记录信息 
--项目名称：Alinn
--说明：
--时间：2008-5-15 1:25:14
------------------------------------
CREATE PROCEDURE UP_AL_UserTemp_GetList
 AS 
	SELECT 
	RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,IsLocked,ActiveCode,RegTime,RegIP
	 FROM AL_UserTemp

GO

