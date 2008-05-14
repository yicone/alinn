using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
using System.Web.Security;
using System.Collections;
using System.Web;
using System.Net.Mail;
namespace HOT.BLL
{
    /// <summary>
    /// 业务逻辑类User 的摘要说明。
    /// </summary>
    public class User
    {
        private readonly IUser dal = DataAccess.CreateUser();
        public User()
        { }
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string email)
        {
            return dal.Exists(email);
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        /// <param name="email"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public bool Exists(string email, string passWord)
        {
            return dal.Exists(email, passWord);
        }



        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add(HOT.Model.User model)
        {
            dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void Update(HOT.Model.User model)
        {
            dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid UserId)
        {
            dal.Delete(UserId);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.User GetModel(Guid UserId)
        {
            return dal.GetModel(UserId);
        }

        public HOT.Model.User GetModel(string email)
        {
            return dal.GetModel(email);
        }

        /// <summary>
        /// 得到一个对象实体，从缓存中。
        /// </summary>
        public HOT.Model.User GetModelByCache(Guid UserId)
        {
            string CacheKey = "UserModel-" + UserId;
            object objModel = HOT.Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetModel(UserId);
                    if (objModel != null)
                    {
                        int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
                        HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
                    }
                }
                catch { }
            }
            return (HOT.Model.User)objModel;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetAllList()
        {
            return GetList("");
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        //public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        //{
        //return dal.GetList(PageSize,PageIndex,strWhere);
        //}

        #endregion  成员方法
        #region Add by F

        #region 邮件相关
        /// <summary>
        /// 发送邮件
        /// </summary>
        /// <param name="UserID">e-mail</param>
        public void SendMail(string email, string Subject, string Detail)
        {
            MailMessage mailMsg = new MailMessage();

            MailAddress mailAddress = new MailAddress("alinngroup@gmail.com");
            mailMsg.From = mailAddress;
            mailMsg.To.Add(email);
            mailMsg.Subject = Subject;
            mailMsg.Body = Detail;
            mailMsg.BodyEncoding = System.Text.Encoding.UTF8;
            mailMsg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.Credentials = new System.Net.NetworkCredential("alinngroup@gmail.com", "guanggaotianxia");
            client.EnableSsl = true;
            try
            {
                client.Send(mailMsg);
            }
            catch (Exception ex)
            {
                //写入日志
            }
        }

        #endregion

        public HOT.Model.User GetModel(string email, string activeCode)
        {
            return dal.GetModel(email, activeCode);
        }

        public HOT.Model.UserTemp GetModelTemp(string email)
        {
            return dal.GetModelTemp(email);
        }

        /// <summary>
        /// 此IP当天是否已存在
        /// </summary>
        /// <returns></returns>
        public bool ExsitsIP(string userIP)
        {
            return dal.ExsitsIP(userIP, DateTime.Now.Date);
        }

        public bool ExsitsIP(string userIP, DateTime dateTime)
        {
            return dal.ExsitsIP(userIP, dateTime);
        }

        public void Add(HOT.Model.UserTemp mUser)
        {
            dal.Add(mUser);
        }

        /// <summary>
        /// 获取登录状态
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool IsUserOnline(string UserID)
        {
            return false;
        }

        /// <summary>
        /// 用户注销
        /// </summary>
        /// <param name="UserID"></param>
        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }

        /// <summary>
        /// 写入票据验证
        /// </summary>
        /// <param name="UserID"></param>
        public void FormsAuthen(Guid UserId)
        {
            string RoleID = GetModelByCache(UserId).RoleID.ToString();
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(0, UserId.ToString(), DateTime.Now, DateTime.Now.AddMinutes(30), false, RoleID);
            string strticket = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, strticket);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        /// <summary>
        /// 把推荐人ID放入内存
        /// </summary>
        /// <param name="IntroducerID"></param>
        public void SetIntroducer(string IntroducerID)
        {
            HttpContext.Current.Session["introducer"] = IntroducerID;
        }

        public void SetIntroducer()
        {
            string introducerID = HttpContext.Current.Request.QueryString["introducer"];
            SetIntroducer(introducerID);
        }

        /// <summary>
        /// 获取推荐人ID
        /// </summary>
        /// <returns></returns>
        public string GetIntroducer()
        {
            if (HttpContext.Current.Session["introducer"] != null)
                return HttpContext.Current.Session["introducer"].ToString();
            return null;
        }

        /// <summary>
        /// 获取该用户推荐的人
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public IList GetIntroducer(Guid UserId)
        {
            return dal.GetIntroducer(UserId);
        }

        #endregion

        public bool Login(string UserID, string PassWord)
        {
            if (Exists(UserID, PassWord))
            {
                SetLoginState(UserID);

                return true;
            }

            return false;
        }

        public string GetLoginUser()
        {
            return HttpContext.Current.Session["LoginUser"] == null ? null : HttpContext.Current.Session["LoginUser"].ToString();
        }

        public void SetLoginState(string UserID)
        {
            HttpContext.Current.Session["LoginUser"] = UserID;
        }
    }
}
