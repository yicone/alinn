<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Web.Controls.Header" %>
<div id="top">
    <div id="top1">
        <div id="logo">
            <a href="/"><span style="display:none">阿里奶奶 alinn.com</span></a>
        </div>
        <div id="topright">
            <div id="login">
                <div class="login">
                    欢迎您！ [<a href="/User/Login.aspx" target="_self">登录</a>]或[<a href="/User/Register.aspx" target="_self">注册</a>]</div>
                <div class="profile">
                    <ul>
                        <li><a href="/MyAlinn.aspx">我的阿里奶奶</a></li>
                        <li><a href="#" target="_blank">QQ</a></li>
                        <li><a href="#" target="_blank">财富通</a></li>
                    </ul>
                </div>
            </div>
            <div id="menu">
                <ul>
                    <li><a href="/Ad/AdList.aspx" target="_self">买广告</a></li>
                    <li><a href="#" target="_self">卖广告</a></li>
                    <li><a href="#" target="_self">网站推广</a></li>
                    <li><a href="#" target="_self">社区</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
