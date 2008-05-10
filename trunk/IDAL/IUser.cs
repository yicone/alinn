using System;
using System.Data;
using System.Collections;
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

        #region add by F

        /// <summary>
        /// 是否存在记录
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        bool Exists(string UserID, string PassWord);

        /// <summary>
        /// 获取该用户推荐的人
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        IList GetIntroducer(string UserID);

        /// <summary>
        /// 该IP在日期内是否存在
        /// </summary>
        /// <param name="userIP"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        bool ExsitsIP(string userIP,DateTime dateTime);

        HOT.Model.User GetModel(string UserID, string activecode);

        HOT.Model.UserTemp GetModelTemp(string UserID);

        void Add(HOT.Model.UserTemp model);

        #endregion
        
    }
}
