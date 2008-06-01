using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// 接口层IStore 的摘要说明。
    /// </summary>
    public interface IStore
    {
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        bool Exists(Guid StoreId);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        void Add(HOT.Model.Store model);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        void Update(HOT.Model.Store model);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        void Delete(Guid StoreId);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        HOT.Model.Store GetModel(Guid StoreId);
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
