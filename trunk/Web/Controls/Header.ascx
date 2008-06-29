<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Web.Controls.Header" %>
<%@ Register src="Search.ascx" tagname="Search" tagprefix="uc1" %>
<style type="text/css">
    .style3
    {
        width: 667px;
    }
</style>
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<div style="text-align: center">
    <table width="938" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <th width="300" height="65" rowspan="2" scope="col"><img src="/images/logo.gif" width="182" height="65" /></th>
    <th height="20" align="right" background="/images/yh07.gif" scope="col" 
          colspan="2"> <span class="bu06"> 欢迎您！<asp:HyperLink ID="hlLogin" runat="server">登录</asp:HyperLink>|</span> <span class="bu06"><asp:LinkButton ID="lbRegister" runat="server" OnClick="LinkButton1_Click">注册</asp:LinkButton>|</span> <span class="bu06">财富通</span> <span class="bu06">|</span> <span class="bu06">腾讯QQ</span> <span class="bu06">|</span> <span class="bu06">用户中心</span></th>
    
  </tr>
  <tr>
    <th valign="bottom" scope="col">
<a href="/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image168','','/images/shouye02.gif',1)"><img src="/images/shouye01.gif" name="Image168" width="60" height="29" vspace="0" border="0" id="Image168" /></a>
<a href="/public/adlist.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image169','','/images/m02.gif',1)"><img src="/images/m01.gif" name="Image169" width="60" height="29" border="0" id="Image169" /></a>
<a href="/public/sellad.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image170','','/images/m-02.gif',1)"><img src="/images/m-01.gif" name="Image170" width="60" height="29" border="0" id="Image170" /></a>
<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image171','','/images/w02.gif',1)"><img src="/images/w01.gif" name="Image171" width="60" height="29" border="0" id="Image171" /></a>
<a href="http://bbs.aaaa0.com" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image172','','/images/s02.gif',1)"><img src="/images/s01.gif" name="Image172" width="60" height="29" border="0" id="Image172" /></a>
    </th>
    <th width="300" scope="col">&nbsp;</th>
  </tr>
</table>
        
    <table width="938" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="273" height="30" background="/images/index0_09.gif" scope="col">&nbsp;</th>
    <th width="389" background="/images/index0_10.gif" scope="col">&nbsp;</th>
    <th width="276" background="/images/index0_11.gif" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th height="30" colspan="3" scope="row"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="229" height="37" background="/images/index0_12.gif" scope="col">&nbsp;</th>
        <th scope="col"><table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th height="8" colspan="2" align="left" valign="top" scope="col"><img src="/images/index01_13.gif" width="509" height="8" /><img src="/images/index01_14.gif" width="200" height="8" /></th>
          </tr>
          <tr>
            <th height="29" align="left" valign="top" scope="col" class="style3" style="background-image:url(/images/searchbg.gif);">
                                <uc1:Search ID="Search1" runat="server" />   
                                          </th>
            <th width="39" align="left" valign="top" style="background-image:url(/images/index01_121.gif);"scope="col">
                &nbsp;</th>
          </tr>
        </table>    
        
        </th>
      </tr>
    </table></th>
  </tr>
</table>
</div>
