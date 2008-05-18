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
                    this.Response.Redirect("/User/Login.aspx");


                BindUserInfo();
            }
        }

        public void BindUserInfo()
        {
            bUser = new HOT.BLL.User();
            Guid userID = bUser.GetLoginUser();

            DataSet ds = bUser.GetList(string.Format(" userid='{0}'", userID));

            if (ds.Tables[0].Rows.Count == 0)
                Response.Redirect("/User/Login.aspx");


            comName.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(5).ToString();
            comAddress.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(6).ToString();
            comLinkMan.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(7).ToString();

            mobile.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(9).ToString();
            telephone.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(8).ToString();
            qqNumber.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(10).ToString();
            msnAddress.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(11).ToString();
            school.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(19).ToString();
            proxy.Text = ds.Tables[0].Rows[0].ItemArray.GetValue(20).ToString();
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                bUser = new HOT.BLL.User();

                HOT.Model.User mUser = bUser.GetModel(bUser.GetLoginUser());



                mUser.QQ = qqNumber.Text.Trim();
                mUser.Msn = msnAddress.Text.Trim();
                mUser.Mobile = mobile.Text.Trim();
                mUser.Telephone = telephone.Text.Trim();

                mUser.CompanyName = comName.Text.Trim();
                mUser.CompanyAddress = comAddress.Text.Trim();
                mUser.LinkMan = comLinkMan.Text.Trim();
                mUser.School = school.Text.Trim();
                mUser.Proxy = proxy.Text.Trim();

                bUser.Update(mUser);
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            BindUserInfo();
        }


    }
}
