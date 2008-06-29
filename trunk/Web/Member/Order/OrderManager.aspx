<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Web.Member.Order.OrderManger" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
    <div style="text-align:left;">
    

        <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="f2" scope="col"><asp:LinkButton ID="btnTimeAd" runat="server" onclick="btnTimeAd_Click" 
        Text="按时长计费广告"/></th>
        <th width="106" height="29" align="center" background="/images/yh04.gif" class="f2" scope="col">    <asp:LinkButton ID="btnPointAd" runat="server" onclick="btnPointAd_Click" 
        Text="按点击计费广告" /></th>
    <th width="723" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
        </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:MultiView ID="mvOrder" runat="server">
        <asp:View ID="View1" runat="server">
           <div style="text-align:left;">
            <table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="832" height="30" align="left" background="/images/yh08.gif" class="f4" scope="col"><span class="STYLE4">&nbsp;&nbsp;&nbsp;</span><span class="bu04">创建时间：<asp:DropDownList ID="ddlTime" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">所有时间</asp:ListItem>
                <asp:ListItem Value="1">最近三天</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">最近一周</asp:ListItem>
                <asp:ListItem Value="3">最近一月</asp:ListItem>
                <asp:ListItem Value="4">最近三个月</asp:ListItem>
            </asp:DropDownList></span><span class="STYLE4">
    <label>

</label>
    </span>
      <label><span class="bu04">按计划查看：</span> </label>
      <span class="STYLE4">
      <label>
<select name="select2">
  <option value="2">所有广告计划</option>
</select>
&nbsp;&nbsp;<img src="/images/yh22.gif" width="10" height="14" /> </label>
      </span>
      <label><span class="bu04">更多查询条件</span></label>
      <span class="STYLE4">
      <label>&nbsp;&nbsp;</label>
      </span></th>
    <th width="104" align="left" background="/images/yh08.gif" class="f4" scope="col"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','images/yh26.gif',1)"><img src="/images/yh27.gif" name="Image21" width="89" height="26" border="0" id="Image21" /></a></th>
  </tr>
</table>
            </div>
            <asp:DataList ID="dlTimeOrder" runat="server" Width="936px" ForeColor="#0066CC">
                <ItemTemplate>
                      <table cellpadding="0" cellspacing="0" style="width:100%; color: #0066CC;">
                          <tr>
                              <td style="width:25%" align="left">
                                  站点：<asp:Label ID="labSite0" runat="server" Text='<%# Eval("SiteName") %>'></asp:Label>
                                  <br />
                                  广告位：<asp:Label ID="labZone0" runat="server" Text='<%# Eval("ZoneName") %>'></asp:Label>
                                  <br />
                                  所属计划：<asp:Label ID="labOrderName0" runat="server" 
                                      Text='<%#  Eval("OrderName") %>'></asp:Label>
                                  <br />
                                  交易：</td>
                              <td style="width:15%">
                                  <%# Eval("StartDate") %>起<br />
                                  <%# Eval("EndDate") %>止</td>
                              <td style="width:15%">
                                  <%# Eval("GroupName") %></td>
                              <td style="width:5%">
                                  <%# Eval("Price") %>元</td>
                              <td style="width:10%">
                                 <%# Eval("PV") %></td>
                              <td style="width:5%">
                                  <%# Eval("PointNum") %></td>
                              <td style="width:5%">
                                  <%# Eval("TodayPrice") %></td>
                              <td style="width:10%">
                                  <asp:Label ID="labState0" runat="server" ForeColor="Red" 
                                      Text=' <%# GetAuditStateMeaning(Convert.ToInt32(Eval("AuditState")))%>' 
                                      Width="100%"></asp:Label>
                              </td>
                              <td style="width:10%">
                                  操作</td>
                          </tr>
                      </table>
                </ItemTemplate>
                <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="width:100%;color: #0066CC;">
                        <tr>
                            <td style="width:25%;">
广告组详情</td>
                            <td style="width:15%;">
                               起始日期</td>
                            <td style="width:15%;">
                                所属广告组</td>
                            <td style="width:5%;">
                                金额</td>
                            <td style="width:10%;">
                                浏览量</td>
                            <td style="width:5%;">
                                点击量</td>
                            <td  style="width:5%;">
                                &nbsp;</td>
                            <td style="width:10%;">
广告组状态                                 </td>
                            <td style="width:10%;">
                                操作</td>
                        </tr>
                    </table>
                </HeaderTemplate>
            </asp:DataList>
            
        </asp:View>
          <asp:View ID="View2" runat="server">
              <asp:DataList ID="dlPointOrder" runat="server">
                <ItemTemplate>
                      <table cellpadding="0" cellspacing="0" class="style1">
                          <tr>
                              <td style="width:25%">
                                  站点：<asp:Label ID="labSite0" runat="server" Text='<%# Eval("SiteName") %>'></asp:Label>
                                  <br />
                                  广告位：<asp:Label ID="labZone0" runat="server" Text='<%# Eval("ZoneName") %>'></asp:Label>
                                  <br />
                                  所属计划：<asp:Label ID="labOrderName0" runat="server" 
                                      Text='<%#  Eval("OrderName") %>'></asp:Label>
                                  <br />
                                  交易：</td>
                              <td style="width:15%">
                                  <%# Eval("StartDate") %>起<br />
                                  <%# Eval("EndDate") %>止</td>
                              <td style="width:15%">
                                  <%# Eval("GroupName") %></td>
                              <td style="width:5%">
                                  <%# Eval("Price") %>元</td>
                              <td style="width:10%">
                                 <%# Eval("PV") %></td>
                              <td style="width:5%">
                                  <%# Eval("PointNum") %></td>
                              <td style="width:5%">
                                  <%# Eval("TodayPrice") %></td>
                              <td style="width:10%">
                                  <asp:Label ID="labState0" runat="server" ForeColor="Red" 
                                      Text=' <%# GetAuditStateMeaning(Convert.ToInt32(Eval("AuditState")))%>' 
                                      Width="100%"></asp:Label>
                              </td>
                              <td style="width:10%">
                                  操作</td>
                          </tr>
                      </table>
                </ItemTemplate>
                <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td style="width:25%;">
广告组详情</td>
                            <td style="width:15%;">
                               起始日期</td>
                            <td style="width:15%;">
                                所属广告组</td>
                            <td style="width:5%;">
                                金额</td>
                            <td style="width:10%;">
                                浏览量</td>
                            <td style="width:5%;">
                                点击量</td>
                            <td  style="width:5%;">
                                &nbsp;</td>
                            <td style="width:10%;">
广告组状态                                 </td>
                            <td style="width:10%;">
                                操作</td>
                        </tr>
                    </table>
                </HeaderTemplate>
              </asp:DataList>
          </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
