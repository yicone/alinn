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

namespace Web.Admin
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
            string sql="Update AL_Ad set AuditState=1 where AdId='"+this.Request.QueryString["AdId"].ToString()+"'";

            HOT.DBUtility.DbHelperSQL.ExecuteSql(sql);
            //提示添加成功，并且转向上一页面
            string name = Request.UrlReferrer.ToString();
            MessageBox.ShowAndRedirect(this.Page, "审核成功", name);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
        private void ShowInfo(Guid AdId)
        {
            HOT.BLL.Ad bll = new HOT.BLL.Ad();
            HOT.Model.Ad model = bll.GetModel(AdId);
            this.txtTitle.Text = model.Title;
            this.txtTitle.Enabled = false;
            this.txtContent.Text = model.Content;
            this.txtContent.Enabled = false;
            this.txtUrl.Text = model.Url;
            this.txtUrl.Enabled = false;
            this.txtUrlText.Text = model.UrlText;
            this.txtUrlText.Enabled = false;
            this.rblSize.SelectedIndex = int.Parse(model.SizeId.ToString()) - 11;
            this.rblSize.Enabled = false;
            switch (model.AuditState)
            {
                case 0:
                    this.labAuditState.Text = "未审核状态！";
                    break;
                case 1:
                    this.labAuditState.Text = "已审核状态！";
                    break;
                default:
                    this.labAuditState.Text = "未知状态！";
                    break;
            }
            switch (model.IsText)
            {
                case 0:
                    this.imgImg.Visible = true;
                    this.labImg.Visible = false;
                    this.imgImg.ImageUrl ="../Ad/uploadImages/"+ model.Img;
                    break;
                default:
                    this.imgImg.Visible = false;
                    this.labImg.Visible = true;
                    this.labImg.Text = "文字广告，没有图片！";
                    break;
            }

        }
    }
}
