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
    public partial class GetPassWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            HOT.BLL.User bUser = new HOT.BLL.User();

            string activecode = Common.GetActiveCode();

            HOT.Model.User mUser = bUser.GetModel(email.Text);
            if (mUser == null)
                return;
            mUser.ActiveCode = activecode;
            bUser.Update(mUser);


            bUser.SendMail(email.Text, "您已经申请在广告天下找回密码", RenderMailDetail(mUser.UserId, activecode));
        }

        public string RenderMailDetail(Guid UserId, string num)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.AppendFormat("请点击下面的链接 <a href='http://www.alinn.com/ResetPassword.aspx?userid={0}&num={1}'>http://www.alinn.com/ResetPassword.aspx?userid={0}&num={1}</a> ", UserId.ToString(), num);

            return sb.ToString();
        }
    }
}
