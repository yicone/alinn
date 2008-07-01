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

using System.Xml;

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
                //ShowZoneInfo(zoneId);
                //dlSiteOwerInfoDataBind();
                //dlSiteInfoDataBind();
                showInfo();
                gvOtherZone.DataBind();
                  HOT.BLL.Zone zBLL=new HOT.BLL.Zone();
                  HOT.Model.Zone zModel=new HOT.Model.Zone();
                  zModel=zBLL.GetModel(zoneId);
                  HOT.BLL.Site sBLL=new HOT.BLL.Site();
                  HOT.Model.Site sModel=new HOT.Model.Site();
                  sModel=sBLL.GetModel(zModel.SiteId);
                  this.labAlexa.Text = "Alexa" + GetAlexaInfo("www.hotbook.cn");
                  dlMessageDateBind(zoneId);
            }
            }

        }

        protected void btnBuyAd_Click(object sender, EventArgs e)
        {
            Guid guid = new Guid(this.Request.QueryString["ZoneId"].ToString());
            //Response.Redirect("/Member/Ad/BuyAd.aspx?ZoneId=" + guid.ToString() + "&StartDate=" + this.txtStartDate.Text + "&Week=" + this.ddlWeek.SelectedValue);
        }
        //protected void ShowZoneInfo(Guid zoneId)
        //{
        //    HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
        //    HOT.Model.Zone zModel = new HOT.Model.Zone();
        //    zModel = zBLL.GetModel(zoneId);
        //    this.labZoneName.Text = zModel.ZoneName;
        //    this.labWeekPrice.Text = zModel.WeekPrice.ToString();
        //    HOT.BLL.Site sBLL=new HOT.BLL.Site();
        //    HOT.Model.Site sModel=new HOT.Model.Site();
        //    sModel=sBLL.GetModel(zModel.SiteId);
        //    //this.labSiteName.Text = sModel.SiteName;
        //    //this.labZoneName1.Text = zModel.ZoneName;
        //    //this.labInfirst1.Text = this.labInfirst.Text;
        //}
        //protected void dlSiteOwerInfoDataBind()
        //{
        //    string sql = "";
        //    sql = "select AL_User.NickName,AL_User.RegTime,AL_User.QQ from AL_Zone left join AL_User on AL_Zone.UserId=AL_User.UserId  where AL_Zone.ZoneId='" + this.Request.QueryString["ZoneId"].ToString()+"'";
        //    DataSet ds = HOT.DBUtility.DbHelperSQL.Query(sql);
        //    this.dlSiteOwerInfo.DataSource = ds;
        //    this.dlSiteOwerInfo.DataBind();
        //}
        //protected void dlSiteInfoDataBind()
        //{
        //    string sql = "";
        //    sql = "select AL_ZonePic.ZonePic,AL_Site.SiteName,AL_Site.SiteUrl,AL_Zone.ZoneName,AL_Zone.SizeId,AL_Zone.MediaType,AL_Zone.Infirst from AL_Zone left join AL_ZonePic on AL_ZonePic.ZoneId=AL_Zone.ZoneId left join AL_Site on AL_Site.SiteId=AL_Zone.SiteId where  AL_Zone.ZoneId='" + this.Request.QueryString["ZoneId"].ToString() + "'";
        //    DataSet ds = HOT.DBUtility.DbHelperSQL.Query(sql);
        //    this.dlSiteInfo.DataSource = ds;
        //    this.dlSiteInfo.DataBind();
        //}
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
                this.labIn.Text = "不在首页";
            }
            else
            {
                this.labInfirst.Text = "在首页";
                this.labIn.Text = "在首页";
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
            //广告位相关信息
            this.labZoneName.Text = zModel.ZoneName;
            this.labZoneName1.Text = zModel.ZoneName;
            HOT.BLL.ZoneSize zsBLL = new HOT.BLL.ZoneSize();
            HOT.Model.ZoneSize zsModel = new HOT.Model.ZoneSize();
            zsModel = zsBLL.GetModel(zModel.SizeId);
            this.labZoneSize.Text = zsModel.SizeCode;
            //得到网站的相关信息
            HOT.BLL.Site sBLL=new HOT.BLL.Site();
            HOT.Model.Site sModel=new HOT.Model.Site();
            sModel=sBLL.GetModel(zModel.SiteId);
            this.labSiteName.Text = sModel.SiteName;
            //得到网站主相关信息
            HOT.BLL.User uBLL = new HOT.BLL.User();
            HOT.Model.User uModel = new HOT.Model.User();
            uModel = uBLL.GetUser(zModel.UserId);
            this.labSiteOwner.Text = uModel.NickName;
            this.labRegTime.Text = uModel.RegTime.ToString();
            this.labConnect.Text = @"<a href='tencent://message/?uin="+uModel.QQ+"&Site="+sModel.SiteName+@"&Menu=yes'
                                                    target='blank'>
                                                    <img src='http://wpa.qq.com/pa?p=1:1363036:7' alt='联系我吧？'></a>";
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

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {
            //if(Convert.ToDateTime(this.txtStartDate.Text)<DateTime.Now)
            //{
            //    HOT.Common.MessageBox.Show(this.Page,"日期不能早于当前日期");
            //}
        }

        private string GetAlexaInfo(string url)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            XmlReader reader;
            reader = XmlReader.Create("http://data.alexa.com/data/?cli=10&dat=snba&ver=7.0&url=" + url);
            XmlDocument doc = new XmlDocument();
            XmlNode node;
            doc.Load(reader);
            node = doc.SelectSingleNode("/ALEXA/SD/POPULARITY");
            if (node != null)
            {
                sb.Append("世界排名："+node.Attributes[1].Value.ToString());
            }
            else
            {
                reader.Close();
            }
            node = doc.SelectSingleNode("/ALEXA/SD/REACH");
            if (node != null)
            {
                sb.Append("<br/>下期排名：" + node.Attributes[0].Value.ToString());
            }
            else
            {
                reader.Close();
            }
            return sb.ToString();
        }

        protected void btnStoreZone_Click(object sender, ImageClickEventArgs e)
        {
            HOT.Model.Store sModel = new HOT.Model.Store();
            HOT.BLL.Store sBLL = new HOT.BLL.Store();

            sModel.UserId = HOT.BLL.User.GetLoginUser();
            sModel.ZoneId = new Guid(this.Request.QueryString["ZoneId"]);
            sBLL.Add(sModel);
            HOT.Common.MessageBox.Show(this.Page, "收藏成功");
        }

        protected void ibtnAddMessage_Click(object sender, ImageClickEventArgs e)
        {
            HOT.BLL.Message mBLL = new HOT.BLL.Message();
            HOT.Model.Message mModel = new HOT.Model.Message();
            mModel.Title = this.textTitle.Text;
            mModel.MessageContent = this.textMessageContent.Text;
            mBLL.Add(mModel);
            HOT.Common.MessageBox.Show(this.Page, "留言成功");
        }
        protected void dlMessageDateBind(Guid zoneId)
        {
            HOT.BLL.Message mBLL = new HOT.BLL.Message();
            DataSet ds = new DataSet();
            ds = mBLL.GetList(" AL_Message.ZoneId='" + zoneId.ToString() + "'");
            this.dlMessage.DataSource = ds;
            this.dlMessage.DataBind();
        }
    }
}
