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
            Guid userId = new Guid(Session["UserId"].ToString());
            HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            ds = adgBLL.GetList(AspNetPager1.StartRecordIndex, AspNetPager1.EndRecordIndex, 1, userId);
            AspNetPager1.RecordCount = int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString());
            dlAdGroupDataBind(userId);
            }
        }
        protected void lbtnAddGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewGroup.aspx");
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
            Guid userId = new Guid(Session["UserId"].ToString());
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
                if (aBLL.Exists(zModel.SizeId, adGroupId))//���������ͬ��С�Ĺ��
                {
                    HOT.BLL.Order oBLL = new HOT.BLL.Order();
                    HOT.Model.Order oModel = new HOT.Model.Order();
                    //ȡ����ͬ��С����Model edited by fzf 20080514
                    HOT.Model.Ad aModel = new HOT.Model.Ad();
                    aModel = aBLL.GetModel(" AdGroupId=" + adGroupId.ToString() + " And SizeId=" + zModel.SiteId.ToString() + " And IsText=0");
                    //end
                    oModel.AdId = aModel.AdId;//���ԣ����Ƕ�ӦadGroupId,

                    oModel.AuditState = CheckAuditState(zModel.ZoneId);
                    oModel.StartDate = Convert.ToDateTime("2008-05-01");//Ҫ����ֵ
                    oModel.EndDate = Convert.ToDateTime("2008-05-07");//Ҫ����ֵ
                    oModel.OrderName = DateTime.Now.Date.ToString() + "_" + zModel.ZoneName;
                    oModel.ZoneId = zoneId;
                    int week = 1;//��Ҫ����ֵ
                    oModel.Price = zModel.WeekPrice * week;
                    oModel.UserId = new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7");//��Ҫ����ֵ
                    oBLL.Add(oModel);
                }
                else
                {

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ConfirmScript", "var question=confirm('����ѡ�Ĺ������û�з��ϴ˹��λ��С�Ĺ�棬�㡰ȷ����ϵͳ���Զ���ʾ���ֹ�棬\\n��ȡ������ѡ�������Ĺ��������ڱ������������µĹ��λ');if(question != '0'){addAd();}", true);
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
                //�жϹ�������Ƿ������ֹ��
                if (adModel == null)
                {
                    MessageBox.ShowAndRedirect(this.Page, "�˹������û�����ֹ�棡������ļ����", "NewAd.aspx?AdGroupId=" + Session["tempAdGroupId"].ToString());
                }
                else
                {
                    HOT.BLL.Order oBLL = new HOT.BLL.Order();
                    HOT.Model.Order oModel = new HOT.Model.Order();
                    oModel.AdId = adModel.AdId;
                    
                    oModel.StartDate = Convert.ToDateTime("2008-05-01");//Ҫ����ֵ
                    oModel.EndDate = Convert.ToDateTime("2008-05-07");//Ҫ����ֵ

                    Guid zoneId = new Guid(this.Request.QueryString["ZoneId"].ToString());
                    HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
                    HOT.Model.Zone zModel = new HOT.Model.Zone();
                    zModel = zBLL.GetModel(zoneId);
                    oModel.AuditState = CheckAuditState(zModel.ZoneId);
                    oModel.OrderName = DateTime.Now.Date.ToString() + "_" + zModel.ZoneName;
                    oModel.ZoneId = zoneId;
                    int week = 1;//��Ҫ����ֵ
                    oModel.Price = zModel.WeekPrice * week;
                    oModel.UserId = new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7");//��Ҫ����ֵ
                    oBLL.Add(oModel);
                    oModel = null;
                    oModel = oBLL.GetModelByUserId(new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7"));
                    //Session["OrderIdBeShow"] = oModel.OrderId;
                    Response.Redirect("../Order/OrderInfo.aspx?OrderId="+oModel.OrderId.ToString());
                }
            }
            else
            {
                Response.Write("<script>alert('������ʱ��');history.go(-1);</script>");
            }
        }
    }
}
