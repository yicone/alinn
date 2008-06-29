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
        
        
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="f2" scope="col">选择广告位类目</th>
    <th width="829" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="135" height="30" background="/images/yh08.gif" class="bu04" scope="col">1. 选择网站 </th>
    <th width="31" background="/images/yh08.gif" class="bu10" scope="col">→</th>
    <th width="147" background="/images/yh08.gif" class="bu04" scope="col">2. 填写广告位信息</th>
    <th width="37" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="157" background="/images/yh08.gif" class="f4" scope="col">3. 选择广告位类目 </th>
    <th width="75" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="354" align="left" background="/images/yh08.gif" class="bu04" scope="col">4. 获取广告位代码 </th>
  </tr>
</table><br />
<table width="936" height="375" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#C2EAFD">
  <tr>
    <th height="40" colspan="2" scope="col"><table width="936" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="32" bgcolor="#EFF4FA" scope="col"><img src="/images/yh19.gif" width="15" height="13" /></th>
        <th width="904" align="left" bgcolor="#EFF4FA" scope="col"><span class="bu03"><span class="bu03">选择广告位类目</span><span class="f3">(以下为必填项</span><span class="f3">)</span></span></th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th width="180" valign="top" bgcolor="#EFF4FA" scope="row"><table width="128" height="141" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="128" height="30" align="right" bgcolor="#FFFFCC" class="bu04">选择广告位类目：</td>
      </tr>
      <tr>
        <td height="17" align="center" valign="middle" bgcolor="#FFFFCC" class="bu08">必选，最多可选两项</td>
      </tr>
      <tr>
        <td height="94" align="left" valign="top" class="d3">说明：<br />
          &nbsp;&nbsp;&nbsp; 玫瑰在稻田里也会被视为杂草，请根据您的网站内容正确选择分类 </td>
      </tr>
    </table></th>
    <th width="756" scope="row">
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
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </th>
  </tr>
  <tr>
    <th height="50" valign="top" bgcolor="#EFF4FA" scope="row"><table width="128" height="118" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td width="128" height="18" align="right" bgcolor="#FFFFCC" class="bu04">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" bgcolor="#FFFFCC" class="bu04">设置广告们关键字：</td>
      </tr>
      
      <tr>
        <td height="76" align="left" valign="top" class="d3">说明：<br />
          &nbsp;&nbsp;&nbsp;&nbsp;合适的关键字能加大被广告主搜索到的机会哦 </td>
      </tr>
    </table></th>
    <th height="120" valign="top" scope="row"><table width="400" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td height="15">&nbsp;
       </td>
      </tr>
      <tr>
        <td height="15"><asp:TextBox ID="txtKeywords" runat="server" Width="350px"></asp:TextBox></td>
      </tr>
      <tr>
        <td height="52" class="d3">&nbsp;关键字最多输入8个，每个关键字最长为8个汉字，可以输入数字及字&nbsp;母，关键字之间请用半角逗号分隔。例如：手机，数码，智能</td>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="50" colspan="2" bgcolor="#EFF4FA" scope="row"><table width="936" height="50" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th scope="col">&nbsp;</th>
        <th scope="col" style="text-align:center;">
                            <input id="btnLast" type="button" value="上一步" onclick="return doCheckAndBack();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="btnNext" type="button" value="下一步：获取广告位代码" onclick="return doCheckAndSubmit('none');" />
                    </th>
        <th scope="col">&nbsp;</th>
      </tr>
    </table></th>
  </tr>
</table>
        

    </div>
    <input id="hdn_dbaction" type="hidden" value="new" name="hdn_dbaction" runat="server" />
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
		
        document.forms[0].action = "/Member/Zone/Zone.aspx?action=new";
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
		    url: "/Member/Zone/ZoneInfoSaver.aspx",
		    type: "POST",
		    data: kvp,
		    async: false,
		    success: function(outZoneId){
		        zoneId = outZoneId;
		    }
		});
        
//		alert(zoneId);
		//如果添加/修改成功
        document.forms[0].submit();
        return false;
    }
    </script>

</asp:Content>
