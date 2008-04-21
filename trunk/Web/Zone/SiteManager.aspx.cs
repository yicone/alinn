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
    public partial class SiteManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO:remove test code here


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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = Guid.Empty;
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
                    break;
                case 1:
                    return "审核通过";
                    break;
                case 2:
                    return "审核未通过";
                    break;
                default:
                    return "";
                    break;
            }
        }
    }
}
