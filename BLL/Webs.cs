using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���Webs ��ժҪ˵����
	/// </summary>
	public class Webs
	{
		private readonly IWebs dal=DataAccess.CreateWebs();
		public Webs()
		{}
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(string WebId)
		{
			return dal.Exists(WebId);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Add(HOT.Model.Webs model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.Webs model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(string WebId)
		{
			dal.Delete(WebId);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.Webs GetModel(string WebId)
		{
			return dal.GetModel(WebId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public HOT.Model.Webs GetModelByCache(string WebId)
		{
			string CacheKey = "WebsModel-" + WebId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(WebId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.Webs)objModel;
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

