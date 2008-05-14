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
    public partial class UserInfo : System.Web.UI.Page
    {
        HOT.BLL.User bUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bUser = new HOT.BLL.User();
                if (bUser.GetLoginUser() == null)
                    this.Response.Redirect("Login.aspx");


                BindUserInfo();
            }
        }

        public void BindUserInfo()
        {
            bUser = new HOT.BLL.User();
            string userID = bUser.GetLoginUser();

            HOT.Model.User mUser = bUser.GetModel(userID);

            comName.Text = mUser.CompanyName;
            comAddress.Text = mUser.CompanyAddress;
            comLinkMan.Text = mUser.LinkMan;

            mobile.Text = mUser.Mobile;
            telephone.Text = mUser.Telephone;
            qqNumber.Text = mUser.QQ;
            msnAddress.Text = mUser.Msn;
            school.Text = mUser.School;
            proxy.Text = mUser.Proxy;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                bUser = new HOT.BLL.User();

                HOT.Model.User mUser = new HOT.Model.User();



                mUser.QQ = qqNumber.Text.Trim();
                mUser.Msn = msnAddress.Text.Trim();
                mUser.Mobile = mobile.Text.Trim();
                mUser.Telephone = telephone.Text.Trim();

                mUser.CompanyName = comName.Text.Trim();
                mUser.CompanyAddress = comAddress.Text.Trim();
                mUser.LinkMan = comLinkMan.Text.Trim();
                mUser.School = school.Text.Trim();
                mUser.Proxy = school.Text.Trim();

                bUser.Update(mUser);
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            BindUserInfo();
        }


    }
}
