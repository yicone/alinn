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
using HOT.Common;

namespace Web
{
    public partial class ZoneManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["SiteId"] = Request.QueryString["siteid"];
            if (!this.IsPostBack)
            {
                DataList1.DataSource = SqlDataSource1;
                DataList1.DataBind();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            if (ViewState["SiteId"] != null)
            {
                e.Command.Parameters[0].Value = new Guid(ViewState["SiteId"].ToString());
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ToZoneView")
            {
                LinkButton lb = e.Item.FindControl("LinkButton1") as LinkButton;
                if (lb != null)
                {
                    Session["ZoneId"] = lb.CommandArgument;
                    Server.Transfer("ZoneView.aspx", false);
                }
            }
        }
    }
}
