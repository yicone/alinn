using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
    /// <summary>
    /// 业务逻辑类OrderReport 的摘要说明。
    /// </summary>
    public class OrderReport
    {
        private readonly IOrderReport dal = DataAccess.CreateOrderReport();
        public OrderReport()
        { }
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid OrderReportId)
        {
            return dal.Exists(OrderReportId);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public void Add(HOT.Model.OrderReport model)
        {
            dal.Add(model);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public void Update(HOT.Model.OrderReport model)
        {
            dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid OrderReportId)
        {
            dal.Delete(OrderReportId);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.OrderReport GetModel(Guid OrderReportId)
        {
            return dal.GetModel(OrderReportId);
        }

        /// <summary>
        /// 得到一个对象实体，从缓存中。
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
    }
}

