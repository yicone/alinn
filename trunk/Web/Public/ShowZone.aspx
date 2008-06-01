<%@ Page Language="C#" MasterPageFile="~/MasterPage/Global.Master" AutoEventWireup="true" CodeBehind="ShowZone.aspx.cs" Inherits="Web.ShowZone" Title="广告位" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <br />
    <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="text-align: center">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:Label ID="labZoneName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style="width:1024px; border-width:1px;">
                    <tr>
                        <td style="width:20%; text-align:left;">
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
                        <td style="width:60%; text-align:left;">
                            <br />
                            价格：<asp:Label ID="labWeekPrice" runat="server"></asp:Label>
                            元/周<br />
                            请选择购买时段：<br />
                            <br />
                            请选择开始时间：<asp:TextBox ID="txtStartDate" runat="server" 
                                ontextchanged="txtStartDate_TextChanged"></asp:TextBox>
                            ，请选择购买时长：<asp:DropDownList ID="ddlWeek" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="1">1周</asp:ListItem>
                                <asp:ListItem Value="2">2周</asp:ListItem>
                                <asp:ListItem Value="3">3周</asp:ListItem>
                                <asp:ListItem Value="4">4周</asp:ListItem>
                            </asp:DropDownList>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                                TargetControlID="txtStartDate">
                            </cc1:CalendarExtender>
                            <br />
    <asp:Button ID="btnBuyAd" runat="server" OnClick="btnBuyAd_Click" Text="购买广告" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnStore" runat="server" onclick="btnStore_Click" 
                                Text="收藏广告位" />
                        </td>
                        <td style="width:20%; text-align:left;">
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
                    <asp:Button ID="btnZoneInfo" runat="server" onclick="btnZoneInfo_Click" 
                    Text="广告位信息" />
                <asp:Button ID="btnZoneUrl" runat="server" onclick="btnZoneUrl_Click" 
                    Text="广告位出现的网址" />
                <asp:Button ID="btnOtherZone" runat="server" Text="该网站下其它广告位" 
        onclick="btnOtherZone_Click" />
                <asp:Button ID="btnLatestOrder" runat="server" Text="最近交易记录" 
        onclick="btnLatestOrder_Click" />
                <asp:Button ID="Button5" runat="server" Text="交易评价" />
                <asp:Button ID="Button6" runat="server" Text="相关广告位推荐" />
                <asp:Button ID="Button7" runat="server" Text="留言" />
    <asp:MultiView ID="mvZoneInfo" runat="server">
        <asp:View ID="View1" runat="server">
            <table  style="width:1024px; border-width:thin;">
        <tr>
            <td>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                广告位类目：<asp:Label ID="labZoneClass" runat="server"></asp:Label><br />
                是否需要审核：<asp:Label ID="labCheck" runat="server"></asp:Label><br />
                是否在首页：<asp:Label ID="labInfirst" runat="server"></asp:Label><br />
                关键字：<asp:Label ID="labKeywords" runat="server"></asp:Label><br />
                网站描述：<asp:Label ID="labDescription" runat="server"></asp:Label><br />
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
        </asp:View>
        <asp:View ID="View2" runat="server">
            2
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:GridView ID="gvOtherZone" runat="server">
                <Columns>
                    <asp:BoundField DataField="ZoneName" />
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <asp:GridView ID="gvLatestOrder" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OrderId" DataSourceID="sdsLatestOrder">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="OrderId" ReadOnly="True" 
                        SortExpression="OrderId" />
                    <asp:BoundField DataField="OrderName" HeaderText="OrderName" 
                        SortExpression="OrderName" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" 
                        SortExpression="UserId" />
                    <asp:BoundField DataField="AdId" HeaderText="AdId" SortExpression="AdId" />
                    <asp:BoundField DataField="ZoneId" HeaderText="ZoneId" 
                        SortExpression="ZoneId" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                        SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                        SortExpression="EndDate" />
                    <asp:BoundField DataField="AuditState" HeaderText="AuditState" 
                        SortExpression="AuditState" />
                    <asp:BoundField DataField="PerPoint" HeaderText="PerPoint" 
                        SortExpression="PerPoint" />
                    <asp:BoundField DataField="EverydayPrice" HeaderText="EverydayPrice" 
                        SortExpression="EverydayPrice" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Payment" HeaderText="Payment" 
                        SortExpression="Payment" />
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" 
                        SortExpression="CreateDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsLatestOrder" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [AL_Order] WHERE ([ZoneId] = @ZoneId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ZoneId" QueryStringField="ZoneId" 
                        Type="Object" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="_htmlHeadContent">

        <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
        <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%> 
</asp:Content>

