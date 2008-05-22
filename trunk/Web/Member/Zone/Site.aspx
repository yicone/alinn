<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Site.aspx.cs" Inherits="Web.Site" masterpagefile="~/MasterPage/Member.Master" %>
<asp:Content id="Content1" runat="Server" contentplaceholderid="_mainContent">
    <div>
         <!--******************************增加页面代码********************************-->

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<!--tr>
	<td height="25" width="30%" align="right">
		UserId
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUserId" runat="server" Width="260px"></asp:TextBox>
	</td></tr-->
	<tr>
	<td height="25" width="30%" align="right">
		网站名称：
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtSiteName" runat="server" Width="260px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		网站地址：
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtSiteUrl" runat="server" Width="260px"></asp:TextBox>
	</td></tr>
		<tr>
	<td height="25" width="30%" align="right">
		网站描述：
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtDescription" runat="server" Rows="8" Columns="50"
            TextMode="MultiLine"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		网站类型：
	</td>
	<td height="25" width="*" align="left">
        <asp:RadioButtonList ID="rblSiteClass" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow" Width="550px">
        </asp:RadioButtonList>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		性别分布：
	</td>
	<td height="25" width="*" align="left">
		<asp:RadioButtonList ID="rblSexType" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="0">男性为主</asp:ListItem>
            <asp:ListItem Value="1">男女基本一致</asp:ListItem>
            <asp:ListItem Value="2">女性为主</asp:ListItem>
        </asp:RadioButtonList>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		年龄：
	</td>
	<td height="25" width="*" align="left">
		<asp:RadioButtonList ID="rblAgeType" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="0">18岁以下</asp:ListItem>
            <asp:ListItem Value="1">18～25岁</asp:ListItem>
            <asp:ListItem Value="2">25～45岁</asp:ListItem>
            <asp:ListItem Value="3">45岁以上</asp:ListItem>
        </asp:RadioButtonList>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		职业：
	</td>
	<td height="25" width="*" align="left">
		<asp:CheckBoxList ID="cblEmployments" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
        </asp:CheckBoxList>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		兴趣爱好：
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTaste" runat="server" Width="260px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
    </div>
    
</asp:Content>
