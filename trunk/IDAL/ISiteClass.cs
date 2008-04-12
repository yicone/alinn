using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�ISiteClass ��ժҪ˵����
	/// </summary>
	public interface ISiteClass
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int ClassId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.SiteClass model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.SiteClass model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int ClassId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.SiteClass GetModel(int ClassId);
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
