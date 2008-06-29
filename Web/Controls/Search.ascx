<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Web.Controls.Search" %>
<style type="text/css">
    .style1
    {
        width: 63px;
    }
    .style2
    {
        width: 523px;
    }
</style>
            <table width="84%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <th width="22" height="20" scope="col">&nbsp;</th>
                <th scope="col" class="style1">&nbsp;</th>
                <th align="left" scope="col" class="style2">
                        <asp:TextBox ID="txtKeyWord" runat="server" Width="200px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
            DataTextField="ClassName" DataValueField="ClassId" Width="100px">
        </asp:DropDownList>
                </th>
                <th width="28" scope="col">&nbsp;</th>
                <th width="245" scope="col">        
                <asp:ImageButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜索"
            ImageUrl="/images/su01.gif" />
            </th>
                <th width="103" align="center" valign="middle" scope="col"></th>
                <th width="10" scope="col">&nbsp;</th>
              </tr>
            </table> 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [ClassId], [ClassName], [ParentId] FROM [AL_ZoneClass] WHERE ([ParentId] = @ParentId)">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="ParentId" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
