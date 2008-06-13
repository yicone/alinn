<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.User.Login" masterpagefile="~/MasterPage/Global1.Master" title="用户登录" %>

<asp:Content id="Content1" runat="Server" contentplaceholderid="_mainContent">
    
    <table width="984" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="608" align="center" valign="top"><table width="608" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="56">&nbsp;</td>
      </tr>
      <tr>
        <td height="260" background="/app_themes/new/images/banrleft.gif">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
      <table width="608" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="608" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="135" class="STYLE4">&nbsp;</td>
          <td width="66" height="33" class="STYLE4"><img src="/app_themes/new/images/buy.gif" width="66" height="33" /></td>
          <td width="407" class="STYLE4">&nbsp;</td>
        </tr>
        <tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>覆盖面广，</strong>覆盖中国一半以上主流网民 </td>
        </tr>
		        <tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>精准营销，</strong>按地区、网站内容、人群特征进行定向投放 </td>
        </tr>
		        <tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>灵活自主，</strong>自由市场广告随意挑选，专业数据支持，实时优化效果</td>
        </tr>
        <tr>
          <td class="STYLE4">&nbsp;</td>
          <td width="66" height="33" class="STYLE4"><img src="/app_themes/new/images/sell.gif" width="66" height="33" /></td>
          <td class="STYLE4">&nbsp;</td>
        </tr>
        <tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>免费交易，</strong>提供免费广告发布软件</td>
        </tr>
		<tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>自主定价，</strong>流量收入最大化</td>
        </tr>
		<tr>
          <td height="20" class="STYLE4">&nbsp;</td>
          <td height="20" colspan="2" class="STYLE4"><strong>收益透明，</strong>结算高效，额度不设限</td>
        </tr>
      </table></td>
    <td width="246" align="center" valign="top"><table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="246" height="60">&nbsp;</td>
      </tr>
      <tr>
        <td width="246" height="349"><table width="246" height="349" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="5" background="/app_themes/new/images/横线上.gif"></td>
          </tr>
          <tr>
            <td height="339" background="/app_themes/new/images/横线中.gif">
			<form action="" method="get">
			<table width="246" height="339" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="50" colspan="2"><table width="244" height="28" border="0" align="center" cellpadding="0" cellspacing="0" background="/app_themes/new/images/title.gif">
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                </tr>
              <tr>
                <td width="83" height="20" align="right" class="STYLE4">用户名</td>
                <td width="163" height="20" class="STYLE4"><label>
                  &nbsp;&nbsp; 
                  <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" CssClass="text"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="用户名不能为空" CssClass="Validator" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="格式不规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="Validator" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                </label></td>
              </tr>
              <tr>
                <td width="83" height="20" align="right" class="STYLE4"><p>密&nbsp; 码</p>                  </td>
                <td height="20" class="STYLE4">&nbsp;&nbsp;  <asp:TextBox ID="txtPassword" runat="server" MaxLength="16" TextMode="Password" CssClass="text"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="密码不能为空" CssClass="Validator" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <input id="_fmm.l._0.lo" type="hidden" name="_fmm.l._0.lo" value="" /></td>
              </tr>
              <tr>
                <td width="83" height="20" align="right" class="STYLE4">版&nbsp; 本</td>
                <td height="20"><span class="STYLE4"><label>
                  </label></span>
                  <label>&nbsp;
                  <select name="select" class="STYLE4" width="200">
                    <option value="1">默认风格</option>
                    <option value="2">春光明媚</option>
                    <option value="3">夏日风景</option>
                    <option value="4">冰雪世界</option>
                  </select>
                  </label>
                  <span class="STYLE4">
                  <label>                  </label>
                  </span></td>
              </tr>
              <tr>
                <td height="20" colspan="2" align="center" class="STYLE4">                                <input id="remember_password" type="checkbox" name="remember_password" value="true" /><label
                                    for="remember_password">在此计算机上记住密码</label>
                                    <br />
                                                                    <!--input class="login_sub" onfocus="this.blur()" onclick="return checkinput();" type="submit" name="dologin" value="" /-->
                                </td>
                </tr>
              <tr>
                <td height="24" colspan="2" align="center" class="STYLE4">
                                <asp:ImageButton ID="btnLogin" runat="server" 
                        OnClick="btnLogin_Click" CssClass="login_sub" 
                        ImageUrl="~/App_Themes/new/images/login.gif" />
                                &nbsp;&nbsp;&nbsp;<asp:HyperLink ID="linkGetPassWord" runat="server" NavigateUrl="/User/GetPassWord.aspx"
                                    CssClass="forget_password">忘记密码？
                                </asp:HyperLink>
                                &nbsp;
                                <asp:Label ID="Label1" runat="server" Width="100px" ForeColor="Red"></asp:Label></td>
                </tr>
              <tr>
                <td height="1" colspan="2" background="/app_themes/new/images/横线.gif" class="STYLE4"></td>
                </tr>
              <tr>
                <td height="150" colspan="2" class="STYLE4">&nbsp;</td>
                </tr>
            </table>
			</form>			
			</td>
          </tr>
          <tr>
            <td height="5" background="/app_themes/new/images/横线下.gif"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="246" height="10"></td>
      </tr>
      <tr>
        <td width="246" height="106"><table width="246" height="106" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="5" background="/app_themes/new/images/横线上.gif"></td>
          </tr>
          <tr>
            <td height="96" background="/app_themes/new/images/横线中.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="5" background="/app_themes/new/images/横线下.gif"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td width="246" height="10"></td>
      </tr>
    </table></td>
    <td width="130" align="left" valign="top"><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="15" height="120">&nbsp;</td>
        <td width="5" height="120"></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="15" height="154" background="/app_themes/new/images/banr.gif">&nbsp;</td>
        <td width="5" height="154" background="/app_themes/new/images/banrright.gif"></td>
        <td height="140">&nbsp;</td>
      </tr>
      <tr>
        <td width="15">&nbsp;</td>
        <td width="5"></td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="760" height="50" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#32ADE6">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</asp:Content>
<asp:Content id="Content2" runat="server" contentplaceholderid="_htmlHeadContent">
    <link rel="stylesheet" type="text/css" href="../CSS/login.css" />
    <%--此处添加MEAT标签、JS脚本和样式表的引用--%><%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%>
</asp:Content>
