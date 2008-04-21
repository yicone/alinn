using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IZoneSize ��ժҪ˵����
	/// </summary>
	public interface IZoneSize
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
		int Add(HOT.Model.ZoneSize model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.ZoneSize model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(int SizeId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.ZoneSize GetModel(int SizeId);
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
