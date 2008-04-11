using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IEmployment ��ժҪ˵����
	/// </summary>
	public interface IEmployment
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int EmploymentId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.Employment model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Employment model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int EmploymentId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Employment GetModel(int EmploymentId);
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
