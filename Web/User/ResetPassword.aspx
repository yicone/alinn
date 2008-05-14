<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Web.User.ResetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改密码</title>
</head>
<body>
    <form id="form1" runat="server">
   <div style="text-align: center">
        输入新密码：<asp:TextBox ID="password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password"
            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator><br />
        请再次输入新密码：<asp:TextBox ID="rePassword" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password"
            ControlToValidate="rePassword" ErrorMessage="密码输入不一致"></asp:CompareValidator><br />
        <br />
        <asp:Button ID="btnConfix" runat="server" Text="确认" Width="69px" OnClick="btnConfix_Click" /></div>
    </form>
</body>
</html>
