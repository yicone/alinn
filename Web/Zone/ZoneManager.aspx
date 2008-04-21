<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneManager.aspx.cs" Inherits="Web.ZoneManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <div>
        <table class="tlists" cellspacing="1" cellpadding="0" border="0">
            <thead class="tcaption">
                <tr>
                    <th>
                        广告位名称/尺寸</th>
                    <th>
                        按时长计费价格(元/周)</th>
                    <th>
                        支持广告类型</th>
                    <th>
                        <select id="status" onchange="chg_status();" name="status">
                            <option value="">状态</option>
                            <option value="A">上架</option>
                            <option value="N">未激活</option>
                            <option value="O">下架</option>
                            <option value="R">拒绝</option>
                        </select>
                    </th>
                    <th class="actions" width="315">
                        操作</th>
                </tr>
            </thead>
            <tbody>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnDataBinding="DataList1_DataBinding">
                    <ItemTemplate>
                        <tr class="tlist-item">
                            <td class="first">
                                <a target="_blank" href='<%# "/Zone/ZoneView.aspx?zoneid=" + Eval("ZoneId") %>'><%# Eval("ZoneName") %> </a>
                                <br />
                                <span class="gray"><%# Eval("ZoneSize") %> </span> <!-- 760x90 -->
                            </td>
                            <td>
                                <em>
                                    <%# Eval("WeekPrice") %>
                                </em><span id="recommendWeekprice2021776" /><a onclick="calZonePrice('2021776','760x90','http://hotboo.com','','');return false;"
                                    href="#"><span id="recommendWeekpriceCalLink2021776">计算推荐价格</span> </a>
                            </td>
                            <td>
                                <%# Eval("MediaType") %>
                            </td>
                            <td>
                                <%# Eval("ZoneState") %>    <!--未激活-->
                            </td>
                            <td class="actions" width="315">
                                <ul>
                                    <li><a target="_blank" href='<%# "/Report/ZoneSellDetail.aspx?zoneid=" + Eval("ZoneId") %>'>
                                        查看报表</a> </li>
                                    <li></li>
                                    <li><a target="_blank" href='<%# "/Zone/ZoneView.aspx?oper=edit&zoneid=" + Eval("ZoneId") %>'>修改</a> </li>
                                    <li><a target="_blank" href='<%# "/Zone/ZoneDesigner.aspx?oper=edit&zoneid=" + Eval("ZoneId") + "&returnactivezonelist=true"%>'>
                                        获取代码</a> </li>
                                    <li><i /></li>
                                    <li><a onclick="dojobcooperate('delete','2021776','953317','')" href="#">
                                        <img width="16" height="16" align="absmiddle" src="http://img.alimama.cn/images/adzone/alimama_070609_06.gif" />
                                        删除 </a></li>
                                    <li></li>
                                </ul>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList></tbody></table>
    </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="UP_ZoneInfoExt" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:QueryStringParameter Name="SiteId" QueryStringField="siteid" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
