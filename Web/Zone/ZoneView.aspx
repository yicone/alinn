<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ZoneView.aspx.cs" Inherits="Web.ZoneView"
    MasterPageFile="../MasterPage/UserCommon.Master" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="ContentPlaceHolder1">
	<div>
        <asp:FormView ID="FormView1" runat="server" Width="950px" DataSourceID="SqlDataSource1" OnDataBound="FormView1_DataBound">
            <ItemTemplate>
                <h3>
                     <span id="sec1" class="sec-toggler"></span>修改广告位信息
                        <span><asp:HyperLink runat="server" id="linkEditZoneInfo">修改</asp:HyperLink></span>
                </h3>
                <dl>
                    <dt>广告位名称：</dt><dd><asp:Literal ID="zoneName" runat="server"></asp:Literal></dd>
                    <dt>计费类型：</dt><dd><asp:Literal ID="transType" runat="server"></asp:Literal></dd>
                    <dt>广告内容：</dt><dd><asp:Literal ID="mediaType" runat="server"></asp:Literal></dd>
                    <dt>广告所在位置：</dt><dd><asp:Literal ID="inFirstpage" runat="server"></asp:Literal></dd>
                    <dt>广告位尺寸：</dt><dd><asp:Literal ID="sizeCode" runat="server"></asp:Literal></dd>
                    <dt>广告位描述：</dt><dd><asp:Literal ID="zoneDesp" runat="server"></asp:Literal></dd></dl>
                <h3>
                        <span id="sec2" class="sec-toggler"></span>广告位扩展信息
                        <span><asp:HyperLink runat="server" id="linkEditZoneClass">修改</asp:HyperLink></span>
                </h3>
                <dl>
                    <dt>广告位分类：</dt><dd><asp:Literal ID="zoneClasses" runat="server"></asp:Literal></dd>
                    <dt>广告位关键词：</dt><dd><asp:Literal ID="zoneKeywords" runat="server"></asp:Literal></dd></dl>
                <h3>
                        <span id="sec3" class="sec-toggler"></span>所属网站信息
                        <span><asp:HyperLink runat="server" id="linkEditSiteInfo">修改</asp:HyperLink></span>
                </h3>
                <dl>
                    <dt>网站名称：</dt><dd><asp:Literal ID="siteName" runat="server"></asp:Literal></dd>
                    <dt>网站地址：</dt><dd><asp:Literal ID="siteUrl" runat="server"></asp:Literal></dd>
                    <dt>网站描述：</dt><dd><asp:Literal ID="siteDesp" runat="server"></asp:Literal></dd>
                    <dt>网站类型：</dt><dd><asp:Literal ID="siteClass" runat="server"></asp:Literal></dd>
					<dt>浏览者性别：</dt><dd><asp:Literal ID="sexType" runat="server"></asp:Literal></dd>
					<dt>浏览者年龄：</dt><dd><asp:Literal ID="ageType" runat="server"></asp:Literal></dd>
					<dt>浏览者职业：</dt><dd><asp:Literal ID="employments" runat="server"></asp:Literal></dd>
					<dt>浏览者兴趣爱好：</dt><dd><asp:Literal ID="taste" runat="server"></asp:Literal></dd>
					<!--dt>浏览者月收入：</dt><dd><asp:Literal ID="articleTitle" runat="server"></asp:Literal></dd-->
				</dl>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" id="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="UP_GetZoneInfoExtForZoneView" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="ZoneId" QueryStringField="zoneid" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;
    </div>
</asp:Content>
