<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="Admin_top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    
        <style type="text/css">
    <!--
    .line {
	    border-bottom-width: 1px;
	    border-bottom-style: dotted;
	    border-bottom-color: #FFFFFF;
    }
    -->
    </style>
    <script language="javascript" type="text/javascript">
    function preloadImg(src)
    {
	    var img=new Image();
	    img.src=src
    }
    preloadImg("images/admin_top_open.gif");

    var displayBar=true;
    function switchBar(obj)
    {
	    if (displayBar)
	    {
		    parent.frame.cols="0,*";
		    displayBar=false;
		    obj.src="images/admin_top_open.gif";
		    obj.title="打开左边管理菜单";
	    }
	    else{
		    parent.frame.cols="210,*";
		    displayBar=true;
		    obj.src="images/admin_top_close.gif";
		    obj.title="关闭左边管理菜单";
	    }
    }    
    </script>
<link  href="images/StyleSheet.css" rel="Stylesheet"  type="text/css" />
</head>
<body class="admin_top_body">
    <form id="form1" runat="server">
    <div class="admin_top">
        <table  border="0"  cellpadding="0" cellspacing="0"   class="admin_top_table" >
          <tr>
            <td  style="width: 40px; height: 59px;" ><img src="images/admin_top_close.gif" alt="" onclick="switchBar(this)" /></td>
              <td align="left" style="width: 66px; height: 59px">
              </td>
            <td style="height: 59px" align="left">
                <asp:LinkButton  ID="btnRefreshSystemCache" runat="server"   style="background-color:White; color:blue; cursor:hand; border:0px; height:20px; padding:2px; font-weight:bold ; text-decoration:none" OnClick="btnRefreshSystemCache_ServerClick" >更新缓存</asp:LinkButton>&nbsp;&nbsp;
                <a href="User/modifypassword.aspx" target="main"><span   style="background-color:White; color:blue; cursor:hand; border:0px; padding:2px; font-weight:bold ;text-decoration:none" >修改密码</span></a>
            </td>
            <td scope="col" width="100" style="height: 59px"><img src="images/time/space.gif" name="one" alt="" /><img src="images/time/space.gif" name="two" alt="" /><img src="images/time/dgon.gif" name="three" alt=""/><img src="images/time/space.gif" name="four" alt=""/><img src="images/time/space.gif" name="five" alt=""/>
        <script language="javascript" type="text/javascript">
        <!--//
            img = new Array()
            for(var i=0; i <= 14; i++) {
            img[i] = new Image()
            }
            img[1].src = "images/time/dg0.gif"
            img[2].src = "images/time/dg1.gif"
            img[3].src = "images/time/dg2.gif"
            img[4].src = "images/time/dg3.gif"
            img[5].src = "images/time/dg4.gif"
            img[6].src = "images/time/dg5.gif"
            img[7].src = "images/time/dg6.gif"
            img[8].src = "images/time/dg7.gif"
            img[9].src = "images/time/dg8.gif"
            img[10].src = "images/time/dg9.gif"
            img[11].src = "images/time/dgon.gif"
            img[12].src = "images/time/dgoff.gif"
            img[13].src = "images/time/dgam.gif"
            img[14].src = "images/time/dgpm.gif"
            var base = "images/time/dg"
            var space = "images/time/space.gif" 
            var per = false

            function go() {
            per = true
            start()
            }

            function start() {
            if(per == true) {
            var now = new Date()
            var hours = now.getHours();
            hours = (hours > 12) ? hours + "" : hours + ""
            hours = (hours < 10) ? "0" + hours : hours + ""
            var minutes = now.getMinutes();
            minutes = (minutes < 10) ? "0" + minutes : minutes + ""
            var seconds = now.getSeconds();
            seconds = (seconds < 10) ? "0" + seconds : seconds + ""
            document.one.src = (hours.charAt(0)=="0") ? space : add(hours.charAt(0))
            document.two.src = add(hours.charAt(1))
            document.four.src = add(minutes.charAt(0))
            document.five.src = add(minutes.charAt(1))
            setTimeout("start()",1000)
            }
            }

            secflag=1;
            function secondgo()
            {
            document.three.src = (secflag % 2) ? add("on") : add("off")
            if (secflag==1)
            {	secflag=2;}
            else
            {	secflag=1;}
            setTimeout("secondgo()",500);
            }

            function add(it) {
            return base + it + ".gif"
            }
            go();
            secondgo();
        //-->
        </script>
        </td>
          </tr>
        </table>
        
        
        

    </div>
    </form>
</body>
</html>
