<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Web.Controls.Header" %>
<%@ Register src="Search.ascx" tagname="Search" tagprefix="uc1" %>
<div style="text-align:center">
<table width="984" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/001.jpg" class="STYLE4" align=left;><a class=a2 href="/">赢在广告首页</a>&nbsp;<span class="STYLE4">|</span>&nbsp;<a class=a2 href="#">加入收藏夹</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    欢迎您！
                    <asp:HyperLink ID="hlLogin" runat="server" >登录</asp:HyperLink>&nbsp;|&nbsp;
                    <asp:LinkButton ID="lbRegister" runat="server" OnClick="LinkButton1_Click">注册</asp:LinkButton>
    </span> &nbsp;&nbsp;<a class=a2 href="#">财富通</a> | <a class=a2 href="#">腾讯QQ</a> <span class="STYLE4">|</span> <a class=a2 href="#">帮助中心</a> </td>
  </tr>
</table>
<table width="984" height="62" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="200" align="center"><img src="/app_themes/new/images/logo.gif" width="145" height="62"></td>
    <td align="center">            
    <div id="menu">
                <ul>
                    <li><a href="/Public/AdList.aspx" target="_self">买广告</a></li>
                    <li><a href="/public/sellad.aspx" target="_self">卖广告</a></li>
                    <li><a href="#" target="_self">网站推广</a></li>
                    <li><a href="#" target="_self">社区</a></li>
                </ul>
            </div></td>
    <td width="312" valign="top"><table width="100%" height="29" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right" valign="bottom"><a href="#"></a>&nbsp;&nbsp;<a href="#"></a>&nbsp;&nbsp;&nbsp;</td>
      </tr>
    </table>
      <table width="100%" height="32" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="984" height="64" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td style="text-align:center;" background="/app_themes/new/images/a007.jpg">
        <uc1:Search ID="Search1" runat="server" />
      </td>
  </tr>
</table><table width="984" height="7" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="/app_themes/new/images/分隔符.gif" width="1" height="1"></td>
  </tr>
</table>
</div>