<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneOutput.aspx.cs" Inherits="Web.ZoneOutput"
    Title="Zone输出服务" %>

<html>
<head runat="server">
    <title>我的阿里奶奶</title>
    <link type="text/css" href="/CSS/ZoneDesigner.css" rel="stylesheet" />
    <style type="text/css">
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
    </style>

    <script src="/JavaScript/jquery.js" type="text/javascript">
    </script>

    <script src="/JavaScript/TextZoneStyle.js" type="text/javascript">
    </script>

</head>
<body>
    <div id="outer">
        <div id="pre" style="border: 1px solid rgb(230, 230, 230); height: 88px; width: 758px;
            background-color: rgb(255, 255, 255);">
        </div>
        <div id="bgimg" style="height: 90px; width: 760px; display: none;">
        </div>
        <div id="zone">
            <table id="main_inner">
            </table>
        </div>
        <a id="icon" style="float: right; position: relative; margin-right: 0px; margin-top: -17px;
            background: transparent none no-repeat scroll 0% 50%; -moz-background-clip: -moz-initial;
            -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;
            z-index: 150; height: 17px; width: 90px;" href="http://www.aaaa0.com" target="_blank">
            <!-- another ZoneDesigner -->
            <div style="position: relative; margin-right: 0px; margin-bottom: -17px; width: 90px;
                height: 17px; z-index: 2; background-image: url(http://img.alimama.cn/images/adzone/alimama0_b.png);">
            </div>
            <div style="position: relative; margin-right: 0px; margin-bottom: 0px; width: 90px;
                height: 17px; z-index: 1; background-color: rgb(230, 230, 230); opacity: 0.6;">
            </div>
        </a>
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
                var mediatype = $("$hdn_mediatype").val();
                
                oTextZone.initZone($("#hdn_title").val(), $("#hdn_text").val(), $("#hdn_link").val(), $("#hdn_imagepath").val(), $("#hdn_isdefaultzone").val(), mediatype);           //修改文字广告的内容，或图片广告的背景图
                if(mediatype == "text")
                {
                    oTextZone.setStyle(currentStyle);
                    oTextZone.applyStyle(false);
                }
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
                    $.post("/Public/ZoneStat.aspx", kvp, success = function(){
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
                    $.post("/Public/ZoneStat.aspx", kvp, success = function(){
                        alert("刷新信息已发送！");
                    });
            }
    </script>

</body>
</html>
