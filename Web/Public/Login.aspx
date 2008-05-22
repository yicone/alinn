<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web.User.Login" masterpagefile="~/MasterPage/Global.Master" title="用户登录" %>

<asp:Content id="Content1" runat="Server" contentplaceholderid="_mainContent">
    <div id="main_login">
        <div class="lc">
            <dl>
                <dt class="sell" title="买广告 做推广"></dt>
                <dd>
                    <b>覆盖面广，</b>覆盖中国一半以上主流网民
                </dd>
                <dd>
                    <b>精准营销，</b>按地区、网站内容、人群特征进行定向投放
                </dd>
                <dd>
                    <b>灵活自主，</b>自由市场广告随意挑选，专业数据支持，实时优化效果
                </dd>
            </dl>
            <dl style="border-bottom-width: 0px">
                <dt class="buy" title="卖广告 来赚钱"></dt>
                <dd>
                    <b>免费交易，</b>提供免费广告发布软件
                </dd>
                <dd>
                    <b>自主定价，</b>流量收入最大化
                </dd>
                <dd>
                    <b>收益透明，</b>结算高效，额度不设限
                </dd>
            </dl>
        </div>
        <div class="rc">
            <div class="login_div">
                <div class="login_head">
                    欢迎登录阿里妈妈</div>
                <div class="login_right">
                    <div class="login_body">
                        <dl class="login_dl">
                            <dt>Email： </dt>
                            <dd style="_margin-bottom: 18px">
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
                            </dd>
                            <dt>登录密码： </dt>
                            <dd>
                                <asp:TextBox ID="txtPassword" runat="server" MaxLength="16" TextMode="Password" CssClass="text"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="密码不能为空" CssClass="Validator" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <input id="_fmm.l._0.lo" type="hidden" name="_fmm.l._0.lo" value="" />
                            </dd>
                            <dd id="wrongTip">
                            </dd>
                            <dd>
                                <input id="remember_password" type="checkbox" name="remember_password" value="true" /><label
                                    for="remember_password">在此计算机上记住密码</label>
                            </dd>
                            <dt></dt>
                            <dd>
                                <!--input class="login_sub" onfocus="this.blur()" onclick="return checkinput();" type="submit" name="dologin" value="" /-->
                                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="login_sub" />
                                <asp:HyperLink ID="linkGetPassWord" runat="server" NavigateUrl="/User/GetPassWord.aspx"
                                    CssClass="forget_password">忘记密码？
                                </asp:HyperLink>
                                <asp:Label ID="Label1" runat="server" Width="100px" ForeColor="Red"></asp:Label>
                            </dd>
                        </dl>
                        <div class="l_desc">
                            还没有阿里妈妈帐号？你只需要1分钟<br />
                            <a href="/User/Register.aspx">免费注册阿里奶奶</a>
                        </div>
                    </div>
                </div>
                <div class="login_bottom">
                </div>
            </div>
            <div class="login_div">
                <div class="login_top">
                </div>
                <div class="login_right">
                    <div class="login_body2">
                        <h3>
                            阿里旺旺</h3>
                        <p>
                            让您的网上沟通领先一步，集成了即时文字、语音视频、短信邮件、群等功能。<br />
                            <a href="http://www.taobao.com/wangwang/index.php">了解更多</a> <a href="http://www.taobao.com/wangwang/download.php">
                                免费下载旺旺&gt;&gt;</a></p>
                    </div>
                </div>
                <div class="login_bottom">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content id="Content2" runat="server" contentplaceholderid="_htmlHeadContent">
    <link rel="stylesheet" type="text/css" href="../App_Themes/login.css" />
    <%--此处添加MEAT标签、JS脚本和样式表的引用--%><%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%>
</asp:Content>
