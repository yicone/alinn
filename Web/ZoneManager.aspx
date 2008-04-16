<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneManager.aspx.cs" Inherits="Web.ZoneManager" %>

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
            <li>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="title-bar">
                            <asp:LinkButton Text="阿斯" runat="server" ID="df">网站名称：<%# Eval("SiteName") %> (共<%# this.ZoneCount %>个广告位)  <%# Eval("AuditState") %></asp:LinkButton></p>
                        </div>
                        <iframe>
                            <!--读取广告位列表-->
                        </iframe>
                    </ItemTemplate>
                </asp:DataList>
            </li>
        </ul>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
