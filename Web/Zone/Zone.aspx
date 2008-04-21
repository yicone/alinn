<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Zone.aspx.cs" Inherits="Web.Zone" EnableViewStateMac="false"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
    <link type="text/css" href="../App_Themes/alinn.css" rel="stylesheet" />
    <link type="text/css" href="../App_Themes/myalinn.css" rel="stylesheet" />
    <script type="text/javascript" src="../App_Themes/common.js"></script>
    <script type="text/javascript" src="../App_Themes/jquery.js"></script>

    <style type="text/css">
    p.group-cb {
        float:left;
        height:250px;
        width:180px;
    }
    .form-section2 p.group-cb .label-cr {
        float:none;
        width:170px;
    }
    </style>
</head>
<body>

    <script type="text/javascript">
	function LenB(str){
		return str.replace(/[^\x00-\xff]/g,"**").length;
	}
		
    function checkForm(){
        //设置广告位名称
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
        $("#hdn_zonename").val($("#zonename").val());
        
        var weekprice = $("#weekprice").val();
		//确保按时长价格有默认值
        if (weekprice.length < 1 || !$("#transtype_period").attr("checked")) {
            $("#weekprice").val(0);
        }
        if ((parseFloat(weekprice) < 0.05 || parseFloat(weekprice) > 1000000) && $("#transtype_period").attr("checked")) {
            alert("按时长价格请限定在0.05-1000000元/周");
            return false;
        }
        var reg = /\.\d{3,}/
        if (reg.test(weekprice)) {
            alert("按时长价格请限定在小数点后两位！");
            return false;
        }
        $("#hdn_weekprice").val(weekprice);
        
        //设置广告位上的广告是否需要审核的选项
        //$("#hdn_needauditing").val(getNeedAuditing());
        if ($("#weekprice_period").attr("checked") && $("#hdn_needauditing").val() == "") {
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
        $("#hdn_transtype").val(calcTranstype());
        if($("#hdn_transtype").val()==""){
	         alert("计费类型必须选择一种！");
	         return false;
        }
        
        //设置广告内容
        var calcMediatype = function(){
            if ($("#mediatype_text").attr("checked") && $("#mediatype_picture").attr("checked")) {
				return "3";
			}
			else {
				if ($("#mediatype_text").attr("checked")) {
					return "1";
				}
				else {
					if ($("#mediatype_picture").attr("checked")) {
						return "2";
					}
					else {
						return "";
					}
				}
			}
        };
        $("#hdn_mediatype").val(calcMediatype());
        if ($("#hdn_mediatype").val() == "") {
            alert("广告内容必须选择一种！");
            return false;
        }
        
        //设置广告位位置
        if ($("#hdn_infirstpage").val() == "") {
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
        if ($("#hdn_zonesize").val() == "" || !checkedFlag()) {
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
        $("#hdn_zonedesp").val(resultBuffer);
        
        return true;
    }
    
    function doCheckAndNext(){
        document.form1.action = 'ZoneCategory.aspx';
        if (checkForm()) {
            document.form1.submit();
            return true;
        } else {
            return false;
        }
    }
    
    function setZoneSize(zonesize, sizenum){
        $("#hdn_zonesize").val(zonesize);
    }
    </script>

    <form id="form1" name="form1" method="post" action="ZoneCategory.aspx">
        <div class="content" style="margin: 20px auto; width: 950px;">
            <div class="sellbox">
                <div class="form-section2">
                    <h3>
                        <span id="sec2" class="sec-toggler"></span>填写广告位信息 <span class="red">（以下为必填项）</span>
                    </h3>
                    <dl>
                        <dt>广告位名称：</dt>
                        <dd>
                            <input id="zonename" type="text" maxlength="32" size="40" value="" name="zonename" />
                            （例如：xxx网站顶部广告位）
                            <div class="inotice1">
                                广告位名称将显示给买家，好的名称有助于买家快速理解广告位价值，请认真填写，并且长度不要超过16个汉字</div>
                        </dd>
                        <dt>广告内容：</dt>
                        <dd>
                            <label>
                                <input id="mediatype_text" type="checkbox" value="2" checked="checked" name="mediatype_text" />文字广告</label>
                            <label style="margin-left: 10px">
                                <input id="mediatype_picture" type="checkbox" value="5" checked="checked" name="mediatype_picture" />图片/flash广告</label>
                            <span class="red">为了增加您的广告收益，建议保留文字广告形式。</span>
                        </dd>
                        <dt>广告所在位置：</dt>
                        <dd>
                            <label>
                                <input id="infirstpage_yes" type="radio" onclick="javascript:$('#hdn_infirstpage').val(this.value);"
                                    value="0" name="infirstpage_yes" />在首页</label>
                            <label>
                                <input id="infirstpage_no" type="radio" onclick="javascript:$('#hdn_infirstpage').val(this.value);"
                                    checked="checked" value="1" name="infirstpage_no" />
                                不在首页</label>
                        </dd>
                        <dt>选择广告位尺寸：</dt>
                        <dd>
                            <div id="zonesizes" style="display: block;">
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="760x90">
                                        <input id="zonesize11" type="radio" onclick='setZoneSize("760x90", "11");' value="760x90"
                                            name="zonesize11" />
                                        横幅广告 <span>760x90</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="468x60">
                                        <input id="zonesize12" type="radio" onclick='setZoneSize("468x60", "12");' value="468x60"
                                            name="zonesize12" />
                                        横幅广告 <span>468x60</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x60">
                                        <input id="zonesize13" type="radio" onclick='setZoneSize("250x60", "13");' value="250x60"
                                            name="zonesize13" />
                                        横幅广告 <span>250x60</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="728x90">
                                        <input id="zonesize14" type="radio" onclick='setZoneSize("728x90", "14");' value="728x90"
                                            name="zonesize14" />
                                        横幅广告 <span>728x90</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="950x90">
                                        <input id="zonesize15" type="radio" onclick='setZoneSize("950x90", "15");' value="950x90"
                                            name="zonesize15" />
                                        横幅广告 <span>950x90</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="120x600">
                                        <input id="zonesize21" type="radio" onclick='setZoneSize("120x600", "21");' value="120x600"
                                            name="zonesize21" />
                                        垂直广告 <span>120x600</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="120x240">
                                        <input id="zonesize22" type="radio" onclick='setZoneSize("120x240", "22");' value="120x240"
                                            name="zonesize22" />
                                        垂直广告 <span>120x240</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="160x600">
                                        <input id="zonesize23" type="radio" onclick='setZoneSize("160x600", "23");' value="160x600"
                                            name="zonesize23" />
                                        垂直广告 <span>160x600</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="180x250">
                                        <input id="zonesize31" type="radio" onclick='setZoneSize("180x250", "31");' value="180x250"
                                            name="zonesize31" />
                                        巨幅广告 <span>180x250</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x300">
                                        <input id="zonesize32" type="radio" onclick='setZoneSize("250x300", "32");' value="250x300"
                                            name="zonesize32" />
                                        巨幅广告 <span>250x300</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="360x190">
                                        <input id="zonesize33" type="radio" onclick='setZoneSize("360x190", "33");' value="360x190"
                                            name="zonesize33" />
                                        巨幅广告 <span>360x190</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="250x250">
                                        <input id="zonesize34" type="radio" onclick='setZoneSize("250x250", "34");' value="250x250"
                                            name="zonesize34" />
                                        巨幅广告 <span>250x250</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="200x200">
                                        <input id="zonesize35" type="radio" onclick='setZoneSize("200x200", "35");' value="200x200"
                                            name="zonesize35" />
                                        巨幅广告 <span>200x200</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="336x280">
                                        <input id="zonesize36" type="radio" onclick='setZoneSize("336x280", "36");' value="336x280"
                                            name="zonesize36" />
                                        巨幅广告 <span>336x280</span>
                                    </label>
                                    <label class="label-cr x_gg_pre" gg_size="300x250">
                                        <input id="zonesize37" type="radio" onclick='setZoneSize("300x250", "37");' value="300x250"
                                            name="zonesize37" />
                                        巨幅广告 <span>300x250</span>
                                    </label>
                                </p>
                                <p class="group-cb">
                                    <label class="label-cr x_gg_pre" gg_size="120x60">
                                        <input id="zonesize41" type="radio" onclick='setZoneSize("120x60", "41");' value="120x60"
                                            name="zonesize41" />
                                        小幅广告 <span>120x60</span>
                                    </label>
                                </p>
                            </div>
                            <div class="inotice3" style="margin-bottom: 0pt; margin-left: 3px; margin-right: 0pt;
                                margin-top: 5px; width: 650px;">
                                现在阿里奶奶平台只提供以上尺寸的广告代码，请选择合适的尺寸。另请注意，广告位需要完整显示才能通过系统的审核</div>
                        </dd>
                        <dt>选择计费类型：</dt>
                        <dd>
                        	<label>
                                <input id="transtype_click" type="radio" onclick='javascript:$("#hdn_transtype").val(this.value);'
                                    checked="checked" value="2" name="transtype_click" />
                                按点击计费</label>
                            <label>
                                <input id="transtype_period" type="radio" onclick='javascript:$("#hdn_transtype").val(this.value);'
                                    value="5" name="transtype_period" />按时长计费</label>
                            <input id="weekprice" type="text" onkeyup="return chkNum(this)" size="11" value="0"
                                name="weekprice" />
                            <span class="red">元/周</span>
                            <br />
                            <div style="display: none">
                                <label>
                                    是否需要审核卖家广告：<input id="needAuditing_yes" type="radio" onclick="javascript:$('#hdn_needauditing').val(this.value);"
                                        value="1" name="needAuditing_yes" />
                                    需要审核
                                    <input id="needAuditing_no" type="radio" onclick="javascript:$('#hdn_needauditing').val(this.value);"
                                        value="0" name="needAuditing_no" checked="" />
                                    不需要审核
                                </label>
                            </div>
                            <div class="red">
                                小贴士：当您的广告位未按周售出时,阿里奶奶将为您的网站选择合适的广告。广告计费类型和广告主在您的网站上投放策略有关，您可以在收益报表看到收入详情。</div>
                        </dd>
                        <dt>广告位描述：</dt>
                        <dd>
                            <textarea id="zonedesp" rows="10" name="textarea" style="width: 750px;"></textarea>
                            <div class="inotice1">
                                例如：广告位的位置，大小，以及该广告位可以在站内所有读帖页展现，访问人群是什么，适合投哪类广告！</div>
                        </dd>
                    </dl>
                </div>
                <div class="sellbox-bottom" style="text-align: right">
                    <div style="float: right">
                        <a class="button3" onclick="return doCheckAndNext();" href="#"><span>为广告位选择分类</span></a>
                    </div>
                </div>
            </div>
        </div>
        <input id="returnzoneview" type="hidden" value="" name="returnzoneview" runat="server" />
        <input id="actioncontrol" type="hidden" value="addzone" name="actioncontrol" runat="server" />
        <input id="hdn_siteid" type="hidden" value="" name="hdn_siteid" runat="server" />
        <input id="hdn_sitename" type="hidden" value="" name="hdn_sitename" runat="server" />
        <input id="hdn_siteurl" type="hidden" value="" name="hdn_siteurl" runat="server" />
        <input id="hdn_zonecatids" type="hidden" value="" name="hdn_classids" runat="server" />
        <input id="hdn_mediatype" type="hidden" value="" name="hdn_mediatype" runat="server" />
        <input id="hdn_transtype" type="hidden" value="" name="hdn_transtype" runat="server" />
        <input id="hdn_zonesize" type="hidden" value="" name="hdn_zonesize" runat="server" />
        <input id="hdn_zoneid" type="hidden" value="" name="hdn_zoneid" runat="server" />
        <input id="hdn_zonename" type="hidden" value="" name="hdn_zonename" runat="server" />
        <input id="hdn_weekprice" type="hidden" value="" name="hdn_weekprice" runat="server" />
        <input id="hdn_zonedesp" type="hidden" value="" name="hdn_zonedesp" runat="server" />
        <input id="hdn_infirstpage" type="hidden" value="" name="hdn_infirstpage" runat="server" />
        <input id="hdn_allowadultad" type="hidden" value="" name="hdn_allowadultad" runat="server" />
        <input id="hdn_keywords" type="hidden" value="" name="hdn_keywords" runat="server" />
        <input id="hdn_recommendweekprice" type="hidden" value="" name="hdn_recommendweekprice" runat="server" />
        <input id="hdn_needauditing" type="hidden" value="" name="hdn_needauditing" runat="server" />
        <input id="hdn_classids" type="hidden" value="" name="hdn_classids" runat="server" />
    </form>
	
	<script type="text/javascript">
		$("#zonename").val($("#hdn_zonename").val());
		//mediatype
		var last_mediatype = $("#hdn_mediatype").val();
		if(last_mediatype == 7){
			$("#mediatype_text").attr("checked", "checked");
			$("#mediatype_picture").attr("checked", "checked");
		} else if(last_mediatype == 5){
			$("#mediatype_picture").attr("checked", "checked");
		} else{
			$("#mediatype_text").attr("checked", "checked");
		}
		//transtype
		var last_transtype = $("#hdn_transtype").val();
		if (last_transtype == 7) {
			$("#transtype_period").attr("checked", "checked");
			$("#transtype_click").attr("checked", "checked");
		}
		else 
			if (last_transtype == 5) {
				$("#transtype_period").attr("checked", "checked");
			}
			else {
				$("#transtype_click").attr("checked", "checked");
			}
		//zonesize
		if($("#hdn_zonesize").val() != "") {
		    $("input[@value=" + $("#hdn_zonesize").val() +"]").attr("checked", "checked");
		}
		//weekprice
		$("#weekprice").val($("#hdn_weekprice").val());
		//zonedesp
		$("#zonedesp").val($("#hdn_zonedesp").val());
		//needauditing
		var last_needauditing = $("#hdn_needauditing").val();
		if (last_needauditing == 0) {
			$("#needauditing_no").attr("checked", "checked");
		} else if(last_needauditing == 1) {
			$("#needauditing_yes").attr("checked", "checked");
		}
		//infirstpage
		var last_infirstpage = $("#hdn_infirstpage").val();
		if(last_infirstpage == 1){
			$("#infirstpage_yes").attr("checked", "checked");
		} else{
			$("#infirstpage_no").attr("checked", "checked");
		}
	</script>
</body>
</html>
