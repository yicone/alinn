<%@ Page Language="C#" MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="MyStore.aspx.cs" Inherits="Web.Member.Store.MyStore" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_htmlHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_searchcontent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="_mainContent" runat="server">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="25" height="40" bgcolor="eff0f0" scope="col">&nbsp;</th>
    <th width="599" align="left" bgcolor="eff0f0" class="bu03" scope="col">广告位收藏夹</th>
    <th width="312" bgcolor="eff0f0" class="gl01" scope="col">广告主 &gt;收藏夹管理 &gt; 广告位收藏夹</th>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="26" height="35" scope="col">&nbsp;</th>
    <th width="136" scope="col"><table width="100%" height="35" border="1" cellpadding="0" cellspacing="0" bordercolor="#ECF0ED">
      <tr>
        <th bgcolor="#E0DFE3" class="d4" scope="col">分类标签</th>
      </tr>
      
    </table></th>
    <th width="19" scope="col">&nbsp;</th>
    <th width="755" rowspan="2" scope="col"><table width="100%" height="70" border="1" cellpadding="0" cellspacing="0" bordercolor="#ECF0ED">
      <tr>
        <th height="35" colspan="6" scope="col"><table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="18%" align="left" bgcolor="#E0DFE3" scope="col">
              <img src="/images/yh31.gif" width="14" height="14" />
              <input name="checkbox" type="checkbox" value="checkbox" />
            
            
              <input type="submit" name="Submit" value="删除" />
            </form>            </th>
            <th width="22%" bgcolor="#E0DFE3" scope="col">&nbsp;</th>
            <th width="60%" bgcolor="#E0DFE3" scope="col">&nbsp;</th>
          </tr>
        </table></th>
      </tr>
      <tr>
        <th width="5%" height="35" background="/images/yh02.gif" scope="row">&nbsp;</th>
        <th width="20%" background="/images/yh02.gif" class="gl01" scope="row">广告位详情</th>
        <th width="19%" background="/images/yh02.gif" class="gl01" scope="row">价格(元/周)</th>
        <th width="18%" background="/images/yh02.gif" class="gl01" scope="row">广告尺寸</th>
        <th width="22%" background="/images/yh02.gif" class="gl01" scope="row">可购买时间</th>
        <th width="16%" background="/images/yh02.gif" class="gl01" scope="row">操作</th>
      </tr>
      <tr>
        <th width="5%" height="35" background="/images/yh02.gif" scope="row">&nbsp;</th>
        <th background="/images/yh02.gif" class="gl01" scope="row" colspan="5">
    <asp:GridView ID="gvStores" runat="server" AutoGenerateColumns="False" 
        Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="广告位名称">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ZoneName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <a href="/Public/ShowZone.aspx?ZoneId=<%# Eval("ZoneId") %>"><%# Eval("ZoneName") %></a>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="广告位描述" >
                <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="收藏日期" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="15%" />
            </asp:BoundField>
        </Columns>
</asp:GridView>
          </th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="35" scope="row">&nbsp;</th>
    <th height="35" scope="row">&nbsp;</th>
    <th height="35" scope="row">&nbsp;</th>
  </tr>
</table>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="_scriptContent" runat="server">
</asp:Content>
