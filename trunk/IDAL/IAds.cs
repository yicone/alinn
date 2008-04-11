using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IAds 的摘要说明。
	/// </summary>
	public interface IAds
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(string AdId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.Ads model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.Ads model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(string AdId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.Ads GetModel(string AdId);
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
