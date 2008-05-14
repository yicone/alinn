<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.User.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        用户名（email）：<asp:TextBox ID="email" runat="server" MaxLength="50"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="格式不规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
        密 &nbsp; &nbsp;码：<asp:TextBox ID="passWord" runat="server" MaxLength="16"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passWord"
            ErrorMessage="密码不能为空"></asp:RequiredFieldValidator><br />
        <br />
        <asp:HyperLink ID="linkRegister" runat="server" 
            NavigateUrl="~/User/Register.aspx">注册</asp:HyperLink>
        <asp:Button ID="btnLogin" runat="server" Text="登录" Width="61px" OnClick="btnLogin_Click" />
        &nbsp;
        <asp:HyperLink ID="linkGetPassWord" runat="server" 
            NavigateUrl="~/User/GetPassWord.aspx">忘记密码？</asp:HyperLink><br />
        <br />
        <asp:Label ID="Label1" runat="server" Width="92px"></asp:Label>
    
    </div>
    </form>
</body>
</html>
