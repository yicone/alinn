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
            if (!IsPostBack)
            {
                ShowInfo(guid);
            }
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
	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	string Title=this.txtTitle.Text;
	string Content=this.txtContent.Text;
	string Url=this.txtUrl.Text;
	string UrlText=this.txtUrlText.Text;
	int SizeId=int.Parse(this.rblSize.SelectedValue);
    string Img = this.labImgInfo.Text;


	HOT.Model.Ad model=new HOT.Model.Ad();
	model.Title=Title;
	model.Content=Content;
	model.Url=Url;
	model.UrlText=UrlText;
	model.SizeId=SizeId;
	model.AuditState=0;
    model.Img = Img;
	HOT.BLL.Ad bll=new HOT.BLL.Ad();
	bll.Update(model);
    //��ʾ��ӳɹ�������ת����һҳ��
    string name = Request.UrlReferrer.ToString();
    MessageBox.ShowAndRedirect(this.Page, "�޸ĳɹ�", name);
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
            this.rblSize.SelectedIndex = int.Parse(model.SizeId.ToString())-11;
            switch (model.AuditState)
            {
                case 0:
                    this.labAuditState.Text= "δ���״̬��";
                    break;
                case 1:
                    this.labAuditState.Text = "�����״̬��";
                    break;
                default:
                    this.labAuditState.Text = "δ֪״̬��";
                    break;
            }
            switch (model.IsText)
            { 
                case 0:
                    this.fuImg.Enabled = true;
                    this.btnUpload.Enabled = true;
                    break;
                default:
                    this.fuImg.Enabled = false;
                    this.btnUpload.Enabled = false;
                    break;
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (this.fuImg.FileContent != null)
            {
                string path = "~/Ad/uploadImages/";
                string datePath = DateTime.Now.ToString("yyyyMMdd");
                string type = fuImg.FileName.Substring(fuImg.FileName.LastIndexOf(".")).Trim().ToLower();
                if (HOT.Common.Picture.CheckValidExt(type))
                {
                    //�ж��ļ���С
                    int fileSize = 0;
                    fileSize = fuImg.PostedFile.ContentLength / 1024;
                    if (fileSize > 2048)
                    {
                        MessageBox.Show(this.Page, "�ļ�̫���ˣ�");
                        return;
                    }
                    else
                    {
                        Random ran = new Random();
                        string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(ran.Next(100001, 999999)) + type;
                        if (HOT.Common.Fill.CreateDirectory(path + datePath))
                        {
                            fuImg.SaveAs(HttpContext.Current.Server.MapPath(path + datePath + "/" + fileName));
                            MessageBox.Show(this.Page, "�ϴ��ɹ�");
                            this.labImgInfo.Text = datePath + "/" + fileName;
                        }
                    }
                }
            }
        }
    }
}
