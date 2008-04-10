if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOT_BookClass_GetListById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[HOT_BookClass_GetListById]
GO
------------------------------------
--��;����ѯ��¼��Ϣ 
--��Ŀ���ƣ�HOTBOOK
--˵����
--ʱ�䣺2008-3-27 18:16:55
------------------------------------
CREATE PROCEDURE HOT_BookClass_GetListById
@n int
 AS 
	SELECT 
	BookClassId,SonId,ParentId,BookClassName,OrderId,BookClassInfo,IsDisabled
	 FROM HOT_BookClass
	Where ParentId=@n

GO