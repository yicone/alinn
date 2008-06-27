<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Web.User.ResetPassword" masterpagefile="~/MasterPage/Member.Master" title="修改密码" %>
<asp:Content id="Content1" runat="Server" contentplaceholderid="_mainContent">
   <div style="text-align: center">
        输入新密码：<asp:TextBox ID="password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password"
            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator><br />
        请再次输入新密码：<asp:TextBox ID="rePassword" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password"
            ControlToValidate="rePassword" ErrorMessage="密码输入不一致"></asp:CompareValidator><br />
        <br />
        <asp:Button ID="btnConfix" runat="server" Text="确认" Width="69px" OnClick="btnConfix_Click" /></div>

</asp:Content>
