using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���ZoneLocation ��ժҪ˵����
	/// </summary>
	public class ZoneLocation
	{
		private readonly IZoneLocation dal=DataAccess.CreateZoneLocation();
		public ZoneLocation()
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
		public bool Exists(int UrlId)
		{
			return dal.Exists(UrlId);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public int  Add(HOT.Model.ZoneLocation model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.ZoneLocation model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int UrlId)
		{
			dal.Delete(UrlId);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.ZoneLocation GetModel(int UrlId)
		{
			return dal.GetModel(UrlId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public HOT.Model.ZoneLocation GetModelByCache(int UrlId)
		{
			string CacheKey = "ZoneLocationModel-" + UrlId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(UrlId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.ZoneLocation)objModel;
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

