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
using System.Data.SqlClient;

namespace Web
{
    public partial class SiteManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO:remove test code here

            if (!Page.IsPostBack)
            {
                DataList1.DataBind();
            }
        }

        protected void btnAddSite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Zone/Site.aspx?action=new");
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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = new Guid("00000000-0000-0000-0000-000000000000"); //UNDONE: JUST FOR TEST

        }

        protected void DataList1_DataBinding(object sender, EventArgs e)
        {
            //DataList1.
        }

        public string ConvertAuditState(int auditState)
        {
            switch (auditState)
            {
                case 0:
                    return "未提交审核";
                case 1:
                    return "审核通过";
                case 2:
                    return "审核未通过";
                default:
                    return "";
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "DelSite")
            {
                string strSiteId = e.CommandArgument.ToString();
                HOT.BLL.Site siteManager = new HOT.BLL.Site();
                siteManager.Delete(new Guid(strSiteId));
                DataList1.DataBind();
            }
        }
    }
}
