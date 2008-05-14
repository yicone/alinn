<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Web.User.UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户信息</title>
    
    <style type="text/css">
        #form1
        {
            text-align: center;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table>
            <tr id="cname_tr" >
                <td>
                    公司名称：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="caddress_tr" >
                <td>
                    公司地址：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="ccharge_tr" >
                <td>
                    公司联系人：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comLinkMan" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 44px">手机号码：</td><td style="height: 44px">
                    &nbsp;<asp:TextBox ID="mobile" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile"
                        ErrorMessage="手机号码不能为空"></asp:RequiredFieldValidator></td><td style="height: 44px"><font color=red>*</font> 手机号码是阿里妈妈就付款、投放等重要问题和您保持联系的首选，
请认真填写</td>
            </tr>
            <tr>
                <td style="height: 26px">固定电话：</td><td style="height: 26px">
                    &nbsp;<asp:TextBox ID="telephone" runat="server"></asp:TextBox></td><td style="height: 26px">请输入您的联系电话</td>
            </tr>
            <tr>
                <td>QQ：</td><td>
                    &nbsp;<asp:TextBox ID="qqNumber" runat="server"></asp:TextBox></td><td>请输入您的QQ号码</td>
            </tr>
            <tr>
                <td>MSN：</td><td>
                    &nbsp;<asp:TextBox ID="msnAddress" runat="server"></asp:TextBox></td><td>请输入您的MSN</td>
            </tr>
            <tr>
                <td>所属院校：</td><td>
                    &nbsp;<asp:TextBox ID="school" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>所属代理：</td><td>
                    &nbsp;<asp:TextBox ID="proxy" runat="server"></asp:TextBox></td>
            </tr>  
        </table>
    </div>
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
        Text="提交修改" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnReset" runat="server" Text="重置" onclick="btnReset_Click" />
    </form>
</body>
</html>
