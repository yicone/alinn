using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// 接口层IOrderReport 的摘要说明。
    /// </summary>
    public interface IOrderReport
    {
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        bool Exists(Guid OrderReportId);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        void Add(HOT.Model.OrderReport model);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        void Update(HOT.Model.OrderReport model);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        void Delete(Guid OrderReportId);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        HOT.Model.OrderReport GetModel(Guid OrderReportId);
        /// <summary>
        /// 获得数据列表
        /// </summary>
        DataSet GetList(string strWhere);
        /// <summary>
        /// 根据分页获得数据列表
        /// </summary>
        //		DataSet GetList(int PageSize,int PageIndex,string strWhere);
        #endregion  成员方法
    }
}
