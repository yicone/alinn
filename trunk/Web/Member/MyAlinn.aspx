<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAlinn.aspx.cs" Inherits="Web.MyAlinn"
    MasterPageFile="~/MasterPage/Member.Master" Title="我的阿里奶奶" %>

<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="_mainContent">
    <div id="maincontent">
        <div class="lcol1">
            <!-- system messeges -->
            <!-- 网站主概况 -->
            <h1 class="summary-title">
                <div class="lc">
                </div>
                <div class="mc">
                    网站主概况 <i class="open"></i>
                </div>
                <div class="rc">
                </div>
                <div class="clearing">
                </div>
            </h1>
            <div class="role-summary seller" style="_height: 1%">
                <div class="finance-bar">
                    <ul>
                        <li>05月16日收入：<span class="large-green">0.00</span>元 </li>
                        <li>未结算收入：<span class="large-green">0.00</span>元 </li>
                        <li class="no-border">可用收入：<span class="large-green">0.00</span>元 </li>
                        <li class="action no-border"><a class="draw" href="http://www.alimama.com/membersvc/accounts/draw.htm?menuid=H03_L0302_V03">
                            <span>提现</span></a> </li>
                    </ul>
                </div>
                <div class="desc-for-bar">
                    <div class="for-yesterday">
                        <div class="arrow">
                        </div>
                        <div class="top">
                        </div>
                        <div class="body">
                            <ul>
                                <li><a href="http://www.alimama.com/membersvc/report/seller_earning.htm">
								» 查看广告位收益</a>
                                </li>
                            </ul>
                        </div>
                        <div class="bottom">
                        </div>
                    </div>
                    <div class="action-points">
                        <ul>
                            <li>上次提现时间：<em></em> </li>
                            <li>下次结算时间：<em>2008-06-15</em> </li>
                        </ul>
                    </div>
                    <div class="clearing">
                    </div>
                </div>
                <!-- 最新交易 -->
                <div class="sections">
                    <h3>
                        <i></i>最新交易 <a class="view-all" href="http://www.alimama.com/membersvc/campaign/cpt/trans_mgr.htm">
                            查看详情</a></h3>
                    <ul class="trans">
                        暂无交易
                    </ul>
                    <div class="clearing">
                    </div>
                </div>
                <!-- 待评价 -->
                <!-- 待评价结束 -->
            </div>
            <div class="role-summary-footer">
                <div class="lc">
                </div>
                <div class="mc">
                </div>
                <div class="rc">
                </div>
                <div class="clearing">
                </div>
            </div>
            <div class="clearing">
            </div>
            <!-- 广告主 -->
            <h1 class="summary-title">
                <div class="lc">
                </div>
                <div class="mc">
                    广告主上手
                </div>
                <div class="rc">
                </div>
            </h1>
            <div class="role-summary seller">
                <p class="start-from-here">
                    作为广告主，您了解以下几种计费模式吗？明白了就直接点击创建各自的广告</p>
                <ul class="plans-intro">
                    <li class="cpt"><a href="http://www.alimama.com/membersvc/campaign/cpt/select_zone.htm">
                        <cite><i></i>
                            <h5>
                                按时长计费</h5>
                            <span class="gray">CPT</span> </cite>
                        <div class="intro">
                            按广告展现的时长进行付费，目前最小购买时间单位是一周。按周期来进行付费。目前广告位最多可以连续购买4周。按时长付费有助于您更好的提高产品/服务的品牌及知名度。
                        </div>
                    </a></li>
                    <li class="cpm"><a href="http://www.alimama.com/membersvc/campaign/cpm/cpm_campaign_create.htm">
                        <cite><i></i>
                            <h5>
                                按浏览量计费</h5>
                            <span class="gray">CPM</span> </cite>
                        <div class="intro">
                            按每次点击进行付费，广告主为每次点击制定价格，按照广告被点击的次数进行付费！广告的点击情况除了和站点有关外，还和广告的样式，内容是否与网站内容相关等因素有关。
                        </div>
                    </a></li>
                    <li class="cpc"><a href="http://www.alimama.com/membersvc/campaign/cpc/cpc_campaign_create.htm">
                        <cite><i></i>
                            <h5>
                                按点击计费</h5>
                            <span class="gray">CPC</span> </cite>
                        <div class="intro">
                            CPM即每千次印象费用，广告主按照其广告所在页面展现1000次进行付费。按广告展现付费可以更有效的控制成本，也可以得到更好的品牌/产品知名度的提升。
                        </div>
                    </a></li>
                </ul>
                <div class="clearing">
                </div>
            </div>
            <div class="role-summary-footer">
                <div class="lc">
                </div>
                <div class="mc">
                </div>
                <div class="rc">
                </div>
            </div>
            <div class="my_sanbao_banner">
                <a href="http://club.alimama.com/thread-98154-1-1.html" target="_blank">
                    <img height="60" src="http://img.alimama.cn/cms/images/1210820555450.gif" width="658"
                        border="0" /></a></div>
        </div>
        <div class="lcol3">
            <div class="side-block userinfo">
                <h3>
                    <span class="open">个人信息<i></i></span></h3>
                <div class="clearing">
                </div>
                <div class="ava-and-nick">
                    <div class="user">
                        <p class="nickname">
                            <strong>
                                <%# Eval("NickName") %></strong></p>
                        <p class="regdate">
                            <i>上次登录时间:<%# Eval("LastLoginTime") %></i></p>
                    </div>
                </div>
                <ul class="attrs">
                    <li>
                        <label>
                            <i class="pm"></i>站内消息：</label>
                        <div class="value">
                            <a href="#" target="_blank">
                                <%# Eval("MsgCount") %></a>条</div>
                    </li>
                    <li>
                        <label>
                            <i class="pm"></i>广告主积分：</label>
                        <div class="value">
                            <a href="#" target="_blank">
                                <%# Eval("MsgCount") %></a>条</div>
                    </li>
                    <li>
                        <label>
                            <i class="pm"></i>网站主积分：</label>
                        <div class="value">
                            <a href="#" target="_blank">
                                <%# Eval("MsgCount") %></a>条</div>
                    </li>
                </ul>
                <div class="alipay-bind">
                    <i></i>您尚未绑定财富通，请尽快<a onclick="javascript:document.alipayForm.submit()" href="#">绑定</a>
                </div>
            </div>
            <div class="side-block alias">
                <h3>
                    <span class="open">快速入口<i></i></span></h3>
                <div class="clearing">
                </div>
                <div class="buyer">
                    <h5>
                        <span>广告主</span></h5>
                    <ul>
                        <li><i class="new-gg-plan"></i><a href="#">新建广告计划</a> </li>
                        <li><i class="manage-gg-group"></i><a href="/Member/Ad/ManageAdGroup.aspx">
						广告组管理</a> </li>
                        <li><i class="manage-trans-buyer"></i><a href="#">广告计划管理</a> </li>
                        <li><i class="incomes"></i><a href="#">消费账户</a> </li>
                    </ul>
                </div>
                <div class="seller">
                    <h5>
                        <span>网站主</span></h5>
                    <ul>
                        <li><i class="new-gg-board"></i><a href="/Member/Zone/Zone.aspx?action=new">
						发布广告位</a> </li>
                        <li><i class="view-income"></i><a href="/Member/Zone/SiteManager.aspx">
						广告位管理</a> </li>
                        <li><i class="manage-trans-seller"></i><a href="#">
						交易管理(卖)</a> </li>
                        <li><i class="incomes"></i><a href="#">收入账户</a> </li>
                    </ul>
                </div>
                <div class="clearing">
                </div>
            </div>
            <div class="side-block news">
            </div>
        </div>
    </div>
</asp:Content>
