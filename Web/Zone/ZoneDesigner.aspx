<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneDesigner.aspx.cs" Inherits="Web.ZoneDesigner"
    EnableViewStateMac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script type="text/javascript" src="../App_Themes/jquery.js"></script>

    <script type="text/javascript" src="../App_Themes/common.js"></script>

    <script type="text/javascript" src="../App_Themes/TextZoneStyle.js"></script>

    <!--color_picker-->

    <script src="../App_Themes/js/jquery/jquery.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/ifx.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/idrop.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/idrag.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/iutil.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/islider.js" type="text/javascript"></script>

    <script src="../App_Themes/js/jquery/color_picker/color_picker.js" type="text/javascript"></script>

    <link href="../App_Themes/js/jquery/color_picker/color_picker.css" rel="stylesheet"
        type="text/css" />
    <!-- compliance patch for microsoft browsers -->
    <!--[if lt IE 7]>
<link rel="stylesheet" href="js/jquery/color_picker/color_picker-ie6.css" type="text/css" />
<![endif]-->
    <!--[if gte IE 7]>
<link rel="stylesheet" href="js/jquery/color_picker/color_picker-ie7.css" type="text/css" />
<![endif]-->
    <!--end color_picker-->
    <link type="text/css" href="../App_Themes/ZoneDesigner.css" rel="stylesheet" />

    <script type="text/javascript">
            var _defaultStyle = new TextZoneStyle('["0000FF","000000","008000","E6E6E6","FFFFFF","FFFFFF",0,0,0]');
            var _currentStyle = _defaultStyle;
            
function doCheckAndSubmit(){
    //保存广告位信息
		var kvp = {
		    requestpage: "ZoneDesigner",
		    zoneid: $("#hdn_zoneid").val(),
		    zonestyle: _currentStyle.toJson()
		}
		
		$.post("ZoneInfoSaver.aspx", kvp, function(result){
			alert(result);
		})
}
    </script>

    <style type="text/css">
div.codess{
	float:left;
}    
    
div.codess textarea{
	height: 142px;
	width:563px;
	padding: 3px;
}    
    
#main_inner {
	overflow: hidden;
	padding: 6px 3px 2px 6px;
}
#outer{
}

