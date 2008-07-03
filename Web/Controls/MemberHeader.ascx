<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberHeader.ascx.cs" Inherits="Web.Controls.MemberHeader" %>
<style type="text/css">
    .style1
    {
        width: 207px;
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="248" height="62" rowspan="2" scope="col"><img src="/images/logo.gif" width="174" height="62" /></th>
    <th height="20" background="/images/yh07.gif" scope="col" class="style1">&nbsp;</th>
    <th width="186" height="20" align="right" background="/images/yh07.gif" scope="col"><ul>
      <span class="bu06">      欢迎您！&nbsp;</span> </th>
    <th width="100" background="/images/yh07.gif" class="dl1" scope="col"><asp:HyperLink ID="hlLogin" runat="server">登录</asp:HyperLink>|</th>
    <th width="92" background="/images/yh07.gif" class="bu06" scope="col"><asp:LinkButton ID="lbRegister" runat="server" OnClick="LinkButton1_Click">注册</asp:LinkButton></th>
    <th width="7" background="/images/yh07.gif" class="dl1" scope="col">|</th>
    <th width="86" background="/images/yh07.gif" class="bu06" scope="col"><a href="/Member/MyAlinn.aspx">我的赢在广告</a></th>
    <th width="7" align="left" background="/images/yh07.gif" class="dl1" scope="col">|</th>
    <th width="8" align="left" background="/images/yh07.gif" class="bu06" scope="col">&nbsp;</th>
    <th width="31" align="left" background="/images/yh07.gif" class="bu06" scope="col">帮助</th>
    <th width="45" align="left" class="bu06" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th scope="col" class="style1">&nbsp;</th>
    <th height="42" colspan="9" scope="col"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="133" scope="col"><a href="/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','/images/sy02.gif',1)"></a></th>
        <th width="60" scope="col"><a href="/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','/images/sy02.gif',1)"><img src="/images/sy01.gif" name="Image5" width="53" height="25" border="0" id="Image5" /></a></th>
        <th width="60" align="center" scope="col"><a href="/public/adlist.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','/images/h11.gif',1)"><img src="/images/h1.gif" name="Image2" width="53" height="25" border="0" id="Image2" /></a></th>
        <th width="60" scope="col"><a href="/public/sellad.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','/images/h22.gif',1)"><img src="/images/h2.gif" name="Image3" width="53" height="25" border="0" id="Image3" /></a></th>
        <th width="60" scope="col"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','/images/wz02.gif',1)"><img src="/images/wz01.gif" name="Image6" width="53" height="25" border="0" id="Image6" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','/images/h22.gif',1)"></a></th>
        <th width="96" align="left" scope="col"><a href="http://bbs.aaaa0.com/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','/images/h33.gif',1)"><img src="/images/h3.gif" name="Image4" width="53" height="25" border="0" id="Image4" /></a></th>
      </tr>
    </table></th>
  </tr>
</table>
