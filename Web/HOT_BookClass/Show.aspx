<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="Maticsoft.Web.HOT_BookClass.Show" Title="ÎÞ±êÌâÒ³" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		BookClassId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBookClassId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookClassName
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBookClassName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		SonId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblSonId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookClassInfo
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBookClassInfo" runat="server"></asp:Label>
	</td></tr>
</table>

</asp:Content>
