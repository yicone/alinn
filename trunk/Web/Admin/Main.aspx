<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Admin_Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
<link  href="images/StyleSheet.css" rel="Stylesheet"  type="text/css" />
</head>
<body class="admin_main_body">
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" cellpadding="10" width="80%" align="center" border="0">
          <tr>
            <td align="center"><span style="color:Red"><b><%--<%=AdminName %>--%></b> </span>您好！ 欢迎进入管理系统！</td>
          </tr>
        </table>
        <table cellspacing="1" cellpadding="3" width="90%" align="center"  bgColor="#ffffff" border="0">
          <tbody>
          <tr>
            <td class="th1" align="center" colSpan=2 height=25>服务器信息统计 </td></tr>
          <tr bgColor="#f9fbf0">
            <td width="50%" style="height: 24px">&nbsp;<strong>服务器名</strong>：<%=System.Environment.MachineName%></td>
            <td width="50%" style="height: 24px">&nbsp;<b>服务器端口：</b><%= HttpContext.Current.Request.ServerVariables["Server_Port"].ToString() %></td></tr>
          <tr bgColor="#f9fbf0">
            <td width="50%" style="height: 23px">&nbsp;<b>脚本解释引擎：</b><%=System.Environment.Version%></td>
            <td width="50%" style="height: 23px"><b>&nbsp;站点物理路径：</b><%=HttpContext.Current.Request.PhysicalApplicationPath.ToString() %></td></tr>
          <tr bgColor="#f9fbf0">
            <td width="50%" style="height: 23px">&nbsp;<b>服务器CPU个数：</b><%=System.Environment.ProcessorCount %> </td>
            <td width="50%" style="height: 23px">&nbsp;<b>服务器IIS版本：</b><%=Request.ServerVariables["SERVER_SOFTWARE"]%></td></tr>
          <tr bgColor="#f9fbf0">
            <td width="50%">&nbsp;<b>开机运行时长</b>：<%=(System.Environment.TickCount/3600000).ToString("N2")%>  小时
            </td>
            <td width="50%"><b>&nbsp;服务器时间：</b><%=DateTime.Now.ToString() %></td></tr>
          <tr bgColor="#f9fbf0">
            <td colspan="2">&nbsp;<b>服务器操作系统：</b><span> <%=System.Environment.OSVersion.ToString()%></span> </td>
            </tr>
          </tbody>
        </table>
    </div>
    </form>
</body>
</html>
