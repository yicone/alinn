<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeftMenu.aspx.cs" Inherits="Admin_LeftMenu"  EnableTheming="false"  %>


<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>无标题页</title>
<script language='javascript' type="text/javascript">
	/***********************************
	    行高为28px
	    minHeight 为层的最低高度
	    maxHeight 为层的最高高度
	************************************/
	
	
	function ShowMenu(id,height,rowsCount)
	{
		var speed = 2; //层移动的速度
		speed = rowsCount * speed;
		var  floor = 6;
		
        var obj=document.getElementById("leftMenu" + id);
		
		for( i = 0 ; i <= floor; i++)
		{
			if( i != id  || obj.style.display == "block" || obj.style.display == "" )
				HideDiv("leftMenu" + i,0,speed);
		}
		
		if(obj.style.display == "none" )
			ShowDiv("leftMenu" + id,height,speed);
		
	}
	
	function HideDiv(id,minHeight,speed)
    {		
		var handle;	
        var obj=document.getElementById(id);
		
		
		if( parseInt(obj.style.height) > minHeight)
			if( parseInt(obj.style.height) - speed <= 0)
				obj.style.height= 0 +"px"; 
			else
				obj.style.height= ( parseInt(obj.style.height) - speed) +"px"; 
		
        if(parseInt(obj.style.height)<= minHeight)
		{
			obj.style.height = minHeight +"px"; 
			if(  minHeight < 1 )
				obj.style.display="none";
			clearTimeout(handle);
            return;
        }
		else 
		{
		   handle = setTimeout("HideDiv('"+id+"'," + minHeight + "," + speed + ")",1);
        }		
    }
	
	function ShowDiv(id,maxHeight,speed)
    {
		var handle;	
        var obj=document.getElementById(id);
		
		
		obj.style.display = "block" ;			
			
		if( parseInt(obj.style.height) < maxHeight )
		{
			obj.style.height = ( parseInt(obj.style.height) + speed ) +"px";
		}
			
        if(parseInt(obj.style.height) >= maxHeight)
		{
			obj.style.height =  maxHeight +"px";
			clearTimeout(handle);
            return;
        }
		else 
		{	
			handle = setTimeout("ShowDiv('"+id+"'," + maxHeight + "," + speed + ")",1);
        }		
    }
    
    
</script>
<link  href="images/StyleSheet.css" rel="Stylesheet"  type="text/css" />
    
</head>
<body class="admin_leftMenu_body" >
    <form id="form1" runat="server">
    
    
