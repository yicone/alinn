using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web
{
    public partial class ZoneManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string siteId = Request.QueryString["siteid"];

        }

        protected void DataList1_DataBinding(object sender, EventArgs e)
        {
            //DataList1.
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //e.Command.Parameters[0].Value = Guid.Empty;
        }
    }
}
