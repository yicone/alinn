using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IWebs ��ժҪ˵����
	/// </summary>
	public interface IWebs
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(string WebId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Webs model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Webs model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(string WebId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Webs GetModel(string WebId);
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
