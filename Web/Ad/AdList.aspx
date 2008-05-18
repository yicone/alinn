<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="AdList.aspx.cs" Inherits="Web.Ad.AdList" Title="无标题页" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
   <div>
       <table width="100%">
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
       <asp:DataList ID="dlZone" runat="server" Width="100%">
           <ItemTemplate>
<table width="100%" border="1">
  <tr>
    <td style="width:100px;height:75px;"><a href="../Zone/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><img src="#" height="75px" width="100px" /></a></td>
    <td>
    <table width="100%" border="1">
  <tr style="width:100px;">
    <td style="width:70px; height: 40px;">网站名：</td>
    <td style="width: 139px; height: 40px"><a href="../Zone/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><%# Eval("SiteName") %></a></td>
  </tr>
  <tr>
    <td style="width: 70px">广告位：</td>
    <td style="width: 139px"><a href="../Zone/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>" target="_blank"><%# Eval("ZoneName") %></a></td>
  </tr>
  <tr>
    <td style="width: 70px">描述：</td>
    <td style="width: 139px"><asp:Label ID="labZoneDescription" runat="server"></asp:Label></td>
  </tr>
        <tr>
            <td colspan="2"><a href="tencent://message/?uin=<%# Eval("QQ") %>&Site=<%# Eval("SiteName") %>&Menu=yes" target="blank"><img src="http://wpa.qq.com/pa?p=1:1363036:7" alt="联系我吧？"></a><a href="../Zone/ZoneSite.aspx?SiteId=<%# Eval("SiteId") %>">查看此网站下的更多广告位</a></td>
        </tr>
    </table></td>
    <td style="width: 86px"><asp:Label ID="labTime" runat="server"></asp:Label></td>
    <td style="width: 116px"><asp:Label ID="labWeekPrice" runat="server" Text='<%# Bind("WeekPrice") %>'></asp:Label></td>
    <td>1111<asp:Label ID="labSize" runat="server" Text='<%# Bind("SizeCode") %>'></asp:Label></td>
    <td>&nbsp;<asp:Label ID="labVistersNum" runat="server" Text='<%# Bind("VistersNum") %>'></asp:Label></td>
    <td>&nbsp;<asp:Label ID="labPricePerK" runat="server" Text='<%# Eval("PricePerK") %>'></asp:Label></td>
  </tr>
</table>

           </ItemTemplate>
       </asp:DataList>&nbsp;
     <webdiyer:AspNetPager id="AspNetPager1" runat="server" HorizontalAlign="Center" Width="100%" OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
    </div>
</asp:Content>
