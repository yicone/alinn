using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web.News
{
    public partial class ShowNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.QueryString["NewsId"] == null)
            {
                Response.Write("<script>alert('参数错误！');history.go(-2);</script>");
            }
            else
            {
                if(HOT.Common.Strings.IsNumber(this.Request.QueryString["NewsId"].ToString()))
                {
                ShowInfo(int.Parse(this.Request.QueryString["NewsId"].ToString()));
                }
                else
                {
                Response.Write("<script>alert('参数错误！');history.go(-2);</script>");
                }
        }
        }
        private void ShowInfo(int NewsId)
        {
            HOT.BLL.News bll = new HOT.BLL.News();
            HOT.Model.News model = bll.GetModel(NewsId);
            HOT.BLL.NewsClass ncBLL = new HOT.BLL.NewsClass();
            HOT.Model.NewsClass ncModel = new HOT.Model.NewsClass();
            ncModel = ncBLL.GetModel(model.ClassId);
            this.lblClassId.Text = ncModel.ClassName;
            this.lblTitle.Text = model.Title;
            this.lblContent.Text = model.Content;
            this.lblCreateDate.Text = model.CreateDate.ToString();
             
        }
    }
}
