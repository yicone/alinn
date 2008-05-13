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
            switch (e.CommandName)
            {
                case "ToZoneView1":
                    {
                        LinkButton lb = e.Item.FindControl("LinkButton1") as LinkButton;
                        if (lb != null)
                        {
                            Session["ZoneId"] = lb.CommandArgument;
                            Response.Write("<script>window.open('ZoneView.aspx','_top');</script>");
                        }
                        break;
                    }
                case "ToZoneView2":
                    {
                        LinkButton lb = e.Item.FindControl("LinkButton3") as LinkButton;
                        if (lb != null)
                        {
                            Session["ZoneId"] = lb.CommandArgument;
                            Response.Write("<script>window.open('ZoneView.aspx','_top');</script>");
                        }
                        break;
                    }
                case "ToZoneDesigner":
                    {
                        LinkButton lb = e.Item.FindControl("LinkButton4") as LinkButton;
                        if (lb != null)
                        {
                            Session["ZoneId"] = lb.CommandArgument;
                            Response.Write("<script>window.open('ZoneDesigner.aspx','_top');</script>");
                        }
                        break;
                    }
                case "ToZoneSellDetail":
                    {
                        LinkButton lb = e.Item.FindControl("LinkButton2") as LinkButton;
                        if (lb != null)
                        {
                            Session["ZoneId"] = lb.CommandArgument;
                            Response.Write("<script>window.open('../Report/ZoneSellDetail.aspx','_top');</script>");
                        }
                        break;
                    }
                default:
                    break;
            }
        }
    }
}
