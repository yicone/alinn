using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层ISiteClass 的摘要说明。
	/// </summary>
	public interface ISiteClass
	{
		#region  成员方法
		/// <summary>
		/// 得到最大ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(int ClassId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		int Add(HOT.Model.SiteClass model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.SiteClass model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(int ClassId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.SiteClass GetModel(int ClassId);
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
