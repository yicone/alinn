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
/* ------------------------
 * powered by FZF 20080418
 * QQ:1363036
 -------------------------- */
namespace Web.User
{
    public partial class NewGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ddlClass1.DataBind();
                this.ddlClass2.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            if (this.txtGroupName.Text == "")
            {
                strErr += "广告组名称不能为空！\\n";
            }

            if (strErr != "")
            {
                MessageBox.Show(this, strErr);
                return;
            }
            string GroupName = this.txtGroupName.Text;
            //Guid UserId = Session["UserId"].ToString();
            
            int Class = 0;
            if (this.ddlClass2.SelectedValue.Length == 0)
            {
                Class = int.Parse(this.ddlClass1.SelectedValue);
            }
            else
            {
                Class = int.Parse(this.ddlClass2.SelectedValue);
            }
            string KeyWords = this.txtKeyWords.Text;


            HOT.Model.AdGroup model = new HOT.Model.AdGroup();
            model.GroupName = GroupName;
            model.UserId = new Guid(Session["UserId"].ToString());
            model.Class = Class;
            model.KeyWords = KeyWords;
            HOT.BLL.AdGroup bll = new HOT.BLL.AdGroup();
            bll.Add(model);
            //MessageBox.Show(this.Page, "");
            Response.Write("<script>alert('添加新广告组成功');location='/Member/Ad/ManageAdGroup.aspx';</script>");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ddlClass2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlClass1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlClass1.DataBind();
            this.ddlClass2.DataBind();
        }
    }
}
