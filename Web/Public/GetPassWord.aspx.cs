﻿using System;
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
    public partial class GetPassWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            HOT.BLL.User bUser = new HOT.BLL.User();

            string activecode = Common.GetActiveCode();

            HOT.Model.User mUser = bUser.GetUser(email.Text.Trim());
            if (mUser == null)
                return;
            mUser.ActiveCode = activecode;
            bUser.UpdateUser(mUser);


            bUser.SendMail(email.Text, "您已经申请在广告天下找回密码", RenderMailDetail(email.Text.Trim(), activecode));

            this.Response.Redirect("register.htm");
        }

        public string RenderMailDetail(string email, string num)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.AppendFormat("请点击下面的链接 <a href='http://www.aaaa0.com/ResetPassword.aspx?userid={0}&num={1}'>http://www.aaaa0.com/ResetPassword.aspx?userid={0}&num={1}</a> ", email, num);

            return sb.ToString();
        }
    }
}
