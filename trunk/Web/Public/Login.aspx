<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.User.Login"
    MasterPageFile="~/MasterPage/Global.Master" Title="用户登录" enableEventValidation="false"%>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">

<table width="936" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="20" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="180" scope="col"><table width="936" height="447" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="536" height="150" scope="col"><img src="/images/dl01.gif" width="536" height="150" /></th>
        <th width="300" height="450" rowspan="3" background="/images/dl03.gif" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="450">
          <tr>
            <th height="180" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="180">
              <tr>
                <th height="45" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                  <tr>
                    <th width="40%" align="right" valign="bottom" class="dl02" scope="col">用户名：</th>
                    <th width="60%" align="left" valign="bottom" scope="col"><asp:TextBox ID="txtEmail" runat="server" MaxLength="50" CssClass="text"></asp:TextBox>
                    <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                                            ErrorMessage="用户名不能为空" CssClass="Validator" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                                            ErrorMessage="格式不规范" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            CssClass="Validator" Display="Dynamic">
                                                        </asp:RegularExpressionValidator>
                    </th>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <th height="45" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                  <tr>
                    <th width="40%" align="right" class="dl02" scope="col">密&nbsp;码：</th>
                    <th width="60%" align="left" scope="col"><span class="STYLE4">
                                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="16" TextMode="Password" CssClass="text"></asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                                        ErrorMessage="密码不能为空" CssClass="Validator" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                    </span></th>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <th height="45" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="40">
                  <tr>
                    <th height="40" align="center" class="dl02" scope="col">
                                                                          <input id="remember_password" type="checkbox" name="remember_password" value="true" /><label
                                                        for="remember_password">在此计算机上记住密码</label>
                    </th>
                    </tr>
                </table></th>
              </tr>
              <tr>
                <th height="45" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="45">
                  <tr>
                    <th width="50%" align="right" scope="col"><span class="gg03">
                                                                        <asp:ImageButton ID="btnLogin" 
                            runat="server" OnClick="btnLogin_Click" CssClass="login_sub"
                                                        ImageUrl="/images/dl07.gif" Height="38px" 
                            Width="74px" />
                                                    </span></th>
                    <th width="50%" align="left" scope="col"> &nbsp;<span class="gg03">&nbsp;
                                                                        &nbsp;&nbsp;&nbsp;<asp:HyperLink ID="linkGetPassWord" runat="server" NavigateUrl="/GetPassWord.aspx"
                                                        CssClass="forget_password">忘记密码？
                                                    </asp:HyperLink>
                                                    &nbsp;
                                                    <asp:Label ID="Label1" runat="server" Width="100px" ForeColor="Red"></asp:Label></span></th>
                  </tr>
                </table></th>
              </tr>
            </table></th>
          </tr>
          <tr>
            <th scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="270">
              <tr>
                <th height="90" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th height="175" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="100">
                  <tr>
                    <th class="dl02" scope="col">还没有赢在广告帐号？你只需要30秒</th>
                  </tr>
                  <tr>
                    <th scope="row"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','images/dl09.gif',1)"><img src="/images/dl08.gif" name="Image4" width="129" height="35" border="0" id="Image4" /></a></th>
                  </tr>
                </table></th>
              </tr>
            </table></th>
          </tr>
        </table></th>
        <th width="100" scope="col"><img src="/images/dl02.gif" width="99" height="150" /></th>
      </tr>
      <tr>
        <th height="130" align="left" scope="row">&nbsp;
          <table width="100%" border="0" cellspacing="0" cellpadding="0" height="130">
            <tr>
              <th height="40" align="left" scope="col">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/dl10.gif" width="77" height="40" /></th>
            </tr>
            <tr>
              <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">覆盖面广，覆盖中国一半以上主流网民</span></th>
            </tr>
            <tr>
              <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">精准营销，按地区、网站内容、人群特征进行定向投放</span></th>
            </tr>
            <tr>
              <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">灵活自主，自由市场广告随意挑选，专业数据支持，实时优化效果</span></th>
            </tr>
          </table>
          <br /></th>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <th height="130" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="130">
          <tr>
            <th height="40" align="left" scope="col">&nbsp;&nbsp;&nbsp;&nbsp;<img src="/images/dl11.gif" width="77" height="40" /></th>
          </tr>
          <tr>
            <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">免费交易，提供免费广告发布软件</span></th>
          </tr>
          <tr>
            <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">自主定价，流量收入最大化</span></th>
          </tr>
          <tr>
            <th align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="dl1">收益透明，结算高效，额度不设限</span></th>
          </tr>
        </table></th>
        <td>&nbsp;</td>
      </tr>
    </table></th>
  </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="_htmlHeadContent">
    <link rel="stylesheet" type="text/css" href="../CSS/login.css" />
    <%--此处添加MEAT标签、JS脚本和样式表的引用--%><%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%>
</asp:Content>
