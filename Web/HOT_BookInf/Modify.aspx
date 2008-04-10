<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Maticsoft.Web.HOT_BookInf.Modify" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td height="25" width="30%" align="right">
		BookInfoId
	</td>
	<td height="25" width="*" align="left">
		<asp:label id="lblBookInfoId" runat="server"></asp:label>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookClassId
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookClassId" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookName
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookName" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		ISBN
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtISBN" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Author
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtAuthor" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Translator
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtTranslator" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Investigator
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtInvestigator" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookConcern
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookConcern" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookSize
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookSize" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PrintSheet
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPrintSheet" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Words
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtWords" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PublishYear
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPublishYear" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Edition
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtEdition" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PrintTime
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPrintTime" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		PrintNum
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPrintNum" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BookPrice
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBookPrice" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		BindingId
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtBindingId" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Pages
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtPages" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Images
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtImages" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		State
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtState" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Recommendation
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtRecommendation" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		Content
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtContent" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		List
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtList" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		DownLoad
	</td>
	<td height="25" width="*" align="left">
		<asp:TextBox id="txtDownLoad" runat="server" Width="200px"></asp:TextBox>
	</td></tr>
	<tr>
	<td height="25" width="30%" align="right">
		AddDate
	</td>
	<td height="25" width="*" align="left">
		<INPUT onselectstart="return false;" onkeypress="return false" id="txtDate1" onfocus="setday(this)"
		 readOnly type="text" size="10" name="Text1" runat="server">
	</td></tr>
	<tr>
	<td height="25" colspan="2"><div align="center">
		<asp:Button ID="btnAdd" runat="server" Text="· 提交 ·" OnClick="btnAdd_Click" ></asp:Button>
		<asp:Button ID="btnCancel" runat="server" Text="· 取消 ·" OnClick="btnCancel_Click" ></asp:Button>
	</div></td></tr>
</table>

</asp:Content>
