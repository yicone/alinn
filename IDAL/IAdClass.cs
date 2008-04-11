using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IAdClass ��ժҪ˵����
	/// </summary>
	public interface IAdClass
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int AdClassId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.AdClass model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.AdClass model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int AdClassId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.AdClass GetModel(int AdClassId);
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
