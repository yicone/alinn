using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Web.Admin.News
{
    public partial class AdNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HOT.BLL.News nBLL = new HOT.BLL.News();
            HOT.Model.News nModel = new HOT.Model.News();
            nModel.Title = this.txtTitle.Text;
            nModel.ClassId = int.Parse(this.ddlNewsClass.SelectedValue);
            nModel.Content = this.txtContent.Text;
            nBLL.Add(nModel);
            Response.Write("<script>alert('添加新闻成功！');</script>");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
