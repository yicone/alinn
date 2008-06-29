<%@ Page Language="C#" MasterPageFile="~/MasterPage/Global.Master" AutoEventWireup="true" CodeBehind="AdList.aspx.cs" Inherits="Web.Ad.AdList" Title="无标题页" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <div>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="25" align="left" scope="col"><table width="936" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="234" align="left" background="/images/b01.gif" scope="col">&nbsp;<span class="d1">你的位置:</span> <span class="d1">首页</span> <span class="d1">&gt;</span> <span class="d1">买广告</span> <span class="d1">&gt; </span></th>
        <th width="215" background="/images/b01.gif" scope="col"><a href="#" class="13">[什么是广告位类别]</a></th>
        <th width="487" background="/images/b01.gif" scope="col"><a href="#" target="_blank" class="13">买广告，做推广，还有推广基金送</a>(横向滚动字母）</th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="5" scope="row">&nbsp;</th>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="30" scope="col"><table width="936" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="55" align="center" valign="middle" scope="col"><img src="/images/d05.gif" width="30" height="34" /></th>
        <th width="881" align="left" scope="col"><span class="d2">请进入下方类目中挑选广告位</span></th>
      </tr>
    </table></th>
  </tr>
</table>
<table width="936" height="8" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="/app_themes/new/images/分隔符.gif" width="1" height="1" /></td>
  </tr>
</table>

<table width="936" border="1"  align="center" cellpadding="0" cellspacing="0" style="border:sild thin ffcc00;">
  <tr>
    <td valign="top">
        <asp:DataList ID="dlClasses" runat="server" OnItemDataBound="dlClasses_ItemDataBound"
        RepeatColumns="7" RepeatDirection="Horizontal" ShowFooter="False" Width="100%">
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
        <ItemTemplate>
            <asp:Label ID="labClassName" runat="server" Text='<%# Bind("ClassName") %>' Font-Size="Small"
                ForeColor="#33CCFF" Font-Bold="True"></asp:Label>
            <br />
            <asp:DataList ID="dlSonClasses" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                RepeatLayout="Flow" Width="100%" Font-Size="Small" ForeColor="#66CCFF">
                <ItemTemplate>
                    <a href="/Public/AdList.aspx?ClassId=<%#Eval("ClassId") %>" style="color:#33CCFF">
                        <%# Eval("ClassName") %></a>
                </ItemTemplate>
            </asp:DataList>
        </ItemTemplate>
    </asp:DataList></td>
  </tr>
</table>

<table width="936" height="15" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="/app_themes/new/images/分隔符.gif" width="1" height="1"></td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th height="5" scope="col">&nbsp;</th>
  </tr>
  <tr>
    <th width="936" height="30" background="/images/d03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
       <table style="width:100%; border-width:thin;">
           <tr>
               <td style="width: 30%; text-align: center;">
       <asp:RadioButtonList ID="rblInFirst" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
           <asp:ListItem Value=" And AL_Zone.InFirst=1">在首页</asp:ListItem>
           <asp:ListItem Value=" ">不要求</asp:ListItem>
       </asp:RadioButtonList></td>
               <td style="width: 50px">
                   <asp:DropDownList ID="ddlPricePerK" runat="server" AutoPostBack="True" Width="144px">
                       <asp:ListItem Selected="True" Value=" ">千人访问成本</asp:ListItem>
                       <asp:ListItem Value=" and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&lt;2">2元以下</asp:ListItem>
                       <asp:ListItem Value="and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&gt;=2 and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&lt;5">2-5元</asp:ListItem>
                       <asp:ListItem Value=" and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&gt;=5 and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&lt;10">5-10元</asp:ListItem>
                       <asp:ListItem Value=" and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&gt;=10 and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&lt;=20">10-20元</asp:ListItem>
                       <asp:ListItem Value=" and ((AL_Zone.WeekPrice*7000)/AL_Site.VistersNum)&gt;20">大于20元</asp:ListItem>
                   </asp:DropDownList></td>
               <td style="width: 100px">
                       <asp:DropDownList ID="ddlVisteNumPerDay" runat="server" AutoPostBack="True" Width="144px">
                       <asp:ListItem Selected="True" Value=" ">日均访问人数</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&lt;100">100以下</asp:ListItem>
                       <asp:ListItem Value="and VistersNum&gt;=100 and VistersNum&lt;200">100-200人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;=200 and VistersNum&lt;500">200－500人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;=500 and VistersNum&lt;=1000">500－1000人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;1000 and VistersNum&lt;=1000">1000－3000人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;3000 and VistersNum&lt;=10000">3000－10000人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;10000 and VistersNum&lt;=100000">10000－100000人</asp:ListItem>
                       <asp:ListItem Value=" and VistersNum&gt;100000">100000以上</asp:ListItem>
                   </asp:DropDownList>
                   </td>
               <td style="width: 100px">
               </td>
           </tr>
       </table>
       <asp:DataList ID="dlZone" runat="server" Width="936px">
           <HeaderTemplate>
<table style="width:100%; border-width:thin; text-align:center;">
  <tr>
    <td style="width:100px;">广告缩略图</td>
    <td style="width: 280px">广告详细信息</td>
    <td style="width: 80px">最早购买时间</td>
    <td style="width: 86px">周价格</td>
    <td style="width: 86px">广告大小</td>
    <td style="width: 86px">日均访问人数</td>
    <td style="width: 86px">千人访问成本</td>
  </tr>
</table>

           </HeaderTemplate>
           <ItemTemplate>
<table style="width:100%; border-width:thin; background: url('/app_themes/new/images/004.gif');background-position:bottom;background-attachment:scroll; ">
  <tr>
    <td style="width:100px;height:75px;"><a href="/Public/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><img src="#" height="75px" width="100px" /></a></td>
    <td>
    <table width="100%" border="0">
  <tr style="width:100px;">
    <td style="width:70px; height: 40px;">网站名：</td>
    <td style="width: 139px; height: 40px"><a href="/Public/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><%# Eval("SiteName") %></a></td>
  </tr>
  <tr>
    <td style="width: 70px">广告位：</td>
    <td style="width: 139px"><a href="/Public/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><%# Eval("ZoneName") %></a></td>
  </tr>
  <tr>
    <td style="width: 70px">描述：</td>
    <td style="width: 139px"><asp:Label ID="labZoneDescription" runat="server"></asp:Label></td>
  </tr>
        <tr>
            <td colspan="2"><a href="tencent://message/?uin=<%# Eval("QQ") %>&Site=<%# Eval("SiteName") %>&Menu=yes" target="blank"><img src="http://wpa.qq.com/pa?p=1:1363036:7" alt="联系我吧？"></a><a href="/Member/Zone/ZoneSite.aspx?SiteId=<%# Eval("SiteId") %>">查看此网站下的更多广告位</a></td>
        </tr>
    </table></td>
    <td style="width: 80px"><asp:Label ID="labTime" runat="server"></asp:Label></td>
    <td style="width: 51px"><asp:Label ID="labWeekPrice" runat="server" Text='<%# Bind("WeekPrice") %>'></asp:Label></td>
    <td style="width: 51px"><asp:Label ID="labSize" runat="server" Text='<%# Bind("SizeCode") %>'></asp:Label></td>
    <td style="width: 86px"><asp:Label ID="labVistersNum" runat="server" Text='<%# Bind("VistersNum") %>'></asp:Label></td>
    <td style="width: 86px"><asp:Label ID="labPricePerK" runat="server" Text='<%# Eval("PricePerK") %>'></asp:Label></td>
  </tr>
</table>

           </ItemTemplate>
       </asp:DataList>&nbsp;
     <webdiyer:AspNetPager id="AspNetPager1" runat="server" HorizontalAlign="Center" Width="100%" OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
    </div>
</asp:Content>
