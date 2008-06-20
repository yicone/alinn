using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Configuration;

namespace tenpaymd5
{
	/// <summary>
	/// 本页面完成支付请求,并指定支付成功后的回跳地址来处理支付结果。
	/// </summary>
	public class md5_pay : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label labErrmsg;

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["OrderId"] == null)
            {
                HOT.Common.MessageBox.Show(this, "操作超时或者部分数据丢失！");
            }
            else
            {
                HOT.BLL.Order oBLL = new HOT.BLL.Order();
                HOT.Model.Order oModel = new HOT.Model.Order();
                oModel = oBLL.GetModel(new Guid(Session["OrderId"].ToString()));
                //接收传给财付通网关的商户订单的参数
                Md5Pay md5pay = new Md5Pay();

                //商品名称
                md5pay.Desc = oModel.OrderName;

                //支付日期
                md5pay.Date = DateTime.Now.ToString("yyyyMMdd");

                //商户订单号
                md5pay.Sp_billno = (long)oModel.PayId;

                //总金额,以分为单位.
                md5pay.Total_fee = (long)oModel.Price*100;

                //交易单备注
                md5pay.Attach = "test";


                string url = ConfigurationManager.AppSettings["paygateurl"];
                if (!md5pay.GetPayUrl(out url))
                {
                    labErrmsg.Text = Server.HtmlEncode(url);
                }
                else
                {
                    /*在这里可以把
                     * 交易单号			md5pay.Transaction_id
                     * 商户订单号		md5pay.Sp_billno
                     * 订单金额			md5pay.Total_fee
                     * 等信息记入数据库.
                     * */

                    Response.Redirect(url);
                }
            }
        }

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	}
}
