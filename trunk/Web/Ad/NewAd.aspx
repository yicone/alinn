<%@ Page Language="C#" MasterPageFile="~/MasterPage/UserCommon.Master" AutoEventWireup="true" CodeBehind="NewAd.aspx.cs" Inherits="Web.User.NewAd" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
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
		<asp:TextBox id="txtContent" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Url
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrl" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UrlText
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrlText" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Img
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtImg" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
</asp:Content>
