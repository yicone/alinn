<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default"
    EnableTheming="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <frameset rows="*" cols="190,*" framespacing="0" frameborder="0" border="false" id="frame"
        scrolling="yes">
  <frame id="leftmenu" name="leftmenu" scrolling="auto"  noresize="noresize" src="leftmenu.aspx" >
  <frameset rows="60,*" cols="*" framespacing="0" frameborder="0" border="false" scrolling="auto">
    <frame  id="top" name="top" src="top.aspx" scrolling="no">
    <frame id="main" name="main" src="Main.aspx" scrolling="auto" >
  </frameset>
</frameset>
</head>
<noframes>
    <body>
        <p>
            你的浏览器版本过低！！！本系统要求IE5及以上版本才能使用本系统。</p>
    </body>
</noframes>
