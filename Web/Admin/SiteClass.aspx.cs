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
using LTP.Common;

namespace Web.Admin
{
    public partial class SiteClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string strErr = "";
            if (this.txtClassName.Text == "")
            {
                strErr += "ClassName不能为空！\\n";
            }

            if (strErr != "")
            {
                MessageBox.Show(this, strErr);
                return;
            }
            string ClassName = this.txtClassName.Text;


            HOT.Model.SiteClass model = new HOT.Model.SiteClass();
            model.ClassName = ClassName;
            HOT.BLL.SiteClass bll = new HOT.BLL.SiteClass();
            bll.Add(model);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}
