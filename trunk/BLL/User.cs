using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
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
        public bool Exists(string UserID)
        {
            return dal.Exists(UserID);
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
        public void Delete(string UserID)
        {
            dal.Delete(UserID);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public HOT.Model.User GetModel(string UserID)
        {
            return dal.GetModel(UserID);
        }

        /// <summary>
        /// �õ�һ������ʵ�壬�ӻ����С�
        /// </summary>
        public HOT.Model.User GetModelByCache(string UserID)
        {
            string CacheKey = "UserModel-" + UserID;
            object objModel = HOT.Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetModel(UserID);
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
    }
}

