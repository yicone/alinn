<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Web.User.UserInfo"
    MasterPageFile="~/MasterPage/Member.Master" Title="用户信息" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div style="text-align: center">
    <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="images/yh04.gif" class="dl02" scope="col">用户信息</th>
    <th width="829" align="left" background="images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
        <table>
            <tr id="cname_tr">
                <td>
                    &nbsp;</td>
                <td>
                    带 * 为必填项，其他为可选项</td>
            </tr>
            <tr id="cname_tr">
                <td>
                    公司名称：                 </td>
                <td>
                    &nbsp;<asp:TextBox ID="comName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="caddress_tr">
                <td>
                    公司地址：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr id="ccharge_tr">
                <td>
                    公司联系人：
                </td>
                <td>
                    &nbsp;<asp:TextBox ID="comLinkMan" runat="server"></asp:TextBox>
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
                    <font color="red">*</font> 手机号码是赢在广告就付款、投放等重要问题和您保持联系的首选， 请认真填写
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
        </table>
    </div>


    <table width="22%" height="50" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th scope="col"> 
            <asp:ImageButton ID="ibtnUpdate" runat="server" Height="25px" 
                onclick="ibtnUpdate_Click" Width="78px" ImageUrl="~/images/yh20.gif" /></th>
        <th width="78" scope="col">
            <asp:ImageButton ID="ibtnReset" runat="server" ImageUrl="~/images/yh21.gif" 
                onclick="ibtnReset_Click" /></th>
      </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="_htmlHeadContent">
    <%--此处添加MEAT标签、JS脚本和样式表的引用--%>
    <%--将特定页面才使用的JS脚本和样式表引用放置在此处，有利于减少网络流量--%>
    <style type="text/css">
        #form1
        {
            text-align: center;
        }
        .style2
        {
            height: 25px;
            width:auto;
        }
    </style>
</asp:Content>
