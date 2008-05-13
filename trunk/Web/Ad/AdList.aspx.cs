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
using HOT.DBUtility;

namespace Web.Ad
{
    public partial class AdList : System.Web.UI.Page
    {
        string Where = " Where AL_Zone.ZoneState=1";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "广告列表";
            Where += this.rblInFirst.SelectedValue.ToString() + this.ddlPricePerK.SelectedValue.ToString()+this.ddlVisteNumPerDay.SelectedValue.ToString();
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            //if (!IsPostBack)
            //{
            DataSet ds = zBLL.GetList(AspNetPager1.StartRecordIndex, 10, 1,Where);
            AspNetPager1.RecordCount = int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString());
            dlZoneDataBind(Where);
            //}
        }
        private void dlZoneDataBind(string strWhere)
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            DataSet ds = new DataSet();
            ds = zBLL.GetList(AspNetPager1.StartRecordIndex, 10, 0,Where);
            this.dlZone.DataSource = ds;
            this.dlZone.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            dlZoneDataBind(Where);
        }
    }
}
