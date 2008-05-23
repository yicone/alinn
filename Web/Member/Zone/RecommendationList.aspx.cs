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
using System.Diagnostics;
using HOT.Common;

namespace Web.Member.Zone
{
    public partial class RecommendationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string strIntroducerId = Request.QueryString["UserId"];
                if (GuidHelper.CanParse(strIntroducerId))
                {
                    SqlDataSource1.SelectParameters[0].DefaultValue = strIntroducerId;

                    DataList1.DataBind();
                }
            }
        }
    }
}
