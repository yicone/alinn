<%@ Page Language="C#" MasterPageFile="~/MasterPage/UserCommon.Master" AutoEventWireup="true" CodeBehind="NewGroup.aspx.cs" Inherits="Web.User.NewGroup" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers> 
<asp:PostBackTrigger ControlID="btnAdd" /> 
</Triggers> 
        <ContentTemplate>
            <br />
            <br />
            <br />
            <br />
            <br />
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" align="right" class="style3">
		</td>
	    <td align="right" height="25" style="width: 15%" class="style2">
            广告组名字：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
	<td height="25" align="left">
		<asp:TextBox id="txtGroupName" runat="server" Width="249px"></asp:TextBox>
        最多40个字符，20个汉字<br />
        </td>
        <td align="left" height="25" width="200px">
            </td>
    </tr>
	<tr>
	<td height="25" align="right" class="style3">
		&nbsp;</td>
	    <td align="right" height="25" style="width: 23%" class="style2">
            分类：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </td>
	<td height="25" align="left">
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
        <br />
        </td>
        <td align="left" height="25" width="*">
            &nbsp;</td>
        </tr>
	<tr>
	<td height="25" align="right" class="style3">
		&nbsp;</td>
	    <td align="right" height="25" style="width: 25%" class="style2">
            关键字：&nbsp;&nbsp;&nbsp; 
        </td>
	<td height="25" align="left">
		<br />
		<asp:TextBox id="txtKeyWords" runat="server" Width="228px"></asp:TextBox>
        <br />
        <br />
        </td>
        <td align="left" height="25" style="width: 75%" width="*">
            最多136个字符，68个汉字,添加关键字可以增加您广告被找到的机率</td>
    </tr>
	<tr>
	<td height="25" class="style3">&nbsp;</td>
        <td colspan="2" height="25" class="style2">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="· 提交 ·" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" 
                    Text="· 重填 ·" />
                <br />
                <br />
        </td>
        <td height="25">
            &nbsp;</td>
    </tr>
</table>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="_headContent">

    <style type="text/css">
        .style2
        {
            text-align: right;
        }
        .style3
        {
            width: 44%;
        }
    </style>

</asp:Content>

