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

namespace Web.Order
{
    public partial class OrderInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //ShowInfo(new Guid(Session["UserId"].ToString()));
                ShowInfo(new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7"));
            }
        }
        private void ShowInfo(Guid UserId)
        {
            HOT.BLL.Order bll = new HOT.BLL.Order();
            HOT.Model.Order model = bll.GetModelByUserId(UserId);
            this.lblOrderName.Text = model.OrderName;
            Session["OrderName"] = model.OrderName;
            this.lblStartDate.Text = model.StartDate.ToString();
            this.lblEndDate.Text = model.EndDate.ToString();
            this.lblAuditState.Text =ShowCheck(model.AuditState);
            this.lblPerPoint.Text = model.PerPoint.ToString();
            this.lblEverydayPrice.Text = model.EverydayPrice.ToString();
            this.lblPrice.Text = model.Price.ToString();
            this.lblPayment.Text=ShowPayMent(model.Payment);
            this.lblCreateDate.Text = model.CreateDate.ToString();

            HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
            HOT.Model.Ad adModel = new HOT.Model.Ad();
            adModel = adBLL.GetModel(model.AdId);
            this.lblAdTitle.Text = adModel.Title;

            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            HOT.Model.Zone zModel = new HOT.Model.Zone();
            zModel = zBLL.GetModel(model.ZoneId);
            this.lblZoneName.Text = zModel.ZoneName;
        }
        private string ShowCheck(int? i)
        {
            string check = "";
            switch (i)
            { 
                case 0:
                    check = "未审核";
                    break;
                case 1:
                    check = "审核通过";
                    break;
                default:
                    check = "未知状态";
                    break;
            }
            return check;
        }
        private string ShowPayMent(int? i)
        {
            string payMent = "";
            switch (i)
            { 
                case 0:
                    payMent = "未付款";
                    break;
                case 1:
                    payMent = "已经付款";
                    break;
                default:
                    payMent = "未知状态";
                    break;
            }
            return payMent;
        }
    }
}
