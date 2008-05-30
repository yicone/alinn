<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Web.Controls.Header" %>
<div id="top">
    <div id="top1">
        <div id="logo">
            <a href="/"><span style="display: none">阿里奶奶 alinn.com</span></a>
        </div>
        <div id="topright">
            <div id="login">
                <div class="login">
                    欢迎您！
                    <asp:HyperLink ID="hlLogin" runat="server" >[登录]</asp:HyperLink>或
                    <asp:LinkButton ID="lbRegister" runat="server" OnClick="LinkButton1_Click">[注册]</asp:LinkButton>
                </div>
                <div class="profile">
                    <ul>
                        <li><a href="/Member/MyAlinn.aspx">我的阿里奶奶</a></li>
                        <li><a href="#" target="_blank">QQ</a></li>
                        <li><a href="#" target="_blank">财富通</a></li>
                    </ul>
                </div>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="/Public/AdList.aspx" target="_self">买广告</a></li>
                    <li><a href="/Member/Zone/ZoneCategory.aspx" target="_self">卖广告</a></li>
                    <li><a href="#" target="_self">网站推广</a></li>
                    <li><a href="#" target="_self">社区</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
