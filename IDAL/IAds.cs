using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IAds ��ժҪ˵����
	/// </summary>
	public interface IAds
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(string AdId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Ads model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Ads model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(string AdId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Ads GetModel(string AdId);
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
