<%@ Page Language="C#" MasterPageFile="~/MasterPage/Global.Master" AutoEventWireup="true"
    CodeBehind="ShowZone.aspx.cs" Inherits="Web.ShowZone" Title="广告位" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="_mainContent">
    <br />
    <table width="936" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#F5F8FC">
        <tr>
            <th height="40" align="left" background="/images/b01.gif" class="d1" scope="col">
                <table width="936" height="40" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="348" align="left" scope="col">
                            &nbsp;你的位置: 首页 &gt; 买广告 &gt; 广告位详情
                        </th>
                        <th width="588" scope="col">
                            &nbsp;
                        </th>
                    </tr>
                </table>
            </th>
        </tr>
        <tr>
            <th height="372" scope="row">
                <table width="936" height="259" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="30" scope="col">
                            <table width="936" height="30" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th width="758" scope="col">
                                        &nbsp;&nbsp;&nbsp;<asp:Label ID="labZoneName1" runat="server"></asp:Label>
                                    </th>
                                    <th width="178" class="bu02" scope="col">
                                        本页浏览量：92次&nbsp;
                                    </th>
                                </tr>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <th height="229" bgcolor="#F2F6FB" scope="row">
                            <table width="936" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th width="246" height="340" valign="top" scope="col">
                                        <table width="100%" height="280" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th colspan="2" scope="col">
                                                    <img src="/images/003.gif" width="160" height="120" />
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="40" colspan="2" scope="row">
                                                    <asp:ImageButton ID="btnStoreZone" runat="server" Height="30px" ImageUrl="/images/b04.gif"
                                                        OnClick="btnStoreZone_Click" Width="111px" />
                                                </th>
                                            </tr>
                                            <tr>
                                                <th width="90" height="40" align="right" valign="middle" scope="row">
                                                    &nbsp;<span class="bu04">网站名称：</span>
                                                </th>
                                                <th width="156" align="left" scope="row">
                                                    <label>
                                                    </label>
                                                    <asp:Label ID="labSiteName" runat="server"></asp:Label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="40" align="right" valign="middle" scope="row">
                                                    &nbsp;<span class="bu04">广告位：</span>
                                                </th>
                                                <th height="40" align="left" class="bu05" scope="row">
                                                    <asp:Label ID="labZoneName" runat="server"></asp:Label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="40" align="right" valign="middle" scope="row">
                                                    &nbsp;<span class="bu04">广告尺寸：</span>
                                                </th>
                                                <th height="40" align="left" class="bu04" scope="row">
                                                    <asp:Label ID="labZoneSize" runat="server"></asp:Label>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="40" align="right" valign="middle" scope="row">
                                                    &nbsp;<span class="bu04">位&nbsp;置：</span>
                                                </th>
                                                <th height="40" align="left" class="bu04" scope="row">
                                                    <asp:Label ID="labIn" runat="server"></asp:Label>
                                                </th>
                                            </tr>
                                        </table>
                                        <p>
                                            &nbsp;</p>
                                    </th>
                                    <th width="362" valign="top" scope="col">
                                        <table width="358" height="300" border="0" cellpadding="0" cellspacing="0">
                                            <tr width="306">
                                                <th width="378" height="40" align="left" scope="col">
                                                    &nbsp;<span class="bu04">价&nbsp; 格：</span> &nbsp;<asp:Label ID="labWeekPrice" runat="server"></asp:Label>元/周
                                                </th>
                                            </tr>
                                            <tr>
                                                <th width="378" height="40" align="left" scope="row">
                                                    &nbsp;<span class="bu04">购买时间：请选择购买时段</span>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th width="378" height="216" scope="row">
                                                    <div class="rilishuoming_1224">选择购买起始日期，购买时长：
                                                        <select class="input" name="D1">
                                                            <option value="7" onclick="changeDay(7)" selected="selected">一周</option>
                                                            <option value="14" onclick="changeDay(14)">两周</option>
                                                        </select>
                                                    </div>
                                                    <div id="putOnDay" class="rilishuoming_1224_1">
                                                        <p>
                                                            起始日期:2008-06-08</p>
                                                        <p>
                                                            结束日期:2008-07-07</p>
                                                        <p>
                                                            购买天数:30天</p>
                                                    </div>
