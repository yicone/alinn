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
    public partial class ZoneOutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string json = "'[" + Request.QueryString["titlecolor"];
            json += "," + Request.QueryString["titlecolor"];
            json += "," + Request.QueryString["textcolor"];
            json += "," + Request.QueryString["linkcolor"];
            json += "," + Request.QueryString["bordercolor"];
            json += "," + Request.QueryString["backgroundcolor"];
            json += "," + Request.QueryString["groundingcolor"];
            json += "," + Request.QueryString["cornerstyle"];
            json += "," + Request.QueryString["backgroundimage"];
            json += "," + Request.QueryString["iconimage"];
            json += "]'";

            hdn_jsonstyle.Value = json;
            hdn_sizecode.Value = Request.QueryString["sizecode"];
            hdn_layouttype.Value = Request.QueryString["layouttype"];
        }
    }
}
