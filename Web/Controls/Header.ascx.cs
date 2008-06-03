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
using System.Diagnostics;

namespace Web.Controls
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Page.User.Identity.IsAuthenticated)
                {
                    object oNickName = Session["NickName"];
                    //显示用户昵称
                    if (oNickName != null)
                    {
                        hlLogin.Text = oNickName.ToString();
                    }
                    else
                    {
                        hlLogin.Text = "丢失的昵称";
                    }

                    hlLogin.NavigateUrl = "/Member/User/UserInfo.aspx";
                    lbRegister.Text = "注销";
                    lbRegister.PostBackUrl = null;
                }
                else
                {
                    hlLogin.Text = "登录";
                    hlLogin.NavigateUrl = "/Public/Login.aspx";
                    lbRegister.Text = "注册";
                    lbRegister.PostBackUrl = "/Public/Register.aspx";
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (lbRegister.Text == "注销")
            {
                FormsAuthentication.SignOut();
                if (Session["NickName"] != null)
                {
                    Session.Remove("NickName");
                }
                Response.Redirect("/Public/Login.aspx");
            }
        }
    }
}