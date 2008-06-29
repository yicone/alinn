<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Site.aspx.cs" Inherits="Web.Site"
    MasterPageFile="~/MasterPage/Member.Master" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div>
 
  <table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="106" height="29" align="center" background="/images/yh04.gif" class="dl02" scope="col">发布广告位</th>
    <th width="829" align="left" background="/images/yh03.gif" scope="col">&nbsp;</th>
  </tr>
</table>
<table width="936" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th width="135" height="30" background="/images/yh08.gif" class="f4" scope="col">1. 选择网站 </th>
    <th width="31" background="/images/yh08.gif" class="bu10" scope="col">→</th>
    <th width="147" background="/images/yh08.gif" class="bu04" scope="col">2. 填写广告位信息</th>
    <th width="37" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="157" background="/images/yh08.gif" class="bu04" scope="col">3. 选择广告位类目 </th>
    <th width="75" background="/images/yh08.gif" class="bu04" scope="col"><span class="bu10">→</span></th>
    <th width="354" align="left" background="/images/yh08.gif" class="bu04" scope="col">4. 获取广告位代码 </th>
  </tr>
</table>
<table width="936" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#C2EAFD">
  <tr>
    <th height="200" valign="top" scope="col"><table width="936" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="29" height="30" bgcolor="#EFF4FA" scope="col"><img src="/images/yh19.gif" width="15" height="13" /></th>
        <th width="907" height="40" align="left" bgcolor="#EFF4FA" class="bu03" scope="col">网站基本信息 <span class="f3">(带</span> <span class="f4">*</span> <span class="f3">项为必填项)</span></th>
      </tr>
      <tr>
        <th height="50" colspan="2" scope="row"><table width="936" height="50" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="199" align="right" bgcolor="#EFF4FA" scope="col"><span class="d4">网站名称：</span><span class="f4">*</span> &nbsp;</th>
            <th width="737" align="left" scope="col">&nbsp;<asp:TextBox ID="txtSiteName" runat="server" Width="260px"></asp:TextBox>
              &nbsp;<span class="f3">网站名称请不要超过20个汉字或40个字符</span></th>
          </tr>
        </table></th>
        </tr>
      <tr>
        <th height="50" colspan="2" scope="row"><table width="936" height="50" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="200" align="right" bgcolor="#EFF4FA" scope="col"><span class="d4">网站地址：</span><span class="f4">*</span> &nbsp; </th>
            <th width="736" align="left" scope="col">&nbsp;<asp:TextBox ID="txtSiteUrl" runat="server" Width="260px"></asp:TextBox>
              &nbsp;<span class="f3">例：http://www.aaaa0.com</span> 
        </table></th>
      </tr>
      <tr>
        <th height="140" colspan="2" scope="row"><table width="936" height="140" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="200" align="right" valign="top" bgcolor="#EFF4FA" scope="col"><br />
                <span class="d4">网站描述：</span><span class="f4">*</span> &nbsp;</th>
            <th width="736" align="left" valign="top" scope="col"><br />
              &nbsp; <asp:TextBox ID="txtDescription" runat="server" Rows="8" Columns="50" TextMode="MultiLine"></asp:TextBox></th>
          </tr>
        </table></th>
      </tr>
      <tr>
        <th height="100" colspan="2" scope="row"><table width="936" height="95" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <th width="201" height="100" rowspan="2" align="right" valign="top" bgcolor="#EFF4FA" scope="col"><br />
              <span class="d4">网站类型：</span><span class="f4">*</span> &nbsp;</th>
            <th width="735" height="60" scope="col"><table width="600" border="0" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" align="left" valign="bottom" class="STYLE4"><label>
                                    <asp:RadioButtonList ID="rblSiteClass" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" Width="550px">
                    </asp:RadioButtonList>
                  </label>
                    
                    <label></label></td>
              </tr>
              <tr>

              </tr>
            </table>
              <label></label></th>
          </tr>
          
          <tr>
            <th align="left" scope="col">&nbsp;&nbsp;&nbsp;&nbsp;<span class="f3">网站类型是广告主常用的一种挑选网站的方式，选择正确的网站类型有助于广告位的售出。</span></th>
          </tr>
        </table></th>
      </tr>
    </table></th>
  </tr>
  <tr>
    <th height="250" valign="top" scope="row"><table width="936" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="29" height="40" bgcolor="#EFF4FA" scope="col"><img src="/images/yh19.gif" width="15" height="13" /></th>
        <th width="907" align="left" bgcolor="#Eff4fa" scope="col"><span class="bu03">网站基本信息</span></th>
      </tr>
    </table>
      <table width="936" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <th width="201" height="50" align="right" bgcolor="#EFF4FA" scope="col"><span class="d4">性 别：<span class="f4">*</span></span> &nbsp; </th>
          <th width="735" align="left" scope="col"><span class="tdblue">
          
                    <asp:RadioButtonList ID="rblSexType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">男性为主</asp:ListItem>
                        <asp:ListItem Value="1">男女基本一致</asp:ListItem>
                        <asp:ListItem Value="2">女性为主</asp:ListItem>
                    </asp:RadioButtonList>
          
          </span></th>
        </tr>
        <tr>
          <th height="50" align="right" bgcolor="#EFF4FA" scope="row">年 龄：<span class="f4">*</span>  &nbsp;</th>
          <td align="left" class="bu04">&nbsp;<asp:RadioButtonList ID="rblAgeType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">18岁以下</asp:ListItem>
                        <asp:ListItem Value="1">18～25岁</asp:ListItem>
                        <asp:ListItem Value="2">25～45岁</asp:ListItem>
                        <asp:ListItem Value="3">45岁以上</asp:ListItem>
                    </asp:RadioButtonList>
                &nbsp;</td>
        </tr>
        <tr>
          <th height="50" align="right" bgcolor="#EFF4FA" scope="row"><span class="d4">职 业：<span class="f4">*</span></span> &nbsp;</th>
          <td align="left" class="bu04">
                    <asp:CheckBoxList ID="cblEmployments" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow">
                    </asp:CheckBoxList>
                </td>
        </tr>
        <tr>
          <th height="50" align="right" bgcolor="#EFF4FA" scope="row"><span class="d4">兴趣爱好： </span>&nbsp;&nbsp;</th>
          <td align="left">&nbsp;<asp:TextBox ID="txtTaste" runat="server" Width="260px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
            <span class="f3">请不要超过30个汉字或者60个字符</span></td>
        </tr>
        <tr>
          <th height="50" align="right" bgcolor="#EFF4FA" scope="row"><span class="d4">月收入：<span class="f4">*</span> </span>&nbsp;</th>
          <td align="left" class="bu04"> &nbsp;<input type="radio" name="radiobutton" value="radiobutton" />
1000以下
  <input type="radio" name="radiobutton" value="radiobutton" />
1000--2000
<input type="radio" name="radiobutton" value="radiobutton" />
2000--4000
<input type="radio" name="radiobutton" value="radiobutton" />
4000--8000
<input type="radio" name="radiobutton" value="radiobutton" />
8000以上</td>
        </tr>
      </table>      </th>
  </tr>
  <tr>
    <th height="40" bgcolor="#EFF4FA" scope="row"><table width="936" height="40" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th width="379" height="60" scope="col">&nbsp;</th>
        <th width="169" height="34" bgcolor="#EFF4FA" scope="col">
        &nbsp;
                    <asp:ImageButton ID="btnAdd1" runat="server" onclick="btnAdd_Click" 
                ImageUrl="~/images/yh05.gif" />
                    </th>
        <th width="388" bgcolor="#EFF4FA" scope="col">&nbsp;</th>
      </tr>
    </table></th>
  </tr>
</table>
    </div>
</asp:Content>
