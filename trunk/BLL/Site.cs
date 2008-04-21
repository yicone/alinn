using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
    /// <summary>
    /// ҵ���߼���Site ��ժҪ˵����
    /// </summary>
    public class Site
    {
        private readonly ISite dal = DataAccess.CreateSite();
        public Site()
        { }
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(Guid SiteId)
        {
            return dal.Exists(SiteId);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void Add(HOT.Model.Site model)
        {
            dal.Add(model);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void Update(HOT.Model.Site model)
        {
            dal.Update(model);
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public void Delete(Guid SiteId)
        {
            dal.Delete(SiteId);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public HOT.Model.Site GetModel(Guid SiteId)
        {
            return dal.GetModel(SiteId);
        }

        /// <summary>
        /// �õ�һ������ʵ�壬�ӻ����С�
        /// </summary>
        public HOT.Model.Site GetModelByCache(Guid SiteId)
        {
            string CacheKey = "SiteModel-" + SiteId;
            object objModel = HOT.Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetModel(SiteId);
                    if (objModel != null)
                    {
                        int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
                        HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
                    }
                }
                catch { }
            }
            return (HOT.Model.Site)objModel;
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

