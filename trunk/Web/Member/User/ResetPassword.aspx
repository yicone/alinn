<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Web.User.ResetPassword" masterpagefile="~/MasterPage/Member.Master" title="修改密码" %>
<asp:Content id="Content1" runat="Server" contentplaceholderid="_mainContent">
   <div style="text-align: center">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="dl02" scope="col">修改密码</th>
    <th width="829" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="30" align="left" background="images/yh08.gif" class="f4" scope="col">&nbsp;</th>
  </tr>
</table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        输入新密码：<asp:TextBox ID="password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password"
            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator><br />
        请再次输入新密码：<asp:TextBox ID="rePassword" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password"
            ControlToValidate="rePassword" ErrorMessage="密码输入不一致"></asp:CompareValidator><br />
        <br /></div>
    <table width="936" height="50" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th scope="col" style="width:50%;"> 
            &nbsp;</th>
        <th scope="col"> 
            <asp:ImageButton ID="ibtnUpdate" runat="server" Height="25px" 
                onclick="ibtnUpdate_Click" Width="78px" ImageUrl="~/images/yh20.gif" /></th>
        <th width="78" scope="col"></th>
      </tr>
    </table>
</asp:Content>
