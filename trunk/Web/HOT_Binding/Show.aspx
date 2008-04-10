<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="Maticsoft.Web.HOT_Binding.Show" Title="ÎÞ±êÌâÒ³" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		BindingId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBindingId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Binding
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBinding" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Description
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblDescription" runat="server"></asp:Label>
	</td></tr>
</table>

</asp:Content>
