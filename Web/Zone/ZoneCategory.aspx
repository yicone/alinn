<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneCategory.aspx.cs" Inherits="Web.ZoneCategory"
    EnableViewStateMac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../App_Themes/alinn.css" rel="stylesheet" />
    <link type="text/css" href="../App_Themes/myalinn.css" rel="stylesheet" />

    <script type="text/javascript" src="../App_Themes/jquery.js"></script>

    <script type="text/javascript">
    function doCheckAndBack(){
        $("#hdn_keywords").val($("#txtKeywords").val());
        //very important!
       //$("#hdn_classids").val($("#hdn_classids").val());
		
        document.form1.action = "Zone.aspx";
        document.form1.submit();
        return false;
    }
    
    function doCheckAndSubmit(returnPage){
       $("#hdn_keywords").val($("#txtKeywords").val());
        //very important!
       $("#hdn_classids").val($("#hdn_classids").val());
		
		//保存广告位信息
		var kvp = {
		    zoneid: $("#hdn_zoneid").val(),
			zonename: $("#hdn_zonename").val(),
			userid: $("#hdn_userid").val(),
			siteid: $("#hdn_siteid").val(),
			mediatype: $("#hdn_mediatype").val(),
			infirstpage: $("#hdn_infirstpage").val(),
			sizeid: $("#hdn_sizeid").val(),
			transtype: $("#hdn_transtype").val(),
			classids: $("#hdn_classids").val(),
			keywords: $("#hdn_keywords").val(),
			needauditing: $("#hdn_needauditing").val(),
			zonedesp: $("#hdn_zonedesp").val(),
			weekprice: $("#hdn_weekprice").val()
		}
		
		var zoneId;
		$.ajax({
			url: "ZoneInfoSaver.aspx",
			type: "POST",
			data: kvp,
			async: false,
			success: function(outZoneId){
				zoneId = outZoneId;
			}
		});
		
		alert(zoneId);
		$("#hdn_zoneid").val(zoneId);
        document.form1.action = "ZoneDesigner.aspx";
        document.form1.submit();
        return false;
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="UP_ZoneClass_GetZoneClassesByParentId" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="ParentId" Type="Int32" />
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
            <div style="width: 800px;">
                <div>
                    <asp:DropDownList ID="ddlParentCategory" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="ClassName" DataValueField="ClassId" Width="166px" AutoPostBack="True">
                    </asp:DropDownList></div>
                <div>
                    <asp:ListBox ID="lbUnselect" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName"
                        DataValueField="ClassId" Height="196px" Width="170px"></asp:ListBox></div>
            </div>
            <div>
                <asp:ListBox ID="lbSelected" runat="server" Height="195px" Width="176px"></asp:ListBox>
                <asp:Button ID="btnSelect" runat="server" Text="btnSelect" OnClick="btnSelect_Click" />
                设置广告位关键字：<asp:TextBox ID="txtKeywords" runat="server"></asp:TextBox><p />
                <asp:Button ID="btnUnselect" runat="server" Text="btnUnselect" OnClick="btnUnselect_Click" />
            </div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <input id="Button3" type="button" value="上一步" onclick="return doCheckAndBack();" />
            <input id="Button2" type="button" value="下一步：获取广告位代码" onclick="return doCheckAndSubmit('none');" />
        </div>
        <input id="returnzoneview" type="hidden" value="" name="returnzoneview" runat="server" />
        <input id="actioncontrol" type="hidden" value="addzone" name="actioncontrol" runat="server" />
        <input id="hdn_siteid" type="hidden" value="" name="hdn_siteid" runat="server" />
        <input id="hdn_sitename" type="hidden" value="" name="hdn_sitename" runat="server" />
        <input id="hdn_siteurl" type="hidden" value="" name="hdn_siteurl" runat="server" />
        <input id="hdn_mediatype" type="hidden" value="" name="hdn_mediatype" runat="server" />
        <input id="hdn_transtype" type="hidden" value="" name="hdn_transtype" runat="server" />
        <input id="hdn_sizeid" type="hidden" value="" name="hdn_sizeid" runat="server" />
        <input id="hdn_zonesize" type="hidden" value="" name="hdn_zonesize" runat="server" />
        <input id="hdn_zoneid" type="hidden" value="" name="hdn_zoneid" runat="server" />
        <input id="hdn_zonename" type="hidden" value="" name="hdn_zonename" runat="server" />
        <input id="hdn_weekprice" type="hidden" value="" name="hdn_weekprice" runat="server" />
        <input id="hdn_zonedesp" type="hidden" value="" name="hdn_zonedesp" runat="server" />
        <input id="hdn_infirstpage" type="hidden" value="" name="hdn_infirstpage" runat="server" />
        <input id="hdn_allowadultad" type="hidden" value="" name="hdn_allowadultad" runat="server" />
        <input id="hdn_keywords" type="hidden" value="" name="hdn_keywords" runat="server" />
        <input id="hdn_recommendweekprice" type="hidden" value="" name="hdn_recommendweekprice"
            runat="server" />
        <input id="hdn_needauditing" type="hidden" value="" name="hdn_needauditing" runat="server" />
        <input id="hdn_classids" type="hidden" value="" name="hdn_classids" runat="server" />
    </form>
</body>
</html>
