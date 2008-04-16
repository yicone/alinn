using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Web
{
    public partial class ZoneManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();
        }

        protected void btnAddSite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Site.aspx");
        }

        private int _zoneCount = 1;

        public int ZoneCount
        {
            get { return _zoneCount; }
            set { _zoneCount = value; }
        }

        public int PrintZoneCount()
        {
            return _zoneCount + 1;
        }
    }
}
