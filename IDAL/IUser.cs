using System;
using System.Data;
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
    }
}
