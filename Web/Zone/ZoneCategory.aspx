<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneCategory.aspx.cs" Inherits="Web.ZoneCategory"
    EnableViewStateMac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    function doCheckAndBack(){
        document.form1.action = "Zone.aspx";
        document.form1.submit();
        return false;
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlParentCategory" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="ClassName" DataValueField="ClassId" Width="166px" AutoPostBack="True"
                OnSelectedIndexChanged="ddlParentCategory_SelectedIndexChanged">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="UP_ZoneClass_GetZoneClassesByParentId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="-1" Name="ParentId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="UP_ZoneClass_GetZoneClassesByParentId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlParentCategory" DefaultValue="" Name="ParentId"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <p />
            <asp:ListBox ID="lbUnselect" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName"
                DataValueField="ClassId" Height="196px" Width="170px"></asp:ListBox>
            <asp:ListBox ID="lbSelected" runat="server" Height="195px" Width="176px"></asp:ListBox><p />
            <asp:Button ID="btnSelect" runat="server" Text="btnSelect" OnClick="btnSelect_Click" />
            设置广告位关键字：<asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox><p />
            <asp:Button ID="btnUnselect" runat="server" Text="btnUnselect" OnClick="btnUnselect_Click" />&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="上一步" OnClientClick="return doCheckAndBack();" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="下一步：获取广告位代码" /></div>
        <input id="returnzoneview" type="hidden" value="" name="returnzoneview" runat="server" />
        <input id="actioncontrol" type="hidden" value="addzone" name="actioncontrol" runat="server" />
        <input id="hdn_siteid" type="hidden" value="953317" name="hdn_siteid" runat="server" />
        <input id="hdn_sitename" type="hidden" value="aaa" name="hdn_sitename" runat="server" />
        <input id="hdn_siteurl" type="hidden" value="???" name="hdn_siteurl" runat="server" />
        <input id="hdn_zonecatids" type="hidden" value="" name="hdn_classids" runat="server" />
        <input id="hdn_mediatype" type="hidden" value="3" name="hdn_mediatype" runat="server" />
        <input id="hdn_transtype" type="hidden" value="3" name="hdn_transtype" runat="server" />
        <input id="hdn_zonesize" type="hidden" value="" name="hdn_zonesize" runat="server" />
        <input id="hdn_zoneid" type="hidden" value="0" name="hdn_zoneid" runat="server" />
        <input id="hdn_zonename" type="hidden" value="" name="hdn_zonename" runat="server" />
        <input id="hdn_weekprice" type="hidden" value="0" name="hdn_weekprice" runat="server" />
        <input id="hdn_zonedesp" type="hidden" value="" name="hdn_zonedesp" runat="server" />
        <input id="hdn_infirstpage" type="hidden" value="0" name="hdn_infirstpage" runat="server" />
        <input id="hdn_allowadultad" type="hidden" value="0" name="hdn_allowadultad" runat="server" />
        <input id="hdn_keywords" type="hidden" value="" name="hdn_keywords" runat="server" />
        <input id="hdn_recommendweekprice" type="hidden" value="" name="hdn_recommendweekprice"
            runat="server" />
        <input id="hdn_needauditing" type="hidden" value="0" name="hdn_needauditing" runat="server" />
        <input id="hdn_classids" type="hidden" value="" name="hdn_classids" runat="server" />
    </form>
</body>
</html>
