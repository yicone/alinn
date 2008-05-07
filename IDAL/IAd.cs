using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IAd ��ժҪ˵����
	/// </summary>
	public interface IAd
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(Guid AdId);
        /// <summary>
        /// �ж�ͬһ����������Ƿ���ĳһ��С�Ĺ��
        /// </summary>
        /// <param name="size">����СID</param>
        /// <param name="adGroupId">�����ID</param>
        /// <returns></returns>
        bool Exists(int? sizeId, Guid adGroupId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Ad model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Ad model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(Guid AdId);
        /// <summary>
        /// ������ɾ������
        /// </summary>
        /// <param name="strWhere"></param>
        void Delete(string strWhere);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Ad GetModel(Guid AdId);
        /// <summary>
        /// ��where�����µõ�һ��ʵ��select top1* from table where strWhere
        /// powered by FZF 20080425
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        HOT.Model.Ad GetModel(string strWhere);
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