<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Codebehind="Add.aspx.cs" Inherits="Maticsoft.Web.HOT_User.Add" Title="无标题页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		RoleID
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtRoleID" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserType
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserType" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserName
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserName" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserPassword
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserPassword" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Question
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtQuestion" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Answer
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtAnswer" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Email
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtEmail" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Address
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtAddress" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PostCode
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPostCode" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Telephone
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTelephone" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Mobile
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtMobile" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		QQ
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtQQ" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserFace
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserFace" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		RegTime
	</td>
	<td height="25" width="*" align="left">
		<INPUT onselectstart="return false;" onkeypress="return false" id="txtDate1" onfocus="setday(this)"
		 readOnly type="text" size="10" name="Text1" runat="server">
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		LastLoginTime
	</td>
	<td height="25" width="*" align="left">
		<INPUT onselectstart="return false;" onkeypress="return false" id="txtDate1" onfocus="setday(this)"
		 readOnly type="text" size="10" name="Text1" runat="server">
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		LastLoginIP
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtLastLoginIP" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		LoginTimes
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtLoginTimes" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserPoint
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserPoint" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserBooks
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserBooks" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		ConsumePoint
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtConsumePoint" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UnreadMsg
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUnreadMsg" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		IsLocked
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtIsLocked" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserSetting
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserSetting" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>

</asp:Content>
