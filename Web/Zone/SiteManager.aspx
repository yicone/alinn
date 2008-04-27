<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteManager.aspx.cs" Inherits="Web.SiteManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul id="treelist">
            <li>
                <asp:Button ID="btnAddSite" runat="server" Text="新增网站" OnClick="btnAddSite_Click" /></li>
            <li style="height:600px">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnDataBinding="DataList1_DataBinding">
                    <ItemTemplate>
                        <div class="title-bar" style="width:950px">
                            <asp:LinkButton Text="阿斯" runat="server" ID="df">网站名称：<%# Eval("SiteName") %>&nbsp;&nbsp;&nbsp;(共<%# Eval("ZoneCount") %>个广告位)&nbsp;&nbsp;&nbsp;<%# this.ConvertAuditState(Convert.ToInt32(Eval("AuditState"))) %> </asp:LinkButton></p>
                        </div>
                        <iframe id='<%# "siteiframe" + Eval("SiteId") %>' width="100%" scrolling="no" height="1" frameborder="0" src='<%# "ZoneManager.aspx?siteid=" + Eval("SiteId") %>'> 
                            <!--读取广告位列表-->
                        </iframe>
                    </ItemTemplate>
                </asp:DataList>
            </li>
        </ul>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="UP_GetSiteInfoExtForSiteManager" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