<div class="admin_leftMenu_body" >
        <div class="admin_leftMenu">
          <table  align="center" class="admin_leftMenu_header"  border="0" cellpadding="4" cellspacing="0" >          
	          <tr align="center">
		        <td   >
		        </td>
	          </tr>
	        </table>
	        
          <table class="admin_leftMenu_tilte_quit"  border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td     >&nbsp;&nbsp;&nbsp;&nbsp;<a href="/"  target="_blank"  style=" text-decoration:none"  ><span onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'" class="menu_title" >网站首页</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="logout.aspx" target="_parent" style=" text-decoration:none" ><span onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'" class="menu_title">退出</span></a>
		        </td>
	          </tr>		
	        </table>
	        
	        
          <table class="admin_leftMenu_tilte"    border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td  onclick="ShowMenu(0,224,8)"  onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'" class="menu_title" >&nbsp;&nbsp;&nbsp;&nbsp;<span> 系统配置管理</span> 		
		        </td>
	          </tr>
	        </table>
        	
			<div id="leftMenu0" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
			
				<table    class="admin_leftMenu_td"   border="0" cellpadding="4" cellspacing="0" >
				  <tr>
					<td   class="admin_leftMenu_td"       onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="main.aspx" target="main">系统信息</a></td>
				  </tr>
				  <tr>
					<td   class="admin_leftMenu_td"       onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/SiteConfig.aspx" target="main">网站信息设置</a></td>
				  </tr>
				  <tr>
					<td   class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
						 <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/RegReadMe.aspx"  target="main">注册协议设置</a></td>
				  </tr>
				  <tr>
					<td   class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
						 <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/log.aspx"  target="main">网站日志管理</a></td>
				  </tr>
				  <tr>
					<td   class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
						 <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/channel.aspx"  target="main">频道管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/Announce.aspx" target="main">公告管理</a></td>
				  </tr>
				  
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/help.aspx" target="main">帮助信息管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/Vote.aspx" target="main">调查管理</a></td>
				  </tr>
				</table>
							
			</div>

			
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(1,168,6)"   class="menu_title"  onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'"  >&nbsp;&nbsp;&nbsp;&nbsp;用户管理
		        </td>
	          </tr>				
	        </table>
			
			<div id="leftMenu1" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
        	
				<table    class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/index.aspx?action=addUser" target="main">添加用户</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/index.aspx" target="main">会员列表</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/index.aspx" target="main">会员查询</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/Admin.aspx?action=add&Type=admin"  target="main"> 添加管理员</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/Admin.aspx?action=show&Type=admin" target="main">管理员列表</a></td>
				  </tr>	   
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="User/Admin.aspx?action=modify&Type=admin" target="main">修改管理员密码</a></td>
				  </tr>	       
				</table>
			</div>			
			
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(2,308,11)"   class="menu_title"  onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'" >&nbsp;&nbsp;&nbsp;&nbsp;订单管理 
		        </td>
	          </tr>				
	        </table>
			
			<div id="leftMenu2" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
				<table  class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/Order_index.aspx?action=show&Type=Showall"  target="main">处理所有订单</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/Order_index.aspx?action=show&Type=Showtoday"  target="main">处理今天订单</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/OrderItem.aspx" target="main"><span
                           style="color: #000000">销售明细情况</span></a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/SaleCount.aspx" target="main">销售统计/排行</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/bankroll.aspx" target="main">资金明细查询</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/Invoice.aspx" target="main">开发票记录</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/deliver.aspx" target="main">发退货记录</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/shoppingcart.aspx" target="main">购物车管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/PaymentType.aspx" target="main">付款方式管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/deliverType.aspx" target="main">送货方式管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/Bank.aspx" target="main">银行帐户管理</a></td>
				  </tr>
				</table>
        	</div>  
        	  
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(3,280,11)"  class="menu_title"   onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'"  >&nbsp;&nbsp;&nbsp;&nbsp;商城管理
		        </td>
	          </tr>				
	        </table>
        	
			<div id="leftMenu3" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
				<table  class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >		
				
				
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/Class.aspx?ChannelId=2"  target="main">栏目管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Book/product_index.aspx"  target="main">商品管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/productKinds.aspx?" target="main">商品大类管理</a></td>
				  </tr>	 
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/category.aspx?" target="main">商品小类管理</a></td>
				  </tr>	      
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/producer.aspx"  target="main">厂商管理</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/trademark.aspx?" target="main">品牌管理</a></td>
				  </tr>			  
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/product_index.aspx?action=show&Type=showhot"  target="main">热卖商品</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/product_index.aspx?action=show&Type=showelite" target="main">推荐商品</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/product_index.aspx?action=show&Type=showhits" target="main">人气排行</a></td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Shop/product_index.aspx?action=show&Type=showrecycle" target="main">已下架商品</a></td>
				  </tr>
				</table> 
			</div>
	        
        	
	        
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(4,84,3)"  class="menu_title"   onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'"  >&nbsp;&nbsp;&nbsp;&nbsp;广告管理
		        </td>
	          </tr>				
	        </table>
        	
			<div id="leftMenu4" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
				<table  class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="AD/ManageAd.aspx"target="main">广告审核</a> </td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Article/index.aspx?channelId=1&action=add" target="main">添加文章</a> </td>
				  </tr>	    
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="SystemConfig/Class.aspx?channelId=1" target="main">栏目管理</a> </td>
				  </tr>         
				</table> 
	        </div>
			
        	
			
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(5,56,2)"  class="menu_title"   onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'"  >&nbsp;&nbsp;&nbsp;&nbsp;广告组管理
		        </td>
	          </tr>				
	        </table>
        	
			<div id="leftMenu5" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
				<table  class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Zone/ManageZone.aspx"target="main">广告组审核</a> </td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Zone/ManageZoneClass.aspx"target="main">广告组分类</a> </td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Zone/SiteClass.aspx"target="main">网站分类</a> </td>
				  </tr>
				  <tr>
					<td  class="admin_leftMenu_td"    onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'">
					   <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="Zone/Employment.aspx" target="main">添加职业</a> </td>
				  </tr>	    
				</table>        
			</div>      	
			
			
          <table class="admin_leftMenu_tilte"     border="0" cellpadding="4" cellspacing="0">	  
	          <tr align="left">
		        <td   onclick="ShowMenu(6,28,1)"  class="menu_title"   onmouseover="this.className='menu_title2';"  onmouseout="this.className='menu_title'"  >&nbsp;&nbsp;&nbsp;&nbsp;新闻管理
		        </td>
	          </tr>				
	        </table>
        	
			<div id="leftMenu6" style="OVERFLOW: hidden; WIDTH: 100%; height:0px; display:none">
				<table  class="admin_leftMenu_td"  border="0" cellpadding="4" cellspacing="0"  >
				  <tr>
					<td  class="admin_leftMenu_td"     onmouseover="this.className='admin_leftMenu_mouseOver'" onmouseout="this.className='admin_leftMenu_mouseOut'" style="height: 18px">
					  <img src="images/mydocuments.gif"   alt=""   />&nbsp;&nbsp;<a href="News/AdNews.aspx"target="main">添加新闻</a> </td>
				  </tr>
				</table>        
			</div>      	
			
			
          <table class="admin_leftMenu_footer"   border="0" cellpadding="4" cellspacing="0">	
	          <tr align="center">
		        <td><span style="font-size:14px"> &copy;</span></td>
	          </tr>	
	          <tr align="center">
		        <td> </td>
	          </tr>	
	          <tr align="center">
		         <td> <span style="font-size:12px"></span></td>
	          </tr>			  
	        </table>
        </div>
        </div>    
    
    </form>
</body>
</html>
