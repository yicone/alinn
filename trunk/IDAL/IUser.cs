using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// 接口层IUser 的摘要说明。
    /// </summary>
    public interface IUser
    {
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        bool Exists(string UserID);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        void Add(HOT.Model.User model);
        /// <summary>
        /// 更新一条数据
        /// </summary>
        void Update(HOT.Model.User model);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        void Delete(string UserID);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        HOT.Model.User GetModel(string UserID);
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
