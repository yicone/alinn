﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage/Global.Master" AutoEventWireup="true" CodeBehind="ShowZone.aspx.cs" Inherits="Web.ShowZone" Title="广告位" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <br />
    <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="labZoneName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td style="width:20%">
                            <asp:DataList ID="dlSiteOwerInfo" runat="server">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td colspan="2" style="text-align: center">
                                                网站主信息</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                网站主：</td>
                                            <td>
                                                <asp:Label ID="labSiteOwner" runat="server" Text='<%# Eval("NickName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                网站主信用：</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                广告主信用：</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                注册时间：</td>
                                            <td>
                                                <asp:Label ID="labRegTime" runat="server" Text='<%# Eval("RegTime") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                联系站主：</td>
                                            <td>
                                                <a href="tencent://message/?uin=<%# Eval("QQ") %>&Site=<%# Eval("NickName") %>&Menu=yes" target="blank"><img src="http://wpa.qq.com/pa?p=1:1363036:7" alt="联系我吧？"></a>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td>
                            <br />
                            价格：<asp:Label ID="labWeekPrice" runat="server"></asp:Label>
                            元/周<br />
                            请选择购买时段：<asp:Calendar ID="caldBuyDate" runat="server" SelectionMode="DayWeek" 
                                Width="219px"></asp:Calendar>
    <asp:Button ID="btnBuyAd" runat="server" OnClick="btnBuyAd_Click" Text="购买广告" />
                        </td>
                        <td style="width:20%">
                            <asp:DataList ID="dlSiteInfo" runat="server">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" 
    style="width: 100%">
                                        <tr>
                                            <td colspan="2">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                网站名：</td>
                                            <td>
                                                <asp:Label ID="labSiteName" runat="server" Text='<%# Eval("SiteName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                广告位：</td>
                                            <td>
                                                <asp:Label ID="labZoneName" runat="server" Text='<%# Eval("ZoneName") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                尺寸：</td>
                                            <td>
                                                <asp:Label ID="labSize" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                位置：</td>
                                            <td>
                                                <asp:Label ID="labInfirst" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                广告位类目：<asp:Label ID="labClass" runat="server"></asp:Label><br />
                是否需要审核：<asp:Label ID="labCheck" runat="server"></asp:Label><br />
                是否在首页：<asp:Label ID="labInfirst" runat="server"></asp:Label><br />
                关键字：<asp:Label ID="labKeywords" runat="server"></asp:Label><br />
                网站描述：<asp:Label ID="Description" runat="server"></asp:Label><br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="_htmlHeadContent">

        <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
        <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%><style type="text/css">                                                      .style1
                                                      {
                                                          width: 100%;
                                                      }
                                                  </style>
</asp:Content>

