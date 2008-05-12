<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageZone.aspx.cs" Inherits="Web.Admin.Zone.ManageZone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:GridView ID="gv_Zone" runat="server" DataSourceID="SqlDataSource2" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ZoneId">
            <Columns>
                <asp:BoundField DataField="ZoneId" HeaderText="ZoneId" ReadOnly="True" SortExpression="ZoneId" />
                <asp:BoundField DataField="ZoneName" HeaderText="ZoneName" SortExpression="ZoneName" />
                <asp:BoundField DataField="InFirst" HeaderText="InFirst" SortExpression="InFirst" />
                <asp:TemplateField HeaderText="SiteName" SortExpression="SiteName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SiteName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <a href="<%#Eval("SiteUrl") %>"><%# Eval("SiteName") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                       <a href="EditeZone.aspx?ZoneId=<%#Eval("ZoneId") %>">选择</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT AL_Zone.ZoneId, AL_Zone.ZoneName, AL_Zone.InFirst, AL_Site.SiteName, AL_Site.SiteUrl FROM AL_Zone LEFT OUTER JOIN AL_Site ON AL_Site.SiteId = AL_Zone.SiteId WHERE (AL_Zone.ZoneState = @ZoneState)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="ZoneState" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
