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
        Guid temp = new Guid();
        Guid tempadGroupId = new Guid();
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
            Guid userId = new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7");
            HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            ds = adgBLL.GetList(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex, 1, userId.ToString());
            AspNetPager1.RecordCount = int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString());

                temp = userId; 
            if (!Page.IsPostBack)
            {
                dlAdGroupDataBind(userId.ToString());
            }
        }
        protected void lbtnAddGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewGroup.aspx");
        }

        private void dlAdGroupDataBind(string userId)
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            ds = adgBLL.GetList(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex,0,userId);
            this.dlAdGroup.DataSource = ds;
            this.dlAdGroup.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            dlAdGroupDataBind(temp.ToString());
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
                    oModel.AdId = adGroupId;//不对，不是对应adGroupId,
                    oModel.AuditState = 0;
                    oModel.StartDate = Convert.ToDateTime("2008-05-01");//要传入值
                    oModel.EndDate = Convert.ToDateTime("2008-05-07");//要传入值
                    oModel.OrderName = DateTime.Now.Date.ToString() + "_" + zModel.ZoneName;
                    oModel.ZoneId = zoneId;
                    int week = 1;//需要传入值
                    oModel.Price = zModel.WeekPrice * week;
                    oModel.UserId = temp;//需要传入值
                    oBLL.Add(oModel);
                }
                else
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ConfirmScript", "var question=confirm('您所选的广告组里没有符合此广告位大小的广告，点“确定”系统将自动显示文字广告，\\n点取消可以选择其它的广告组或者在本广告组里添加新的广告位');if(question != '0'){addAd();}", true);
                }
            }
        }

        protected void btnAddTextAd_Click(object sender, EventArgs e)
        {
            HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
            HOT.Model.Ad adModel = new HOT.Model.Ad();
            adModel = adBLL.GetModel("AdGroupId='"+tempadGroupId.ToString()+"' and istext=1");
            //判断广告组下是否有文字广告
            if (adModel==null)
            {
                MessageBox.ShowAndRedirect(this.Page, "此广告组下没有文字广告！请添加文件广告", "NewAd.aspx?AdGroupId=" + tempadGroupId.ToString());
            }
            else
            {
                HOT.BLL.Order oBLL = new HOT.BLL.Order();
                HOT.Model.Order oModel = new HOT.Model.Order();
                oModel.AdId = adModel.AdId;
                oModel.AuditState = 0;
                oModel.StartDate = Convert.ToDateTime("2008-05-01");//要传入值
                oModel.EndDate = Convert.ToDateTime("2008-05-07");//要传入值

                Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
                HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
                HOT.Model.Zone zModel = new HOT.Model.Zone();
                zModel = zBLL.GetModel(zoneId);
                oModel.OrderName = DateTime.Now.Date.ToString() + "_" + zModel.ZoneName;
                oModel.ZoneId = zoneId;
                int week = 1;//需要传入值
                oModel.Price = zModel.WeekPrice * week;
                oModel.UserId = temp;//需要传入值
                oBLL.Add(oModel);
                Response.Redirect("../Order/OrderInfo.aspx");
            }
        }
    }
}
