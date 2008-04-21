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
using HOT.DALFactory;
using HOT.IDAL;
using HOT.Common;
using System.Text;

namespace Web
{
    public partial class Site : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ISiteClass SiteClassManager = DataAccess.CreateSiteClass();
                rblSiteClass.DataSource = SiteClassManager.GetList("").Tables[0];
                rblSiteClass.DataTextField = "ClassName";
                rblSiteClass.DataValueField = "ClassID";
                rblSiteClass.DataBind();

                IEmployment employmentManager = DataAccess.CreateEmployment();
                cblEmployments.DataSource = employmentManager.GetList("").Tables[0];
                cblEmployments.DataTextField = "EmploymentName";
                cblEmployments.DataValueField = "EmploymentID";
                cblEmployments.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            //if (this.txtUserId.Text == "")
            //{
            //    strErr += "UserId不能为空！\\n";
            //}
            if (this.txtSiteName.Text == "")
            {
                strErr += "请输入站点名称！\\n";
            }
            //TODO:验证是否为合法URL
            if (this.txtSiteUrl.Text == "")
            {
                strErr += "请输入网站地址！\\n";
            }
            if (!PageValidate.IsNumber(rblSiteClass.SelectedValue))
            {
                strErr += "请选择网站类型！\\n";
            }
            if (!PageValidate.IsNumber(rblSexType.SelectedValue))
            {
                strErr += "请选择性别分布！\\n";
            }
            if (!PageValidate.IsNumber(rblAgeType.SelectedValue))
            {
                strErr += "请选择年龄！\\n";
            }
            if (this.cblEmployments.SelectedValue == "")
            {
                strErr += "请选择职业！\\n";
            }
            //if (this.txtTaste.Text == "")
            //{
            //    strErr += "Taste不能为空！\\n";
            //}
            if (this.txtDescription.Text == "")
            {
                strErr += "请输入网站描述！\\n";
            }

            if (strErr != "")
            {
                MessageBox.Show(this, strErr);
                return;
            }
            string userId = this.txtUserId.Text;
            string siteName = this.txtSiteName.Text;
            string siteUrl = this.txtSiteUrl.Text;
            int siteClass = int.Parse(this.rblSiteClass.Text);
            int sexType = int.Parse(this.rblSexType.Text);
            int ageType = int.Parse(this.rblAgeType.Text);
            //将多选项序列化为如"0,2,3,5"的格式
            StringBuilder sbEmployments = new StringBuilder();
            foreach(ListItem li in this.cblEmployments.Items)
            {
                if (li.Selected)
                {
                    sbEmployments.Append(li.Value);
                    sbEmployments.Append(",");
                }
            }
            string employments = (sbEmployments.Length > 0) ? (sbEmployments.Remove(sbEmployments.Length - 1, 1).ToString()) : string.Empty;
            string taste = this.txtTaste.Text; 
            string description = this.txtDescription.Text;


            HOT.Model.Site model = new HOT.Model.Site();
            //model.UserId = userId;    //TODO:userId替换为登录用户的ID
            model.SiteName = siteName;
            model.SiteUrl = siteUrl;
            model.SiteClass = siteClass;
            model.SexType = sexType;
            model.AgeType = ageType;
            model.Employments = employments;
            model.Taste = taste;
            model.Description = description;
            model.AuditState = 0;   //TODO:替换为枚举值 0：未提交审核
            HOT.BLL.Site bll = new HOT.BLL.Site();
            bll.Add(model);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
