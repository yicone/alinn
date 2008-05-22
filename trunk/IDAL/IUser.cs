using System;
using System.Data;
using System.Collections;
namespace HOT.IDAL
{
    /// <summary>
    /// �ӿڲ�IUser ��ժҪ˵����
    /// </summary>
    public interface IUser
    {
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        bool ExistsUser(Guid UserId);
        bool ExistsUserOrTempUser(string emial);
        /// <summary>
        /// ����һ������
        /// </summary>
        void AddUser(HOT.Model.User model);


        /// <summary>
        /// ����һ������
        /// </summary>
        void UpdateUser(HOT.Model.User model);
        /// <summary>
        /// ɾ��һ������
        /// </summary>
        void DeleteUser(Guid UserId);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.User GetUser(Guid UserId);

        HOT.Model.User GetUser(string email);
        /// <summary>
        /// ��������б�
        /// </summary>
        DataSet GetList(string strWhere);
        /// <summary>
        /// ���ݷ�ҳ��������б�
        /// </summary>
        //		DataSet GetList(int PageSize,int PageIndex,string strWhere);

        #endregion  ��Ա����

        #region add by F

        /// <summary>
        /// �Ƿ���ڼ�¼
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="PassWord"></param>
        /// <returns></returns>
        Guid ExistsUser(string email, string password);
        /// <summary>
        /// ��ȡ���û��Ƽ�����
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        string GetIntroducerOfUser(Guid UserId);

        /// <summary>
        /// ĳ�����Ƿ���ͨ��ָ��IPע�����ʱ�û�
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
