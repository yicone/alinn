using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// 接口层ISite 的摘要说明。
    /// </summary>
    public interface ISite
    {
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        bool Exists(Guid SiteId);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        void Add(HOT.Model.Site model);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        void Update(HOT.Model.Site model);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        void Delete(Guid SiteId);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        HOT.Model.Site GetModel(Guid SiteId);
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
