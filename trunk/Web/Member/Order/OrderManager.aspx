<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Web.Member.Order.OrderManger" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 1024px; border-width:thin;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
    <div style="text-align:left;">
    <asp:Button ID="btnTimeAd" runat="server" onclick="btnTimeAd_Click" 
        Text="按时长计费广告" />
    <asp:Button ID="btnPointAd" runat="server" onclick="btnPointAd_Click" 
        Text="按点击计费广告" />
        </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:MultiView ID="mvOrder" runat="server">
        <asp:View ID="View1" runat="server">
        <br />
           <div style="text-align:left;"> 创建时间：<asp:DropDownList ID="ddlTime" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">所有时间</asp:ListItem>
                <asp:ListItem Value="1">最近三天</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">最近一周</asp:ListItem>
                <asp:ListItem Value="3">最近一月</asp:ListItem>
                <asp:ListItem Value="4">最近三个月</asp:ListItem>
            </asp:DropDownList><br />
            <br /></div>
            <asp:DataList ID="dlTimeOrder" runat="server">
                <ItemTemplate>
                      <table cellpadding="0" cellspacing="0" class="style1">
                          <tr>
                              <td style="width:25%">
                                  站点：<asp:Label ID="labSite0" runat="server" Text='<%# Eval("SiteName") %>'></asp:Label>
                                  <br />
                                  广告位：<asp:Label ID="labZone0" runat="server" Text='<%# Eval("ZoneName") %>'></asp:Label>
                                  <br />
                                  所属计划：<asp:Label ID="labOrderName0" runat="server" 
                                      Text='<%#  Eval("OrderName") %>'></asp:Label>
                                  <br />
                                  交易：</td>
                              <td style="width:15%">
                                  <%# Eval("StartDate") %>起<br />
                                  <%# Eval("EndDate") %>止</td>
                              <td style="width:15%">
                                  <%# Eval("GroupName") %></td>
                              <td style="width:5%">
                                  <%# Eval("Price") %>元</td>
                              <td style="width:10%">
                                 <%# Eval("PV") %></td>
                              <td style="width:5%">
                                  <%# Eval("PointNum") %></td>
                              <td style="width:5%">
                                  <%# Eval("TodayPrice") %></td>
                              <td style="width:10%">
                                  <asp:Label ID="labState0" runat="server" ForeColor="Red" 
                                      Text=' <%# GetAuditStateMeaning(Convert.ToInt32(Eval("AuditState")))%>' 
                                      Width="100%"></asp:Label>
                              </td>
                              <td style="width:10%">
                                  操作</td>
                          </tr>
                      </table>
                </ItemTemplate>
                <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td style="width:25%;">
广告组详情</td>
                            <td style="width:15%;">
                               起始日期</td>
                            <td style="width:15%;">
                                所属广告组</td>
                            <td style="width:5%;">
                                金额</td>
                            <td style="width:10%;">
                                浏览量</td>
                            <td style="width:5%;">
                                点击量</td>
                            <td  style="width:5%;">
                                &nbsp;</td>
                            <td style="width:10%;">
广告组状态                                 </td>
                            <td style="width:10%;">
                                操作</td>
                        </tr>
                    </table>
                </HeaderTemplate>
            </asp:DataList>
            
        </asp:View>
          <asp:View ID="View2" runat="server">
              <asp:DataList ID="dlPointOrder" runat="server">
                <ItemTemplate>
                      <table cellpadding="0" cellspacing="0" class="style1">
                          <tr>
                              <td style="width:25%">
                                  站点：<asp:Label ID="labSite0" runat="server" Text='<%# Eval("SiteName") %>'></asp:Label>
                                  <br />
                                  广告位：<asp:Label ID="labZone0" runat="server" Text='<%# Eval("ZoneName") %>'></asp:Label>
                                  <br />
                                  所属计划：<asp:Label ID="labOrderName0" runat="server" 
                                      Text='<%#  Eval("OrderName") %>'></asp:Label>
                                  <br />
                                  交易：</td>
                              <td style="width:15%">
                                  <%# Eval("StartDate") %>起<br />
                                  <%# Eval("EndDate") %>止</td>
                              <td style="width:15%">
                                  <%# Eval("GroupName") %></td>
                              <td style="width:5%">
                                  <%# Eval("Price") %>元</td>
                              <td style="width:10%">
                                 <%# Eval("PV") %></td>
                              <td style="width:5%">
                                  <%# Eval("PointNum") %></td>
                              <td style="width:5%">
                                  <%# Eval("TodayPrice") %></td>
                              <td style="width:10%">
                                  <asp:Label ID="labState0" runat="server" ForeColor="Red" 
                                      Text=' <%# GetAuditStateMeaning(Convert.ToInt32(Eval("AuditState")))%>' 
                                      Width="100%"></asp:Label>
                              </td>
                              <td style="width:10%">
                                  操作</td>
                          </tr>
                      </table>
                </ItemTemplate>
                <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td style="width:25%;">
广告组详情</td>
                            <td style="width:15%;">
                               起始日期</td>
                            <td style="width:15%;">
                                所属广告组</td>
                            <td style="width:5%;">
                                金额</td>
                            <td style="width:10%;">
                                浏览量</td>
                            <td style="width:5%;">
                                点击量</td>
                            <td  style="width:5%;">
                                &nbsp;</td>
                            <td style="width:10%;">
广告组状态                                 </td>
                            <td style="width:10%;">
                                操作</td>
                        </tr>
                    </table>
                </HeaderTemplate>
              </asp:DataList>
          </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
