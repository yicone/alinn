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
    public partial class ShowZone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuyAd_Click(object sender, EventArgs e)
        {
            Guid guid =new Guid("AF0A638B-43E1-1EFA-ADAB-9A8200C07657");
            Response.Redirect("../Ad/BuyAd.aspx?ZoneId=" + guid.ToString());
        }
    }
}
