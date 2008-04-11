using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���AdClass ��ժҪ˵����
	/// </summary>
	public class AdClass
	{
		private readonly IAdClass dal=DataAccess.CreateAdClass();
		public AdClass()
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
		public bool Exists(int AdClassId)
		{
			return dal.Exists(AdClassId);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(HOT.Model.AdClass model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.AdClass model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int AdClassId)
		{
			dal.Delete(AdClassId);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.AdClass GetModel(int AdClassId)
		{
			return dal.GetModel(AdClassId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public HOT.Model.AdClass GetModelByCache(int AdClassId)
		{
			string CacheKey = "AdClassModel-" + AdClassId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(AdClassId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.AdClass)objModel;
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

