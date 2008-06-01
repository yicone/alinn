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

namespace Web.Member.Store
{
    public partial class MyStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvStoresDateBind();
            }
        }
        protected void gvStoresDateBind()
        {
            DataSet ds = new DataSet();
            HOT.BLL.Store sBLL = new HOT.BLL.Store();
            ds = sBLL.GetList("AL_Store.UserId='" + HOT.BLL.User.GetLoginUser().ToString()+"'");
            this.gvStores.DataSource = ds;
            this.gvStores.DataBind();
        }
    }
}
