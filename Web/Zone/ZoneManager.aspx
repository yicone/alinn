<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneManager.aspx.cs" Inherits="Web.ZoneManager" title="Untitled Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>我的阿里奶奶</title>
    <meta http-equiv="Content-Language" content="zh-cn" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../App_Themes/jquery.js"></script>
    <script type="text/javascript" src="../App_Themes/common.js"></script>
    <link type="text/css" href="../App_Themes/alinn.css" />
    <link type="text/css" href="../App_Themes/myalinn.css" />
</head>
<body>
    <form id="form1" runat="server">
<div id="main">
		<script type="text/javascript" src="../App_Themes/jquery.js"></script>
    <style type="text/css">
        ul, li{
	        list-style-type:none;
        }
        li{
	        float:left;
        }
    </style>
    <div style="width: 100%; height: 100%">
        <table class="tlists" cellspacing="1" cellpadding="0" border="0" width="800px">
            <thead class="tcaption">
                <tr>
                    <th style="width: 95px">
                        广告位名称/尺寸</th>
                    <th style="width: 119px">
                        按时长计费价格(元/周)</th>
                    <th style="width: 123px">
                        支持广告类型</th>
                    <th style="width: 82px">
                        <select id="status" onchange="chg_status();" name="status">
                            <option value="">状态</option>
                            <option value="A">上架</option>
                            <option value="N">未激活</option>
                            <option value="O">下架</option>
                            <option value="R">拒绝</option>
                        </select>x
                    </th>
                    <th class="actions" width="315">
                        操作</th>
                </tr>
            </thead>
            <tbody>
                <asp:DataList ID="DataList1" runat="server" 
                    OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <tr class="tlist-item">
                            <td class="first" style="width: 95px; text-align: center;">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ToZoneView" CommandArgument='<%# Eval("ZoneId") %>'><%# Eval("ZoneName") %></asp:LinkButton>
                                <br />
                                <span class="gray">
                                    <%# Eval("SizeCode") %></span><!-- 760x90 --></td>
                            <td style="width: 119px; text-align: center;">
                                <em>
                                    <%# Eval("WeekPrice") %></em><span id="recommendWeekprice2021776" /><a onclick="calZonePrice('2021776','760x90','http://hotboo.com','','');return false;"
                                    href="#"><span id="recommendWeekpriceCalLink2021776">计算推荐价格</span> </a></span>
                            </td>
                            <td style="width: 123px; text-align: center;">
                                <%# Eval("MediaType") %></td>
                            <td style="width: 82px; text-align: center;">
                                <%# Eval("ZoneState") %><!--未激活--></td>
                            <td class="actions" width="315px">
                                <ul>
                                    <li><a target="_blank" href='<%# "../Report/ZoneSellDetail.aspx?zoneid=" + Eval("ZoneId") %>'>
                                        查看报表    </a> </li>
                                    <li>&nbsp;</li>
                                    <li><a target="_blank" href='<%# "ZoneView.aspx?zoneid=" + Eval("ZoneId") %>'>
                                        修改    </a> </li>
                                    <li>&nbsp;</li>
                                    <li><a target="_blank" href='<%# "ZoneDesigner.aspx?zoneid=" + Eval("ZoneId") %>'>
                                        获取代码    </a> </li>
                                    <li>&nbsp;</li>
                                    <li><a onclick="dojobcooperate('delete','2021776','953317','')" href="#">
                                        <img width="16" height="16" align="absmiddle" src="http://img.alimama.cn/images/adzone/alimama_070609_06.gif" />
                                        删除 </a></li>
                                    <li>&nbsp;</li>
                                </ul>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList></tbody></table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_GetZoneInfoExtForSiteManager" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="SiteId" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
    </form>
</body>
</html>

