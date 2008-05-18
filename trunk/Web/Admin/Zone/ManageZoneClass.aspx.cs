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

namespace Web.Admin.Zone
{
    public partial class ManageZoneClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ddlParentId.DataBind();
            }
            if (this.rblIs.SelectedValue == "1")
            { this.ddlParentId.Enabled = false; }
            else
            { this.ddlParentId.Enabled = true; }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
            zcModel.ClassName = this.txtClassName.Text;
            if (this.rblIs.SelectedValue == "1")
            {
                zcModel.ParentId = 0;
            }
            else
            {
                zcModel.ParentId = int.Parse(this.ddlParentId.SelectedValue);
            }
            zcBLL.Add(zcModel);
            Response.Write("<script>alert('添加成功！');loaction='managezoneclass.aspx';</script>");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ddlParentId_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlParentId.DataBind();
        }
    }
}
