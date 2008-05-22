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
	/// ֧���������ҳ��,���ݻ���ʱ��URL�����Ĳ���ȡ��֧�������
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
				//���ڰ�ȫ����,����У��һ������URL�Ļ����Ƿ�Ϊ�Ƹ�ͨ������.

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

					//��������Ը���֧�����������Ӧ�Ĵ���,������¶���Ϊ�ɹ���ʧ��.
					if(md5pay.PayResult == Md5Pay.PAYOK)
					{
						//֧���ɹ�,�����ﴦ������߼�

					}
					else
					{
						//֧��ʧ��,��Ҫ��֧���ɹ�����
						Response.Write("�Ƿ�����!");
					}
				}
			}
		}

		#region Web ������������ɵĴ���
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: �õ����� ASP.NET Web ���������������ġ�
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	}
}
