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
            if (!IsPostBack)
            {
                ShowZoneInfo(zoneId);
                dlSiteOwerInfoDataBind();
                dlSiteInfoDataBind();
            }
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
            this.labWeekPrice.Text = zModel.WeekPrice.ToString();
        }
        protected void dlSiteOwerInfoDataBind()
        {
            string sql = "";
            sql = "select AL_User.NickName,AL_User.RegTime,AL_User.QQ from AL_Zone left join AL_User on AL_Zone.UserId=AL_User.UserId  where AL_Zone.ZoneId='" + this.Request.QueryString["ZoneId"].ToString()+"'";
            DataSet ds = HOT.DBUtility.DbHelperSQL.Query(sql);
            this.dlSiteOwerInfo.DataSource = ds;
            this.dlSiteOwerInfo.DataBind();
        }
        protected void dlSiteInfoDataBind()
        {
            string sql = "";
            sql = "select AL_ZonePic.ZonePic,AL_Site.SiteName,AL_Site.SiteUrl,AL_Zone.ZoneName,AL_Zone.SizeId,AL_Zone.MediaType,AL_Zone.Infirst from AL_Zone left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId where  AL_Zone.ZoneId='" + this.Request.QueryString["ZoneId"].ToString() + "'";
            DataSet ds = HOT.DBUtility.DbHelperSQL.Query(sql);
            this.dlSiteInfo.DataSource = ds;
            this.dlSiteInfo.DataBind();
        }
        protected string getSize(int sizeId)
        {
            string size = "";
            switch (sizeId)
            { 
                case 1:
                    size = "";
                    break;
                default:
                    size = "";
                    break;
            }
            return size;
        }
        protected void showInfo()
        {
            Guid zoneId = new Guid(this.Request.QueryString["ZoneId"]);

            //得到Zone实体
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(zoneId);

            
        }
    }
}
