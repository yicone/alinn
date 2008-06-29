<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneManager.aspx.cs" Inherits="Web.ZoneManager"
    Title="广告位管理" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的赢在广告</title>
    <meta http-equiv="Content-Language" content="zh-cn" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <script type="text/javascript" src="/JavaScript/jquery.js"></script>

    <style type="text/css">
        ul, li
        {
            list-style-type: none;
        }
        li
        {
            float: left;
        }
        .actions
        {
            text-align: center;
            width: 40%;
        }
        .cMediaType
        {
            width: 10%;
            text-align: center;
        }
        .cZoneState
        {
            width: 10%;
            text-align: center;
        }
        .second
        {
            width: 20%;
            text-align: center;
        }
        .first
        {
            width: 20%;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="SampleDataList">
        <asp:DataList ID="DataList1" SkinID="SampleDataList" runat="server" OnItemCommand="DataList1_ItemCommand"
            DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr style="background-image:url(/images/yh29.gif);">
                        <td class="baibiao first">
                            广告位名称/尺寸
                        </td>
                        <td class="baibiao second ">
                            按时长计费价格(元/周)
                        </td>
                        <td class="baibiao cMediaType">
                            支持广告类型
                        </td>
                        <td id="zonestate_header" class="baibiao cZoneState">
                            <select id="status" name="select">
                                <option value="">状态</option>
                                <option value="1">上架</option>
                                <option value="0">未激活</option>
                                <option value="2">下架</option>
                                <option value="3">拒绝</option>
                            </select>
                        </td>
                        <td class="baibiao actions">
                            操作
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="first">
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ToZoneView1" CommandArgument='<%# Eval("ZoneId") %>'><%# Eval("ZoneName") %></asp:LinkButton>
                            <br />
                            <span class="gray">
                                <%# Eval("SizeCode") %></span><!-- 760x90 -->
                        </td>
                        <td class="second">
                            <em>
                                <%# Eval("WeekPrice") %></em> <span id="recommendWeekprice2021776" /><a onclick="calZonePrice('2021776','760x90','http://hotboo.com','','');return false;"
                                    href="#"><span id="recommendWeekpriceCalLink2021776">计算推荐价格</span> </a></span>
                        </td>
                        <td class="cMediaType">
                            <%# Eval("MediaType") %>
                        </td>
                        <td class="cZoneState">
                            <%# Eval("ZoneState") %><!--未激活-->
                        </td>
                        <td class="actions">
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="ToZoneSellDetail" CommandArgument='<%# Eval("ZoneId") %>'>查看报表</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ToZoneView2" CommandArgument='<%# Eval("ZoneId") %>'>修改</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="ToZoneDesigner" CommandArgument='<%# Eval("ZoneId") %>'>获取代码</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton5" runat="server" CommandName="DelZone" CommandArgument='<%# Eval("ZoneId") %>'><img alt="" width="16" height="16" align="top" src="http://img.alimama.cn/images/adzone/alimama_070609_06.gif" />删除</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    </div>
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
            
            var oldFrameHeight = $(window.frameElement).attr("height");
            var tlistHeight = 0;
            $(".tlist-item").parent().parent().parent().parent().each(function(){tlistHeight += this.offsetHeight;});
            var delta = oldFrameHeight - tlistHeight;
            
            $("#status").change(function(){
                var jZoneState = $("select option:selected");
                var zoneState = jZoneState.text();
                //alert(zoneState);
                if(zoneState != "状态")
                {
                    var selector = ".cZoneState:contains('" + zoneState + "')" ;
                    
                    $(".tlist-item").parent().parent().parent().parent().css("display", "none");
                    $(selector).parent().parent().parent().parent().parent().css("display", "table-row");
                    var i = 0;
                    $(".tlist-item").parent().parent().parent().parent().each(function(){i += this.offsetHeight;});
                    $(window.frameElement).css("height", i + delta);
                } else {
                    $(".tlist-item").parent().parent().parent().parent().css("display", "table-row");
                    $(window.frameElement).css("height", oldFrameHeight);
                }
            });
        });
    </script>

</body>
</html>
