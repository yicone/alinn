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
    public partial class EditeAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid guid = new Guid(this.Request.QueryString["AdId"].ToString());
            ShowInfo(guid);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

  /*�޸Ĵ���-�ύ���� */

	string strErr="";
	if(this.txtTitle.Text =="")
	{
		strErr+="Title����Ϊ�գ�\\n";	
	}
	if(this.txtContent.Text =="")
	{
		strErr+="Content����Ϊ�գ�\\n";	
	}
	if(this.txtUrl.Text =="")
	{
		strErr+="Url����Ϊ�գ�\\n";	
	}
	if(this.txtUrlText.Text =="")
	{
		strErr+="UrlText����Ϊ�գ�\\n";	
	}
    //if(!PageValidate.IsNumber(txtSizeId.Text))
    //{
    //    strErr+="SizeId�������֣�\\n";	
    //}
	if(!PageValidate.IsNumber(txtAuditState.Text))
	{
		strErr+="AuditState�������֣�\\n";	
	}
	if(this.txtImg.Text =="")
	{
		strErr+="Img����Ϊ�գ�\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	string Title=this.txtTitle.Text;
	string Content=this.txtContent.Text;
	string Url=this.txtUrl.Text;
	string UrlText=this.txtUrlText.Text;
	int SizeId=int.Parse(this.txtSizeId.Text);
	int AuditState=int.Parse(this.txtAuditState.Text);
	string Img=this.txtImg.Text;


	HOT.Model.Ad model=new HOT.Model.Ad();
	model.Title=Title;
	model.Content=Content;
	model.Url=Url;
	model.UrlText=UrlText;
	model.SizeId=SizeId;
	model.AuditState=AuditState;
	model.Img=Img;
	HOT.BLL.Ad bll=new HOT.BLL.Ad();
	bll.Update(model);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
        private void ShowInfo(Guid AdId)
        {
            HOT.BLL.Ad bll = new HOT.BLL.Ad();
            HOT.Model.Ad model = bll.GetModel(AdId);
            this.txtTitle.Text = model.Title;
            this.txtContent.Text = model.Content;
            this.txtUrl.Text = model.Url;
            this.txtUrlText.Text = model.UrlText;
            this.txtSizeId.Text = model.SizeId.ToString();
            if (model.AuditState == 0)
            { this.labAuditState.Text = "δ���״̬��"; }
            if (model.AuditState == 1)
            { this.labAuditState.Text = "�����״̬��"; }
            else
            { this.labAuditState.Text = "δ֪״̬��"; }
            this.txtImg.Text = model.Img;

        }
    }
}
