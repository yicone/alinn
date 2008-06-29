<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Web.Controls.Header" %>
<%@ Register src="Search.ascx" tagname="Search" tagprefix="uc1" %>
<style type="text/css">
    .style3
    {
        width: 667px;
    }
</style>
<div style="text-align: center">
    <table width="938" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <th width="300" height="65" rowspan="2" scope="col"><img src="/images/logo.gif" width="182" height="65" /></th>
    <th height="20" align="right" background="/images/yh07.gif" scope="col" 
          colspan="2"> <span class="bu06"> 欢迎您！<asp:HyperLink ID="hlLogin" runat="server">登录</asp:HyperLink>|</span> <span class="bu06"><asp:LinkButton ID="lbRegister" runat="server" OnClick="LinkButton1_Click">注册</asp:LinkButton>|</span> <span class="bu06">财富通</span> <span class="bu06">|</span> <span class="bu06">腾讯QQ</span> <span class="bu06">|</span> <span class="bu06">用户中心</span></th>
    
  </tr>
  <tr>
    <th valign="bottom" scope="col">
                <div id="menu">
                    <ul>
                        <li class="shouye"><a href="/" target="_self">首页</a></li>
                        <li class="mai"><a href="/Public/AdList.aspx" target="_self">买广告</a></li>
                        <li class="mai1"><a href="/public/sellad.aspx" target="_self">卖广告</a></li>
                        <li class="tuiguang"><a href="#" target="_self">网站推广</a></li>
                        <li class="shequ"><a href="#" target="_self">社区</a></li>
                    </ul>
                </div>
    </th>
    <th width="300" scope="col">&nbsp;</th>
  </tr>
</table>
        
    <table width="938" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="273" height="30" background="/images/index0_09.gif" scope="col">&nbsp;</th>
    <th width="389" background="/images/index0_10.gif" scope="col">&nbsp;</th>
    <th width="276" background="/images/index0_11.gif" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th height="30" colspan="3" scope="row"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="229" height="37" background="/images/index0_12.gif" scope="col">&nbsp;</th>
        <th scope="col"><table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th height="8" colspan="2" align="left" valign="top" scope="col"><img src="/images/index01_13.gif" width="509" height="8" /><img src="/images/index01_14.gif" width="200" height="8" /></th>
          </tr>
          <tr>
            <th height="29" align="left" valign="top" scope="col" class="style3" style="background-image:url(/images/searchbg.gif);">
                                <uc1:Search ID="Search1" runat="server" />   
                                          </th>
            <th width="39" align="left" valign="top" style="background-image:url(/images/index01_121.gif);"scope="col">
                &nbsp;</th>
          </tr>
        </table>    
        
        </th>
      </tr>
    </table></th>
  </tr>
</table>
</div>
