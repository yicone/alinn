using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IZone 的摘要说明。
	/// </summary>
	public interface IZone
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(Guid ZoneId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.Zone model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.Zone model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(Guid ZoneId);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.Zone GetModel(Guid ZoneId);
		/// <summary>
		/// 获得数据列表
		/// </summary>
		DataSet GetList(string strWhere);
        DataSet GetList(int startIndex, int endIndex, int doCount);
		/// <summary>
		/// 根据分页获得数据列表
		/// </summary>
//		DataSet GetList(int PageSize,int PageIndex,string strWhere);
		#endregion  成员方法
	}
}
