using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IZone ��ժҪ˵����
	/// </summary>
	public interface IZone
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(Guid ZoneId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Zone model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Zone model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(Guid ZoneId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Zone GetModel(Guid ZoneId);
		/// <summary>
		/// ��������б�
		/// </summary>
		DataSet GetList(string strWhere);
        DataSet GetList(int startIndex, int endIndex, int doCount);
		/// <summary>
		/// ���ݷ�ҳ��������б�
		/// </summary>
//		DataSet GetList(int PageSize,int PageIndex,string strWhere);
		#endregion  ��Ա����
	}
}
