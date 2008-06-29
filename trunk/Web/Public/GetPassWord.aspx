<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPassWord.aspx.cs" Inherits="Web.User.GetPassWord"
    MasterPageFile="~/MasterPage/Global.Master" Title="找回密码" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="text-align: center">
        email：
<br />
        <br />
        <br />

        
        <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="19" height="40" background="images/b01.gif" scope="col">&nbsp;</th>
    <td width="917" align="left" background="images/b01.gif" class="gg03" scope="col"><span class="gl01">&nbsp;你的位置: 首页 &gt; 找回密码</span> </td>
  </tr>
  <tr>
    <th height="5" bgcolor="#ECEFF4" scope="row">&nbsp;</th>
    <td height="40" bgcolor="#ECEFF4" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="d3">填写您的邮件地址来找回密码 </span></td>
  </tr>
  <tr>
    <th height="5" scope="row">&nbsp;</th>
    <td height="40" scope="row"><table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="329" height="50" align="right" class="bt02" scope="col">EMAIL地址：</th>
        <th width="588" align="left" scope="col">&nbsp;&nbsp;
          <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="email不能为空"></asp:RequiredFieldValidator>
          &nbsp;<span class="gl01">        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
            ErrorMessage="email不符合规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>请输入您注册时填写的邮件地址</span></th>
      </tr>
    </table></td>
  </tr>
  <tr>
    <th height="10" scope="row">&nbsp;</th>
    <td height="40" scope="row"><table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="36%" height="50" align="right" class="bt02" scope="col">&nbsp;</th>
        <th width="64%" height="30" align="left" scope="col"> </th>
      </tr>
    </table></td>
  </tr>
  <tr>
    <th height="20" bgcolor="#E0DFE3" scope="row">&nbsp;</th>
    <td height="60" align="center" bgcolor="#E0DFE3" scope="row">
        <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="发送邮件" /></div>
    </form></td>
  </tr>
</table>
</asp:Content>
