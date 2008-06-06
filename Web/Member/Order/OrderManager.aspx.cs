using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web.Member.Order
{
    public partial class OrderManger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string whereTime = " And AL_Order.UserId='" + HOT.BLL.User.GetLoginUser().ToString() + "'" + "And AL_Order.PerPoint is null" + getTimeWhere();
            dlTimeOrderDateBind(whereTime);
            string wherePoint = " And AL_Order.UserId='" + HOT.BLL.User.GetLoginUser().ToString() + "'" + "And AL_Order.PerPoint is not null" + getTimeWhere();
            dlPointOrderDateBind(wherePoint);
                if (!IsPostBack)
                {
                    this.mvOrder.ActiveViewIndex = 0;
                }
        }
        protected void dlTimeOrderDateBind(string strWhere)
        {
            HOT.BLL.Order oBLL = new HOT.BLL.Order();
            DataSet ds = new DataSet();
            ds = oBLL.GetList(strWhere);
            this.dlTimeOrder.DataSource = ds;
            this.dlTimeOrder.DataBind();
        }
        protected void dlPointOrderDateBind(string strWhere)
        {
            HOT.BLL.Order oBLL = new HOT.BLL.Order();
            DataSet ds = new DataSet();
            ds = oBLL.GetList(strWhere);
            this.dlPointOrder.DataSource = ds;
            this.dlPointOrder.DataBind();
        }
        protected void btnTimeAd_Click(object sender, EventArgs e)
        {
            this.mvOrder.ActiveViewIndex = 0;
        }

        protected void btnPointAd_Click(object sender, EventArgs e)
        {
            this.mvOrder.ActiveViewIndex = 1;
        }
        protected string getTimeWhere()
        {
            string timeWhere = "";
            double time = 0;
            switch (this.ddlTime.SelectedValue)
            { 
                case "0":
                    timeWhere = "";
                    break;
                case "1":
                    time = -3;
                    timeWhere = " And AL_Order.CreateDate>'" + DateTime.Now.AddDays(time).ToString()+"'";
                    break;
                case "2":
                    time = -7;
                    timeWhere = " And AL_Order.CreateDate>'" + DateTime.Now.AddDays(time).ToString() + "'";
                    break;
                case "3":
                    timeWhere = " And AL_Order.CreateDate>'" + DateTime.Now.AddMonths(-1).ToString() + "'";
                    break;
                case "4":
                    timeWhere = " And AL_Order.CreateDate>'" + DateTime.Now.AddMonths(-3).ToString() + "'";
                    break;
                default:
                    timeWhere = "";
                    break;

            }
            return timeWhere;
        }
 
        public static string GetAuditStateMeaning(int? auditState)
        {
            string meaning = "";
            switch (auditState)
            {
                case 0:
                    meaning = "未通过网站主审核";
                    break;
                case 1:
                    meaning = "定单有效";
                    break;
                case 2:
                    meaning = "审核拒绝";
                    break;
                case 3:
                    meaning = "定单过期";
                    break;
                default:
                    meaning = "未知状态";
                    break;
            }
            return meaning;
        }
    }
}
