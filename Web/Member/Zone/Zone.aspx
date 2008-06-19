<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zone.aspx.cs" Inherits="Web.Zone"
    EnableViewStateMac="false" MasterPageFile="/MasterPage/Member.Master" Title="广告位基本信息" %>

<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_htmlHeadContent">

    <script type="text/javascript" src="/JavaScript/jquery.js"></script>

    <link rel="Stylesheet" type="text/css" href="http://static.alimama.com/css/instance/module/sell.css" />
    <style type="text/css">
        p.group-cb
        {
            float: left;
            height: 250px;
            width: 180px;
        }
        .label-cr
        {
            float: none;
            display:block;
            width: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <table width="984" height="36" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle" background="/app_themes/new/images/menu.gif">
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="984" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle" background="/app_themes/new/images/menutwo.gif">
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="984" height="25" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="124" rowspan="2" background="/app_themes/new/images/ad.gif">
            </td>
            <td width="860" height="16">
            </td>
        </tr>
        <tr>
            <td width="860" height="9" background="/app_themes/new/images/adline.gif">
            </td>
        </tr>
    </table>
    <table width="984" height="39" border="0" align="center" cellpadding="0" cellspacing="0"
        background="/app_themes/new/images/ad4.gif">
        <tr>
            <td background="/app_themes/new/images/ad42.gif">
                &nbsp;
            </td>
            <td background="/app_themes/new/images/ad42.gif">
                &nbsp;
            </td>
            <td background="/app_themes/new/images/ad42.gif">
                &nbsp;
            </td>
            <td background="/app_themes/new/images/ad42.gif">
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="984" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="43" align="center" valign="middle" background="/app_themes/new/images/title2.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table width="984" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="242" height="30" align="right" valign="middle" class="tdblue">
                            广告位名称：
                        </td>
                        <td width="742" height="30" align="left" valign="middle" class="tdblue">
                            <input id="zonename" type="text" maxlength="32" size="40" value="" name="zonename" />
                            （例如：xxx网站顶部广告位）
                            <div class="inotice1">
                                广告位名称将显示给买家，好的名称有助于买家快速理解广告位价值，请认真填写，并且长度不要超过16个汉字</div>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="right" valign="middle" class="tdblue">
                            广告内容：
                        </td>
                        <td height="30" align="left" valign="middle" class="tdblue">
                            <label>
                                <input id="mediatype_text" type="checkbox" value="2" checked="checked" name="mediatype" />文字广告</label>
                            <label style="margin-left: 10px">
                                <input id="mediatype_picture" type="checkbox" value="5" checked="checked" name="mediatype" />图片/flash广告</label>
                            <span class="red">为了增加您的广告收益，建议保留文字广告形式。</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="right" valign="middle" class="tdblue">
                            广告位所在位置：
                        </td>
                        <td height="30" align="left" valign="middle" class="tdblue">
                            <label>
                                <input id="infirstpage_yes" type="radio" onclick="javascript:$('#<%= hdn_infirstpage.ClientID %>').val(this.value);"
                                    value="0" name="infirstpage" />在首页</label>
                            <label>
                                <input id="infirstpage_no" type="radio" onclick="javascript:$('#<%= hdn_infirstpage.ClientID %>').val(this.value);"
                                    checked="checked" value="1" name="infirstpage" />
                                不在首页</label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdblue">
                            选择广告位尺寸：
                        </td>
                        <td align="left" valign="middle" class="tdblue">
                            <div id="zonesizes" style="display: block;">
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="760x90">
                                        <input id="zonesize11" type="radio" onclick='setZoneSize("760x90", "1");' value="760x90"
                                            name="zonesize" />
                                        横幅广告 <span>760x90</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="468x60">
                                        <input id="zonesize12" type="radio" onclick='setZoneSize("468x60", "2");' value="468x60"
                                            name="zonesize" />
                                        横幅广告 <span>468x60</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x60">
                                        <input id="zonesize13" type="radio" onclick='setZoneSize("250x60", "3");' value="250x60"
                                            name="zonesize" />
                                        横幅广告 <span>250x60</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="728x90">
                                        <input id="zonesize14" type="radio" onclick='setZoneSize("728x90", "4");' value="728x90"
                                            name="zonesize" />
                                        横幅广告 <span>728x90</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="950x90">
                                        <input id="zonesize15" type="radio" onclick='setZoneSize("950x90", "5");' value="950x90"
                                            name="zonesize" />
                                        横幅广告 <span>950x90</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="120x600">
                                        <input id="zonesize21" type="radio" onclick='setZoneSize("120x600", "6");' value="120x600"
                                            name="zonesize" />
                                        垂直广告 <span>120x600</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="120x240">
                                        <input id="zonesize22" type="radio" onclick='setZoneSize("120x240", "7");' value="120x240"
                                            name="zonesize" />
                                        垂直广告 <span>120x240</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="160x600">
                                        <input id="zonesize23" type="radio" onclick='setZoneSize("160x600", "8");' value="160x600"
                                            name="zonesize" />
                                        垂直广告 <span>160x600</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="180x250">
                                        <input id="zonesize31" type="radio" onclick='setZoneSize("180x250", "9");' value="180x250"
                                            name="zonesize" />
                                        巨幅广告 <span>180x250</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x300">
                                        <input id="zonesize32" type="radio" onclick='setZoneSize("250x300", "10");' value="250x300"
                                            name="zonesize" />
                                        巨幅广告 <span>250x300</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="360x190">
                                        <input id="zonesize33" type="radio" onclick='setZoneSize("360x190", "11");' value="360x190"
                                            name="zonesize" />
                                        巨幅广告 <span>360x190</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x250">
                                        <input id="zonesize34" type="radio" onclick='setZoneSize("250x250", "12");' value="250x250"
                                            name="zonesize" />
                                        巨幅广告 <span>250x250</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="200x200">
                                        <input id="zonesize35" type="radio" onclick='setZoneSize("200x200", "13");' value="200x200"
                                            name="zonesize" />
                                        巨幅广告 <span>200x200</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="336x280">
                                        <input id="zonesize36" type="radio" onclick='setZoneSize("336x280", "14");' value="336x280"
                                            name="zonesize" />
                                        巨幅广告 <span>336x280</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="300x250">
                                        <input id="zonesize37" type="radio" onclick='setZoneSize("300x250", "15");' value="300x250"
                                            name="zonesize" />
                                        巨幅广告 <span>300x250</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="120x60">
                                        <input id="zonesize41" type="radio" onclick='setZoneSize("120x60", "16");' value="120x60"
                                            name="zonesize" />
                                        小幅广告 <span>120x60</span>
                                    </label>
                                </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdblue">
                            选择计费类型：
                        </td>
                        <td align="left" valign="middle" class="tdblue">
                            <table width="700" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="30" colspan="3">
                                        <label>
                                            <input id="transtype_click" type="radio" onclick='javascript:$("#<%= hdn_transtype.ClientID %>").val(this.value);'
                                                checked="checked" value="2" name="transtype" />
                                            按点击计费</label>
                                        <label>
                                            <input id="transtype_period" type="radio" onclick='javascript:$("#<%= hdn_transtype.ClientID %>").val(this.value);'
                                                value="5" name="transtype" />按时长计费</label>
                                        <input id="weekprice" type="text" onkeyup="return chkNum(this)" size="11" value="0"
                                            name="weekprice" />
                                        <span class="red">元/周</span>
                                        <br />
                                        <div style="display: none">
                                            <label>
                                                是否需要审核卖家广告：<input id="needAuditing_yes" type="radio" onclick="javascript:$('#<%= hdn_needauditing.ClientID %>').val(this.value);"
                                                    value="1" name="needAuditing" />
                                                需要审核
                                                <input id="needAuditing_no" type="radio" onclick="javascript:$('#<%= hdn_needauditing.ClientID %>').val(this.value);"
                                                    value="0" name="needAuditing" checked="" />
                                                不需要审核
                                            </label>
                                        </div>
                                        <div class="red">
                                        小贴士：当您的广告位未按周售出时,赢在广告将为您的网站选择合适的广告。广告计费类型和广告主在您的网站上投放策略有关，您可以在收益报表看到
                                    </td>
                                </tr>
                                <tr>
                                    <td width="207" height="30">
                                    </td>
                                    <td height="30" colspan="2">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="tdblue">
                            广告位描述：
                        </td>
                        <td align="left" valign="middle" class="tdblue">
                            <textarea id="zonedesp" rows="10" name="textarea" style="width: 750px;"></textarea>
                            <div class="inotice1">
                                例如：广告位的位置，大小，以及该广告位可以在站内所有读帖页展现，访问人群是什么，适合投哪类广告！</div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="984" height="50" border="0" align="center" cellpadding="0" cellspacing="0"
        bgcolor="#65BFEF">
        <tr>
            <td width="414" align="center" valign="middle">
                &nbsp;
            </td>
            <td width="164" align="center" valign="middle">
                <a id="btnCheck" onclick="javascript:doCheckAndNext();" href="javascript:doCheckAndNext();">
                    <img src="/app_themes/new/images/nextif.gif" width="164" height="32" border="0" usemap="#Map" /></a>
            </td>
            <td width="406" align="center" valign="middle">
                &nbsp;
            </td>
        </tr>
    </table>
    <map name="Map" id="Map">
        <area shape="rect" coords="2,3,166,38" href="#" />
    </map>
    <input id="hdn_dbaction" type="hidden" value="new" name="hdn_dbaction" runat="server" />
    <%--<input id="hdn_siteid" type="hidden" value="" name="hdn_siteid" runat="server" />--%>
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
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="_scriptContent">

    <script type="text/javascript">
    $(document).ready(initForm);

	function initForm(){
		$("#zonename").val($("#<%= hdn_zonename.ClientID %>").val());
		//mediatype
		var last_mediatype = $("#<%= hdn_mediatype.ClientID %>").val();
		if(last_mediatype == 2){
			$("#mediatype_text").attr("checked", "checked");
		} else if(last_mediatype == 5){
			$("#mediatype_picture").attr("checked", "checked");
		} else{ //默认值
			$("#mediatype_text").attr("checked", "checked");
			$("#mediatype_picture").attr("checked", "checked");
			$("#<%= hdn_mediatype.ClientID %>").val("7");
		}
		//transtype
		var last_transtype = $("#<%= hdn_transtype.ClientID %>").val();
		if (last_transtype == 7) {
			$("#transtype_period").attr("checked", "checked");
			$("#transtype_click").attr("checked", "checked");
		}
		else 
			if (last_transtype == 5) {
				$("#transtype_click").attr("checked", "checked");
			}
			else {  //默认值
				$("#transtype_period").attr("checked", "checked");
				$("#<%= hdn_transtype.ClientID %>").val("2");
			}
		//zonesize
		if($("#<%= hdn_zonesize.ClientID %>").val() != "") {
		    $("input[@value=" + $("#<%= hdn_zonesize.ClientID %>").val() +"]").attr("checked", "checked");
		}
		//weekprice
		$("#weekprice").val($("#<%= hdn_weekprice.ClientID %>").val());
		//zonedesp
		$("#zonedesp").val($("#<%= hdn_zonedesp.ClientID %>").val());
		//needauditing
		var last_needauditing = $("#<%= hdn_needauditing.ClientID %>").val();
		if(last_needauditing == 1) {
			$("#needauditing_yes").attr("checked", "checked");
		} else {    //默认值
		    $("#needauditing_no").attr("checked", "checked");
		    $("#<%= hdn_needauditing.ClientID %>").val("0");
		}
		
		//infirstpage
		var last_infirstpage = $("#<%= hdn_infirstpage.ClientID %>").val();
		if(last_infirstpage == 1){
			$("#infirstpage_yes").attr("checked", "checked");
		} else{ //默认值
			$("#infirstpage_no").attr("checked", "checked");
			$("#<%= hdn_infirstpage.ClientID %>").val("0");
		}
		
		if($("#<%= hdn_dbaction.ClientID %>").val() == "update"){
		    $("#btnCheck > span").text("提交");
		}
	}
		
    function checkForm(){
        //设置广告位名称#
        if (LenB($("#zonename").val()) <= 0) {
            alert("请填写广告位名称!");
            $("#zonename").focus();
            return false;
        }
        
        if (LenB($("#zonename").val()) > 32) {
            alert("广告位的名称请限定在16个汉字以内!");
            $("#zonename").focus();
            return false;
        }
        $("#<%= hdn_zonename.ClientID %>").val($("#zonename").val());
        
        var weekprice = $("#weekprice").val();
		//确保按时长价格有默认值
        if (weekprice.length < 1 || !$("#transtype_period").attr("checked")) {
            $("#weekprice").val(0);
        }
        if($("#transtype_period").attr("checked")) {
            if ((parseFloat(weekprice) < 0.05 || parseFloat(weekprice) > 1000000)) {
                alert("按时长价格请限定在0.05-1000000元/周");
                return false;
            }
        }
        var reg = /\.\d{3,}/
        if (reg.test(weekprice)) {
            alert("按时长价格请限定在小数点后两位！");
            return false;
        }
        $("#<%= hdn_weekprice.ClientID %>").val(weekprice);
        
        //设置广告位上的广告是否需要审核的选项
        if ($("#weekprice_period").attr("checked") && $("#<%= hdn_needauditing.ClientID %>").val() == "") {
            alert("请选择是否需要审核买家广告！");
            return false;
        }
        
        //设置计费类型
        function calcTranstype(){
            if ($("#transtype_click").attr("checked") && $("#transtype_period").attr("checked")) {
                return "7"; //按点击计费+按时长计费
            }
            else 
                if ($("#transtype_click").attr("checked")) {
                    return "5";
                }
                else 
                    if ($("#transtype_period").attr("checked")) {
                        return "2";
                    }
                    else {
                        return "";
                    }
        };
        $("#<%= hdn_transtype.ClientID %>").val(calcTranstype());
        if($("#<%= hdn_transtype.ClientID %>").val()==""){
	         alert("计费类型必须选择一种！");
	         return false;
        }
        
        //设置广告内容
        var calcMediatype = function(){
            if ($("#mediatype_text").attr("checked") && $("#mediatype_picture").attr("checked")) {
				return "7";
			}
			else {
				if ($("#mediatype_text").attr("checked")) {
					return "2";
				}
				else {
					if ($("#mediatype_picture").attr("checked")) {
						return "5";
					}
					else {
						return "";
					}
				}
			}
        };
        $("#<%= hdn_mediatype.ClientID %>").val(calcMediatype());
        if ($("#<%= hdn_mediatype.ClientID %>").val() == "") {
            alert("广告内容必须选择一种！");
            return false;
        }
        
        //设置广告位位置
        if ($("#<%= hdn_infirstpage.ClientID %>").val() == "") {
            alert("广告位位置必须选择！");
            return false;
        }
        
        //设置广告位尺寸
        var checkedFlag = function(){
            var zonesizes = $("[@name*=zonesize]");
            for (i = 0; i < zonesizes.length; i++) {
                if (zonesizes.get(i).checked) {
                    return true;
                }
            }
            return false;
        };
        if ($("#<%= hdn_zonesize.ClientID %> ").val() == "" || !checkedFlag()) {
            alert("广告位尺寸必须选择！");
            return false;
        }
        //设置广告位描述
        var resultBuffer = $("#zonedesp").val();
        if (LenB(resultBuffer) <= 0) {
            alert("请填写广告位描述!");
            $("#zonedesp").focus();
            return false;
        }
        if (LenB(resultBuffer) > 3999) {
            alert("广告位描述请不要超过最大长度(3999字符)限定!");
            $("#zonedesp").focus();
            return false;
        }
		//替换非法字符
        var p = new RegExp('<s' + 'cript[^>]*>[\\S\\s]*?<\\/s' + 'cript>|\\s*(?:onload)=(?:\'[^\']*\'|"[^"]*"|[^"\'\\s]*)', "ig");
        resultBuffer = resultBuffer.replace(p, "");
        $("#<%= hdn_zonedesp.ClientID %>").val(resultBuffer);
        
        return true;
    }
    
    function doCheckAndNext(){
        if($("#<%= hdn_dbaction.ClientID %>").val() == "new"){
            document.forms[0].action ="/Member/Zone/ZoneCategory.aspx?action=new";
            
            if (checkForm()) {
                document.forms[0].submit();
                return true;
            } else {
                return false;
            }
        } else {
            if (checkForm()) {
                //保存广告位信息
		        var kvp = {
			        zonename: $("#<%= hdn_zonename.ClientID %>").val(),
			        mediatype: $("#<%= hdn_mediatype.ClientID %>").val(),
			        infirstpage: $("#<%= hdn_infirstpage.ClientID %>").val(),
			        sizeid: $("#<%= hdn_sizeid.ClientID %>").val(),
			        transtype: $("#<%= hdn_transtype.ClientID %>").val(),
    //			    classids: $("#<%= hdn_classids.ClientID %>").val(),
    //			    keywords: $("#<%= hdn_keywords.ClientID %>").val(),
			        needauditing: $("#<%= hdn_needauditing.ClientID %>").val(),
			        zonedesp: $("#<%= hdn_zonedesp.ClientID %>").val(),
			        weekprice: $("#<%= hdn_weekprice.ClientID %>").val(),
			        dbaction: $("#<%= hdn_dbaction.ClientID %>").val()
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
    		    
		        //如果修改成功
		        document.location = "/Member/Zone/ZoneView.aspx";
		        return true;
		    } else {
		        return false;
		    }
        }
    }
    
    //当选择的广告位大小发生变化时，设置隐藏变量的值
    function setZoneSize(zonesize, sizeid){
        $("#<%= hdn_zonesize.ClientID %>").val(zonesize);
        $("#<%= hdn_sizeid.ClientID %>").val(sizeid);
    }    
    </script>

</asp:Content>
