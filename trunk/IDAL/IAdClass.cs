using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IAdClass 的摘要说明。
	/// </summary>
	public interface IAdClass
	{
		#region  成员方法
		/// <summary>
		/// 得到最大ID
		/// </summary>
		int GetMaxId();
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(int AdClassId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		int Add(HOT.Model.AdClass model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.AdClass model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(int AdClassId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.AdClass GetModel(int AdClassId);
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
