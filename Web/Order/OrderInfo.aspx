<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderInfo.aspx.cs" Inherits="Web.Order.OrderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		OrderId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblOrderId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		OrderName
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblOrderName" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		UserId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblUserId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		AdId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblAdId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		ZoneId
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblZoneId" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		StartDate
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblStartDate" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		EndDate
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblEndDate" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		AuditState
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblAuditState" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PerPoint
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPerPoint" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		EverydayPrice
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblEverydayPrice" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Price
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPrice" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Payment
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblPayment" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		CreateDate
	</td>
	<td height="25" width="*" align="left">
		<asp:Label id="lblCreateDate" runat="server"></asp:Label>
	</td></tr>
</table>
    </div>
    </form>
</body>
</html>
