<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Web.Controls.Search" %>
<asp:TextBox ID="txtKeyWord" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
    DataSourceID="SqlDataSource1" DataTextField="ClassName" 
    DataValueField="ClassId" Width="100px">
</asp:DropDownList>
&nbsp;
<asp:ImageButton ID="btnSearch" runat="server" onclick="btnSearch_Click" 
    Text="搜索" ImageUrl="~/App_Themes/new/images/a006.jpg" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT [ClassId], [ClassName], [ParentId] FROM [AL_ZoneClass] WHERE ([ParentId] = @ParentId)">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="ParentId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
