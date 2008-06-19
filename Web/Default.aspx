<%@ Page Language="C#" MasterPageFile="~/MasterPage/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web.Default" Title="赢在广告：www.aaaa0.com" %>
<asp:Content ID="Content1" ContentPlaceHolderID="notice" runat="server">
    <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsId"
        DataSourceID="SqlDataSource1" ShowHeader="False" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-VerticalAlign="Middle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    &gt;&gt;<a href="News/ShowNews.aspx?NewsId=<%# Eval("NewsId") %>" target="_blank"><%# HOT.Common.Strings.CutString( Eval("Title").ToString(),18) %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreateDate" DataFormatString="{0:d}" HeaderText="CreateDate"
                SortExpression="CreateDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT TOP (8) NewsId, ClassId, Title, [Content], CreateDate FROM AL_News ORDER BY NewsId DESC">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ecBox1" runat="server">
    <asp:GridView ID="gvecBox1" runat="server" AutoGenerateColumns="False" CellPadding="0"
        ForeColor="#333333" GridLines="None" Height="98%" HorizontalAlign="Center" 
        Width="98%">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="SiteName" HeaderText="网站名">
                <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="ZoneName" HeaderText="广告位名称">
                <ItemStyle Width="30%" />
            </asp:BoundField>
            <asp:BoundField DataField="MediaType" HeaderText="广告形式">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="PricePerK" HeaderText="千人成本">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="VistersNum" HeaderText="日浏览量">
                <ItemStyle Width="15%" />
            </asp:BoundField>
        </Columns>
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#99CCFF" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" VerticalAlign="Middle" />
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ContentPlaceHolder3">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsId"
        DataSourceID="SqlDataSource2" ShowHeader="False" Width="98%">
        <Columns>
            <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-VerticalAlign="Middle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    &gt;&gt;<a href="News/ShowNews.aspx?NewsId=<%# Eval("NewsId") %>" target="_blank"><%# HOT.Common.Strings.CutString( Eval("Title").ToString(),18) %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreateDate" DataFormatString="{0:d}" HeaderText="CreateDate"
                SortExpression="CreateDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT TOP (8) NewsId, ClassId, Title, [Content], CreateDate FROM AL_News ORDER BY NewsId DESC">
    </asp:SqlDataSource>
</asp:Content>


<asp:Content ID="Content5" runat="server" 
    contentplaceholderid="ContentPlaceHolder4">
    <asp:DataList ID="dlClasses" runat="server" OnItemDataBound="dlClasses_ItemDataBound"
        RepeatColumns="7" RepeatDirection="Horizontal" ShowFooter="False" 
        Width="100%">
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
        <ItemTemplate>
            <asp:Label ID="labClassName" runat="server" Text='<%# Bind("ClassName") %>' Font-Size="Small"
                ForeColor="#33CCFF" Font-Bold="True"></asp:Label>
            <br />
            <asp:DataList ID="dlSonClasses" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
                RepeatLayout="Flow" Width="100%">
                <ItemTemplate>
                    <a href="/Public/AdList.aspx?ClassId=<%#Eval("ClassId") %>" style="color:#33CCFF;">
                        <%# Eval("ClassName") %></a>
                </ItemTemplate>
            </asp:DataList>
        </ItemTemplate>
    </asp:DataList>
              
</asp:Content>



