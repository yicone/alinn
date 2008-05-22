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
	/// 支付结果处理页面,根据回跳时的URL所带的参数取得支付结果。
	/// </summary>
	public class payresult : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label labResult;
		protected System.Web.UI.WebControls.Label labErrmsg;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
				//出于安全考虑,可以校验一下请求URL的机器是否为财付通服务器.

				string errmsg = "";

				Md5Pay md5pay = new Md5Pay();
				if(!md5pay.GetPayValueFromUrl(Request.QueryString,out errmsg))
				{
					labErrmsg.Text = Server.HtmlEncode(errmsg);
				}
				else
				{
					labResult.Text = md5pay.PayResultStr;

					if(md5pay.PayResult == Md5Pay.PAYERROR)
					{
						labResult.Text += md5pay.PayErrMsg;
					}

					//在这里可以根据支付结果进行相应的处理,比如更新订单为成功或失败.
					if(md5pay.PayResult == Md5Pay.PAYOK)
					{
						//支付成功,在这里处理你的逻辑

					}
					else
					{
						//支付失败,不要按支付成功处理
						Response.Write("非法操作!");
					}
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
