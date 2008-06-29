<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderViewer.aspx.cs" Inherits="Web.Member.Zone.OrderViewer"
    Culture="auto" UICulture="auto" MasterPageFile="../../MasterPage/Member.Master"
    Title="交易管理" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="text-align:center;">
    <table width="800" height="60" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#EAEFF9">
  <tr>
    <th scope="col"><table border="0" align="center" cellpadding="0" cellspacing="0" 
            style="width: 931px">
      <tr>
        <th scope="col" class="style3">&nbsp;</th>
        <th height="30" align="left" scope="col" class="style4"><span class="bu06">查询条件</span></th>
        <th width="444" scope="col">&nbsp;</th>
      </tr>
      <tr>
        <th height="30" scope="row" class="style3">&nbsp;</th>
        <td align="left" class="style4">选择广告位：<span class="bu06">
           <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" Width="120px"
                DataTextField="ZoneName" DataValueField="ZoneID">
            </asp:DropDownList>
        </span></td>
        <td><span class="bu02">交易日期：</span><span class="bu04"><asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1" Format="yyyy-MM-dd" SelectedDate="2008-01-01">
            </cc1:CalendarExtender> </span><span class="bu02">至</span><span class="bu04"><span class="STYLE4"> <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBox2" Format="yyyy-MM-dd" SelectedDate="2008-02-01">
            </cc1:CalendarExtender> &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ImageButton1" runat="server" Text="查询" Width="40px" Height="20px" OnClick="ImageButton1_Click" />
        </span></span></td>
      </tr>
    </table></th>
  </tr>
</table>
    </div>
    <br />
    <br />
    <div id="SampleDataList" style="text-align:left">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="f2" scope="col">交易列表</th>
    <th width="829" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="200" height="30" align="center" valign="middle" background="/images/yh08.gif" class="f4" scope="col"><span class="STYLE4">&nbsp;
          <label>&nbsp;</label>
    </span><span class="bu02">所有 待审核的 待评价的</span> </th>
    <th width="736" align="right" background="/images/yh08.gif" class="f4" scope="col"><a href="#"></a></a>&nbsp;&nbsp;</th>
  </tr>
</table>
        <asp:DataList ID="DataList1" SkinID="SampleDataList" runat="server"
            DataSourceID="SqlDataSource2">
            <HeaderTemplate>
                <table style="background-image:url(/images/yh23.gif); ">
                    <tr>
                        <td width="100" align="center">
                            交易号/时间
                        </td>
                        <td width="200" align="center">
                            广告位名称/所属网站
                        </td>
                        <td width="150" align="center">
                            广告主信息
                        </td>
                        <td width="150" align="center">
                            成交价（元）
                        </td>
                        <td width="150" align="center">
                            购买时段
                        </td>
                        <td width="100" align="center">
                            投放广告
                        </td>
                        <td width="100" align="center">
                            投放效果
                        </td>
                        <td width="50" align="center">
                            <select id="status" name="status">
                                <option value="">所有状态</option>
                                <option value="NOTCANCELED">隐藏已取消交易</option>
                                <option value="WAITPAY">待付款</option>
                                <option value="WAITAPPROVE">待审核</option>
                                <option value="BEFORERUNNING">待投放</option>
                                <option value="RUNNING">投放中</option>
                                <option value="COMPLETE">交易结束,待确认</option>
                                <!--<option value="ENDCANCELED"  >投放结束,有异议</option>-->
                                <option value="WAITPROCESS">交易结束,有异议</option>
                                <option value="WAITSETTLE">仲裁结束,待结算</option>
                                <option value="SETTLED">交易成功</option>
                                <option value="CANCELED">交易取消</option>
                            </select>
                        </td>
                        <td width="100" align="center" class="baibiao">
                            操作
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td width="100" align="center">
                            <%# Eval("OrderId") + "/" + Eval("CreateDate") %>
                        </td>
                        <td width="200" align="center">
                            <%# Eval("ZoneName") + "/" + Eval("SiteName") %>
                        </td>
                        <td width="150" align="center">
                            <%# Eval("NickName") %>
                        </td>
                        <td width="150" align="center">
                            <%# Eval("Price") %>
                        </td>
                        <td width="150" align="center">
                            <%# Eval("StartDate") + "~" + Eval("EndDate") %>
                        </td>
                        <td width="100" align="center">
                            <%# Eval("Title") %>
                        </td>
                        <td width="100" align="center">
                            &nbsp;
                        </td>
                        <td width="50" align="center">
                            <%# Eval("AuditState") %>
                        </td>
                        <td width="100" align="center">
                            操作
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select ZoneID,ZoneName from AL_zone where UserId=@UserId"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommandType="StoredProcedure"
        SelectCommand="UP_AL_Zone_OrderViewer" OnSelecting="SqlDataSource2_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="ZoneId" />
            <asp:Parameter Name="StartDate" />
            <asp:Parameter Name="EndDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="_htmlHeadContent">

        <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
        <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%><style type="text/css">                                                      .style3
                                                      {
                                                          width: 32px;
                                                      }
                                                      .style4
                                                      {
                                                          width: 227px;
                                                      }
                                                  </style>
</asp:Content>

