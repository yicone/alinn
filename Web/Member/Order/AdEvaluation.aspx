<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="AdEvaluation.aspx.cs" Inherits="Web.Member.Order.AdEvaluation" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		&nbsp;</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		评分：
	</td>
	<td height="25" width="*" align="left">
		<asp:RadioButtonList ID="rblEvaluation" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="1">好评</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">中评</asp:ListItem>
            <asp:ListItem Value="-1">差评</asp:ListItem>
        </asp:RadioButtonList>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;描述：</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtDescription" runat="server" Width="334px" Height="167px" 
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

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
