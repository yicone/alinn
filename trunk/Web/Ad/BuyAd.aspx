<%@ Page Language="C#" MasterPageFile="~/MasterPage/BuyCommon.Master" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="BuyAd.aspx.cs" Inherits="Web.Ad.BuyAd" Title="无标题页" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="../App_Themes/jquery.js"></script>
<script language="javascript" type="text/javascript">
function addAd()
{
eval("document.getElementById('<%=btnAddTextAd.ClientID %>').click();");
}
</script>
<table width="100%%" border="1">
  <tr>
    <td>广告计划：
        <asp:Label ID="labBuyAdName" runat="server" Width="339px"></asp:Label>
<asp:Button ID="btnAddTextAd" runat="server" OnClick="btnAddTextAd_Click" CssClass="hidden" BorderStyle="None" BorderWidth="0px" Height="0px" Width="0px"/>
</td>
  </tr>
</table>
<table width="100%%" border="1">
  <tr>
    <td style="width: 185px">&nbsp;<asp:LinkButton ID="lbtnAddGroup" runat="server" OnClick="lbtnAddGroup_Click">新建广告组</asp:LinkButton></td>
    <td style="text-align: center">&nbsp;<span class="B" style="font-size: 14px">从已有广告组中选择</span></td>
  </tr>
  <tr>
    <td colspan="2">
        <asp:DataList ID="dlAdGroup" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" OnItemCommand="dlAdGroup_ItemCommand" OnItemDataBound="dlAdGroup_ItemDataBound" DataKeyField="AdGroupId">
            <ItemTemplate>
            <table width="100%" border="1">
  <tr>
    <td>&nbsp;广告组名：<asp:Label ID="labGroupName" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label></td>
  </tr>
  <tr>
    <td>&nbsp;类目：<asp:Label ID="labClassName" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>&nbsp;关键字：<asp:Label ID="labKeywords" runat="server" Text='<%# Eval("KeyWords") %>'></asp:Label></td>
  </tr>
  <tr>
    <td>&nbsp;广告牌：</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="text-align: center">&nbsp;<asp:Button ID="btnSelect" runat="server" Text="选择" CommandName="Buy" />
        <asp:Button ID="Button1" runat="server" CommandName="AD" Text="Button" /></td>
  </tr>
</table>
            </ItemTemplate>
        </asp:DataList>
        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%">
        </webdiyer:AspNetPager>
    </td>
  </tr>
</table>
</asp:Content>
