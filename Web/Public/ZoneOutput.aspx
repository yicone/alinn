<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneOutput.aspx.cs" Inherits="Web.ZoneOutput"
    Title="Zone输出服务" %>

<html>
<head>
    <title>我的阿里奶奶</title>
    <link type="text/css" href="../App_Themes/ZoneDesigner.css" rel="stylesheet" />
    <style type="text/css">
        #main_inner
        {
            overflow: hidden;
            padding: 6px 3px 2px 6px;
        }
        #outer
        {
        }
        #pre
        {
            border: 1px none;
        }
        #main
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
    </style>

    <script src="../App_Themes/jquery.js" type="text/javascript">
    </script>

    <script src="../App_Themes/TextZoneStyle.js" type="text/javascript">
    </script>

</head>
<body>
    <div id="outer">
        <div id="pre">
        </div>
        <div id="main">
            <table id="main_inner">
            </table>
        </div>
    </div>
    <input id="hdn_zoneid" type="hidden" runat="server" />
    <input id="hdn_jsonstyle" type="hidden" runat="server" />
    <input id="hdn_sizecode" type="hidden" runat="server" />
    <input id="hdn_layouttype" type="hidden" runat="server" />
    <input id="hdn_zonehref" type="hidden" runat="server" />
    <input id="hdn_title" type="hidden" runat="server" />
    <input id="hdn_link" type="hidden" runat="server" />
    <input id="hdn_text" type="hidden" runat="server" />
    <input id="hdn_imagepath" type="hidden" runat="server" />
    <input id="hdn_mediatype" type="hidden" runat="server" />
    <input id="hdn_isdefaultzone" type="hidden" runat="server" />

    <script type="text/javascript">
            $(document).ready(function(){
                var jsonStyle = $("#hdn_jsonstyle").val();
                var sizecode = $("#hdn_sizecode").val();
                var layouttype = $("#hdn_layouttype").val();
                var currentStyle = new TextZoneStyle(jsonStyle);
                var oTextZone = new TextZone(sizecode, layouttype);
                oTextZone.initZone($("#hdn_title").val(), $("#hdn_text").val(), $("#hdn_link").val(), $("#hdn_isdefaultzone").val());           //修改文字广告的内容，或图片广告的背景图
                oTextZone.setStyle(currentStyle);
                oTextZone.applyStyle(false);
               
                handleReadyEvent();
               	$(document).click(handleClickEvent);
            });
            
            function handleClickEvent(){
                var kvp = {
                        zoneid: $("#hdn_zoneid").val(),
                        zonehref: $("#hdn_zonehref").val(),
                        action:"click"
                    }
                    
                    //alert(location.href);
                    //alert(location.host);
                    $.post("ZoneStat.aspx", kvp, success = function(){
                        alert("点击信息已发送！");
                    });
            }
            
            function handleReadyEvent(){
                var kvp = {
                        zoneid: $("#hdn_zoneid").val(),
                        zonehref: $("#hdn_zonehref").val(),
                        action:"refresh"
                    }
                    
                    //alert(location.href);
                    //alert(location.host);
                    $.post("ZoneStat.aspx", kvp, success = function(){
                        alert("刷新信息已发送！");
                    });
            }
    </script>

</body>
</html>
