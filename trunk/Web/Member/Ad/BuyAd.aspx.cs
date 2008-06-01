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

namespace Web.Ad
{
    public partial class BuyAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
            Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
            Guid userId = HOT.BLL.User.GetLoginUser();
            HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            ds = adgBLL.GetList(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex, 1, userId);
            AspNetPager1.RecordCount = int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString());
            dlAdGroupDataBind(userId);
            }
        }
        protected void lbtnAddGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Member/Ad/NewGroup.aspx");
        }

        private void dlAdGroupDataBind(Guid UserId)
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            ds = adgBLL.GetList(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex, 0, UserId);
            this.dlAdGroup.DataSource = ds;
            this.dlAdGroup.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            Guid userId = HOT.BLL.User.GetLoginUser();
            dlAdGroupDataBind(userId);
        }

        protected void dlAdGroup_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label labClassName = (Label)(e.Item.FindControl("labClassName"));
                HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                int classid=int.Parse(rowv["Class"].ToString());

                HOT.BLL.ZoneClass zBLL = new HOT.BLL.ZoneClass();
                HOT.Model.ZoneClass zModel = new HOT.Model.ZoneClass();
                HOT.Model.ZoneClass zParentModel = new HOT.Model.ZoneClass();
                zModel = zBLL.GetModel(classid);
                zParentModel = zBLL.GetModel(zModel.ClassId);
                labClassName.Text = zModel.ClassName+" > "+zParentModel.ClassName;
            }
        }

        protected void dlAdGroup_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Guid adGroupId = new Guid(dlAdGroup.DataKeys[e.Item.ItemIndex].ToString());
            Session["tempAdGroupId"] = adGroupId;
            if (e.CommandName=="Buy")
            {
                Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
                HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
                HOT.Model.Zone zModel=new HOT.Model.Zone();
                zModel = zBLL.GetModel(zoneId);
                DataSet ds = new DataSet();
                HOT.BLL.Ad aBLL=new HOT.BLL.Ad();
                if (aBLL.Exists(zModel.SizeId, adGroupId))//如果存在相同大小的广告
                {
                    HOT.BLL.Order oBLL = new HOT.BLL.Order();
                    HOT.Model.Order oModel = new HOT.Model.Order();
                    //取得相同大小广告的Model edited by fzf 20080514
                    HOT.Model.Ad aModel = new HOT.Model.Ad();
                    aModel = aBLL.GetModel(" AdGroupId=" + adGroupId.ToString() + " And SizeId=" + zModel.SiteId.ToString() + " And IsText=0");
                    //end
                    oModel.AdId = aModel.AdId;//不对，不是对应adGroupId,
                    int week =int.Parse(this.Request.QueryString["Week"]);//需要传入值
                    oModel.AuditState = CheckAuditState(zModel.ZoneId);
                    oModel.StartDate = Convert.ToDateTime(this.Request.QueryString["StartDate"]);//要传入值
                    oModel.EndDate = Convert.ToDateTime(this.Request.QueryString["StartDate"]).AddDays(Convert.ToDouble(week*7));//要传入值
                    oModel.OrderName = DateTime.Now.Date.ToString("yyyyMMddhhmmss") + "_" + zModel.ZoneName;
                    oModel.ZoneId = zoneId;

                    oModel.Price = zModel.WeekPrice * week;
                    oModel.UserId = HOT.BLL.User.GetLoginUser();
                    oBLL.Add(oModel);
                }
                else
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ConfirmScript", "var question=confirm('您所选的广告组里没有符合此广告位大小的广告，点“确定”系统将自动显示文字广告，\\n点取消可以选择其它的广告组或者在本广告组里添加新的广告位');if(question != '0'){addAd();}", true);
                }
            }
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        protected int CheckAuditState(Guid guid)
        {
            int checkAuditState=0;
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(guid);
            switch (zModel.NeedAuditing)
            { 
                case 0:
                    checkAuditState=1;
                    break;
                case 1:
                    checkAuditState = 0;
                    break;
            }
            return checkAuditState;

        }
        protected void btnAddTextAd_Click(object sender, EventArgs e)
        {
            HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
            HOT.Model.Ad adModel = new HOT.Model.Ad();
            if (Session["tempAdGroupId"] != null)
            {
                adModel = adBLL.GetModel("AdGroupId='" + Session["tempAdGroupId"].ToString() + "' and istext=1");
                //判断广告组下是否有文字广告
                if (adModel == null)
                {
                    MessageBox.ShowAndRedirect(this.Page, "此广告组下没有文字广告！请添加文件广告", "/Member/Ad/NewAd.aspx?AdGroupId=" + Session["tempAdGroupId"].ToString());
                }
                else
                {
                    HOT.BLL.Order oBLL = new HOT.BLL.Order();
                    HOT.Model.Order oModel = new HOT.Model.Order();
                    oModel.AdId = adModel.AdId;
                    int week = int.Parse(this.Request.QueryString["Week"]);//需要传入值
                    oModel.StartDate = Convert.ToDateTime(this.Request.QueryString["StartDate"]);//要传入值
                    oModel.EndDate = Convert.ToDateTime(this.Request.QueryString["StartDate"]).AddDays(Convert.ToDouble(week * 7));

                    Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
                    HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
                    HOT.Model.Zone zModel = new HOT.Model.Zone();
                    zModel = zBLL.GetModel(zoneId);
                    oModel.AuditState = CheckAuditState(zModel.ZoneId);
                    oModel.OrderName = DateTime.Now.Date.ToString("yyyyMMddhhmmss") + "_" + zModel.ZoneName;
                    oModel.ZoneId = zoneId;

                    oModel.Price = zModel.WeekPrice * week;
                    oModel.UserId = HOT.BLL.User.GetLoginUser();//需要传入值
                    oBLL.Add(oModel);
                    oModel = null;
                    oModel = oBLL.GetModelByUserId(HOT.BLL.User.GetLoginUser());
                    //Session["OrderIdBeShow"] = oModel.OrderId;
                    Response.Redirect("/Member/Order/OrderInfo.aspx?OrderId=" + oModel.OrderId.ToString());
                }
            }
            else
            {
                Response.Write("<script>alert('操作超时！');history.go(-1);</script>");
            }
        }
        
    }
}
