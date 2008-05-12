using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IOrder ��ժҪ˵����
	/// </summary>
	public interface IOrder
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(Guid OrderId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Order model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Order model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(Guid OrderId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Order GetModel(Guid OrderId);
        /// <summary>
        /// �õ�һ������ʵ��BY UserId
        /// powered by fzf 20080511
        /// </summary>
        HOT.Model.Order GetModelByUserId(Guid UserId);
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
