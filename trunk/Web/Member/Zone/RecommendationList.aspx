<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecommendationList.aspx.cs"
    Inherits="Web.Member.Zone.RecommendationList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .center
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SampleDataList" style="text-align:left">
        <asp:DataList ID="DataList1" SkinID="SampleDataList" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table>
                    <tr>
                        <td style="width: 120px" class="center baibiao">
                            网站名称
                        </td>
                        <td style="width: 120px" class="center baibiao">
                            添加时间
                        </td>
                        <td style="width: 120px" class="center baibiao">
                            我的提成
                        </td>
                        <td style="width: 435px" class="center baibiao">
                            网站地址
                        </td>
                        <td style="width: 120px" class="center baibiao">
                            Alexa排名
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td style="width: 120px;">
                            <a id="aSiteName" href='http://<%# Eval("SiteUrl") %>'>
                                <%# Eval("SiteName") %></a>
                        </td>
                        <td style="width: 120px" class="center">
                            <%# Eval("RegDate") %>
                        </td>
                        <td style="width: 120px" class="center">
                            我的提成？
                        </td>
                        <td style="width:435px" class="center">
                            <a id="a1" href='http://<%# Eval("SiteUrl") %>' target="_blank">
                                <%# Eval("SiteUrl") %></a>
                        </td>
                        <td style="width: 120px" class="center">
                            Alexa排名
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT SiteName, SiteUrl, RegDate FROM Al_Site WHERE UserId = @UserId">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
