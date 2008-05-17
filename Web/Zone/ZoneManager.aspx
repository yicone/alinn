<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneManager.aspx.cs" Inherits="Web.ZoneManager"
    Title="广告位管理" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的阿里奶奶</title>
    <meta http-equiv="Content-Language" content="zh-cn" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="text/javascript" src="../App_Themes/jquery.js"></script>

    <%--    <script type="text/javascript" src="../App_Themes/common.js"></script>

    <link type="text/css" href="../App_Themes/alinn.css" />
    <link type="text/css" href="../App_Themes/myalinn.css" />--%>
    <style type="text/css">
        ul, li
        {
            list-style-type: none;
        }
        li
        {
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand"
        DataSourceID="SqlDataSource1" Width="800px">
        <HeaderTemplate>
            <tr>
                <td class="first" style="width: 95px; height: 32px; text-align: center;">
                    广告位名称/尺寸
                </td>
                <td style="width: 119px; text-align: center">
                    按时长计费价格(元/周)
                </td>
                <td style="width: 123px; text-align: center;">
                    支持广告类型
                </td>
                <td style="width: 82px; text-align: center;">
                    <select id="status" name="status">
                        <option value="">状态</option>
                        <option value="1">上架</option>
                        <option value="0">未激活</option>
                        <option value="2">下架</option>
                        <option value="3">拒绝</option>
                    </select>
                </td>
                <td class="actions" style="text-align: center;">
                    操作
                </td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr class="tlist-item">
                <td class="first" style="width: 95px; text-align: center;">
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ToZoneView1" CommandArgument='<%# Eval("ZoneId") %>'><%# Eval("ZoneName") %></asp:LinkButton>
                    <br />
                    <span class="gray">
                        <%# Eval("SizeCode") %></span><!-- 760x90 -->
                </td>
                <td style="width: 119px; text-align: center;">
                    <em>
                        <%# Eval("WeekPrice") %></em><span id="recommendWeekprice2021776" /><a onclick="calZonePrice('2021776','760x90','http://hotboo.com','','');return false;"
                            href="#"><span id="recommendWeekpriceCalLink2021776">计算推荐价格</span> </a></span>
                </td>
                <td class="cMediaType" style="width: 123px; text-align: center;">
                    <%# Eval("MediaType") %>
                </td>
                <td class="cZoneState" style="width: 82px; text-align: center;">
                    <%# Eval("ZoneState") %><!--未激活-->
                </td>
                <td class="actions" style="text-align: center;">
                    <ul style="text-align: center;">
                        <li>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="ToZoneSellDetail" CommandArgument='<%# Eval("ZoneId") %>'>查看报表</asp:LinkButton></li>
                        <li>&nbsp;</li>
                        <li>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ToZoneView2" CommandArgument='<%# Eval("ZoneId") %>'>修改</asp:LinkButton></li>
                        <li>&nbsp;</li>
                        <li>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="ToZoneDesigner" CommandArgument='<%# Eval("ZoneId") %>'>获取代码</asp:LinkButton></li>
                        <li>&nbsp;</li>
                        <li>
                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="DelZone" CommandArgument='<%# Eval("ZoneId") %>'><img width="16" height="16" align="absmiddle" src="http://img.alimama.cn/images/adzone/alimama_070609_06.gif" />删除</asp:LinkButton>
                        </li>
                        <li>&nbsp;</li>
                    </ul>
                </td>
            </tr>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_GetZoneInfoExtForSiteManager" SelectCommandType="StoredProcedure"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="SiteId" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>

    <script type="text/javascript">
        $(document).ready(function(){
            var tdList = $(".cMediaType");
            tdList.each(function(td){
                var mediaType = $(this).text();
                if(mediaType.indexOf("7") != -1)
                    $(this).text("文字和图片");
                else if(mediaType.indexOf("5") != -1)
                    $(this).text("图片");
                else if(mediaType.indexOf("2") != -1)
                    $(this).text("文字");
            });
            
            tdList = $(".cZoneState");
            tdList.each(function(td){
                var zoneState = $(this).text();
                if(zoneState.indexOf("0") != -1)
                    $(this).text("未激活");
                else if(zoneState.indexOf("1") != -1)
                    $(this).text("上架");
                else if(zoneState.indexOf("2") != -1)
                    $(this).text("下架");
                else if(zoneState.indexOf("3") != -1)
                    $(this).text("拒绝");
            });
            
            $("#status").change(function(){
                var jZoneState = $("select option:selected");
                var zoneState = jZoneState.text();
                alert(zoneState);
                if(zoneState != "状态")
                {
                    var selector = "td:contains('" + zoneState + "')" ;
                    $("#DataList1 tr").attr("style", "display:none");

                    $(selector).parent().attr("style", "display:block");
                    var i = 0;
                    $(".tlist-item").each(function(td){i += this.offsetHeight;});
//                    //$("#DataList1").css("height", i)
//                    var j = i + 32;
//                    $(document.forms[0]).css("height", j);
//                    $(window.frameElement).css("height", j);
                    //$("#DataList1").attr("height", i + 67);
                    $(window.frameElement).css("height", i + 67);
//                    alert(document.body.offsetHeight + "," + i + ","　+ j);
                }
            });
        });
    </script>

</body>
</html>
