<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAlinn.aspx.cs" Inherits="Web.MyAlinn"
    MasterPageFile="~/MasterPage/Member.Master" Title="用户管理中心" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <table width="936" height="382" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#EDEDED">
  <tr>
    <th height="380" valign="top" scope="col"><table width="936" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="260" height="30" align="left" background="/images/yz01.gif" scope="col"><span class="d4">&nbsp;&nbsp;个人信息</span> </th>
        <th scope="col"><%# Eval("NickName") %></th>
        <th align="left" background="/images/yz03.gif" scope="col"><span class="d4">&nbsp;&nbsp;广告主概况</span></th>
      </tr>
      <tr>
        <th width="260" height="152" valign="top" bgcolor="#F1F1F1" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th width="115" height="30" align="right" scope="col"><strong class="bt02">ping08&nbsp;</strong></th>
            <th width="145" scope="col">&nbsp;</th>
          </tr>
          <tr>
            <th height="30" align="right" class="gl01" scope="row">上次登录时间:&nbsp;</th>
            <td class="gl01">&nbsp;<%# Eval("LastLoginTime") %></td>
          </tr>
          <tr>
            <th height="30" align="right" scope="row"><img src="/images/yz02.gif" width="18" height="12" /> <span class="bu02">站内消息：</a></span></th>
            <td class="bu02">&nbsp;<%# Eval("MsgCount") %>条</td>
          </tr>
          <tr>
            <th height="30" align="right" class="bu02" scope="row"><img src="/images/yz04.gif" width="16" height="15" />广告主积分：</th>
            <td class="bu02">&nbsp;<%# Eval("MsgCount") %></td>
          </tr>
          <tr>
            <th height="30" align="right" class="bu02" scope="row"><img src="/images/yz04.gif" width="16" height="15" />网站主积分：</th>
            <td class="bu02">&nbsp;<%# Eval("MsgCount") %></td>
          </tr>
        </table></th>
        <th width="20" scope="col">&nbsp;</th>
        <th valign="top" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th height="50" scope="col"><table width="90%" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
              <tr>
                <th width="281" align="left" scope="col"><span class="bu06">&nbsp;&nbsp;</span><span class="d3">今日实时支出：</span><span class="bu07">0.00元</span><span class="d3"> &nbsp;&nbsp;可用余额：</span><span class="bu07">0.00元</span> </th>
                <th width="244" scope="col">&nbsp;</th>
              </tr>
            </table></th>
          </tr>
          <tr>
            <th height="40" align="left" bgcolor="#F8F8F8" scope="row"><em></em>&nbsp;&nbsp;&nbsp; <span class="bt02">&gt;&gt;&nbsp;最新广告计划</span> <span class="d3">&nbsp;&nbsp;<a href="#" class="bu06">查看广告计划</a></span></th>
          </tr>
          <tr>
            <th height="40" align="left" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="gl02">&nbsp;&nbsp; 暂无最新广告计划</span></th>
          </tr>
          <tr>
            <th height="22" scope="row">&nbsp;</th>
          </tr>
        </table></th>
      </tr>
    </table>
    <br /><br />
    <table width="936" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="260" height="30" align="left" background="/images/yz01.gif" scope="col"><span class="d4">&nbsp;&nbsp;快速入口</span> </th>
        <th scope="col">&nbsp;</th>
        <th align="left" background="/images/yz03.gif" scope="col"><span class="d4">&nbsp;&nbsp;网站主概况</span></th>
      </tr>
      <tr>
        <th width="260" height="152" valign="top" bgcolor="#F1F1F1" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th width="125" height="35" align="center" scope="col"><strong class="bt02">广告主</strong></th>
              <th width="135" class="bt02" scope="col">网站主</th>
            </tr>
            <tr>
              <th height="40" align="center" valign="middle" class="bu02" scope="row"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col"><span class="bu02"><a href="#">新建广告计划</a></span></th>
                  </tr>
                </table></th>
              <td align="center" valign="middle" class="gl01"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">发布广告位</a></span></th>
                  </tr>
                </table>
                </td>
            </tr>
            <tr>
              <th height="40" align="center" valign="middle" class="bu02" scope="row"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                <tr>
                  <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">广告组管理</a></span></th>
                </tr>
              </table></th>
              <td align="center" valign="middle" class="bu02"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">广告位管理</a></span></th>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <th height="40" align="center" valign="middle" class="bu02" scope="row"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">广告计划管理</a></span></th>
                  </tr>
                </table></th>
              <td align="center" valign="middle" class="bu02"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                <tr>
                  <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">交易管理(卖)</a></span></th>
                </tr>
              </table>
                </td>
            </tr>
            <tr>
              <th height="40" align="center" valign="middle" class="bu02" scope="row"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">修改账户</a></span></th>
                  </tr>
                </table></th>
              <td align="center" valign="middle" class="bu02"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                <tr>
                  <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">我的推广</a></span></th>
                </tr>
              </table>
                </td>
            </tr>
            <tr>
              <th height="40" align="center" valign="middle" class="bu02" scope="row"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                  <tr>
                    <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">消费账户</a></span></th>
                  </tr>
                </table></th>
              <td align="center" valign="middle" class="bu02"><table width="110" height="30" border="1" cellpadding="0" cellspacing="0" bordercolor="#E0DFE3" bgcolor="#FFFFFF">
                <tr>
                  <th width="106" scope="col">&nbsp;<span class="bu02"><a href="#">收入账户</a></span></th>
                </tr>
              </table>                
            </tr>
        </table></th>
        <th width="20" scope="col">&nbsp;</th>
        <th valign="top" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th height="60" colspan="3" scope="col"><table width="90%" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#F1F1F1">
                  <tr>
                    <th width="477" align="left" scope="col"><span class="bu06">&nbsp;&nbsp;</span><span class="d3">06月23日收入：</span><span class="bu07">0.00元</span><span class="d3"> &nbsp;&nbsp;未结算收入：<span class="bu07">0.00元</span>&nbsp;&nbsp;可用收入：<span class="bu07">0.00元</span> </span> </th>
                    <th width="113" scope="col">&nbsp;</th>
                  </tr>
              </table></th>
            </tr>
            <tr>
              <th width="39%" height="60" align="left" scope="row"><em></em>&nbsp;&nbsp;&nbsp;<span class="d3">&nbsp;&nbsp;<a href="#" class="bu06">查看广告位收益 </a></span></th>
              <th width="30%" align="left" class="q01" scope="row">上次提现时间：<em class="bu07">008-07-15</em></th>
              <th width="31%" align="left" class="q01" scope="row">下次结算时间：<em class="bu07">2008-07-15</em> </th>
            </tr>
            <tr>
              <th height="40" colspan="3" align="left" bgcolor="#F8F8F8" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<span class="gl02">&nbsp;<span class="bt02">&gt;&gt;&nbsp;查看交易 &nbsp;&nbsp;<a href="campaign/cpt/trans_mgr.htm" class="bu06">查看详情</a></span></span></th>
            </tr>
            <tr>
              <th height="50" colspan="3" align="left" scope="row"><span class="gl02"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无</span></th>
            </tr>
        </table></th>
      </tr>
    </table></th>
  </tr>
</table>
</asp:Content>
