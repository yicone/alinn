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
	/// ��ҳ�����֧������,��ָ��֧���ɹ���Ļ�����ַ������֧�������
	/// </summary>
	public class md5_pay : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label labErrmsg;

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["OrderId"] == null)
            {
                HOT.Common.MessageBox.Show(this, "������ʱ���߲������ݶ�ʧ��");
            }
            else
            {
                HOT.BLL.Order oBLL = new HOT.BLL.Order();
                HOT.Model.Order oModel = new HOT.Model.Order();
                oModel = oBLL.GetModel(new Guid(Session["OrderId"].ToString()));
                //���մ����Ƹ�ͨ���ص��̻������Ĳ���
                Md5Pay md5pay = new Md5Pay();

                //��Ʒ����
                md5pay.Desc = oModel.OrderName;

                //֧������
                md5pay.Date = DateTime.Now.ToString("yyyyMMdd");

                //�̻�������
                md5pay.Sp_billno = (long)oModel.PayId;

                //�ܽ��,�Է�Ϊ��λ.
                md5pay.Total_fee = (long)oModel.Price*100;

                //���׵���ע
                md5pay.Attach = "test";


                string url = ConfigurationManager.AppSettings["paygateurl"];
                if (!md5pay.GetPayUrl(out url))
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
