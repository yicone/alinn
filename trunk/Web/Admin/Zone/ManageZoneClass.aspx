<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageZoneClass.aspx.cs" Inherits="Web.Admin.Zone.ManageZoneClass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <br />
            <table cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr>
                    <td height="25" width="30%" align="right">
                        &nbsp;</td>
                    <td height="25" width="*" align="left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td height="25" width="30%" align="right">
                        是否一级分类:</td>
                    <td height="25" width="*" align="left">
                        <asp:RadioButtonList ID="rblIs" runat="server" 
            AutoPostBack="True" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">不是</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td height="25" width="30%" align="right">
                        上级分类： 
                    </td>
                    <td height="25" width="*" align="left">
                        <asp:DropDownList ID="ddlParentId" runat="server" 
            AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
            DataValueField="ClassId" Height="16px" 
            onselectedindexchanged="Page_Load" Width="199px" 
                            AppendDataBoundItems="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
                            
                            
                            SelectCommand="SELECT * FROM [AL_ZoneClass] WHERE ([ParentId] &lt;&gt; @ParentId) ORDER BY [ClassId]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="ParentId" 
                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td height="25" width="30%" align="right">
                        分类名字： 
                    </td>
                    <td height="25" width="*" align="left">
                        <asp:TextBox id="txtClassName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td height="25" colspan="2">
                        <div align="center">
                            <asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" >
                            </asp:Button>
                            <asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" 
            OnClick="btnCancel_Click" ></asp:Button>
                        </div>
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
