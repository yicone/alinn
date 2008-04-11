using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IAdSize ��ժҪ˵����
	/// </summary>
	public interface IAdSize
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int SizeId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.AdSize model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.AdSize model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int SizeId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.AdSize GetModel(int SizeId);
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
