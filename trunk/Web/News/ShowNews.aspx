<%@ Page Language="C#" MasterPageFile="~/MasterPage/ShowZone.Master" AutoEventWireup="true" CodeBehind="ShowNews.aspx.cs" Inherits="Web.News.ShowNews" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
  <!--******************************显示页面代码********************************-->

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		&nbsp;</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		所在分类：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblClassId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		标题：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblTitle" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		内容：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblContent" runat="server" Width="500px"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		发布时间： 	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblCreateDate" runat="server"></asp:Label>
	</td></tr>
</table>
</asp:Content>
