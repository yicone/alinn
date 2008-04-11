using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���Employment ��ժҪ˵����
	/// </summary>
	public class Employment
	{
		private readonly IEmployment dal=DataAccess.CreateEmployment();
		public Employment()
		{}
		#region  ��Ա����

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int EmploymentId)
		{
			return dal.Exists(EmploymentId);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(HOT.Model.Employment model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.Employment model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int EmploymentId)
		{
			dal.Delete(EmploymentId);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.Employment GetModel(int EmploymentId)
		{
			return dal.GetModel(EmploymentId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public HOT.Model.Employment GetModelByCache(int EmploymentId)
		{
			string CacheKey = "EmploymentModel-" + EmploymentId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(EmploymentId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.Employment)objModel;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  ��Ա����
	}
}

