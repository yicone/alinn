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

namespace Web.User
{
    public partial class NewAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                //if (Request.UrlReferrer != null)  //
                //{
                //    ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
                //    //string str = this.Request.Url.AbsolutePath.ToString();
                //}
            //}

            if (this.rblAdType.SelectedValue == "1")
            {
                this.fuImg.Enabled = false;
                this.btnUpload.Enabled = false;
            }
            else
            {
                this.fuImg.Enabled = true;
                this.btnUpload.Enabled = true;           
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            if (this.txtTitle.Text == "")
            {
                strErr += "Title����Ϊ�գ�\\n";
            }
            if (this.txtContent.Text == "")
            {
                strErr += "Content����Ϊ�գ�\\n";
            }
            if (this.txtUrl.Text == "")
            {
                strErr += "Url����Ϊ�գ�\\n";
            }
            if (this.txtUrlText.Text == "")
            {
                strErr += "UrlText����Ϊ�գ�\\n";
            }

            if (strErr != "")
            {
                MessageBox.Show(this, strErr);
                return;
            }
            string Title = this.txtTitle.Text;
            string Content = this.txtContent.Text;
            string Url = this.txtUrl.Text;
            string UrlText = this.txtUrlText.Text;


            HOT.Model.Ad model = new HOT.Model.Ad();
            model.AdGroupId = new Guid(this.Request.QueryString["AdGroupId"].ToString());
            model.Title = Title;
            model.Content = Content;
            model.Url = Url;
            model.UrlText = UrlText;
            if (this.rblAdType.SelectedValue == "1")
            {
                model.Img = null;
                model.IsText = 1;
            }
            else
            {
                model.Img = this.labImgInfo.Text;
                model.IsText = 0;
            }
            model.SizeId = int.Parse(this.rblSize.SelectedValue);
            HOT.BLL.Ad bll = new HOT.BLL.Ad();
            bll.Add(model);
            //��ʾ��ӳɹ�������ת����һҳ��
            string name = Request.UrlReferrer.ToString();
            Response.Write("<script>alert('����¹��ɹ�');location='ManageAdGroup.aspx';</script>");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (this.fuImg.FileContent != null)
            {
                string path = "~/Ad/uploadImages/";
                string datePath=DateTime.Now.ToString("yyyyMMdd");
                string type = fuImg.FileName.Substring(fuImg.FileName.LastIndexOf(".")).Trim().ToLower() ;
                if (HOT.Common.Picture.CheckValidExt(type))
                {
                    //�ж��ļ���С
                    int fileSize = 0;
                    fileSize = fuImg.PostedFile.ContentLength / 1024;
                    if (fileSize > 2048)
                    {
                        MessageBox.Show(this.Page,"�ļ�̫���ˣ�");
                        return;
                    }
                    else
                    {
                        Random ran = new Random();
                        string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(ran.Next(100001, 999999)) + type;
                        if (HOT.Common.Fill.CreateDirectory(path+datePath))
                        {
                            fuImg.SaveAs(HttpContext.Current.Server.MapPath(path+datePath +"/"+ fileName));
                            MessageBox.Show(this.Page, "�ϴ��ɹ�");
                            this.labImgInfo.Text = datePath + "/" + fileName;
                        }
                    }
                }
            }
        }
    }
}
