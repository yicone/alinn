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

            if (this.Request.QueryString["ZoneId"] == null)
            {
                HOT.Common.MessageBox.Show(this.Page, "参数错误");
            }
            else
            {
                Guid zoneId=new Guid(this.Request.QueryString["ZoneId"].ToString());
                if (!IsPostBack)
            {
                ShowZoneInfo(zoneId);
                dlSiteOwerInfoDataBind();
                dlSiteInfoDataBind();
                this.mvZoneInfo.ActiveViewIndex = 0;
                showInfo();
                gvOtherZone.DataBind();
            }
            }

        }

        protected void btnBuyAd_Click(object sender, EventArgs e)
        {
            Guid guid = new Guid(this.Request.QueryString["ZoneId"].ToString());
            Response.Redirect("/Member/Ad/BuyAd.aspx?ZoneId=" + guid.ToString());
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

            //得到ZoneClass实体
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
            string[] classes = HOT.Common.Strings.SplitString(zModel.ClassIds.ToString(), ",");

            if (zModel.NeedAuditing == 0)
            {
                this.labCheck.Text = "不需要审核";
            }
            else
            {
                this.labCheck.Text = "需要审核";
            }
            if (zModel.InFirst == 0)
            {
                this.labInfirst.Text = "不在首页";
            }
            else
            {
                this.labInfirst.Text = "在首页";
            }
            this.labKeywords.Text = zModel.Keywords;
            this.labDescription.Text = zModel.Description;
            HOT.Model.ZoneClass zcParentModel = new HOT.Model.ZoneClass();

            for (int i = 0; i < classes.Length; i++)
            {
                zcModel = zcBLL.GetModel(int.Parse(classes[i]));
                if (zcModel.ParentId == 0)
                {
                    labZoneClass.Text += zcModel.ClassName.ToString()+";";
                }
                else
                {
                    zcParentModel = zcBLL.GetModel(zcModel.ParentId);
                    labZoneClass.Text += zcParentModel.ClassName.ToString() + " > " + zcModel.ClassName.ToString()+";";
                }
            }
            
        }
        //绑定gvOtherZone，显示同一网站下的广告位
        protected void gvOtherZoneDataBind()
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(new Guid(this.Request.QueryString["ZoneId"]));
            string sql = "select * from AL_Zone where siteId='"+ zModel.SiteId.ToString()+"'";
            DataSet ds = new DataSet();
            ds = HOT.DBUtility.DbHelperSQL.Query(sql);
            this.gvOtherZone.DataSource = ds;
            this.gvOtherZone.DataBind();
        }
        protected void btnZoneInfo_Click(object sender, EventArgs e)
        {
            this.mvZoneInfo.ActiveViewIndex = 0;
        }

        protected void btnZoneUrl_Click(object sender, EventArgs e)
        {
            this.mvZoneInfo.ActiveViewIndex = 1;
        }

        protected void btnOtherZone_Click(object sender, EventArgs e)
        {
            this.mvZoneInfo.ActiveViewIndex = 2;
        }

        protected void btnLatestOrder_Click(object sender, EventArgs e)
        {
            this.mvZoneInfo.ActiveViewIndex = 3;
        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {
            if(Convert.ToDateTime(this.txtStartDate.Text)<DateTime.Now)
            {
                HOT.Common.MessageBox.Show(this.Page,"日期不能早于当前日期");
            }
        }

        protected void btnStore_Click(object sender, EventArgs e)
        {
            HOT.Model.Store sModel = new HOT.Model.Store();
            HOT.BLL.Store sBLL = new HOT.BLL.Store();

            sModel.UserId = HOT.BLL.User.GetLoginUser();
            sModel.ZoneId = new Guid(this.Request.QueryString["ZoneId"]);
            sBLL.Add(sModel);
            HOT.Common.MessageBox.Show(this.Page,"收藏成功");
        }


    }
}
