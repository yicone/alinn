/******************************************************************
* ������AL_NewsClass
* ʱ�䣺2008-5-17 1:57:34
******************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_Exists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_Exists]
GO
------------------------------------
--��;���Ƿ��Ѿ����� 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_Exists
@ClassId int
AS
	DECLARE @TempID int
	SELECT @TempID = count(1) FROM AL_NewsClass WHERE ClassId=@ClassId 
	IF @TempID = 0
		RETURN 0
	ELSE
		RETURN 1

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_ADD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_ADD]
GO
------------------------------------
--��;������һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_ADD
@ClassId int output,
@ClassName nvarchar(40)

 AS 
	INSERT INTO AL_NewsClass(
	[ClassName]
	)VALUES(
	@ClassName
	)
	SET @ClassId = @@IDENTITY

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_Update]
GO
------------------------------------
--��;���޸�һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_Update
@ClassId int,
@ClassName nvarchar(40)
 AS 
	UPDATE AL_NewsClass SET 
	[ClassName] = @ClassName
	WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_Delete]
GO
------------------------------------
--��;��ɾ��һ����¼ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_Delete
@ClassId int
 AS 
	DELETE AL_NewsClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_GetModel]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_GetModel]
GO
------------------------------------
--��;���õ�ʵ��������ϸ��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_GetModel
@ClassId int
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_NewsClass
	 WHERE ClassId=@ClassId 

GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UP_AL_NewsClass_GetList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[UP_AL_NewsClass_GetList]
GO
------------------------------------
--��;����ѯ��¼��Ϣ 
--��Ŀ���ƣ�Alinn
--˵����
--ʱ�䣺2008-5-17 1:57:34
------------------------------------
CREATE PROCEDURE UP_AL_NewsClass_GetList
 AS 
	SELECT 
	ClassId,ClassName
	 FROM AL_NewsClass

GO

