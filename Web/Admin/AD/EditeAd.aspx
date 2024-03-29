﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditeAd.aspx.cs" Inherits="Web.Admin.EditeAd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
        <td align="left" colspan="2" height="25" style="text-align: center" width="*">
            广告信息修改 &nbsp;</td>
    </tr>
	<tr>
	<td height="25" width="30%" align="right">
        状态：&nbsp;</td>
	<td height="25" width="*" align="left">
        &nbsp;<asp:Label ID="labAuditState" runat="server" Width="200px"></asp:Label></td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        广告标题：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTitle" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        广告内容：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtContent" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        广告链接：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrl" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        链接文字：&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtUrlText" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        广告大小：&nbsp;</td>
	<td height="25" width="*" align="left">
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
        </asp:RadioButtonList></td></tr>
	<tr>
	<td height="25" width="30%" align="right">
        图片：&nbsp;</td>
	<td height="25" width="*" align="left">
        &nbsp;<asp:Image ID="imgImg" runat="server" Height="60px" Width="468px" />
        <asp:Label ID="labImg" runat="server"></asp:Label></td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 通过审核 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 取消 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>
    </div>
    </form>
</body>
</html>
