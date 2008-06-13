<%@ Page Language="C#" MasterPageFile="~/MasterPage/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web.Default" Title="阿里奶奶" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="classes" runat="server">
    <asp:DataList ID="dlClasses" runat="server" OnItemDataBound="dlClasses_ItemDataBound"
        RepeatColumns="4" RepeatDirection="Horizontal" ShowFooter="False" Width="100%">
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
        <HeaderTemplate>
            <div style="width: 1002px; text-align: left; background-color: #6699FF; height: 22px;
                padding-top: 8px; padding-left: 20px; font-size: 18px;">
                广告分类</div>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Label ID="labClassName" runat="server" Text='<%# Bind("ClassName") %>' Font-Size="Medium"
                ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:DataList ID="dlSonClasses" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                RepeatLayout="Flow" Width="100%">
                <ItemTemplate>
                    <a href="Ad/AdList.aspx?ClassId=<%#Eval("ClassId") %>">
                        <%# Eval("ClassName") %></a>
                </ItemTemplate>
            </asp:DataList>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ecBox1" runat="server">
    <asp:GridView ID="gvecBox1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="SiteName" HeaderText="网站名">
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="ZoneName" HeaderText="广告位名称">
                <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="MediaType" HeaderText="广告形式">
                <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="PricePerK" HeaderText="每千人成本">
                <ItemStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="VistersNum" HeaderText="日均浏览量">
                <ItemStyle Width="70px" />
            </asp:BoundField>
        </Columns>
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#99CCFF" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>
