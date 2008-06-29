<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteManager.aspx.cs" Inherits="Web.SiteManager"
    MasterPageFile="~/MasterPage/Member.Master" Title="广告位管理" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="_htmlHeadContent">

    <script type="text/javascript" src="/JavaScript/jquery.js"></script>

</asp:Content>
<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="width:950px" class="center">
            <div style="text-align: left; background-image:url(/images/yh08.gif); width:100%;">
                <span width="166" height="30" align="center" valign="middle" background="images/yh08.gif" class="d4" scope="col">广告组概览</span>
            <span class="bu05">当前共有X个组</span>
        </div>
        <div style="text-align: left; width:100%;">
            <asp:ImageButton ID="btnAddSite" runat="server" Text="新增网站" OnClick="btnAddSite_Click"
                Height="25px" ImageAlign="Middle" ImageUrl="/images/yh28.gif"
                Style="width: 100px" Width="80px" />
        </div>
        <div style="margin-top: 20px">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnDataBinding="DataList1_DataBinding"
                OnItemCommand="DataList1_ItemCommand" Width="100%">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td width="13" height="30" align="center" valign="middle" background="/images/yh29.gif">
                                &nbsp;
                            </td>
                            <td height="30" align="left" valign="middle" background="/images/yh29.gif"
                                class="STYLE8">
                                <asp:LinkButton runat="server" ID="lbViewSite">网站名称：<%# Eval("SiteName") %>&nbsp;&nbsp;&nbsp;(共<%# Eval("ZoneCount") %>个广告位)&nbsp;&nbsp;&nbsp;<%# this.ConvertAuditState(Convert.ToInt32(Eval("AuditState"))) %> </asp:LinkButton>
                                <span style="width: auto"></span>
                                <asp:LinkButton runat="server" ID="lbAddZone" PostBackUrl='<%# "/Member/Zone/Zone.aspx?action=new&siteid=" + Eval("SiteId") %>'>在此网站下新增广告位</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbChangeSite" PostBackUrl='<%# "/Member/Zone/Site.aspx?action=update&siteid=" + Eval("SiteId")%>'>修改</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LinkButton1" CommandName="DelSite"
                                    CommandArgument='<%# Eval("SiteId") %>'>删除</asp:LinkButton>
                                </p>
                            </td>
                            <td width="13" height="30" align="center" valign="middle" background="/images/yh29.gif">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <span class="tdblue"></span>
                    <iframe id='<%# "siteiframe" + Eval("SiteId") %>' scrolling="no" frameborder="0" width="100%"
                        src='<%# "/Member/Zone/ZoneManager.aspx?siteid=" + Eval("SiteId") %>'>
                        <!--读取广告位列表-->
                    </iframe>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_GetSiteInfoExtForSiteManager" SelectCommandType="StoredProcedure"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="_scriptContent">

    <script type="text/javascript">
	function frameResize(frameId){
	    var helpFrame = $("#" + frameId);
	    var innerDoc = (helpFrame.get(0).contentDocument) ? helpFrame.get(0).contentDocument : helpFrame.get(0).contentWindow.document;
	    var scrollHeight = innerDoc.body.scrollHeight;
	    $("#" + frameId).css("height", scrollHeight + 35);
	}
	
	$('iframe').load(function(){
        try {
            this.style.height =
            this.contentWindow.document.body.offsetHeight + 35 + 'px';
        } catch (exception) {
            this.contentWindow.location.reload();
        }
    });

    </script>

</asp:Content>
