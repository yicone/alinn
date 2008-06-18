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

using System.Data.SqlClient;

namespace Web.Admin.Zone
{
    public partial class ManageZone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void gv_Zone_SelectedIndexChanged(object sender, EventArgs e)
        {
            Guid zoneId = new Guid(this.gv_Zone.SelectedRow.Cells[0].Text.ToString());
            Session["CheckZoneId"] = zoneId;
            this.MultiView1.ActiveViewIndex = 1;
            //取得广告位的详细信息
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(zoneId);
            this.labZoneName.Text = zModel.ZoneName;
            this.rblSize.SelectedIndex = int.Parse(zModel.SizeId.ToString());
            this.rblMediaType.SelectedIndex = getSelectedIndex(zModel.MediaType);
            this.rblInFirst.SelectedIndex =int.Parse( zModel.InFirst.ToString());
            this.rblTransType.SelectedIndex = getSelectedIndex(zModel.TransType);
            this.labZoneState.Text = checkText(zModel.ZoneState);
            //取得分类
            this.labClasses.Text=getClasses(HOT.Common.Strings.SplitString(zModel.ClassIds.ToString(),","));
            this.labNeedCheck.Text = needCheck(zModel.NeedAuditing);
            this.labKeyWords.Text = zModel.Keywords;
            this.labDescription.Text = zModel.Description;
            this.labWeekPrice.Text = zModel.WeekPrice.ToString();
            //取得广告位投放网址并显示
            gvUrlsDateBind(zoneId);
        }
        protected int getSelectedIndex(int? id)
        {
            int selectedId=0;
            switch (id)
            { 
                case 2:
                    selectedId = 0;
                    break;
                case 5:
                    selectedId = 1;
                    break;
            }
            return selectedId;
        }
        protected string checkText(int? check)
        {
            string text = "";
            switch (check)
            { 
                case 0:
                    text = "未审核";
                    break;
                case 1:
                    text = "审核通过";
                    break;
                default:
                    text = "未知状态";
                    break;
            }
            return text;
        }
        protected string needCheck(int? needcheck)
        {
            string text = "";
            switch (needcheck)
            {
                case 0:
                    text = "无需审核";
                    break;
                case 1:
                    text = "需要审核";
                    break;
                default:
                    text = "未知状态";
                    break;
            }
            return text;
        }
        protected string getClasses(string[] classes)
        {
            string classtext = "";
            for (int i = 0; i < classes.Length; i++)
            {
                HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
                HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
                int? id = int.Parse(classes[i]);
                
                zcModel = zcBLL.GetModel(id);
                if (zcModel.ParentId == 0)
                {
                    classtext = zcModel.ClassName;
                }
                else
                {
                    string temp = zcModel.ClassName;
                    zcModel = zcBLL.GetModel(zcModel.ParentId);
                    classtext = zcModel.ClassName + ">>" + temp;
                }
                classtext += ";";
            }
            return classtext;
        }
        /// <summary>
        /// 审核通过
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (Session["CheckZoneId"] != null)
            {
                string sql = "update AL_Zone set ZoneState=2 where ZoneId='" + Session["CheckZoneId"].ToString()+"'";
                HOT.DBUtility.DbHelperSQL.ExecuteSql(sql);
                Session["CheckZoneId"] = null;
                HOT.BLL.Zone zBLL=new HOT.BLL.Zone();
                Response.Write("<script>alert('操作成功');location='ManageZone.aspx';</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('操作超时');history.go(-2);</script>");
            }
        }
        protected DataSet GetUrls(Guid zoneId)
        {
            HOT.BLL.ZoneLocation zlBLL = new HOT.BLL.ZoneLocation();
            DataSet ds = new DataSet();
            ds = zlBLL.GetList("AL_ZoneLocation.ZoneId='" + zoneId.ToString()+"'");
            return ds;
        }
        protected void gvUrlsDateBind(Guid zoneId)
        {
            this.gv_Urls.DataSource = GetUrls(zoneId);
            this.gv_Urls.DataBind();
        }

        protected void gv_Urls_SelectedIndexChanged(object sender, EventArgs e)
        {
            string url=this.gv_Urls.SelectedRow.Cells[0].Text.ToString();
            url = "www.51aspx.com";
           Response.Redirect("../GetPic/Snap.aspx?url=" + url);
        }
    }
}
