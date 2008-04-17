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
using HOT.Common;

namespace Web.Admin
{
    public partial class Employment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            if (this.txtEmploymentName.Text == "")
            {
                strErr += "EmploymentName不能为空！\\n";
            }

            if (strErr != "")
            {
                MessageBox.Show(this, strErr);
                return;
            }
            string EmploymentName = this.txtEmploymentName.Text;


            HOT.Model.Employment model = new HOT.Model.Employment();
            model.EmploymentName = EmploymentName;
            HOT.BLL.Employment bll = new HOT.BLL.Employment();
            bll.Add(model);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
