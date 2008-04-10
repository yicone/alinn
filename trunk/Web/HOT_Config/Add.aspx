<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Codebehind="Add.aspx.cs" Inherits="Maticsoft.Web.HOT_Config.Add" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		SiteName
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtSiteName" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		SiteUrl
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtSiteUrl" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		WebmasterName
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtWebmasterName" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		WebmasterEmail
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtWebmasterEmail" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Copyright
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtCopyright" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		HitsOfHot
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtHitsOfHot" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		EnableUserReg
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtEnableUserReg" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserName_RegDisabled
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserName_RegDisabled" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserNumber
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserNumber" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookNumber
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookNumber" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>

</asp:Content>
