<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageZone.aspx.cs" Inherits="Web.Admin.Zone.ManageZone" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
* {
	margin: 0pt;
	padding: 0pt;
}
        .style3
        {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="gv_Zone" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="ZoneId" DataSourceID="SqlDataSource2" 
                onselectedindexchanged="gv_Zone_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ZoneId" HeaderText="ZoneId" ReadOnly="True" 
                        SortExpression="ZoneId">
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ZoneName" HeaderText="ZoneName" 
                        SortExpression="ZoneName">
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="SiteName" SortExpression="SiteName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SiteName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <a href='<%#Eval("SiteUrl") %>'><%# Eval("SiteName") %></a>
                        </ItemTemplate>
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT AL_Zone.ZoneId, AL_Zone.ZoneName, AL_Zone.InFirst, AL_Site.SiteName, AL_Site.SiteUrl FROM AL_Zone LEFT OUTER JOIN AL_Site ON AL_Site.SiteId = AL_Zone.SiteId WHERE (AL_Zone.ZoneState = @ZoneState)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="ZoneState" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
        
        
        <table width="100%" border="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="width:60%;">
               <table cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td class="style3">
                        广告位：</td>
                    <td>
                        <asp:Label ID="labZoneName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        网站：</td>
                    <td>
                        <asp:Label ID="labSiteName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        广告类型：</td>
                    <td>
                        <asp:RadioButtonList ID="rblMediaType" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>图片广告</asp:ListItem>
                            <asp:ListItem>文字广告</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        是否在首页：</td>
                    <td>
                        <asp:RadioButtonList ID="rblInFirst" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>不在首页</asp:ListItem>
                            <asp:ListItem>在首页</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        广告大小：</td>
                    <td>
                        <asp:RadioButtonList ID="rblSize" runat="server" AutoPostBack="True" 
                            RepeatColumns="4" RepeatDirection="Horizontal">
                            <asp:ListItem Value="11">760X90</asp:ListItem>
                            <asp:ListItem Value="12">468X60</asp:ListItem>
                            <asp:ListItem Value="13">250X60</asp:ListItem>
                            <asp:ListItem Value="14">728X90</asp:ListItem>
                            <asp:ListItem Value="15">950X90</asp:ListItem>
                            <asp:ListItem Value="16">658X60</asp:ListItem>
                            <asp:ListItem Value="17">120X600</asp:ListItem>
                            <asp:ListItem Value="18">120X240</asp:ListItem>
                            <asp:ListItem Value="19">160X600</asp:ListItem>
                            <asp:ListItem Value="20">180X250</asp:ListItem>
                            <asp:ListItem Value="21">250X300</asp:ListItem>
                            <asp:ListItem Value="22">360X190</asp:ListItem>
                            <asp:ListItem Value="23">250X250</asp:ListItem>
                            <asp:ListItem Value="24">200X200</asp:ListItem>
                            <asp:ListItem Value="25">336X280</asp:ListItem>
                            <asp:ListItem Value="26">300X250</asp:ListItem>
                            <asp:ListItem Value="27">290X200</asp:ListItem>
                            <asp:ListItem Value="28">120X60</asp:ListItem>
                            <asp:ListItem Value="29">100X100</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        计费类型：</td>
                    <td>
                        <asp:RadioButtonList ID="rblTransType" runat="server" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>按时长</asp:ListItem>
                            <asp:ListItem>按点击</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        所在分类：</td>
                    <td>
                        <asp:Label ID="labClasses" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        是否需要审核：</td>
                    <td>
                        <asp:Label ID="labNeedCheck" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        关键字：</td>
                    <td>
                        <asp:Label ID="labKeyWords" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        广告位描述：</td>
                    <td>
                        <asp:Label ID="labDescription" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        周价格：</td>
                    <td>
                        <asp:Label ID="labWeekPrice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        广告位状态：</td>
                    <td>
                        <asp:Label ID="labZoneState" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="审核通过" />
                        <asp:Button ID="btnNO" runat="server" Text="审核拒绝" />
                    </td>
                </tr>
            </table>
    </td>
    <td>22222222222</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
