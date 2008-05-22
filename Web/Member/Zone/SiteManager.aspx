<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteManager.aspx.cs" Inherits="Web.SiteManager"
    MasterPageFile="../MasterPage/Member.Master" Title="���λ����" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="_htmlHeadContent">

    <script type="text/javascript" src="../App_Themes/jquery.js"></script>

</asp:Content>
<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_mainContent">
    <div id="maincontent">
        <div>
            <ul id="treelist">
                <li>
                    <asp:Button ID="btnAddSite" runat="server" Text="������վ" OnClick="btnAddSite_Click" /></li>
                <li>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnDataBinding="DataList1_DataBinding"
                        OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="title-bar" style="width: 950px">
                                <asp:LinkButton runat="server" ID="lbViewSite">��վ���ƣ�<%# Eval("SiteName") %>&nbsp;&nbsp;&nbsp;(��<%# Eval("ZoneCount") %>�����λ)&nbsp;&nbsp;&nbsp;<%# this.ConvertAuditState(Convert.ToInt32(Eval("AuditState"))) %> </asp:LinkButton>
                                <span style="width: 400px"></span>
                                <asp:LinkButton runat="server" ID="lbAddZone" PostBackUrl='<%# "/Member/Zone/Zone.aspx?action=new&siteid=" + Eval("SiteId") %>'>�ڴ���վ���������λ</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbChangeSite" PostBackUrl='<%# "/Member/Zone/Site.aspx?action=update&siteid=" + Eval("SiteId")%>'>�޸�</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="LinkButton1" CommandName="DelSite"
                                    CommandArgument='<%# Eval("SiteId") %>'>ɾ��</asp:LinkButton>
                                </p>
                            </div>
                            <iframe id='<%# "siteiframe" + Eval("SiteId") %>' width="100%" scrolling="no" frameborder="0"
                                src='<%# "/Member/Zone/ZoneManager.aspx?siteid=" + Eval("SiteId") %>'>
                                <!--��ȡ���λ�б�-->
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
    </div>
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
