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
    /// ҵ���߼���User ��ժҪ˵����
    /// </summary>
    public class User
    {
        private readonly IUser dal = DataAccess.CreateUser();
        public User()
        { }
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(string email)
        {
            return dal.ExistsUserOrTempUser(email);
        }

        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        /// <param name="email"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public Guid ExistsUser(string email, string passWord)
        {
            return dal.ExistsUser(email, passWord);
        }



        /// <summary>
        /// ����һ������
        /// </summary>
        public void AddUser(HOT.Model.User model)
        {
            dal.AddUser(model);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void UpdateUser(HOT.Model.User model)
        {
            dal.UpdateUser(model);
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public void DeleteUser(Guid UserId)
        {
            dal.DeleteUser(UserId);
        }

        /// <summary>
        /// �õ�һ������ʵ��
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
        /// �õ�һ������ʵ�壬�ӻ����С�
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
        /// ��������б�
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        /// <summary>
        /// ��������б�
        /// </summary>
        public DataSet GetAllList()
        {
            return GetList("");
        }

        /// <summary>
        /// ��������б�
        /// </summary>
        //public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        //{
        //return dal.GetList(PageSize,PageIndex,strWhere);
        //}

        #endregion  ��Ա����
        #region Add by F

        #region �ʼ����

        /// <summary>
        /// �����ʼ�
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
                //д����־
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
        /// �������Ƿ���ͨ��ָ��IPע�����ʱ�û�
        /// </summary>
        /// <returns></returns>
        public bool ExsitsTempUser(string userIP)
        {
            return dal.ExsitsTempUser(userIP, DateTime.Now.Date);
        }

        /// <summary>
        /// ĳ�����Ƿ���ͨ��ָ��IPע�����ʱ�û�
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
        /// ��ȡ��¼״̬
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool IsOnline(string UserID)
        {
            return false;
        }

        /// <summary>
        /// ���Ƽ���ID�����ڴ�
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
        /// ��ȡ�Ƽ���ID
        /// </summary>
        /// <returns></returns>
        public string GetIntroducer()
        {
            if (HttpContext.Current.Session["introducer"] != null)
                return HttpContext.Current.Session["introducer"].ToString();
            return null;
        }

        /// <summary>
        /// ��ȡ���û��Ƽ�����
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
