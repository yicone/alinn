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

namespace Web.User
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfix_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string email = Request.QueryString["userid"];
                string num = Request.QueryString["num"];

                HOT.BLL.User bUser = new HOT.BLL.User();

                HOT.Model.User mUser = bUser.GetUser(email, num);
                if (mUser == null)
                    return;

                mUser.ActiveCode = "";
                mUser.UserPassword = HOT.Common.MakeMd5.MakeMd5Pwd(password.Text.Trim());

                bUser.UpdateUser(mUser);

                this.Response.Redirect("Login.aspx");
            }
        }
    }
}
