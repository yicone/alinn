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
        bool Exists(string UserID);
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
        void Delete(string UserID);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.User GetModel(string UserID);


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
        bool Exists(string UserID, string PassWord);

        /// <summary>
        /// ��ȡ���û��Ƽ�����
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        IList GetIntroducer(string UserID);

        /// <summary>
        /// ��IP���������Ƿ����
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
