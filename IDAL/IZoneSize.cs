using System;
using System.Data;
namespace HOT.IDAL
{
    /// <summary>
    /// �ӿڲ�IAL_ZoneSize ��ժҪ˵����
    /// </summary>
    public interface IAL_ZoneSize
    {
        #region  ��Ա����
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        bool Exists(int SizeId);
        /// <summary>
        /// ����һ������
        /// </summary>
        int Add(HOT.Model.AL_ZoneSize model);
        /// <summary>
        /// ����һ������
        /// </summary>
        void Update(HOT.Model.AL_ZoneSize model);
        /// <summary>
        /// ɾ��һ������
        /// </summary>
        void Delete(int SizeId);
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        HOT.Model.AL_ZoneSize GetModel(int SizeId);
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
