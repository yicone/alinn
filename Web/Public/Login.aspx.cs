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
using System.Diagnostics;

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
                Guid userId = bUser.ExistsUser(email, password);
                if (userId != Guid.Empty)
                {
                    HOT.Model.User mUser = bUser.GetUser(userId);
                    mUser.LastLoginIP = Request.UserHostAddress;
                    mUser.LastLoginTime = DateTime.Now.Date;
                    mUser.LoginTimes = mUser.LoginTimes + 1;

                    int? roleId = bUser.GetUserByCache(userId).RoleID;
                    Debug.Assert(roleId.HasValue,
                        string.Format("User表中RoleId字段必须有值！UserId={0}", userId.ToString()));
                    string strRoleId = roleId.ToString();

                    #region Forms 验证机制 之 写Cookie部分
                    //cookie的有效期暂定为30分
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, strRoleId, DateTime.Now, DateTime.Now.AddMinutes(30), false, strRoleId, "/"); //建立身份验证票对象 
                    string hashTicket = FormsAuthentication.Encrypt(ticket); //加密序列化验证票为字符串 
                    HttpCookie userCookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashTicket); //生成Cookie 
                    Context.Response.Cookies.Add(userCookie); //输出Cookie 
                    FormsAuthentication.RedirectFromLoginPage(userId.ToString(), false);  //转向未登录前请求的页面

                    #endregion

                    Session["NickName"] = mUser.NickName;
                    //Session["UserId"] = mUser.UserId;
                    //this.Response.Redirect("../zone/zone.aspx", true);
                }
                else
                    this.Label1.Text = "用户名或密码错误";
            }
        }
    }
}
