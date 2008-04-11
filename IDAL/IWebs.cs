using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IWebs 的摘要说明。
	/// </summary>
	public interface IWebs
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(string WebId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.Webs model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.Webs model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(string WebId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.Webs GetModel(string WebId);
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
