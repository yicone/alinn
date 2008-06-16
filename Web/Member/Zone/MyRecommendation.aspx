<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true"
    CodeBehind="MyRecommendation.aspx.cs" Inherits="Web.Member.Zone.MyRecommendation"
    Title="我的推广" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
        <div style="width: 919px; height: 80px; background-image: url('images/bg_recommendlink.png')" class="center">
            <div style="float: left; margin-left: 50px; margin-top: 20px">
                推广链接：<span id="txtRecommendLink">http://www.aaaa0.com?introducer=<%= HOT.BLL.User.GetLoginUser().ToString() %></span><input
                    name="btnCopy" type="button" value="复制链接" onclick="javascript:copyLink();" style="margin-left: 60px" />
            </div>
        </div>
        <br />
        <br />
        <br />
        <div style="width: 919px; text-align: left">
            <h3>
                网站列表</h3>
            <asp:DataList runat="server" ID="DataList1" Width="100%" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <span style="float: left;">昵称：<%# Eval("NickName") %>（共<%# Eval("SiteCount") %>个网站）</span>
                    <iframe width="100%" style="margin-top: 2px; margin-bottom: 5px; border: 0px" src='RecommendationList.aspx?userid=<%# Eval("UserId") %>'
                        scrolling="no"></iframe>
                </ItemTemplate>
            </asp:DataList>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="UP_GetIntroducerInfoExtForMyRecommendation" SelectCommandType="StoredProcedure"
        OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">

    <script type="text/javascript">
        function copyLink(){
            if (window.clipboardData) {
                var link = $("#txtRecommendLink").attr("innerHtml");
                alert(link);
                window.clipboardData.setData("Text", link);
                alert('已成功复制到剪贴板！您可以将推荐链接通过QQ发送或者粘贴到网站上喽！');
            }
        }
    </script>

</asp:Content>
