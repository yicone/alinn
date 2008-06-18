using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;

using System.Collections;

namespace HOT.BLL
{
	/// <summary>
	/// 业务逻辑类Order 的摘要说明。
	/// </summary>
	public class Order
	{
		private readonly IOrder dal=DataAccess.CreateOrder();
		public Order()
		{}
		#region  成员方法
		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid OrderId)
		{
			return dal.Exists(OrderId);
		}
        /// <summary>
        /// 是否可以购买
        /// </summary>
        public bool Exists(Guid zoneId, DateTime date)
        {
            return dal.Exists(zoneId, date);
        }
        /// <summary>
        /// 得到购买的日期数组
        /// </summary>
        /// <param name="zoneId"></param>
        /// <param name="checkDate"></param>
        /// <returns></returns>
        public static ArrayList getCouldBuy(Guid zoneId, DateTime checkDate)
        {
            int year = checkDate.Year;
            int month = checkDate.Month;
            int today = checkDate.Day;
            ArrayList arraylist = new ArrayList();
            int daysCount = HOT.Common.Date.GetMonthDaysCount(year, month);
            for (int i = 1; i <= daysCount; i++)
            {
                int add = i - today;
                DateTime datetime = checkDate.AddDays(add);
                HOT.BLL.Order oBLL = new HOT.BLL.Order();
                if (!oBLL.Exists(zoneId, datetime.Date))
                {
                    if (datetime.Year >= DateTime.Now.Year && datetime.Month >= DateTime.Now.Month && datetime.Day > DateTime.Now.Day)
                    {
                        arraylist.Add(datetime.Day);
                    }
                    else
                    {
                        continue;
                    }
                }
            }
            return arraylist;
        }
		/// <summary>
		/// 增加一条数据
		/// </summary>
		public void Add(HOT.Model.Order model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public void Update(HOT.Model.Order model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(Guid OrderId)
		{
			dal.Delete(OrderId);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Order GetModel(Guid OrderId)
		{
			return dal.GetModel(OrderId);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中。
		/// </summary>
		public HOT.Model.Order GetModelByCache(Guid OrderId)
		{
			string CacheKey = "OrderModel-" + OrderId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(OrderId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.Order)objModel;
		}
        /// <summary>
        /// 得到一个对象实体BY UserId
        /// powered by fzf 20080511
        /// </summary>
        public HOT.Model.Order GetModelByUserId(Guid UserId)
        {
            return dal.GetModelByUserId(UserId);
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

