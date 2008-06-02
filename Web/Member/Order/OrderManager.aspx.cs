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
            string where = " And UserId='" + HOT.BLL.User.GetLoginUser().ToString() + "'";
                gvTimeOrderDateBind(where);
                this.mvOrder.ActiveViewIndex = 0;
            
        }
        protected void gvTimeOrderDateBind(string strWhere)
        {
            HOT.BLL.Order oBLL = new HOT.BLL.Order();
            DataSet ds = new DataSet();
            ds = oBLL.GetList(strWhere);
            this.gvTimeOrder.DataSource = ds;
            this.gvTimeOrder.DataBind();
        }

        protected void btnTimeAd_Click(object sender, EventArgs e)
        {
            this.mvOrder.ActiveViewIndex = 0;
        }

        protected void btnPointAd_Click(object sender, EventArgs e)
        {
            this.mvOrder.ActiveViewIndex = 1;
        }
    }
}
