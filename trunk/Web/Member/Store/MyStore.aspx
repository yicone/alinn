<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="MyStore.aspx.cs" Inherits="Web.Member.Store.MyStore" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
    <asp:GridView ID="gvStores" runat="server" AutoGenerateColumns="False" 
        Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="广告位名称">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ZoneName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <a href="/Public/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>"><%# Eval("ZoneName") %></a>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="广告位描述" >
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="收藏日期" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="15%" />
            </asp:BoundField>
        </Columns>
</asp:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
