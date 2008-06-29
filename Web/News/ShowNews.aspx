<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="ShowNews.aspx.cs" Inherits="Web.News.ShowNews" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
  <!--******************************显示页面代码********************************-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <th width="2%" height="34" background="/images/yh02.gif" class="bu06"  scope="row">&nbsp;</th>
    <th width="16%" align="left" background="/images/yh02.gif" class="gl01"  scope="row">所在分类：  <asp:Label id="lblClassId" runat="server"></asp:Label> </th>
    <th width="82%" background="images/yh02.gif" class="bu06"  scope="row">&nbsp;</th>
  </tr>
</table>
<table width="100%" height="882" border="1" cellpadding="0" cellspacing="0" bordercolor="#EDEDED">
  <tr>
    <th height="880" valign="top" scope="col"><table width="100%" height="875" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="180" rowspan="3" bgcolor="#F9FAFA" scope="col">&nbsp;</th>
        <th height="70" background="/images/yh37.gif" scope="col"><span class="f3"><br />
          标题：</span> <span class="bu03"><asp:Label id="lblTitle" runat="server"></asp:Label></span></th>
        <th width="180" rowspan="3" bgcolor="#F9FAFA" scope="col">&nbsp;</th>
      </tr>
      <tr>
        <th height="20" align="right" valign="middle" class="f3" scope="row">发布时间:		<asp:Label id="lblCreateDate" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;</th>
        </tr>
      <tr>
        <th height="804" align="left" valign="top" scope="row"><table width="98%" height="828" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <th height="719" align="left" valign="top" scope="col"><br />
<asp:Label id="lblContent" runat="server" Width="500px"></asp:Label></th>
          </tr>
        </table>
          </th>
        </tr>
      
    </table></th>
  </tr>
</table>
<table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <th background="/images/b01.gif" scope="col">&nbsp;</th>
  </tr>
</table>
</asp:Content>