<!------------------------------------------------------------ 开始日历 ------------------------------------------------------------>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div class="rili_1224">
                                                                    <div id="main_outer_1">

                                                                        <script type="text/javascript" src="/JavaScript/calendar.js"></script>

                                                                        <div id="detail" style="position: absolute; top: 494px; left: 354px;">
                                                                        </div>
                                                                        <input id="SDuring" type="hidden" name="SDuring" value="7" />
                                                                        <input id="adZoneId" type="hidden" value="9edc5c3d-4bb9-46f0-bfb8-9a8801183c9c" name="adZoneId" />
                                                                        <input id="startDate" type="hidden" name="startDate" />
                                                                        <input id="endDate" type="hidden" name="endDate" />
                                                                        <div id="main_outer">
                                                                            <div id="cal_main">
                                                                                <div class="top">
                                                                                    <div class="input_txt">
                                                                                        <select class="input" onchange="changeCld()" name="SY" id="SY">

                                                                                            <script type="text/javascript">
//var beAbleBuyDate_start_year = 2008;	//test
for(i = beAbleBuyDate_start_year; i < beAbleBuyDate_start_year + 2; i++){
    document.write('<option value="' + i + '">' + i);
}
                                                                                            </script>

                                                                                        </select><span class="font_blue">年</span>
                                                                                    </div>
                                                                                    <div class="input_txt">
                                                                                        <select class="input" onchange="changeCld()" name="SM" id="SM">

                                                                                            <script type="text/javascript">
//var beAbleBuyDate_start_month = 5;	//test
for(i = beAbleBuyDate_start_month; i < 13; i++){	//i<13,表示不能隔年买
    document.write('<option value="' + i + '">' + i);
}
                                                                                            </script>

                                                                                        </select><span class="font_blue">月</span>
                                                                                    </div>
                                                                                    <div class="top_txt">
                                                                                        今天:

                                                                                        <script language="JavaScript">
//tY=2008;tM=6;tD=12;	//test
document.write(tY+'/'+(tM+1)+'/'+tD)
                                                                                        </script>

                                                                                    </div>
                                                                                    <div style="clear: both;">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="day">
                                                                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                        <tr>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>日</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>一</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>二</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>三</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>四</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>五</strong>
                                                                                            </td>
                                                                                            <td valign="middle" align="center">
                                                                                                <strong>六</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="middle">
                                                                                    <table width="100%" cellspacing="0" cellpadding="0" border="0" style="text-align: center;
                                                                                        color: rgb(0, 0, 0);">

                                                                                        <script type="text/javascript">
<!--
var gNum;
for(i=0;i<6;i++) {
    // 阳历的<tr>
    document.write('<tr>');
    for(j=0;j<7;j++) {
        gNum = i*7+j;
        //alert('<td class="td" id="SD' + gNum +'" onclick="selectDay(\'SD' + gNum +'\')" onMouseOver="mOvr(\'SD' + gNum +'\')" onMouseOut="mOut()" TITLE=""> </td>');
        document.write('<td class="td" id="SD' + gNum +'" onclick="selectDay(\'SD' + gNum +'\')" onMouseOver="mOvr(\'SD' + gNum +'\')" onMouseOut="mOut(\'SD' + gNum +'\')" TITLE=""> </td>');
        //document.write('<td class="s_d" id="SD' + gNum +'" onMouseOver="mOvr(' + gNum +')" onMouseOut="mOut()" TITLE=""> </td>');
        document.write('');
    }
}
//-->
                                                                                        </script>

                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <div style="background: rgb(255, 255, 255) none repeat scroll 0%; width: 100%; -moz-background-clip: -moz-initial;
                                                                                -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;
                                                                                padding-top: 5px;">
                                                                                <div class="shuoming_2">
                                                                                </div>
                                                                                <div style="padding-left: 2px; padding-right: 5px; height: 20px; line-height: 20px;
                                                                                    float: left;">
                                                                                    可购起始日</div>
                                                                                <div class="shuoming_3">
                                                                                </div>
                                                                                <div style="padding-left: 2px; padding-right: 5px; height: 20px; line-height: 20px;
                                                                                    float: left;">
                                                                                    选中起始日</div>
                                                                                <div class="shuoming_1">
                                                                                </div>
                                                                                <div style="padding-left: 2px; padding-right: 5px; height: 20px; line-height: 20px;
                                                                                    float: left;">
                                                                                    已卖出</div>
                                                                                <div style="border: 1px solid rgb(60, 182, 193); width: 14px; height: 14px; float: left;">
                                                                                </div>
                                                                                <div style="padding-left: 2px; padding-right: 5px; height: 20px; line-height: 20px;
                                                                                    float: left;">
                                                                                    当日</div>
                                                                                <div style="clear: both;">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="rili_1224" valign="top" align="left">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
