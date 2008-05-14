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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("Register.aspx", true);
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                HOT.BLL.User bUser = new HOT.BLL.User();
                if (bUser.Login(email.Text.Trim(), HOT.Common.MakeMd5.MakeMd5Pwd(passWord.Text.Trim())))
                {
                    HOT.Model.User mUser = bUser.GetModel(email.Text.Trim());
                    mUser.LastLoginIP = Request.UserHostAddress;
                    mUser.LastLoginTime = DateTime.Now.Date;
                    mUser.LoginTimes = mUser.LoginTimes + 1;


                    Session["UserId"] = mUser.UserId;
                    this.Response.Redirect("../zone/zone.aspx", true);
                }
                else
                    this.Label1.Text = "用户名或密码错误";
            }
        }
    }
}
