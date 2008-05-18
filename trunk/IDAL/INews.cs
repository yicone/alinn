using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�INews ��ժҪ˵����
	/// </summary>
	public interface INews
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int NewsId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.News model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.News model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int NewsId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.News GetModel(int NewsId);
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
