<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageAdGroup.aspx.cs"
    Inherits="Web.User.ManageAdGroup" Title="无标题页" EnableEventValidation="false"
    MasterPageFile="~/MasterPage/Member.Master" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div id="maincontent">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnAddGroup" />
            </Triggers>
            <ContentTemplate>
                <asp:Button ID="btnAddGroup" runat="server" Text="新增广告组" OnClick="btnAddGroup_Click" />
                <asp:DataList ID="dlAdGroup" runat="server" Width="100%" OnItemDataBound="dlAdGroup_ItemDataBound"
                    OnItemCommand="dlAdGroup_ItemCommand" DataKeyField="AdGroupId">
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td style="width: 200px">
                                    <asp:Button ID="btnGroupName" runat="server" Text='<%# Bind("GroupName") %>' OnClick="btnGroupName_Click"
                                        Width="112px" />
                                </td>
                                <td style="width: 600px" align="right">
                                    <asp:LinkButton ID="lbtnDeleteGroup" runat="server" Text="删除此广告组" CommandName="DeleteGroup"
                                        Width="100px" />
                                    <asp:LinkButton ID="lbtnAddAd" runat="server" CommandName="AddAd">
						添加此广告组下广告</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%">
                                        <tr>
                                            <td style="width: 800px; height: 39px;">
                                                类目：<asp:Label ID="labZoneClass" runat="server" Text="Label" Width="150px"></asp:Label>
                                                关键字：<asp:Label ID="labKeyWords" runat="server" Width="300px"></asp:Label>
                                                <asp:HyperLink ID="hlEdite" runat="server">
									修改分类和关键字</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataList ID="dlAD" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"
                                        OnItemDataBound="dlAD_ItemDataBound" DataKeyField="AdId" OnItemCommand="dlAD_ItemCommand">
                                        <ItemTemplate>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 100px; height: 21px">
                                                        <asp:Label ID="labState" runat="server" ForeColor="Red" Width="100%" Text=' <%# adState(Convert.ToInt32(Eval("AuditState")))%>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 21px">
                                                        <asp:Label ID="labTitle" runat="server" Text='<%# Bind("TiTle") %>' Width="100%"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="labContent" runat="server" Text='<%# Bind("Content") %>' Width="100%"
                                                            Height="19px"></asp:Label>
                                                        <asp:Image ID="imgImg" ImageUrl='<%# "~/AD/uploadimages/" + Eval("Img") %>' runat="server"
                                                            Height="20px" Width="100%" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="labSize" runat="server" Width="100%" Text='<%# Eval("SizeCode") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Button ID="btnDeleteAd" runat="server" Text="删除" CommandName="DeleteAd" />
                                            <asp:Button ID="btnEditeAd" runat="server" Text="修改" CommandName="EditeAd" />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
