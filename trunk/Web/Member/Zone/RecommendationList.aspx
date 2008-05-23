﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendationList.aspx.cs"
    Inherits="Web.Member.Zone.RecommendationList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
    .center {
    text-align:center
	}
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
            <HeaderTemplate>
                <tr>
                    <td style="width:120px;height: 32px;" class="center">
                        网站名称
                    </td>
                    <td style="width:120px" class="center">
                        添加时间
                    </td>
                    <td style="width:120px" class="center">
                        我的提成
                    </td>
                    <td style="width:auto" class="center">
                        网站地址
                    </td>
                    <td style="width:120px" class="center">
                        Alexa排名
                    </td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="center">
                        <a id="aSiteName" href='http://<%# Eval("SiteUrl") %>'><%# Eval("SiteName") %></a></td>
                    <td class="center">
                        <%# Eval("RegDate") %></td>
                    <td class="center">
                        我的提成？
                    </td>
                    <td>
                        <a id="a1" href='http://<%# Eval("SiteUrl") %>' target="_blank"><%# Eval("SiteUrl") %></a></td>
                    <td class="center">
                        Alexa排名
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT SiteName, SiteUrl, RegDate FROM Al_Site WHERE UserId = @UserId">
            <SelectParameters>
                <asp:Parameter Name="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>