using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// �ӿڲ�IOrderReport ��ժҪ˵����
    /// </summary>
    public interface IOrderReport
    {
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        bool Exists(Guid OrderReportId);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Add(HOT.Model.OrderReport model);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Update(HOT.Model.OrderReport model);
        /// <summary>
        /// ɾ��һ������
        /// </summary>
        void Delete(Guid OrderReportId);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.OrderReport GetModel(Guid OrderReportId);
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
