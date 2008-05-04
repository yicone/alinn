using System;
using System.Data;
namespace HOT.IDAL
{
	/// <summary>
	/// 接口层IAd 的摘要说明。
	/// </summary>
	public interface IAd
	{
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		bool Exists(Guid AdId);
        /// <summary>
        /// 判断同一个广告组内是否有某一大小的广告
        /// </summary>
        /// <param name="size">广告大小ID</param>
        /// <param name="adGroupId">广告组ID</param>
        /// <returns></returns>
        bool Exists(int? sizeId, Guid adGroupId);
		/// <summary>
		/// 增加一条数据
		/// </summary>
		void Add(HOT.Model.Ad model);
		/// <summary>
		/// 更新一条数据
		/// </summary>
		void Update(HOT.Model.Ad model);
		/// <summary>
		/// 删除一条数据
		/// </summary>
		void Delete(Guid AdId);
        /// <summary>
        /// 按条件删除数据
        /// </summary>
        /// <param name="strWhere"></param>
        void Delete(string strWhere);
		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		HOT.Model.Ad GetModel(Guid AdId);
        /// <summary>
        /// 在where条件下得到一个实体select top1* from table where strWhere
        /// powered by FZF 20080425
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        HOT.Model.Ad GetModel(string strWhere);
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
