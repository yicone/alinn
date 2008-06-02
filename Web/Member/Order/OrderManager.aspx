<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Web.Member.Order.OrderManger" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
    <asp:Button ID="btnTimeAd" runat="server" onclick="btnTimeAd_Click" 
        Text="按时长计费广告" />
    <asp:Button ID="btnPointAd" runat="server" onclick="btnPointAd_Click" 
        Text="按点击计费广告" />
    <asp:MultiView ID="mvOrder" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="gvTimeOrder" runat="server" AllowPaging="True" PageSize="20">
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
