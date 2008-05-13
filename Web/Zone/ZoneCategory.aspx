<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneCategory.aspx.cs" Inherits="Web.ZoneCategory"
    EnableViewStateMac="false" MasterPageFile="../MasterPage/UserCommon.Master" Title="Untitled Page" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_headContent">
    <link type="text/css" href="../App_Themes/alinn.css" rel="stylesheet" />
    <link type="text/css" href="../App_Themes/myalinn.css" rel="stylesheet" />

    <script type="text/javascript" src="../App_Themes/jquery.js"></script>
    </asp:Content>
<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_mainContent">
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
                <br />
                <br />
                
                <table width="100%" border="0">
                  <tr>
                    <td width="20%">&nbsp;</td>
                    <td colspan="2"><br />
					<asp:DropDownList ID="ddlParentCategory" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="ClassName" DataValueField="ClassId" Width="166px" AutoPostBack="True">
                </asp:DropDownList>
                        <br />
                <br />
                </td>
                    <td width="20%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>
					<asp:ListBox ID="lbUnselect" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName"
                    DataValueField="ClassId" Height="196px" Width="170px"></asp:ListBox> <asp:ListBox ID="lbSelected" runat="server" Height="195px" Width="176px"></asp:ListBox>
                        <br />
                      </td>
                    <td> &nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><asp:Button ID="btnSelect" runat="server" Text="选择分类" OnClick="btnSelect_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnUnselect" runat="server" Text="取消选择" OnClick="btnUnselect_Click" />
                        <br />
                      </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
				   <tr>
                    <td>&nbsp;</td>
                    <td>
                        <br />
                        设置广告位关键字：<asp:TextBox ID="txtKeywords" runat="server" Width="350px"></asp:TextBox>
                        <br />
                       </td>
                    <td></td>
                    <td>&nbsp;</td>
                  </tr>
				  	<tr>
                    <td>&nbsp;</td>
                    <td>
                        <br />
                        <input id="Button3" type="button" value="上一步" onclick="return doCheckAndBack();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="Button2" type="button" value="下一步：获取广告位代码" onclick="return doCheckAndSubmit('none');" /><br />
                        <br />
                        </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                </table>
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
		//如果添加成功
		$("#hdn_zoneid").val(zoneId);
        document.form1.action = "ZoneDesigner.aspx";
        document.form1.submit();
        return false;
    }
    </script>

</asp:Content>
