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
            return dal.ExistsUserOrTempUser(email);
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        /// <param name="email"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public Guid ExistsUser(string email, string passWord)
        {
            return dal.ExistsUser(email, passWord);
        }



        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void AddUser(HOT.Model.User model)
        {
            dal.AddUser(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void UpdateUser(HOT.Model.User model)
        {
            dal.UpdateUser(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void DeleteUser(Guid UserId)
        {
            dal.DeleteUser(UserId);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.User GetUser(Guid UserId)
        {
            return dal.GetUser(UserId);
        }

        public HOT.Model.User GetUser(string email)
        {
            return dal.GetUser(email);
        }

        /// <summary>
        /// 得到一个对象实体，从缓存中。
        /// </summary>
        public HOT.Model.User GetUserByCache(Guid userId)
        {
            string CacheKey = "UserModel-" + userId;
            object objModel = HOT.Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetUser(userId);
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
            client.Credentials = new System.Net.NetworkCredential("fuhaowen12@gmail.com", "kfgzfhw0p;/'[-");
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

        public HOT.Model.User GetUser(string email, string activeCode)
        {
            return dal.GetUser(email, activeCode);
        }

        public HOT.Model.UserTemp GetTempUser(string email)
        {
            return dal.GetTempUser(email);
        }

        /// <summary>
        /// 当日内是否有通过指定IP注册的临时用户
        /// </summary>
        /// <returns></returns>
        public bool ExsitsTempUser(string userIP)
        {
            return dal.ExsitsTempUser(userIP, DateTime.Now.Date);
        }

        /// <summary>
        /// 某日内是否有通过指定IP注册的临时用户
        /// </summary>
        /// <param name="userIP"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public bool ExsitsTempUser(string userIP, DateTime dateTime)
        {
            return dal.ExsitsTempUser(userIP, dateTime);
        }

        public void AddTempUser(HOT.Model.UserTemp mUser)
        {
            dal.AddTempUser(mUser);
        }

        /// <summary>
        /// 获取登录状态
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool IsOnline(string UserID)
        {
            return false;
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
        public string GetIntroducer(Guid UserId)
        {
            return dal.GetIntroducerOfUser(UserId);
        }

        #endregion

        public static Guid GetLoginUser()
        {
            //object o = HttpContext.Current.Session["LoginUser"];
            //if (o == null)
            //    return Guid.Empty;
            //return (Guid)o;
            return new Guid(HttpContext.Current.User.Identity.Name);
        }
    }
}
