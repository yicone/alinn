﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteManager.aspx.cs" Inherits="Web.SiteManager" masterpagefile="../MasterPage/UserCommon.Master" title="Untitled Page" %>
<asp:Content id="Content1" runat="Server" contentplaceholderid="ContentPlaceHolder1">
    <div>
        <ul id="treelist">
            <li>
                <asp:Button ID="btnAddSite" runat="server" Text="新增网站" OnClick="btnAddSite_Click" /></li>
            <li>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnDataBinding="DataList1_DataBinding">
                    <ItemTemplate>
                        <div class="title-bar" style="width: 950px">
                            <asp:LinkButton Text="阿斯" runat="server" ID="df">网站名称：<%# Eval("SiteName") %>&nbsp;&nbsp;&nbsp;(共<%# Eval("ZoneCount") %>个广告位)&nbsp;&nbsp;&nbsp;<%# this.ConvertAuditState(Convert.ToInt32(Eval("AuditState"))) %> </asp:LinkButton></p>
                        </div>
                        <iframe id='<%# "siteiframe" + Eval("SiteId") %>' onload="frameResize(this.id);" width="100%" scrolling="no" frameborder="0" src='<%# "ZoneManager.aspx?siteid=" + Eval("SiteId") %>'>
                            <!--读取广告位列表-->
                        </iframe>
                    </ItemTemplate>
                </asp:DataList>
            </li>
        </ul>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_GetSiteInfoExtForSiteManager" SelectCommandType="StoredProcedure"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script type="text/javascript">
	function frameResize(frameId){
	    var helpFrame = $("#" + frameId);
	    var innerDoc = (helpFrame.get(0).contentDocument) ? helpFrame.get(0).contentDocument : helpFrame.get(0).contentWindow.document;
	    var scrollHeight = innerDoc.body.scrollHeight;
	    $("#" + frameId).css("height", scrollHeight + 35);
	}
    </script>


</asp:Content>
