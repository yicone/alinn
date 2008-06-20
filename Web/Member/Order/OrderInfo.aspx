<%@ Page Language="C#"  MasterPageFile="~/MasterPage/Member.Master" AutoEventWireup="true" CodeBehind="OrderInfo.aspx.cs" Inherits="Web.Order.OrderInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_mainContent" runat="server">
    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		<br />
        <br />
        <br />
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		广告计划名称： 	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblOrderName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		广告：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblAdTitle" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		购买的广告位：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblZoneName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		开始时间：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblStartDate" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		结束：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblEndDate" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		审核状态：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblAuditState" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		每次点击费用：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPerPoint" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		每天最多投入费用：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblEverydayPrice" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		总投入费用：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPrice" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		支付状态：</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPayment" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		创建时间：
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblCreateDate" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		&nbsp;</td>
	<td height="25" width="*" align="left">
		<asp:ImageButton ID="ibtnPay" runat="server" 
            ImageUrl="~/Order/images/tenpay_button_02_l.gif" onclick="ibtnPay_Click" />
	</td></tr>
</table>
</asp:Content>
