using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// 业务逻辑类AdGroup 的摘要说明。
	/// </summary>
	public class AdGroup
	{
		private readonly IAdGroup dal=DataAccess.CreateAdGroup();
		public AdGroup()
		{}
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid AdGroupId)
		{
			return dal.Exists(AdGroupId);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public void Add(HOT.Model.AdGroup model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public void Update(HOT.Model.AdGroup model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(Guid AdGroupId)
		{
			dal.Delete(AdGroupId);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.AdGroup GetModel(Guid AdGroupId)
		{
			return dal.GetModel(AdGroupId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中。
		/// </summary>
		public HOT.Model.AdGroup GetModelByCache(Guid AdGroupId)
		{
			string CacheKey = "AdGroupModel-" + AdGroupId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(AdGroupId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.AdGroup)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  成员方法
	}
}

