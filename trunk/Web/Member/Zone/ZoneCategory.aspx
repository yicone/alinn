<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneCategory.aspx.cs" Inherits="Web.ZoneCategory"
    EnableViewStateMac="false" MasterPageFile="/MasterPage/Member.Master" Title="广告位分类" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="_htmlHeadContent">

    <script type="text/javascript" src="/JavaScript/jquery.js"></script>

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
                <td width="20%">
                    &nbsp;
                </td>
                <td colspan="2">
                    <br />
                    <asp:DropDownList ID="ddlParentCategory" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="ClassName" DataValueField="ClassId" Width="166px" AutoPostBack="True">
                    </asp:DropDownList>
                    <br />
                    <br />
                </td>
                <td width="20%">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:ListBox ID="lbUnselect" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName"
                        DataValueField="ClassId" Height="196px" Width="170px"></asp:ListBox>
                    <asp:ListBox ID="lbSelected" runat="server" Height="195px" Width="176px"></asp:ListBox>
                    <br />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnSelect" runat="server" Text="选择分类" OnClick="btnSelect_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnUnselect" runat="server" Text="取消选择" OnClick="btnUnselect_Click" />
                    <br />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <br />
                    设置广告位关键字：<asp:TextBox ID="txtKeywords" runat="server" Width="350px"></asp:TextBox>
                    <br />
                </td>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <br />
                    <input id="btnLast" type="button" value="上一步" onclick="return doCheckAndBack();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="btnNext" type="button" value="下一步：获取广告位代码" onclick="return doCheckAndSubmit('none');" /><br />
                    <br />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <input id="hdn_dbaction" type="hidden" value="new" name="hdn_dbaction" runat="server" />
    <input id="hdn_siteid" type="hidden" value="" name="hdn_siteid" runat="server" />
    <input id="hdn_sitename" type="hidden" value="" name="hdn_sitename" runat="server" />
    <input id="hdn_siteurl" type="hidden" value="" name="hdn_siteurl" runat="server" />
    <input id="hdn_mediatype" type="hidden" value="" name="hdn_mediatype" runat="server" />
    <input id="hdn_transtype" type="hidden" value="" name="hdn_transtype" runat="server" />
    <input id="hdn_sizeid" type="hidden" value="" name="hdn_sizeid" runat="server" />
    <input id="hdn_zonesize" type="hidden" value="" name="hdn_zonesize" runat="server" />
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
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="_scriptContent">

    <script type="text/javascript">
    $(document).ready(function(){
        if($("#<%= hdn_dbaction.ClientID %>").val() == "update"){
            $("#btnLast").css("visibility", "hidden");
            $("#btnNext").val("提交");
        }
    });
    
    function doCheckAndBack(){
        $("#<%= hdn_keywords.ClientID %>").val($("#<%= txtKeywords.ClientID %>").val());
        //very important!
        $("#<%= hdn_classids.ClientID %>").val($("#<%= hdn_classids.ClientID %>").val());
		
        document.forms[0].action = "/Member/Zone/Zone.aspx";
        document.forms[0].submit();
        return false;
    }
    
    function doCheckAndSubmit(returnPage){
        $("#<%= hdn_keywords.ClientID %>").val($("#<%= txtKeywords.ClientID %>").val());
         //very important!
        $("#<%= hdn_classids.ClientID %>").val($("#<%= hdn_classids.ClientID %>").val());
        		
        if($("#<%= hdn_dbaction.ClientID %>").val() == "new"){
		//保存广告位信息
		var kvp = {
		    zonename: $("#<%= hdn_zonename.ClientID %>").val(),
		    siteid: $("#<%= hdn_siteid.ClientID %>").val(),
		    mediatype: $("#<%= hdn_mediatype.ClientID %>").val(),
		    infirstpage: $("#<%= hdn_infirstpage.ClientID %>").val(),
		    sizeid: $("#<%= hdn_sizeid.ClientID %>").val(),
		    transtype: $("#<%= hdn_transtype.ClientID %>").val(),
		    classids: $("#<%= hdn_classids.ClientID %>").val(),
		    keywords: $("#<%= hdn_keywords.ClientID %>").val(),
		    needauditing: $("#<%= hdn_needauditing.ClientID %>").val(),
		    zonedesp: $("#<%= hdn_zonedesp.ClientID %>").val(),
		    weekprice: $("#<%= hdn_weekprice.ClientID %>").val(),
		    dbaction: $("#<%= hdn_dbaction.ClientID %>").val()
		}
		
		document.forms[0].action = "/Member/Zone/ZoneDesigner.aspx";
		} else {
		   var kvp = {
		       classids: $("#<%= hdn_classids.ClientID %>").val(),
		       keywords: $("#<%= hdn_keywords.ClientID %>").val(),
		       dbaction: $("#<%= hdn_dbaction.ClientID %>").val()
		   }
		   
		   document.forms[0].action = "/Member/Zone/ZoneView.aspx";
		}
        		
		var zoneId;
		$.ajax({
		    url: "/Public/ZoneInfoSaver.aspx",
		    type: "POST",
		    data: kvp,
		    async: false,
		    success: function(outZoneId){
		        zoneId = outZoneId;
		    }
		});
        
		alert(zoneId);
		//如果添加/修改成功
        document.forms[0].submit();
        return false;
    }
    </script>

</asp:Content>
