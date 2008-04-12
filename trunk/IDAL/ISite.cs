using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// �ӿڲ�ISite ��ժҪ˵����
    /// </summary>
    public interface ISite
    {
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        bool Exists(Guid SiteId);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Add(HOT.Model.Site model);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Update(HOT.Model.Site model);
        /// <summary>
        /// ɾ��һ������
        /// </summary>
        void Delete(Guid SiteId);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.Site GetModel(Guid SiteId);
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
