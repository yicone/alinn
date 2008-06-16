using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IZoneLocation ��ժҪ˵����
	/// </summary>
	public interface IZoneLocation
	{
		#region  ��Ա����
		/// <summary>
		/// �õ����ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(int UrlId);
		/// <summary>
		/// ����һ������
		/// </summary>
		int Add(HOT.Model.ZoneLocation model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.ZoneLocation model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int UrlId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.ZoneLocation GetModel(int UrlId);
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
