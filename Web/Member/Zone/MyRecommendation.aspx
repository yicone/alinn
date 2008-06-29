<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true"
    CodeBehind="MyRecommendation.aspx.cs" Inherits="Web.Member.Zone.MyRecommendation"
    Title="我的推广" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
    <div class="center" style="width:915px">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <th width="2%" height="34" background="/images/yh02.gif" class="bu06"  scope="row">&nbsp;</th>
    <th width="16%" align="left" background="/images/yh02.gif" class="gl01"  scope="row">复制链接 </th>
    <th width="82%" background="/images/yh02.gif" class="bu06"  scope="row">&nbsp;</th>
  </tr>
</table>
<table width="100%" height="157" border="1" cellpadding="0" cellspacing="0" bordercolor="#EEEFEE">
  <tr>
    <th height="155" scope="col"><table width="800" height="100" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th background="/images/tg01.gif" scope="col">
            <div style="float: left; margin-left: 50px; margin-top: 20px">
                推广链接：<span id="txtRecommendLink">http://www.aaaa0.com?introducer=<%= HOT.BLL.User.GetLoginUser().ToString() %></span><input
                    name="btnCopy" type="button" value="复制链接" onclick="javascript:copyLink();" style="margin-left: 60px" />
            </div>
          </th>
      </tr>
    </table></th>
  </tr>
</table>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#EEEFEE">
  <tr>
    <th width="109" height="30" background="../用户管理/images/yh02.gif" class="bu02" scope="col">用户列表</th>
    <th width="161" background="../用户管理/images/yh02.gif" class="bu02" scope="col">用户名</th>
    <th width="257" background="../用户管理/images/yh02.gif" class="bu02" scope="col">网站名称</th>
    <th width="230" background="../用户管理/images/yh02.gif" class="bu02" scope="col">网址</th>
    <th width="189" background="../用户管理/images/yh02.gif" class="bu02" scope="col">日独立IP</th>
  </tr>
</table>
        <div  style="text-align: left">
            <h3>网站列表</h3>
            <asp:DataList runat="server" ID="DataList1" Width="100%" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <span style="float: left;">昵称：<%# Eval("NickName") %>（共<%# Eval("SiteCount") %>个网站）</span>
                    <iframe width="100%" style="margin-top: 2px; margin-bottom: 5px; border: 0px" src='RecommendationList.aspx?userid=<%# Eval("UserId") %>'
                        scrolling="no"></iframe>
                </ItemTemplate>
            </asp:DataList>
        </div>
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
