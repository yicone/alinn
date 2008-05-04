using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IAdGroup 的摘要说明。
	/// </summary>
	public interface IAdGroup
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(Guid AdGroupId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.AdGroup model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.AdGroup model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(Guid AdGroupId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.AdGroup GetModel(Guid AdGroupId);
		/// <summary>
		/// 获得数据列表
		/// </summary>
		DataSet GetList(string strWhere);
        /// <summary>
        /// 获得分页数据列表
        /// powered by FZF 20080422
        /// </summary>
        /// <param name="strWhere">查询条件</param>
        /// <returns>dataset</returns>
        DataSet GetList(int startIndex, int endIndex,int doCount,string userId);
		/// <summary>
		/// 根据分页获得数据列表
		/// </summary>
//		DataSet GetList(int PageSize,int PageIndex,string strWhere);
		#endregion  成员方法
	}
}
