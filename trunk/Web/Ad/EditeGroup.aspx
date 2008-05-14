<%@ Page Language="C#" MasterPageFile="~/MasterPage/UserCommon.Master" AutoEventWireup="true" CodeBehind="EditeGroup.aspx.cs" Inherits="Web.Ad.EditeGroup" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_headContent" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_mainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers> 
<asp:PostBackTrigger ControlID="btnAdd" /> 
</Triggers> 
        <ContentTemplate>
<table cellSpacing="0" cellPadding="0" width="600" border="0">
	<tr>
	<td height="25" align="right" style="width: 25%" class="style1">
		广告组名字：
	</td>
	<td height="25" width="*" align="left" style="width: 75%">
		<asp:Label ID="labAdGroupName" runat="server" Width="100%"></asp:Label>
        </td></tr>
	<tr>
	<td height="25" align="right" style="width: 23%" class="style1">
		分类：
	</td>
	<td height="25" width="*" align="left" style="width: 75%">
        <br />
     <asp:DropDownList ID="ddlClass1" runat="server" Width="101px" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sdsClass1" DataTextField="ClassName" DataValueField="ClassId" OnSelectedIndexChanged="Page_Load">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsClass1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [ClassName], [ParentId], [ClassId] FROM [AL_ZoneClass] WHERE ([ParentId] = @ParentId)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="ParentId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlClass2" runat="server" DataSourceID="sdsClass2" DataTextField="ClassName"
            DataValueField="ClassId" OnSelectedIndexChanged="ddlClass2_SelectedIndexChanged"
            Width="102px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sdsClass2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [ClassId], [ClassName], [ParentId] FROM [AL_ZoneClass] WHERE ([ParentId] = @ParentId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlClass1" Name="ParentId" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        如果不做更改可以不选择</td>
        </tr>
	<tr>
	<td height="25" align="right" style="width: 25%" class="style1">
		关键字：
	</td>
	<td height="25" width="*" align="left" style="width: 75%">
		<asp:TextBox id="txtKeyWords" runat="server" Width="228px"></asp:TextBox>
        最多136个字符，68个汉字,添加关键字可以增加您广告被找到的机率</td></tr>
	<tr>
	<td height="25" colspan="2" class="style1"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
