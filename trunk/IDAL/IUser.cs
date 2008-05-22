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
        bool ExistsUser(Guid UserId);
        bool ExistsUserOrTempUser(string emial);
        /// <summary>
        /// 增加一条数据
        /// </summary>
        void AddUser(HOT.Model.User model);


        /// <summary>
        /// 更新一条数据
        /// </summary>
        void UpdateUser(HOT.Model.User model);
        /// <summary>
        /// 删除一条数据
        /// </summary>
        void DeleteUser(Guid UserId);
        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        HOT.Model.User GetUser(Guid UserId);

        HOT.Model.User GetUser(string email);
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
        Guid ExistsUser(string email, string password);
        /// <summary>
        /// 获取该用户推荐的人
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        string GetIntroducerOfUser(Guid UserId);

        /// <summary>
        /// 某日内是否有通过指定IP注册的临时用户
        /// </summary>
        /// <param name="userIP"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        bool ExsitsTempUser(string userIP, DateTime dateTime);

        HOT.Model.User GetUser(string email, string activeCode);

        HOT.Model.UserTemp GetTempUser(string email);

        void AddTempUser(HOT.Model.UserTemp model);

        #endregion

    }
}