#pre {
	border: 1px none;
}
#main {
	left: 0px;
	margin: 0px;
	padding: 5px;
	position: absolute;
	top: 0px;
	z-index: 100;
}
.outer-and-preview .outer-wrapper {
	width: 480px;
}
.ad_top {
	border-bottom: 1px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
}
.ad_content {
	border-right: 1px solid #CCCCCC;
	float: left;
	height: 100px;
	list-style-image: none;
	list-style-position: outside;
	list-style-type: none;
	margin: 10px 0pt 10px 0px;
	padding: 0px;
}
.ad_div {
	margin: 20px;
}
.clearing {
	border-top: 1px solid transparent !important;
	clear: both;
	visibility: hidden;
}
div#txt_board_preview {
	padding: 1.5em 20px 2em;
	width: auto;
}
.sellbox {
	background: transparent url(http://img.alimama.cn/images/bg/sellbox_top_bg.gif) repeat-x scroll left top;
	border: 1px solid #CBDDF1;
	margin: 0.5em 0pt;
	padding: 0.5em 0pt 0pt;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    	<div id="code-wrapper">
    		<h3><span id="sec1" class="sec-toggler"> </span>代码复制<span class="red">(一个网页限制最多发布6个广告位)</span></h3>
    			<div class="codess">
    			<textarea id="genjstxt" readonly="readonly" style="text-align:left" name="genjstxt" onclick="this.select();copyCode($('#genjstxt').val());" ></textarea>
    		<br/></div>
    			<div class="copytips">
    			<a class="big-button" onclick="copyCode($('#genjstxt').val());return false;" href="#">
    			<img src="images/btn_copycode_big.jpg" /></a>
    			</div>
    			<div class="clearing"></div>
    		</div>
        <div id="txt_board_preview">
            <div class="outer-and-preview">
                <div class="outer-wrapper">
                    <div id="outer" style="position: relative; height: 90px; width: 760px; background-color: rgb(255, 255, 255);">
                        <div id="pre" style="border: 1px solid rgb(230, 230, 230); height: 88px; width: 758px;
                            background-color: rgb(255, 255, 255);">
                        </div>
                        <div id="main" style="height: 80px; width: 750px;">
                            <table id="main_inner" cellspacing="0" cellpadding="0" border="0" align="center">
                                <tr>
                                    <td id='main_title_outer' class='t" + size + "' nowrap>
                                        <div id='main_title'>
                                            阿里奶奶：好产品更需要好广告</div>
                                        <div id='main_link_outer' class='l" + size + "'>
                                            <div id='main_link'>
                                                www.alinn.com</div>
                                        </div>
                                    </td>
                                    <td id='main_text_outer' class='d" + size + "'>
                                        <div id='main_text'>
                                            我们一起创建公开、透明的广告交易平台。买广告，卖广告，一切都很轻松!</div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <a id="icon"></a>
                        </div>
                        <div class="clearing">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ad_div">
            <div class="ad_top">
                <div style="width: 160px;" class="ad_content">
                    <ul>
                        <li>标题：<input type="text" id="colorfield-title" value="" name="title" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-title&amp;objshow=colorsample-title&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-title" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                        <li>描述：<input type="text" id="colorfield-text" value="" name="text" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-text&amp;objshow=colorsample-text&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-text" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                        <li>链接：<input type="text" id="colorfield-link" value="" name="link" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-link&amp;objshow=colorsample-link&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-link" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                    </ul>
                </div>
                <div style="width: 160px;" class="ad_content">
                    <ul>
                        <li>边框：<input type="text" id="colorfield-border" value="" name="border" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-border&amp;objshow=colorsample-border&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-border" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                        <li>背景：<input type="text" id="colorfield-background" value="" name="background" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-background&amp;objshow=colorsample-background&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-background" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                        <li>底色：<input type="text" id="colorfield-grounding" value="" name="grounding" style="width: 60px;"
                            maxlength="6" />
                            <a href="javascript:void(0);" rel="colorpicker&amp;objcode=colorfield-grounding&amp;objshow=colorsample-grounding&amp;showrgb=1&amp;okfunc=myokfunc"
                                style="text-decoration: none">
                                <div id="colorsample-grounding" style="width: 15px; height: 15px; border: 1px solid black;">
                                    &nbsp;</div>
                            </a></li>
                    </ul>
                </div>
                <div id="controlPanel" class="ad_content" style="width: 160px">
                    <select id="Select1">
                        <option selected="selected" value="1">760x90</option>
                        <option value="4">120x60</option>
                        <option value="3">336x280</option>
                    </select>
                    <button id="Button1" type="button" onclick="javascript:return doCheckAndSubmit()">
                        保存设置</button>
                </div>
                <div class="clearing">
                </div>
            </div>
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
        <!--end copy-->
        <input id="hdn_zonestyle" type="hidden" value="" name="hdn_zonestyle" runat="server" />

        <script type="text/javascript">
                            
            function myokfunc(field, color){
                switch(field){
                    case "border":
                        $("#pre").css("border-color", "#" + color);
                        break;
                    default:
                        $("#main_" + field).css("color", "#" + color);
                 }
                 
                 eval("_currentStyle." + field + "$color = '" + color + "';");
                 generateCode($("#hdn_zoneid").val(), _currentStyle, $("#hdn_zonesize").val(), 1);  //todo:计算layoutType
	        }
	        
	        function init(){
	            //init colorpicker
                $.ColorPicker.init();
            
                var size = "760x90";
                var layoutType = "1";
                //init textzone
                var textZone = new TextZone(document.window, size, layoutType);
                textZone.initZone();
                textZone.setStyle(_currentStyle);
                textZone.applyStyle(true);
                generateCode($("#hdn_zoneid").val(), _currentStyle, size, layoutType);
	        }
                
            $(document).ready(init);
            
//            function(){
//                $("#Select1").change(function(){
//                    var size = $(":selected").text();
//                    var layoutType = $(":selected").val();
//                    alert(size, layoutType);
//                    
//                    switchZoneCoreHtml(size, sizetype);
//                    //changeTextZoneSize(size);
//                });
//             })
        </script>

    </form>
</body>
</html>
