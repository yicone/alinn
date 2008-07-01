using System;
using System.Reflection;
using System.Configuration;
namespace HOT.DALFactory
{
	/// <summary>
    /// Abstract Factory pattern to create the DAL。
	/// </summary>
	public sealed class DataAccess
	{
        private static readonly string path = ConfigurationManager.AppSettings["DAL"];        
		public DataAccess()
		{ }

        #region CreateObject 

		//不使用缓存
        private static object CreateObjectNoCache(string path,string CacheKey)
		{		
			try
			{
				object objType = Assembly.Load(path).CreateInstance(CacheKey);	
				return objType;
			}
			catch//(System.Exception ex)
			{
				//string str=ex.Message;// 记录错误日志
				return null;
			}			
			
        }
		//使用缓存
		private static object CreateObject(string path,string CacheKey)
		{			
			object objType = DataCache.GetCache(CacheKey);
			if (objType == null)
			{
				try
				{
					objType = Assembly.Load(path).CreateInstance(CacheKey);					
					DataCache.SetCache(CacheKey, objType);// 写入缓存
				}
				catch//(System.Exception ex)
				{
					//string str=ex.Message;// 记录错误日志
				}
			}
			return objType;
		}
        #endregion

        #region CreateSysManage
        public static HOT.IDAL.ISysManage CreateSysManage()
		{
			//方式1			
			//return (HOT.IDAL.ISysManage)Assembly.Load(path).CreateInstance(path+".SysManage");

			//方式2 			
			string CacheKey = path+".SysManage";	
			object objType=CreateObject(path,CacheKey);
            return (HOT.IDAL.ISysManage)objType;		
		}
		#endregion
        /// <summary>
        /// 创建AL_Ad数据层接口
        /// </summary>
        public static HOT.IDAL.IAd CreateAd()
        {

            string CacheKey = path + ".Ad";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAd)objType;
        }

        /// <summary>
        /// 创建AL_AdGroup数据层接口
        /// </summary>
        public static HOT.IDAL.IAdGroup CreateAdGroup()
        {

            string CacheKey = path + ".AdGroup";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdGroup)objType;
        }
        /// <summary>
        /// 创建AL_Employment数据层接口
        /// </summary>
        public static HOT.IDAL.IEmployment CreateEmployment()
        {

            string CacheKey = path + ".Employment";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IEmployment)objType;
        }
        /// <summary>
        /// 创建AL_Order数据层接口
        /// </summary>
        public static HOT.IDAL.IOrder CreateOrder()
        {

            string CacheKey = path + ".Order";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IOrder)objType;
        }
        /// <summary>
        /// 创建AL_OrderReport数据层接口
        /// </summary>
        public static HOT.IDAL.IOrderReport CreateOrderReport()
        {

            string CacheKey = path + ".OrderReport";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IOrderReport)objType;
        }
        /// <summary>
        /// 创建AL_Site数据层接口
        /// </summary>
        public static HOT.IDAL.ISite CreateSite()
        {

            string CacheKey = path + ".Site";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISite)objType;
        }
        /// <summary>
        /// 创建AL_SiteClass数据层接口
        /// </summary>
        public static HOT.IDAL.ISiteClass CreateSiteClass()
        {

            string CacheKey = path + ".SiteClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISiteClass)objType;
        }
        /// <summary>
        /// 创建AL_User数据层接口
        /// </summary>
        public static HOT.IDAL.IUser CreateUser()
        {

            string CacheKey = path + ".User";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IUser)objType;
        }
        /// <summary>
        /// 创建AL_Zone数据层接口
        /// </summary>
        public static HOT.IDAL.IZone CreateZone()
        {

            string CacheKey = path + ".Zone";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZone)objType;
        }
        /// <summary>
        /// 创建AL_ZoneClass数据层接口
        /// </summary>
        public static HOT.IDAL.IZoneClass CreateZoneClass()
        {

            string CacheKey = path + ".ZoneClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZoneClass)objType;
        }
        /// <summary>
        /// 创建AL_ZoneSize数据层接口
        /// </summary>
        public static HOT.IDAL.IZoneSize CreateZoneSize()
        {

            string CacheKey = path + ".ZoneSize";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZoneSize)objType;
        }
        /// <summary>
        /// 创建News数据层接口
        /// </summary>
        public static HOT.IDAL.INews CreateNews()
        {

            string CacheKey = path + ".News";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.INews)objType;
        }

        /// <summary>
        /// 创建NewsClass数据层接口
        /// </summary>
        public static HOT.IDAL.INewsClass CreateNewsClass()
        {

            string CacheKey = path + ".NewsClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.INewsClass)objType;
        }
        /// <summary>
        /// 创建Store数据层接口
        /// </summary>
        public static HOT.IDAL.IStore CreateStore()
        {

            string CacheKey = path + ".Store";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IStore)objType;
        }
        /// <summary>
        /// 创建ZoneLocation数据层接口
        /// </summary>
        public static HOT.IDAL.IZoneLocation CreateZoneLocation()
        {

            string CacheKey = path + ".ZoneLocation";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZoneLocation)objType;
        }
        /// <summary>
        /// 创建Evaluation数据层接口
        /// </summary>
        public static HOT.IDAL.IEvaluation CreateEvaluation()
        {

            string CacheKey = path + ".Evaluation";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IEvaluation)objType;
        }
        /// 创建Message数据层接口
        /// </summary>
        public static HOT.IDAL.IMessage CreateMessage()
        {

            string CacheKey = path + ".Message";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IMessage)objType;
        }
}
}