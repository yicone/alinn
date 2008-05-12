<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAd.aspx.cs" Inherits="Web.Admin.ManageAd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gv_ad" runat="server" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="AdId">
            <Columns>
                <asp:BoundField DataField="AdId" HeaderText="AdId" ReadOnly="True" SortExpression="AdId" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                <asp:BoundField DataField="SizeId" HeaderText="SizeId" SortExpression="SizeId" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="EditeAd.aspx?AdId=<%#Eval("AdId") %>">选择</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [AL_Ad] WHERE ([AuditState] = @AuditState)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="AuditState" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
