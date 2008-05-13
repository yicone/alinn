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
            //Guid zoneId=new Guid(this.Request.QueryString["ZoneId"].ToString());
            Guid zoneId = new Guid("AF0A638B-43E1-1EFA-ADAB-9A8200C07657");
            ShowZoneInfo(zoneId);
        }

        protected void btnBuyAd_Click(object sender, EventArgs e)
        {
            Guid guid =new Guid("AF0A638B-43E1-1EFA-ADAB-9A8200C07657");
            Response.Redirect("../Ad/BuyAd.aspx?ZoneId=" + guid.ToString());
        }
        protected void ShowZoneInfo(Guid zoneId)
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(zoneId);
            this.labZoneName.Text = zModel.ZoneName;
        }

    }
}
