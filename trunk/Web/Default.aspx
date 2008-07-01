<%@ Page Language="C#" MasterPageFile="~/MasterPage/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web.Default" Title="赢在广告：www.aaaa0.com" %>
<asp:Content ID="Content5" runat="server" 
    contentplaceholderid="ContentPlaceHolder4">
    <asp:DataList ID="dlClasses" runat="server" OnItemDataBound="dlClasses_ItemDataBound"
        RepeatColumns="7" RepeatDirection="Horizontal" ShowFooter="False" 
        Width="95%">
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



