<%@ Page Language="C#" MasterPageFile="~/MasterPage/UserCommon.Master" AutoEventWireup="true" CodeBehind="NewAd.aspx.cs" Inherits="Web.User.NewAd" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
    <tr>
        <td align="right" height="25" width="30%" class="style1">
            广告类型：</td>
        <td align="left" height="25" width="*">
            <asp:RadioButtonList ID="rblAdType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="1">文字广告</asp:ListItem>
                <asp:ListItem Value="0">图片/Flash广告</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
    <tr>
        <td align="right" height="25" width="30%" class="style1">
            广告大小：</td>
        <td align="left" height="25" width="*">
            <asp:RadioButtonList ID="rblSize" runat="server" AutoPostBack="True" RepeatColumns="4"
                RepeatDirection="Horizontal">
                <asp:ListItem Value="11">760X90</asp:ListItem>
                <asp:ListItem Value="12">468X60</asp:ListItem>
                <asp:ListItem Value="13">250X60</asp:ListItem>
                <asp:ListItem Value="14">728X90</asp:ListItem>
                <asp:ListItem Value="15">950X90</asp:ListItem>
                <asp:ListItem Value="16">658X60</asp:ListItem>
                <asp:ListItem Value="17">120X600</asp:ListItem>
                <asp:ListItem Value="18">120X240</asp:ListItem>
                <asp:ListItem Value="19">160X600</asp:ListItem>
                <asp:ListItem Value="20">180X250</asp:ListItem>
                <asp:ListItem Value="21">250X300</asp:ListItem>
                <asp:ListItem Value="22">360X190</asp:ListItem>
                <asp:ListItem Value="23">250X250</asp:ListItem>
                <asp:ListItem Value="24">200X200</asp:ListItem>
                <asp:ListItem Value="25">336X280</asp:ListItem>
                <asp:ListItem Value="26">300X250</asp:ListItem>
                <asp:ListItem Value="27">290X200</asp:ListItem>
                <asp:ListItem Value="28">120X60</asp:ListItem>
                <asp:ListItem Value="29">100X100</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
	<tr>
	<td height="25" width="30%" align="right" class="style1">
        广告标题：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTitle" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right" class="style1">
        广告内容：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtContent" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right" class="style1">
        广告链接：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrl" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right" class="style1">
        链接内容：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrlText" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
    <tr>
        <td align="right" style="height: 25px" width="30%" class="style1">
            图片：</td>
        <td align="left" style="height: 25px" width="*">
            <asp:FileUpload ID="fuImg" runat="server" />
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="上传" />
            <asp:Label ID="labImgInfo" runat="server" BorderWidth="0px" Height="0px" Width="0px"></asp:Label></td>
    </tr>
	<tr>
	<td height="25" colspan="2" class="style1"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 重填 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="_headContent">

    <style type="text/css">
        .style1
        {
            text-align: right;
        }
    </style>

</asp:Content>

