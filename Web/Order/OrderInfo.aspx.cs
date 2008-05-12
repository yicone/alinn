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
            //ShowInfo(new Guid(Session["UserId"].ToString()));
            ShowInfo(new Guid("936DA01F-9ABD-4D9D-80C7-02AF85C822A7"));
        }
        private void ShowInfo(Guid UserId)
        {
            HOT.BLL.Order bll = new HOT.BLL.Order();
            HOT.Model.Order model = bll.GetModelByUserId(UserId);
            this.lblOrderName.Text = model.OrderName;
            this.lblUserId.Text = model.UserId.ToString();
            this.lblAdId.Text = model.AdId.ToString();
            this.lblZoneId.Text = model.ZoneId.ToString();
            this.lblStartDate.Text = model.StartDate.ToString();
            this.lblEndDate.Text = model.EndDate.ToString();
            this.lblAuditState.Text = model.AuditState.ToString();
            this.lblPerPoint.Text = model.PerPoint.ToString();
            this.lblEverydayPrice.Text = model.EverydayPrice.ToString();
            this.lblPrice.Text = model.Price.ToString();
            this.lblPayment.Text = model.Payment.ToString();
            this.lblCreateDate.Text = model.CreateDate.ToString();

        }
    }
}
