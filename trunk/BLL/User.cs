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
            return dal.Exists(email);
        }

        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        /// <param name="email"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        public Guid Exists(string email, string passWord)
        {
            return dal.Exists(email, passWord);
        }



        /// <summary>
        /// ����һ������
        /// </summary>
        public void Add(HOT.Model.User model)
        {
            dal.Add(model);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void Update(HOT.Model.User model)
        {
            dal.Update(model);
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public void Delete(Guid UserId)
        {
            dal.Delete(UserId);
        }

        /// <summary>
        /// �õ�һ������ʵ��
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
        /// �õ�һ������ʵ�壬�ӻ����С�
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
            client.Credentials = new System.Net.NetworkCredential("alinngroup@gmail.com", "guanggaotianxia");
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

        public HOT.Model.User GetModel(string email, string activeCode)
        {
            return dal.GetModel(email, activeCode);
        }

        public HOT.Model.UserTemp GetModelTemp(string email)
        {
            return dal.GetModelTemp(email);
        }

        /// <summary>
        /// ��IP�����Ƿ��Ѵ���
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
        /// ��ȡ��¼״̬
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool IsUserOnline(string UserID)
        {
            return false;
        }

        /// <summary>
        /// �û�ע��
        /// </summary>
        /// <param name="UserID"></param>
        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }

        /// <summary>
        /// д��Ʊ����֤
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
            return dal.GetIntroducer(UserId);
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="PassWord">���ܺ������</param>
        /// <returns></returns>
        public bool Login(string UserID, string PassWord)
        {
            Guid guid = Exists(UserID, PassWord);
            if (guid != Guid.Empty)
            {
                SetLoginState(guid);

                return true;
            }

            return false;
        }

        public Guid GetLoginUser()
        {
            object o = HttpContext.Current.Session["LoginUser"];
            if (o == null)
                return Guid.Empty;
            return (Guid)o;
            
        }

        public void SetLoginState(Guid UserID)
        {
            HttpContext.Current.Session["LoginUser"] = UserID;
        }
    }
}
