using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
    /// <summary>
    /// ҵ���߼���OrderReport ��ժҪ˵����
    /// </summary>
    public class OrderReport
    {
        private readonly IOrderReport dal = DataAccess.CreateOrderReport();
        public OrderReport()
        { }
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(Guid OrderReportId)
        {
            return dal.Exists(OrderReportId);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void Add(HOT.Model.OrderReport model)
        {
            dal.Add(model);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public void Update(HOT.Model.OrderReport model)
        {
            dal.Update(model);
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public void Delete(Guid OrderReportId)
        {
            dal.Delete(OrderReportId);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public HOT.Model.OrderReport GetModel(Guid OrderReportId)
        {
            return dal.GetModel(OrderReportId);
        }

        /// <summary>
        /// �õ�һ������ʵ�壬�ӻ����С�
        /// </summary>
        public HOT.Model.OrderReport GetModelByCache(Guid OrderReportId)
        {
            string CacheKey = "OrderReportModel-" + OrderReportId;
            object objModel = HOT.Common.DataCache.GetCache(CacheKey);
            if (objModel == null)
            {
                try
                {
                    objModel = dal.GetModel(OrderReportId);
                    if (objModel != null)
                    {
                        int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
                        HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
                    }
                }
                catch { }
            }
            return (HOT.Model.OrderReport)objModel;
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

