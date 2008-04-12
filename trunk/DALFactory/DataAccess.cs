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
        /// 创建User数据层接口
        /// </summary>
        public static HOT.IDAL.IUser CreateUser()
        {

            string CacheKey = path + ".User";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IUser)objType;
        }
        /// <summary>
        /// 创建AdClass数据层接口
        /// </summary>
        public static HOT.IDAL.IAdClass CreateAdClass()
        {

            string CacheKey = path + ".AdClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdClass)objType;
        }

        /// <summary>
        /// 创建Ads数据层接口
        /// </summary>
        public static HOT.IDAL.IAds CreateAds()
        {

            string CacheKey = path + ".Ads";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAds)objType;
        }


        /// <summary>
        /// 创建AdSize数据层接口
        /// </summary>
        public static HOT.IDAL.IAdSize CreateAdSize()
        {

            string CacheKey = path + ".AdSize";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdSize)objType;
        }


        /// <summary>
        /// 创建Employment数据层接口
        /// </summary>
        public static HOT.IDAL.IEmployment CreateEmployment()
        {

            string CacheKey = path + ".Employment";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IEmployment)objType;
        }


        /// <summary>
        /// 创建SiteClass数据层接口
        /// </summary>
        public static HOT.IDAL.ISiteClass CreateSiteClass()
        {

            string CacheKey = path + ".SiteClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISiteClass)objType;
        }


        /// <summary>
        /// 创建Site数据层接口
        /// </summary>
        public static HOT.IDAL.ISite CreateSite()
        {

            string CacheKey = path + ".Site";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISite)objType;
        }

}
}