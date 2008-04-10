<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="Maticsoft.Web.HOT_SoldBook.Show" Title="ÎÞ±êÌâÒ³" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		SoldBookId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblSoldBookId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Grade
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblGrade" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookPrice
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblBookPrice" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Number
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblNumber" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Description
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblDescription" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		AddDate
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblAddDate" runat="server"></asp:Label>
	</td></tr>
</table>

</asp:Content>
