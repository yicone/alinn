using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// 业务逻辑类Evaluation 的摘要说明。
	/// </summary>
	public class Evaluation
	{
		private readonly IEvaluation dal=DataAccess.CreateEvaluation();
		public Evaluation()
		{}
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid EvaluationId)
		{
			return dal.Exists(EvaluationId);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public void Add(HOT.Model.Evaluation model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public void Update(HOT.Model.Evaluation model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(Guid EvaluationId)
		{
			dal.Delete(EvaluationId);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Evaluation GetModel(Guid EvaluationId)
		{
			return dal.GetModel(EvaluationId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中。
		/// </summary>
		public HOT.Model.Evaluation GetModelByCache(Guid EvaluationId)
		{
			string CacheKey = "EvaluationModel-" + EvaluationId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(EvaluationId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.Evaluation)objModel;
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

