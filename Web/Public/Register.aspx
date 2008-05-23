<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web.User.Register"
    MasterPageFile="~/MasterPage/Global.Master" Title="用户注册" %>

<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="text-align: center">
        <table>
            <tr>
                <td>
                    帐号类型：
                </td>
                <td>
                    <input type="radio" id="P" value="P" checked="true" onclick="typeSelect('1')" runat="server" /><span>个人</span>
                </td>
                <td>
                    <input type="radio" id="C" value="C" onclick="typeSelect('2')" runat="server" /><span>企业</span>
                </td>
            </tr>
            <tr id="cname_tr" style="display: none">
                <td>
                    公司名称：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="caddress_tr" style="display: none">
                <td>
                    公司地址：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="ccharge_tr" style="display: none">
                <td>
                    公司联系人：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comLinkMan" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    EMAIL地址：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="email" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
                        ErrorMessage="您输入的Email地址无效" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email"
                        ErrorMessage="email不能为空"></asp:RequiredFieldValidator>
                </td>
                <td>
                    您将使用此邮件登录
                </td>
            </tr>
            <tr>
                <td>
                    确认EMAIL地址：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="reEmail" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="email"
                        ControlToValidate="reEmail" ErrorMessage="您的输入有误" CultureInvariantValues="True"></asp:CompareValidator>
                </td>
                <td>
                    请重复输入您的邮件地址
                </td>
            </tr>
            <tr>
                <td>
                    密码：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="passWord" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="passWord"
                        ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                </td>
                <td>
                    密码由6-16个字符组成，请使用英文字母加数字的组合密码
                </td>
            </tr>
            <tr>
                <td>
                    再输入一遍密码：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="rePassWord" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="passWord"
                        ControlToValidate="rePassWord" CultureInvariantValues="True" ErrorMessage="您的输入有误"></asp:CompareValidator>
                </td>
                <td>
                    密码由6-16个字符组成，请使用英文字母加数字的组合密码
                </td>
            </tr>
            <tr>
                <td>
                    昵称：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="nickName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nickName"
                        ErrorMessage="昵称不能为空"></asp:RequiredFieldValidator>
                </td>
                <td>
                    昵称不可更改，请谨慎填写
                </td>
            </tr>
            <tr>
                <td style="height: 44px">
                    手机号码：
                </td>
                <td style="height: 44px">
                    &nbsp;<asp:TextBox ID="mobile" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile"
                        ErrorMessage="手机号码不能为空"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 44px">
                    <font color="red">*</font> 手机号码是阿里奶奶就付款、投放等重要问题和您保持联系的首选， 请认真填写
                </td>
            </tr>
            <tr>
                <td style="height: 26px">
                    固定电话：
                </td>
                <td style="height: 26px">
                    &nbsp;<asp:TextBox ID="telephone" runat="server"></asp:TextBox>
                </td>
                <td style="height: 26px">
                    请输入您的联系电话
                </td>
            </tr>
            <tr>
                <td>
                    QQ：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="qqNumber" runat="server"></asp:TextBox>
                </td>
                <td>
                    请输入您的QQ号码
                </td>
            </tr>
            <tr>
                <td>
                    MSN：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="msnAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    请输入您的MSN
                </td>
            </tr>
            <tr>
                <td>
                    所属院校：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="school" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    所属代理：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="proxy" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 5px">
                        验证码：<input id="code" style="border-right: #999 1px solid; border-top: #999 1px solid;
                            border-left: #999 1px solid; width: 130px; border-bottom: #999 1px solid" type="text"
                            maxlength="4" name="code" /></div>
                    <div style="padding-right: 0px; padding-left: 58px; padding-bottom: 3px; padding-top: 5px">
                        请输入下面的字</div>
                    <div id="test" style="padding-right: 0px; padding-left: 58px; padding-bottom: 3px;
                        padding-top: 5px">
                        <a href="javascript:f()">看不清?</a><br />
                        <img id="ival" height="40" src="BuildImageCode.aspx" width="105" align="absMiddle"
                            border="0" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="注册" />
</asp:Content>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_scriptContent">

    <script language="javascript" type="text/javascript">
    
        function typeSelect(id)
        {
            if(id == "1")
            {
                document.getElementById("cname_tr").style.display = "none";
                document.getElementById("caddress_tr").style.display = "none";
                document.getElementById("ccharge_tr").style.display = "none";
            }
            else if( id == "2")
            {
                document.getElementById("cname_tr").style.display = "";
                document.getElementById("caddress_tr").style.display = "";
                document.getElementById("ccharge_tr").style.display = "";
            }
            else
            {}
        }
    
        function f()
    {
       var img = document.getElementById('ival');
       img.src = "/Public/BuildImageCode.aspx?"+Math.random();
       
        //document.getElementById("test").innerHTML = "<A href=\"javascript:f()\">看不清?</A><br><IMG id=\"ival\" height=\"40\" src=\"/Public/BuildImageCode.aspx\" width=\"105\" align=\"absMiddle\"border=\"0\"  >";
    }
    </script>

</asp:Content>
