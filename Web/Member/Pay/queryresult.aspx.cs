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

namespace tenpaymd5
{
	/// <summary>
	/// 查询结果处理页面。
	/// </summary>
	public class queryresult : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label labTransid;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label labBillno;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label labTotalFee;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label labAttach;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label labResult;
		protected System.Web.UI.WebControls.Label labErrmsg;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
                string errmsg = "";
				//出于安全考虑,可以校验一下请求URL的机器是否为财付通服务器.
                if (Request.Url.AbsolutePath == "")
                {


                    Md5Pay md5pay = new Md5Pay();
                    if (!md5pay.GetQueryValueFromUrl(Request.QueryString, out errmsg))
                    {
                        labErrmsg.Text = Server.HtmlEncode(errmsg);
                    }
                    else
                    {
                        labTransid.Text = md5pay.Transaction_id;
                        labAttach.Text = Server.HtmlEncode(md5pay.Attach);
                        labBillno.Text = md5pay.Sp_billno.ToString();
                        labTotalFee.Text = md5pay.Total_fee.ToString();//总金额,以分为单位.
                        labResult.Text = md5pay.PayResultStr;

                        if (md5pay.PayResult == Md5Pay.PAYERROR)
                        {
                            labResult.Text += md5pay.PayErrMsg;
                        }

                        //在这里可以根据支付结果进行相应的处理,比如更新订单为成功或失败.
                    }
                }
                else
                {
                    labResult.Text = "传入地址错误";
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