<!------------------------------------------------------------ 结束日历 ------------------------------------------------------------>
                                                    <br />
                                                </th>
                                            </tr>
                                            <tr>
                                                <th width="378" height="40" scope="row">
                                                    <asp:Button ID="btnBuyAd" runat="server" OnClick="btnBuyAd_Click" Text="购买广告" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                </th>
                                            </tr>
                                        </table>
                                    </th>
                                    <th width="328" valign="top" scope="col">
                                        <table width="300" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <th height="14" scope="col">
                                                    <img src="/images/b05.gif" width="300" height="14" />
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="200" background="/images/b06.gif" scope="row">
                                                    <table width="300" height="200" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <th colspan="3" align="center" class="bu03" scope="col">
                                                                网站主信息
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th width="53" scope="row">
                                                                &nbsp;
                                                            </th>
                                                            <th width="94" align="left" class="bu04" scope="row">
                                                                网站主：
                                                            </th>
                                                            <th width="153" align="left" scope="row">
                                                                &nbsp;<span class="bu05"><asp:Label ID="labSiteOwner" runat="server"></asp:Label></span>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">
                                                                &nbsp;
                                                            </th>
                                                            <th align="left" class="bu04" scope="row">
                                                                网站主信用：
                                                            </th>
                                                            <th align="left" scope="row">
                                                                &nbsp;<span class="bu05">5 </span>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">
                                                                &nbsp;
                                                            </th>
                                                            <th align="left" class="bu04" scope="row">
                                                                广告主信用：
                                                            </th>
                                                            <th align="left" scope="row">
                                                                &nbsp;<span class="bu05">0 </span>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row">
                                                                &nbsp;
                                                            </th>
                                                            <th align="left" class="bu04" scope="row">
                                                                注册时间：
                                                            </th>
                                                            <th align="left" scope="row">
                                                                &nbsp;<span class="bu05"><asp:Label ID="labRegTime" runat="server"></asp:Label>
                                                                </span>
                                                            </th>
                                                        </tr>
                                                    </table>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="14" scope="row">
                                                    <img src="/images/b07.gif" width="300" height="14" />
                                                </th>
                                            </tr>
                                        </table>
                                        <table width="300" height="80" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th width="150" scope="col">
                                                    &nbsp;
                                                </th>
                                                <th width="150" scope="col">
                                                    &nbsp;
                                                </th>
                                            </tr>
                                            <tr>
                                                <th height="54" align="right" class="bu03" scope="row">
                                                    联系网站主：
                                                </th>
                                                <td align="left">
                                                    <asp:Label ID="labConnect" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <p>
                                            &nbsp;</p>
                                    </th>
                                </tr>
                            </table>
                        </th>
                    </tr>
                </table>
            </th>
        </tr>
    </table>
    <br />
    <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th colspan="2" scope="col">
                <img src="/images/b08.gif" width="937" height="30" />
            </th>
        </tr>
        <tr>
            <th width="400" height="230" bgcolor="#F0F0F0" scope="row">
                <table width="374" height="210" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="112" align="right" class="bu04" scope="col">
                            广告位类目：
                        </th>
                        <th width="262" align="left" class="bu04" scope="col">
                            <asp:Label ID="labZoneClass" runat="server"></asp:Label>
                        </th>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            是否需审核：
                        </th>
                        <td align="left" class="bu04">
                            <asp:Label ID="labCheck" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            是否在首页：
                        </th>
                        <td align="left" class="bu04">
                            <asp:Label ID="labInfirst" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            关键字：
                        </th>
                        <td align="left" class="bu04">
                            <asp:Label ID="labKeywords" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            网站描述：
                        </th>
                        <td align="left" class="bu04">
                            <asp:Label ID="labDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            性别：
                        </th>
                        <td align="left" class="bu04">
                            男女基本一致
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            年龄：
                        </th>
                        <td align="left" class="bu04">
                            18~25岁
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            职业：
                        </th>
                        <td align="left" class="bu04">
                            学生,职员,高级管理人员,
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            月收入：
                        </th>
                        <td align="left" class="bu04">
                            1000~3000
                        </td>
                    </tr>
                    <tr>
                        <th align="right" scope="row" class="bu04">
                            兴趣爱好：
                        </th>
                        <td align="left" class="bu04">
                            网络
                        </td>
                    </tr>
                </table>
            </th>
            <th width="500" valign="top" bgcolor="#F0F0F0" scope="row">
                <table width="400" height="230" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="36" align="center" class="bu03" scope="col">
                            该广告位数据信息走势图
                        </th>
                    </tr>
                    <tr>
                        <th width="480" height="210" scope="row">
                            <asp:Label ID="labAlexa" runat="server"></asp:Label><br />
                            <img src="/images/b09.gif" width="480" height="211" />
                        </th>
                    </tr>
                </table>
            </th>
        </tr>
    </table>
    <br>
    <table width="936" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th height="28" align="left" bgcolor="#F0F0F0" class="bu03" scope="col">
                &nbsp;该网站下其它广告位
            </th>
            <th align="right" bgcolor="#F0F0F0" class="bu06" scope="col">
                &gt;&gt; 更多&nbsp;
            </th>
        </tr>
        <tr>
            <th height="20" colspan="2" align="left" background="/images/b10.gif" scope="col">
                <table width="936" height="20" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th width="241" align="center" class="bu02" scope="col">
                            广告位名称
                        </th>
                        <th width="10" class="bu01" scope="col">
                            |
                        </th>
                        <th width="122" align="center" class="bu02" scope="col">
                            价 格
                        </th>
                        <th width="9" scope="col">
                            <span class="bu01">|</span>
                        </th>
                        <th width="167" align="center" class="bu02" scope="col">
                            最早可购买时间
                        </th>
                        <th width="8" scope="col">
                            <span class="bu01">|</span>
                        </th>
                        <th width="154" align="center" class="bu02" scope="col">
                            尺 寸
                        </th>
                        <th width="7" scope="col">
                            <span class="bu01">|</span>
                        </th>
                        <th width="182" align="center" class="bu02" scope="col">
                            千人访问成本
                        </th>
                        <th width="37" scope="col">
                            &nbsp;
                        </th>
                    </tr>
                </table>
            </th>
        </tr>
    </table>
    <asp:GridView ID="gvOtherZone" runat="server">
        <Columns>
            <asp:BoundField DataField="ZoneName" />
        </Columns>
    </asp:GridView>
    <br>
    <table width="936" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="680" align="left" bgcolor="#F0F0F0" scope="col">
                &nbsp;<span class="bu03">该网站下其它广告位</span>
            </th>
            <th width="256" align="right" bgcolor="#F0F0F0" scope="col">
                <span class="bu06">&gt;&gt; 更多&nbsp;</span>
            </th>
        </tr>
    </table>
    <asp:GridView ID="gvLatestOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId"
        DataSourceID="sdsLatestOrder">
        <Columns>
            <asp:BoundField DataField="OrderId" HeaderText="OrderId" ReadOnly="True" SortExpression="OrderId" />
            <asp:BoundField DataField="OrderName" HeaderText="OrderName" SortExpression="OrderName" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="AdId" HeaderText="AdId" SortExpression="AdId" />
            <asp:BoundField DataField="ZoneId" HeaderText="ZoneId" SortExpression="ZoneId" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            <asp:BoundField DataField="AuditState" HeaderText="AuditState" SortExpression="AuditState" />
            <asp:BoundField DataField="PerPoint" HeaderText="PerPoint" SortExpression="PerPoint" />
            <asp:BoundField DataField="EverydayPrice" HeaderText="EverydayPrice" SortExpression="EverydayPrice" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
            <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsLatestOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [AL_Order] WHERE ([ZoneId] = @ZoneId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ZoneId" QueryStringField="ZoneId" Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>
    <table width="936" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="680" align="left" bgcolor="#F0F0F0" scope="col">
                &nbsp;<span class="bu03">交易评价(3) </span>
            </th>
            <th width="256" align="right" bgcolor="#F0F0F0" scope="col">
                <span class="bu06"><span class="bu06">&gt;&gt; </span>更多&nbsp;</span>
            </th>
        </tr>
    </table>
    <table width="936" height="22" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="243" height="20" background="/images/b10.gif" class="bu02" scope="col">
                表 情
            </th>
            <th width="10" background="/images/b10.gif" scope="col">
                <span class="bu01">|</span>
            </th>
            <th width="439" background="/images/b10.gif" class="bu02" scope="col">
                评价内容
            </th>
            <th width="8" background="/images/b10.gif" scope="col">
                <span class="bu01">|</span>
            </th>
            <th width="236" background="/images/b10.gif" class="bu02" scope="col">
                评价人
            </th>
        </tr>
    </table>
    <asp:DataList ID="dlEvaluation" runat="server" DataKeyField="EvaluationId" DataSourceID="sdsEvaluation">
        <ItemTemplate>
            <table width="100%" border="0">
                <tr>
                    <td width="16%">
                        用户：
                        <asp:Label ID="NickNameLabel" runat="server" Text='<%# Eval("NickName") %>' />
                    </td>
                    <td width="84%">
                        分数：
                        <asp:Label ID="ScoreLabel" runat="server" Text='<%# Eval("Score") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        描述：
                        <asp:Label ID="DescriptiontLabel" runat="server" Text='<%# Eval("Descriptiont") %>' />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        评价时间：
                    </td>
                    <td>
                        <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="sdsEvaluation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_AL_Evaluation_GetListWhere" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="AL_Evaluation.Type=1" Name="StrWhere" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>
    <table width="936" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="686" align="left" bgcolor="#F0F0F0" scope="col">
                &nbsp;<span class="bu03">相关广告位推荐</span>
            </th>
            <th width="250" align="right" bgcolor="#F0F0F0" scope="col">
                <span class="bu06">&gt;&gt; 更多&nbsp;</span>
            </th>
        </tr>
    </table>
    <table width="936" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="234" height="312" background="/images/b12.gif" scope="col">
                <table width="100%" height="303" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="152" colspan="2" scope="col">
                            <p>
                                <img src="/images/003.gif" width="160" height="120" /><br />
                                <span class="bu07">￥10.00元/周</span></p>
                        </th>
                    </tr>
                    <tr>
                        <th width="49%" height="30" align="right" class="bu04" scope="row">
                            网站名：
                        </th>
                        <th width="51%" align="left" class="bu05" scope="row">
                            八讯免费网
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            广告位：
                        </th>
                        <th height="30" align="left" class="bu05" scope="row">
                            顶部 横幅广告
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            尺寸：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            468x60
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            千人访问成本：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            0.73元
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            最早可购买时间：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            2008-06-23
                        </th>
                    </tr>
                </table>
            </th>
            <th width="234" background="/images/b12.gif" scope="col">
                <table width="100%" height="312" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="150" colspan="2" scope="col">
                            <img src="/images/003.gif" width="160" height="120" /><br />
                            <span class="bu07">￥10.00元/周</span>
                        </th>
                    </tr>
                    <tr>
                        <th width="49%" height="30" align="right" class="bu04" scope="row">
                            网站名：
                        </th>
                        <th width="51%" align="left" class="bu05" scope="row">
                            八讯免费网
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            广告位：
                        </th>
                        <th height="30" align="left" class="bu05" scope="row">
                            顶部 横幅广告
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            尺寸：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            468x60
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            千人访问成本：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            0.73元
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            最早可购买时间：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            2008-06-23
                        </th>
                    </tr>
                </table>
            </th>
            <th width="234" bgcolor="#EAEFF9" scope="col">
                <table width="100%" height="312" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="150" colspan="2" scope="col">
                            <img src="/images/003.gif" width="160" height="120" /><br />
                            <span class="bu07">￥10.00元/周</span>
                        </th>
                    </tr>
                    <tr>
                        <th width="49%" height="30" align="right" class="bu04" scope="row">
                            网站名：
                        </th>
                        <th width="51%" align="left" class="bu05" scope="row">
                            八讯免费网
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            广告位：
                        </th>
                        <th height="30" align="left" class="bu05" scope="row">
                            顶部 横幅广告
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            尺寸：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            468x60
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            千人访问成本：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            0.73元
                        </th>
                    </tr>
                    <tr>
                        <th height="30" align="right" class="bu04" scope="row">
                            最早可购买时间：
                        </th>
                        <th height="30" align="left" class="bu04" scope="row">
                            2008-06-23
                        </th>
                    </tr>
                </table>
            </th>
            <th width="234" bgcolor="#EAEFF9" scope="col">
                <table width="100%" height="300" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="25" background="/images/b13.gif" class="bu03" scope="col">
                            同类目成交排行榜
                        </th>
                    </tr>
                    <tr>
                        <th height="262" background="/images/b14.gif" scope="row">
                            <table width="95%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th width="32" height="24" scope="col">
                                        <img src="/images/p1.gif" width="22" height="22" />
                                    </th>
                                    <th width="120" height="24" scope="col">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th width="70" height="24" class="bu08" scope="col">
                                        ￥2.80元/周
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p2.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p3.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p4.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p5.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p6.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p7.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p8.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p9.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a><a href="http://www.alimama.com/membersvc/zone/303485.htm"
                                            target="_blank" class="bu09"></a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                                <tr>
                                    <th height="24" scope="row">
                                        <img src="/images/p10.gif" width="22" height="22" />
                                    </th>
                                    <th height="24" scope="row">
                                        <a href="#" target="_blank" class="bu09">论坛首页一(高点击)</a>
                                    </th>
                                    <th height="24" scope="row">
                                        <span class="bu08">￥2.80元/周</span>
                                    </th>
                                </tr>
                            </table>
                        </th>
                    </tr>
                    <tr>
                        <th height="13" scope="row">
                            <img src="/images/b15.gif" width="234" height="13" />
                        </th>
                    </tr>
                </table>
            </th>
        </tr>
    </table>
    <br>
    <table width="936" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="680" align="left" bgcolor="#F0F0F0" scope="col">
                &nbsp;<span class="bu03">留言（3）</span>
            </th>
            <th width="256" align="right" bgcolor="#F0F0F0" scope="col">
                <span class="bu06"><span class="bu06">&gt;&gt; </span>更多&nbsp;</span>
            </th>
        </tr>
    </table>
    <asp:DataList ID="dlMessage" runat="server">
        <ItemTemplate>
            <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="450" height="25" background="/images/b11.gif" class="bu06" scope="col">
                        <asp:Label ID="labTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </th>
                    <th width="248" background="/images/b11.gif" class="bu06" scope="col">
                        <asp:Label ID="labUser" runat="server" Text='<%# Eval("NickName") %>'></asp:Label>
                    </th>
                    <th width="238" background="/images/b11.gif" class="bu06" scope="col">
                        &nbsp;<span class="bu02"><asp:Label ID="labCreateDate" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
                        </span>
                    </th>
                </tr>
            </table>
        </ItemTemplate>
        <HeaderTemplate>
            <table width="936" height="22" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <th width="449" height="20" background="/images/b10.gif" class="bu02" scope="col">
                        标 题
                    </th>
                    <th width="10" background="/images/b10.gif" scope="col">
                        <span class="bu01">|</span>
                    </th>
                    <th width="236" background="/images/b10.gif" class="bu02" scope="col">
                        评价人
                    </th>
                    <th width="8" background="/images/b10.gif" scope="col">
                        <span class="bu01">|</span>
                    </th>
                    <th width="236" background="/images/b10.gif" class="bu02" scope="col">
                        最后回复时间
                    </th>
                </tr>
            </table>
        </HeaderTemplate>
    </asp:DataList>
    <br>
    <table width="936" height="28" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th align="left" bgcolor="#F0F0F0" class="bu03" scope="col">
                &nbsp;发表留言
            </th>
            <th bgcolor="#F0F0F0" scope="col">
                &nbsp;
            </th>
        </tr>
    </table>
    <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <th width="175" height="30" align="right" bgcolor="#F0F0F0" class="bu04" scope="col">
                标 题:&nbsp;&nbsp;&nbsp;&nbsp;
            </th>
            <th width="74" align="left" valign="middle" bgcolor="#F0F0F0" scope="col">
                <label>
                </label>
            </th>
            <th colspan="2" align="left" bgcolor="#F0F0F0" scope="col">
                <asp:TextBox ID="textTitle" runat="server" Width="440px"></asp:TextBox>
            </th>
        </tr>
        <tr>
            <th height="25" align="right" bgcolor="#F0F0F0" class="bu04" scope="row">
                内 容:&nbsp;&nbsp;&nbsp;&nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th height="25" colspan="2" align="left" bgcolor="#F0F0F0" scope="row">
                <asp:TextBox ID="textMessageContent" runat="server" Height="184px" TextMode="MultiLine"
                    Width="440px"></asp:TextBox>
            </th>
        </tr>
        <tr>
            <th height="30" align="right" bgcolor="#F0F0F0" class="bu04" scope="row">
                &nbsp;&nbsp;&nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th height="25" colspan="2" align="left" bgcolor="#F0F0F0" scope="row">
                <asp:ImageButton ID="ibtnAddMessage" runat="server" Height="22px" ImageUrl="/images/b18.gif"
                    OnClick="ibtnAddMessage_Click" Width="78px" />
            </th>
        </tr>
        <tr>
            <th height="30" align="right" bgcolor="#F0F0F0" class="bu04" scope="row">
                &nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th width="103" height="25" align="left" valign="middle" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th width="584" align="left" valign="middle" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
        </tr>
        <tr>
            <th height="30" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
            <th height="25" align="left" bgcolor="#F0F0F0" scope="row">
                &nbsp;
            </th>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="_htmlHeadContent">
    <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
    <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%>
    <link href="/CSS/calander.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="_scriptContent">

    <script type="text/javascript">
var countDay;
// 时长选择
function changeDay(day){
//	// 选择日期变化
//	var during = document.getElementById("divduring"+day);
//	var duringradio = document.getElementById("during"+day);
//	var durings = document.getElementsByName("during");
//	for(i=0;i<durings.length;i++){
//		document.getElementById('div'+durings[i].id).className = 'huadong1224_1';
//	}
//	duringradio.checked = true;// 选中单选按钮
//	during.className = 'huadong1224_1_queding';// 选中时的css样式
//	// 行为数据隐藏,日历显示
//	var fixed = document.getElementById("fixed");
//	var direct = document.getElementById("direct");
//	fixed.style.display = 'none';
//	direct.style.display = 'block';
	// 日历变化
	var SDuring = document.getElementById("SDuring");
	SDuring.value = day;
	changeCld_1();
	// 提示购买信息 
	var putOnDay = document.getElementById("putOnDay");
	var putOnDayHtml = "";
	putOnDayHtml += "<p>起始日期:--</p>";
	putOnDayHtml += "<p>结束日期:--</p>";
	putOnDayHtml += "<p>购买天数:--</p>";
	putOnDay.innerHTML = putOnDayHtml;
}

    </script>

</asp:Content>
