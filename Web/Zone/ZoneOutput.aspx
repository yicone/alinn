<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneOutput.aspx.cs" Inherits="Web.ZoneOutput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
<link type="text/css" href="../App_Themes/ZoneDesigner.css" rel="stylesheet" />
<style type="text/css">
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
</style>
    <script src="../App_Themes/jquery.js" type="text/javascript">
            </script>

    <script src="../App_Themes/TextZoneStyle.js" type="text/javascript">
            </script>

    <script type="text/javascript">
                $(document).ready(function(){
                    var jsonStyle = $("#hdn_jsonstyle").val();
                    var sizecode = $("#hdn_sizecode").val();
                    var layouttype = $("#hdn_layouttype").val();
    	            var currentStyle = new TextZoneStyle(jsonStyle);
	                var oTextZone = new TextZone(document.window, sizecode, layouttype);
	                oTextZone.initZone();
	                oTextZone.setStyle(currentStyle);
	                oTextZone.applyStyle(false);
                });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="outer">
            <div id="pre">
            </div>
            <div id="main">
                <table id="main_inner">
                </table>
            </div>
        </div>
        <input id="hdn_jsonstyle" type="hidden" runat="server" />
        <input id="hdn_sizecode" type="hidden" runat="server" />
        <input id="hdn_layouttype" type="hidden" runat="server" />
    </form>
</body>
</html>
