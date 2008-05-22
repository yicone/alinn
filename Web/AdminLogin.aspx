<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Email：<asp:TextBox ID="txtEmail" runat="server" MaxLength="50" CssClass="text"></asp:TextBox>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="用户名不能为空" CssClass="Validator" Display="Dynamic">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="格式不规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            CssClass="Validator" Display="Dynamic">
        </asp:RegularExpressionValidator><br />
        登录密码：<asp:TextBox ID="txtPassword" runat="server" MaxLength="16" TextMode="Password"
            CssClass="text"></asp:TextBox>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="密码不能为空" CssClass="Validator" Display="Dynamic">
        </asp:RequiredFieldValidator><br />
        <input id="remember_password" type="checkbox" name="remember_password" value="true" />
        <label for="remember_password">
            在此计算机上记住密码</label>
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="登录" CssClass="login_sub" />
        <asp:HyperLink ID="linkGetPassWord" runat="server" NavigateUrl="/User/GetPassWord.aspx"
            CssClass="forget_password">忘记密码？
        </asp:HyperLink><br />
        <asp:Label ID="Label1" runat="server" Width="100px" ForeColor="Red"></asp:Label>
    </div>
    </form>
</body>
</html>
