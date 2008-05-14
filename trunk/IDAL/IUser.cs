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
        bool Exists(Guid UserId);
        bool Exists(string emial);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Add(HOT.Model.User model);


        /// <summary>
        /// ����һ������
        /// </summary>
        void Update(HOT.Model.User model);
        /// <summary>
        /// ɾ��һ������
        /// </summary>
        void Delete(Guid UserId);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.User GetModel(Guid UserId);

        HOT.Model.User GetModel(string email);
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
        bool Exists(string email, string password);
        /// <summary>
        /// ��ȡ���û��Ƽ�����
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        IList GetIntroducer(Guid UserId);

        /// <summary>
        /// ��IP���������Ƿ����
        /// </summary>
        /// <param name="userIP"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        bool ExsitsIP(string userIP, DateTime dateTime);

        HOT.Model.User GetModel(string email, string activeCode);

        HOT.Model.UserTemp GetModelTemp(string email);

        void Add(HOT.Model.UserTemp model);

        #endregion

    }
}
