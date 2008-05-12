using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IOrder 的摘要说明。
	/// </summary>
	public interface IOrder
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(Guid OrderId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.Order model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.Order model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(Guid OrderId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.Order GetModel(Guid OrderId);
        /// <summary>
        /// 得到一个对象实体BY UserId
        /// powered by fzf 20080511
        /// </summary>
        HOT.Model.Order GetModelByUserId(Guid UserId);
		/// <summary>
		/// 获得数据列表
		/// </summary>
		DataSet GetList(string strWhere);
		/// <summary>
		/// 根据分页获得数据列表
		/// </summary>
//		DataSet GetList(int PageSize,int PageIndex,string strWhere);
		#endregion  成员方法
	}
}
