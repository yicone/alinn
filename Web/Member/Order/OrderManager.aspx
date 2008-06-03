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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:MultiView ID="mvOrder" runat="server">
        <asp:View ID="View1" runat="server">
        <br />
            创建时间：<asp:DropDownList ID="ddlTime" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">所有时间</asp:ListItem>
                <asp:ListItem Value="1">最近三天</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">最近一周</asp:ListItem>
                <asp:ListItem Value="3">最近一月</asp:ListItem>
                <asp:ListItem Value="4">最近三个月</asp:ListItem>
            </asp:DropDownList><br />
            <asp:GridView ID="gvTimeOrder" runat="server" AllowPaging="True" PageSize="20">
            </asp:GridView>
            
        </asp:View>
          <asp:View ID="View2" runat="server">
          </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
