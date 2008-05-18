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
	/// ��ҳ�����֧������,��ָ��֧���ɹ���Ļ�����ַ������֧�������
	/// </summary>
	public class md5_pay : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label labErrmsg;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			//���մ����Ƹ�ͨ���ص��̻������Ĳ���
			Md5Pay md5pay = new Md5Pay();

			//��Ʒ����
			md5pay.Desc ="��ƷQQ";
			
			//֧������
			md5pay.Date = DateTime.Now.ToString("yyyyMMdd");			
			
			//�̻�������
			md5pay.Sp_billno =123456789;
			
			//�ܽ��,�Է�Ϊ��λ.
			md5pay.Total_fee =1;
			
			//���׵���ע
			md5pay.Attach = "test";
			

			string url = "";
			if(!md5pay.GetPayUrl(out url))
			{
				labErrmsg.Text = Server.HtmlEncode(url);
			}
			else
			{
				/*��������԰�
				 * ���׵���			md5pay.Transaction_id
				 * �̻�������		md5pay.Sp_billno
				 * �������			md5pay.Total_fee
				 * ����Ϣ�������ݿ�.
				 * */

				Response.Redirect(url);
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
