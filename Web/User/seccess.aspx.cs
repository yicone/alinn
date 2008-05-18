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

namespace Web.User
{
    public partial class Seccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HOT.BLL.User bUser = new HOT.BLL.User();

            string email = Request.QueryString["email"];
            HOT.Model.UserTemp mUserTemp = bUser.GetModelTemp(email);
            Debug.Assert(mUserTemp != null, "不存在此用户或者该页面得到未注册用户的请求！");

            if (mUserTemp.ActiveCode == Request.QueryString["num"])
            {
                HOT.Model.User mUser = new HOT.Model.User();
                mUser.CompanyAddress = mUserTemp.CompanyAddress;
                mUser.CompanyName = mUserTemp.CompanyName;
                mUser.Email = mUserTemp.Email;
                mUser.Introducer = mUserTemp.Introducer;
                mUser.LinkMan = mUserTemp.LinkMan;
                mUser.Mobile = mUserTemp.Mobile;
                mUser.Msn = mUserTemp.Msn;
                mUser.NickName = mUserTemp.NickName;
                mUser.QQ = mUserTemp.QQ;
                mUser.RegTime = System.DateTime.Now;
                mUser.RoleID = mUserTemp.RoleID;
                mUser.Telephone = mUserTemp.Telephone;
                mUser.UserPassword = mUserTemp.UserPassword;
                mUser.RegTime = DateTime.Now.Date;

                bUser.Add(mUser);

                this.Response.Redirect("/User/Login.aspx");
            }
            else
            {
                this.Response.Redirect("/User/Register.aspx", true);
            }
        }
    }
}
