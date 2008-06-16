<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EffectReport.aspx.cs" Inherits="Web.Member.Zone.EffectReport"
    Culture="auto" UICulture="auto" MasterPageFile="../../MasterPage/Member.Master"
    Title="效果报表" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div>
            选择广告位：
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                Width="120px" DataTextField="ZoneName" DataValueField="ZoneID">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 交易时间
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1"
                Format="yyyy-MM-dd" SelectedDate="2008-01-01">
            </cc1:CalendarExtender>
            &nbsp;&nbsp; 到
            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBox2"
                Format="yyyy-MM-dd" SelectedDate="2008-02-01">
            </cc1:CalendarExtender>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="查询" Width="40px"
                Height="20px" OnClick="ImageButton1_Click" />
        </div>
    </div>
    <br />
    <br />
    <div id="SampleDataList" style="text-align:left">
        <h3>交易列表</h3>
        <asp:DataList ID="DataList1" SkinID="SampleDataList" runat="server"
            DataSourceID="SqlDataSource2">
            <HeaderTemplate>
                <table>
                    <tr>
                        <td width="200" align="center" class="baibiao">
                            日期
                        </td>
                        <td width="250" align="center" class="baibiao">
                            广告位
                        </td>
                        <td width="250" align="center" class="baibiao">
                            广告主信息
                        </td>
                        <td width="250" align="center" class="baibiao">
                            成交价（元）
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td width="200" align="center">
                            <%# Eval("OrderId") + "/" + Eval("CreateDate") %>
                        </td>
                        <td width="250" align="center">
                            <%# Eval("ZoneName") + "/" + Eval("SiteName") %>
                        </td>
                        <td width="250" align="center">
                            <%# Eval("NickName") %>
                        </td>
                        <td width="250" align="center">
                            <%# Eval("Price") %>
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
        SelectCommand="UP_AL_Zone_EffectReport" OnSelecting="SqlDataSource2_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="ZoneId" />
            <asp:Parameter Name="StartDate" />
            <asp:Parameter Name="EndDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
