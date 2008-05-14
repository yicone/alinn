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
            if (Session["AdGroupIdToBeAdd"] == null)
            {
                Response.Write("<script>alert('广告组ID不能为空！');history.go(-2);</script>");
            }
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
                strErr += "标题不能为空！\\n";
            }
            if (this.txtContent.Text == "")
            {
                strErr += "广告内容不能为空！\\n";
            }
            if (this.txtUrl.Text == "")
            {
                strErr += "链接不能为空！\\n";
            }
            if (this.txtUrlText.Text == "")
            {
                strErr += "链接内容不能为空！\\n";
            }
            if (this.rblSize.SelectedValue == "")
            {
                strErr += "广告大小必须选择！";
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
            int SizeId = int.Parse(this.rblSize.SelectedValue);

            HOT.Model.Ad model = new HOT.Model.Ad();
            model.AdGroupId = new Guid(Session["AdGroupIdToBeAdd"].ToString());
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
            model.SizeId =SizeId ;
            HOT.BLL.Ad bll = new HOT.BLL.Ad();
            bll.Add(model);
            Session["AdGroupIdToBeAdd"] = null;
            //提示添加成功，并且转向上一页面
            string name = Request.UrlReferrer.ToString();
            Response.Write("<script>alert('添加新广告成功');location='ManageAdGroup.aspx';</script>");
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
                    //判断文件大小
                    int fileSize = 0;
                    fileSize = fuImg.PostedFile.ContentLength / 1024;
                    if (fileSize > 2048)
                    {
                        MessageBox.Show(this.Page,"文件太大了！");
                        return;
                    }
                    else
                    {
                        Random ran = new Random();
                        string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + Convert.ToString(ran.Next(100001, 999999)) + type;
                        if (HOT.Common.Fill.CreateDirectory(path+datePath))
                        {
                            fuImg.SaveAs(HttpContext.Current.Server.MapPath(path+datePath +"/"+ fileName));
                            MessageBox.Show(this.Page, "上传成功");
                            this.labImgInfo.Text = datePath + "/" + fileName;
                        }
                    }
                }
            }
        }
    }
}
