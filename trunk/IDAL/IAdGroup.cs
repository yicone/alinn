using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IAdGroup ��ժҪ˵����
	/// </summary>
	public interface IAdGroup
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(Guid AdGroupId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.AdGroup model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.AdGroup model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(Guid AdGroupId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.AdGroup GetModel(Guid AdGroupId);
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