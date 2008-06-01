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
using HOT;
namespace Web.User
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_register_Click(object sender, EventArgs e)
        {
            if (!IsVaildCode(Request.Form["code"]))
            {
                this.Response.Write("<script>javascript:alert('验证码不正确');</script>");
                return;
            }

            if (this.IsValid)
            {
                HOT.BLL.User bUser = new HOT.BLL.User();

                //email唯一  IP当天没注册
                //Edited by fzf 20080518
                if (bUser.Exists(this.email.Text.Trim().ToLower()))
                {
                    this.Response.Write("<script>alert('该邮箱已经注册，请换邮箱进行注册。')</script>");
                    return;
                }
                else if (bUser.ExsitsTempUser(Request.UserHostAddress))
                {
                    this.Response.Write("<script>alert('此IP今天已注册')</script>");
                    return;
                }
                else
                {
                    HOT.Model.UserTemp mUser = new HOT.Model.UserTemp();

                    mUser.Email = email.Text.Trim().ToLower();
                    mUser.UserPassword = HOT.Common.MakeMd5.MakeMd5Pwd(passWord.Text.Trim());
                    mUser.NickName = nickName.Text.Trim();
                    mUser.QQ = qqNumber.Text.Trim();
                    mUser.Msn = msnAddress.Text.Trim();
                    mUser.Mobile = mobile.Text.Trim();
                    mUser.Telephone = telephone.Text.Trim();
                    mUser.RegTime = System.DateTime.Now.ToShortDateString();
                    mUser.RoleID = 0;
                    mUser.Introducer = bUser.GetIntroducer();
                    string activecode = Common.GetActiveCode();
                    mUser.ActiveCode = activecode;
                    mUser.RegIP = Request.UserHostAddress;

                    if (this.C.Checked)//企业用户
                    {
                        mUser.CompanyName = comName.Text.Trim();
                        mUser.CompanyAddress = comAddress.Text.Trim();
                        mUser.LinkMan = comLinkMan.Text.Trim();
                        mUser.RoleID = 1;
                    }
                    else
                    {
                        mUser.RoleID = 0;
                    }


                    //发送邮件
                    bUser.SendMail(this.email.Text, "欢迎注册广告天下", RenderMailDetail(email.Text, activecode));

                    //临时表比用户表多1个activecode字段
                    bUser.AddTempUser(mUser);//写入临时表,所以此时的bUser对象是不准确的



                    //this.Response.Redirect("register.htm", true);

                    Response.Write("<script>javascript:alert('已发送邮件，请注意查收，完成注册');</script>");
                }
            }


        }


        /// <summary>
        /// 生成邮件内容
        /// </summary>
        /// <param name="UserID">e-mail</param>
        /// <returns></returns>
        public string RenderMailDetail(string email, string num)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();



            sb.Append("<table width=\"580\" border=\"0\" align=\"center\" cellpadding=\"2\" cellspacing=\"0\" style=\"font-size:12px;\"><tr><td height=\"10\"><a rel=\"nofollow\" target=\"_blank\" href=\"http://www.alinn.com/\"></a>广告天下邮件提醒!</td></tr></table>");

            sb.Append("<table width=\"580\" height=\"116\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0px;\">");

            sb.Append("<tr><td height=\"37\" style=\"border-right:1px solid #e15e27;border-left:1px solid #e15e27;\">");

            sb.Append("<table width=\"100%\" border=\"0\" cellpadding=\"6\" cellspacing=\"0\" style=\"font-size:12px;line-height:180%;font-family:Arial, Helvetica, sans-serif;background:#FFFFFF;\">");

            sb.Append("<tr><td bgcolor=\"#ffeacb\"><span style=\"font-size:14px;line-height:160%;\">亲爱的会员：<span style=\"color:#FF3300;\"></span>您好！<br />感谢您成功注册为广告天下会员！</span></td></tr>");

            sb.AppendFormat("<tr><td><strong>您的登录名为：</strong>{0}<br><br>请<a rel=\"nofollow\" target=\"_blank\" href=\"http://www.aaaa0.com/public/success.aspx?email={0}&num={1}\">点击这里，立即激活</a>您的会员帐户。<br>如果邮件无法正常显示，<br>请点击以下链接激活：<a rel=\"nofollow\" target=\"_blank\" href=\"http://www.aaaa0.com/public/success.aspx?userid={0}&num={1}\">http://www.aaaa0.com/public/success.aspx?userid={0}&num={1}</a><br><br /><strong>会员帐户激活后，您就可以：</strong><br>* 发布您网站的广告位，让您的网站轻松赢利！<br>* 自主投放网络广告，把您的产品、公司推广出去！<br /></td></tr>", email, num);

            sb.Append("<tr><td height=\"80\" style=\"border-top:1px solid #CCCCCC;\"><span>广告天下——好产品，更需要好广告！ <a rel=\"nofollow\" target=\"_blank\" href=\"http://www.aaaa0.com\">http://www.aaaa0.com</a></span><br><span style=\"color:#FF0000;font-size:12px;\">提示: 此信是系统自动发出, 请不要直接&quot;回复&quot;本邮件, 系统看不懂您的回信：）</span></td></tr>");

            sb.Append("</table></td></tr>");

            sb.Append("</td></tr></table>");

            return sb.ToString();
        }

        //校验验证码
        private bool IsVaildCode(string InputCode)
        {
            if (InputCode == null || InputCode.Length == 0)
                return false;

            if (HttpContext.Current.Request.Cookies["ImageV"] == null)
                return false;

            string RndCode = (string)HttpContext.Current.Request.Cookies["ImageV"].Value;
            return InputCode.ToUpper().Equals(RndCode) ? true : false;
        }



    }

}
