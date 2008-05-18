<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPassWord.aspx.cs" Inherits="Web.User.GetPassWord"
    MasterPageFile="../MasterPage/Global.Master" Title="找回密码" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="text-align: center">
        email：<asp:TextBox ID="email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="email不能为空"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="email不符合规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
        <br />
        <br />
        <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="发送邮件" /></div>
</asp:Content>
