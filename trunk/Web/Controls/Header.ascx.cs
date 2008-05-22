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
            if (Page.User.Identity.IsAuthenticated)
            {
                Debug.Assert(Session["NickName"] != null);
                hlLogin.Text = Session["NickName"].ToString();
                hlLogin.NavigateUrl = "/User/UserInfo.aspx";
                lbRegister.Text = "[注销]";
                lbRegister.OnClientClick = null;
            }
            else
            {
                hlLogin.Text = "[登录]";
                hlLogin.NavigateUrl = "/Public/Login.aspx";
                lbRegister.Text = "[注册]";
                lbRegister.OnClientClick = "javascript:location='/Public/Register.aspx';";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (lbRegister.Text == "[注销]")
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