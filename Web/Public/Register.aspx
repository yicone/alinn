<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Web.User.Register"
    MasterPageFile="~/MasterPage/Global.Master" Title="用户注册" %>

<asp:Content ID="Content2" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="text-align: center">
    
<table width="936" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#F5F8FC">
  <tr>
    <th height="40" align="left" background="/images/zc01.gif" scope="col">&nbsp;<span class="d1">你的位置: 首页 &gt; 新会员注册</span> </th>
  </tr>
  <tr>
    <th height="40" ><table width="936" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="66" background="/images/zc02.gif" scope="col">&nbsp;</th>
        <th width="870" align="left" background="/images/zc02.gif" class="d4" scope="col">设置您的账户信息</th>
      </tr>
    </table></th>
  </tr>
</table>
<table width="936" style="background-image:url(/app_themes/new/images/line.gif)">
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td style="width:10%;">
                    帐号类型：
                </td>
                <td style="width:10%;">
                    <input type="radio" id="P" value="P" checked="true" onclick="typeSelect('1')" runat="server" /><span>个人</span>
                    <input type="radio" id="C" value="C" onclick="typeSelect('2')" runat="server" /><span>企业</span>
                </td>
                <td style="width:25%;">
                    
                    &nbsp;</td>
            </tr>
            <tr id="cname_tr" style="display: none">
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    公司名称：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="comName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="caddress_tr" style="display: none">
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    公司地址：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="comAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="ccharge_tr" style="display: none">
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    公司联系人：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="comLinkMan" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    EMAIL地址：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="email" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    您将使用此邮件登录<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email"
                        ErrorMessage="email不能为空"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
                        ErrorMessage="您输入的Email地址无效" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    确认EMAIL地址：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="reEmail" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    请重复输入您的邮件地址
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="email"
                        ControlToValidate="reEmail" ErrorMessage="您的输入有误" CultureInvariantValues="True"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    密码：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="passWord" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    密码由6-16个字符组成，请使用英文字母加数字的组合密码
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="passWord"
                        ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    再输入一遍密码：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="rePassWord" runat="server" TextMode="Password" MaxLength="16"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    密码由6-16个字符组成，请使用英文字母加数字的组合密码
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="passWord"
                        ControlToValidate="rePassWord" CultureInvariantValues="True" ErrorMessage="您的输入有误"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    昵称：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="nickName" runat="server"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    昵称不可更改，请谨慎填写
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nickName"
                        ErrorMessage="昵称不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style8">
                    手机号码：
                </td>
                <td class="style11">
                    &nbsp;<asp:TextBox ID="mobile" runat="server"></asp:TextBox>
                </td>
                <td style="height: 44px" style="width:25%;">
                    <font color="red">*</font> 手机号码是赢在广告就付款、投放等重要问题和您保持联系的首选， 请认真填写
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile"
                        ErrorMessage="手机号码不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style9">
                    固定电话：
                </td>
                <td class="style12">
                    &nbsp;<asp:TextBox ID="telephone" runat="server"></asp:TextBox>
                </td>
                <td style="height: 26px" style="width:25%;">
                    请输入您的联系电话
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    QQ：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="qqNumber" runat="server"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    请输入您的QQ号码
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    MSN：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="msnAddress" runat="server"></asp:TextBox>
                </td>
                <td style="width:25%;">
                    请输入您的MSN
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    所属院校：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="school" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style7">
                    所属代理：
                </td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="proxy" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                        &nbsp;</td>
                <td class="style7">
                        验证码：</td>
                <td class="style10">
                                       <div style="padding-right: 0px; padding-left: 10px; padding-bottom: 0px; padding-top: 5px">
                                           <input id="code" style="border-right: #999 1px solid; border-top: #999 1px solid;
                            border-left: #999 1px solid; width: 130px; border-bottom: #999 1px solid" type="text"
                            maxlength="4" name="code" />
                            <br/>请输入下面的字
                            </div>
                    <div id="test" style="padding-right: 0px; padding-left: 58px; padding-bottom: 3px;
                        padding-top: 5px">
                        
                        <img id="ival" height="40" src="BuildImageCode.aspx" width="105" align="absMiddle"
                            border="0" /><a href="javascript:f()">看不清?</a><br />
                    </div></td>
            </tr>
            </table>
<table width="147" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/button.gif">&nbsp;</td>
  </tr>
</table>
<table width="765" height="5" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#4AB6EF" style="text-align:center;">
  <tr>
    <td bgcolor="#4AB6EF">
    <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="注册" />
      </td>
  </tr>
</table>
<table width="147" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
  
    
    
        
    </div>
    <br />
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
<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="_htmlHeadContent">

        <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
        <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%><style type="text/css">                                                      .style1
                                                      {
                                                          text-align: left;
                                                      }
                                                      .style4
                                                      {
                                                          width: 11%;
                                                      }
                                                      .style5
                                                      {
                                                          height: 44px;
                                                          width: 11%;
                                                      }
                                                      .style6
                                                      {
                                                          height: 26px;
                                                          width: 11%;
                                                      }
                                                      .style7
                                                      {
                                                          width: 142px;
                                                      }
                                                      .style8
                                                      {
                                                          height: 44px;
                                                          width: 142px;
                                                      }
                                                      .style9
                                                      {
                                                          height: 26px;
                                                          width: 142px;
                                                      }
                                                      .style10
                                                      {
                                                          width: 133px;
                                                      }
                                                      .style11
                                                      {
                                                          height: 44px;
                                                          width: 133px;
                                                      }
                                                      .style12
                                                      {
                                                          height: 26px;
                                                          width: 133px;
                                                      }
                                                  </style>
</asp:Content>

