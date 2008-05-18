<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdNews.aspx.cs" Inherits="Web.Admin.News.AdNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <!--******************************增加页面代码********************************-->

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		<br />
        <br />
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;分类：</td>
	<td height="25" width="*" align="left">
		<asp:DropDownList ID="ddlNewsClass" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="ClassName" 
            DataValueField="ClassId" Width="173px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [AL_NewsClass]"></asp:SqlDataSource>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Title
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTitle" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Content
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtContent" runat="server" Width="415px" Height="217px" 
            TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		&nbsp;</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
    </div>
    </form>
</body>
</html>
