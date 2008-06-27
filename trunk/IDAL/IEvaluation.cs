using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// �ӿڲ�IEvaluation ��ժҪ˵����
	/// </summary>
	public interface IEvaluation
	{
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		bool Exists(Guid EvaluationId);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Add(HOT.Model.Evaluation model);
		/// <summary>
		/// ����һ������
		/// </summary>
		void Update(HOT.Model.Evaluation model);
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		void Delete(Guid EvaluationId);
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		HOT.Model.Evaluation GetModel(Guid EvaluationId);
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
