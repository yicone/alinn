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
        private Guid adGroupId = new Guid();
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid guid = new Guid(this.Request.QueryString["AdGruopId"].ToString());
            adGroupId = guid;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            if (this.txtTitle.Text == "")
            {
                strErr += "Title不能为空！\\n";
            }
            if (this.txtContent.Text == "")
            {
                strErr += "Content不能为空！\\n";
            }
            if (this.txtUrl.Text == "")
            {
                strErr += "Url不能为空！\\n";
            }
            if (this.txtUrlText.Text == "")
            {
                strErr += "UrlText不能为空！\\n";
            }
            if (this.txtImg.Text == "")
            {
                strErr += "Img不能为空！\\n";
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
            string Img = this.txtImg.Text;


            HOT.Model.Ad model = new HOT.Model.Ad();
            model.AdGroupId = adGroupId;
            model.Title = Title;
            model.Content = Content;
            model.Url = Url;
            model.UrlText = UrlText;
            model.Img = Img;
            HOT.BLL.Ad bll = new HOT.BLL.Ad();
            bll.Add(model);
            MessageBox.ShowAndRedirect(this.Page, "添加成功", "ManageAdGroup.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
