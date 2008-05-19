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
using HOT.BLL;

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
                string email = txtEmail.Text.Trim().ToLower();
                string password = HOT.Common.MakeMd5.MakeMd5Pwd(txtPassword.Text.Trim());
                HOT.BLL.User bUser = new HOT.BLL.User();
                //Edited by FZF 2008.05.18
                bool success = bUser.Login(email, password);
                if (success)
                {

                    HOT.Model.User mUser = bUser.GetModel(email);
                    mUser.LastLoginIP = Request.UserHostAddress;
                    mUser.LastLoginTime = DateTime.Now.Date;
                    mUser.LoginTimes = mUser.LoginTimes + 1;


                    #region Forms 验证机制 之 写Cookie部分

                    SiteRole role = SiteRole.Member;
                    string strRole = ((int)role).ToString();
                    //cookie的有效期暂定为30分
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, strRole, DateTime.Now, DateTime.Now.AddMinutes(30), false, strRole, "/"); //建立身份验证票对象 
                    string hashTicket = FormsAuthentication.Encrypt(ticket); //加密序列化验证票为字符串 
                    HttpCookie userCookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashTicket); //生成Cookie 
                    Context.Response.Cookies.Add(userCookie); //输出Cookie 
                    FormsAuthentication.RedirectFromLoginPage(mUser.UserId.ToString(), false);  //转向未登录前请求的页面

                    #endregion


                    //Session["UserId"] = mUser.UserId;
                    //this.Response.Redirect("../zone/zone.aspx", true);

                    //退出登录，使用FormsAuthentication.SignOut();
                }
                else
                    this.Label1.Text = "用户名或密码错误";
            }
        }
    }
}
