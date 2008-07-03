<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneDesigner.aspx.cs" Inherits="Web.ZoneDesigner"
    EnableViewStateMac="false" Title="设计广告位" MasterPageFile="~/MasterPage/Member.Master" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="_htmlHeadContent">

    <script type="text/javascript" src="/JavaScript/common.js"></script>

    <script type="text/javascript" src="/JavaScript/TextZoneStyle.js"></script>

    <script src="/JavaScript/jquery/color_picker/jquery.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/ifx.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/idrop.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/idrag.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/iutil.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/islider.js" type="text/javascript"></script>

    <script src="/JavaScript/jquery/color_picker/color_picker.js" type="text/javascript"></script>

    <link href="/JavaScript/jquery/color_picker/color_picker.css" rel="stylesheet" type="text/css" />
    <!-- compliance patch for microsoft browsers -->
    <!--[if lt IE 7]>
	    <link rel="stylesheet" href="/js/jquery/color_picker/color_picker-ie6.css" type="text/css">
    <![endif]-->
    <!--[if gte IE 7]>
	    <link rel="stylesheet" href="/js/jquery/color_picker/color_picker-ie7.css" type="text/css">
    <![endif]-->
    <link type="text/css" href="/CSS/ZoneDesigner.css" rel="stylesheet" />
    <style type="text/css">
        div.codess
        {
            float: left;
        }
        div.codess textarea
        {
            height: 142px;
            width: 563px;
            padding: 3px;
        }
        #main_inner
        {
            overflow: hidden;
            padding: 6px 3px 2px 6px;
        }
        #zone
        {
            left: 0px;
            margin: 0px;
            padding: 5px;
            position: absolute;
            top: 0px;
            z-index: 100;
        }
        .outer-and-preview .outer-wrapper
        {
            width: 480px;
        }
        .ad_top
        {
            border-bottom: 1px solid #CCCCCC;
            border-left: 1px solid #CCCCCC;
            border-right: 1px solid #CCCCCC;
        }
        .ad_content
        {
            border-right: 1px solid #CCCCCC;
            float: left;
            height: 100px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin: 10px 0pt 10px 0px;
            padding: 0px;
        }
        .ad_div
        {
            margin: 20px;
        }
        div#txt_board_preview
        {
            padding: 1.5em 20px 2em;
            width: auto;
            text-align: left;
        }
        .sellbox
        {
            background: transparent url(http://img.alimama.cn/images/bg/sellbox_top_bg.gif) repeat-x scroll left top;
            border: 1px solid #CBDDF1;
            margin: 0.5em 0pt;
            padding: 0.5em 0pt 0pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="f2" scope="col">获取广告位代码</th>
    <th width="829" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="135" height="30" background="/images/yh08.gif" class="bu04" scope="col">1. 选择网站 </th>
    <th width="31" background="/images/yh08.gif" class="bu10" scope="col">→</th>
    <th width="147" background="/images/yh08.gif" class="bu04" scope="col">2. 填写广告位信息</th>
    <th width="37" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="157" background="/images/yh08.gif" class="bu04" scope="col">3. 选择广告位类目 </th>
    <th width="75" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="354" align="left" background="/images/yh08.gif" class="f4" scope="col">4. 获取广告位代码 </th>
  </tr>
</table>
<table width="936" height="43" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="/app_themes/new/images/title2.gif">&nbsp;</td>
  </tr>
</table>




<table width="936" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#C2EAFD">
  <tr>
    <th height="40" scope="col"><table width="936" height="50" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="32" height="40" bgcolor="#EFF4FA" scope="col"><img src="/images/yh19.gif" width="15" height="13" /></th>
        <th width="905" align="left" bgcolor="#EFF4FA" scope="col"><span class="bu03">代码复制</span> <span class="bu08">(一个网页限制最多发布6个广告位)</span></th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="149" scope="row"><table width="936" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="565" height="149" valign="top" scope="col"><table width="109%" height="96" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <th width="32" bgcolor="#EFF4FA" scope="col">&nbsp;</th>
              <th width="534" align="left" class="d2" scope="col">&nbsp;javascript代码：</th>
            </tr>
            <tr>
              <td width="32" bgcolor="#EFF4FA" scope="row">&nbsp;</td>
              <th align="left" scope="row">&nbsp;
                          <div class="codess">
            <textarea id="genjstxt" readonly="readonly" style="text-align: left" name="genjstxt"
                onclick="this.select();copyCode($('#genjstxt').val());" cols="70" rows="10"></textarea>
            <br />
        </div></th>
            </tr>
        </table></th>
        <th width="371" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th height="100" scope="col">            <a class="big-button" onclick="copyCode($('#genjstxt').val());return false;" href="#">
                <img src="/App_Themes/new/images/copy.gif" height="50px" width="159px" /></a><br />
              </a><a href="#" target="_blank" class="bu06">如何布署代码？</a> </th>
            </tr>
            <tr>
              <th scope="row">&nbsp;</th>
            </tr>
        </table></th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="40" scope="row"><table width="100%" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="32" align="center" bgcolor="#EFF4FA" scope="col"><img src="/images/yh19.gif" width="15" height="13" /></td>
        <td align="left" bgcolor="#EFF4FA" scope="col"><span class="bu03">广告预览</span></td>
      </tr>
    </table></th>
  </tr>
  <tr>
    <td height="151" valign="top" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
    <div id="txt_board_preview">
        <div class="outer-and-preview">
            <div class="outer-wrapper">
<%--                <div id="outer" style="position: relative; height: 90px; width: 760px; background-color: rgb(255, 255, 255);">--%>
<%--                    <div id="pre" style="border: 1px solid rgb(230, 230, 230); height: 88px; width: 758px;
                        background-color: rgb(255, 255, 255);">
                    </div>--%>
                    <div id="bgimg" style="height: 90px; width: 760px; display: none;"> </div>
                    <div id="zone" style="height: 80px; width: 750px;">
                        <table id="main_inner" cellspacing="0" cellpadding="0" border="0" align="center">
                        </table>
                    </div>
                    <a id="icon" style="float: right; position: relative; margin-right: 0px; margin-top: -13px;
                        background: transparent none no-repeat scroll 0% 50%; -moz-background-clip: -moz-initial;
                        -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;
                        z-index: 150; height: 13px; width: 78px;" href="http://www.aaaa0.com" target="_blank"><!-- another in ZoneOutput -->
                        <div style="position: relative; margin-right: 0px; margin-bottom: -13px; width: 78px;
                            height: 13px; z-index: 2; background-image: url(/images/aaaa0.gif);">
                        </div>
                        <div style="position: relative; margin-right: 0px; margin-bottom: 0px; width: 78px;
                            height: 13px; z-index: 1; background-color: rgb(230, 230, 230); opacity: 0.6;">
                        </div>
                    </a>
                    <div class="clearing">
                    </div>
                </div>
            </div>
        </div>
    </div>
      </tr>
      <tr>
        <th height="40" colspan="3" align="left" bgcolor="#fefce1" scope="row">&nbsp;<span class="bu04">文字广告推荐效果选择</span> <span class="bu08">&gt;&gt;</span>
          <span class="bu06">初始
 经典白
 天空蓝
 木纹灰
 素色花
 典雅绿
 雪花飘
 圣诞节</span> </th>
      </tr>
      <tr>
        <th colspan="3" bgcolor="#EFF4FA" scope="row">&nbsp;<table width="898" border="0" align="center" cellpadding="0" cellspacing="0">
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
            <div id="controlPanel" class="ad_content" style="width: 160px; text-align: center">
                <button id="Button1" type="button" onclick="javascript:return doCheckAndSubmit()">
                    保存设置</button></div>
            <div class="clearing">
            </div>
        </div>
    </div>
</table></th>
      </tr>
    </table></td>
  </tr>
  <tr>
    <th height="60" bgcolor="#EFF4FA" scope="row"></th>
  </tr>
</table>

    <input id="hdn_dbaction" type="hidden" value="update" name="hdn_dbaction" runat="server" />
    <input id="hdn_zoneid" type="hidden" value="" name="hdn_zoneid" runat="server" />
    <!--end copy-->
    <input id="hdn_zonestyle" type="hidden" value="" name="hdn_zonestyle" runat="server" />
    <input id="hdn_zonesize" type="hidden" value="" name="hdn_zonesize" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="_scriptContent">

    <script type="text/javascript">
            var _defaultStyle = new TextZoneStyle('["0000FF","000000","008000","E6E6E6","FFFFFF","FFFFFF",0,0,0]');
            var _currentStyle = _defaultStyle;
            
            //保存广告位信息
            function doCheckAndSubmit(){
                    alert('修改的广告位Id' + $("#<%= hdn_zoneid.ClientID %>").val());
		            var kvp = {
		                requestpage: "ZoneDesigner",
		                zonestyle: _currentStyle.toJson(),
		                dbaction: "update"
		            }
            		
		            $.post("/Member/Zone/ZoneInfoSaver.aspx", kvp, function(result){
			            alert(result);
		            })
		            
		            document.location = "/Member/Zone/SiteManager.aspx";
            }
                            
            function myokfunc(field, color){
                switch(field){
                    case "border":
                        $("#pre").css("border-color", "#" + color);
                        break;
                    default:
                        $("#main_" + field).css("color", "#" + color);
                 }
                 
                 eval("_currentStyle." + field + "$color = '" + color + "';");
                 generateCode($("#<%= hdn_zoneid.ClientID %>").val(), _currentStyle, $("#<%= hdn_zonesize.ClientID %>").val(), 1);  //todo:计算layoutType
	        }
	        
	        function init(){
	            //init colorpicker
                $.ColorPicker.init();
                
                var zoneStyle = $("#<%= hdn_zonestyle.ClientID %>").val();
                if(zoneStyle != ""){
                    _currentStyle = new TextZoneStyle(zoneStyle);
                }
            
                var size = $("#<%= hdn_zonesize.ClientID %>").val();
                var layoutType = "2";
                //init textzone
                var textZone = new TextZone(size, layoutType);
                textZone.initZone(null, null, null, null, "true", "text");
                textZone.setStyle(_currentStyle);
                textZone.applyStyle(true);
                generateCode($("#<%= hdn_zoneid.ClientID %>").val(), _currentStyle, size, layoutType);
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

</asp:Content>
