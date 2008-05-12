using System;
using System.Reflection;
using System.Configuration;
namespace HOT.DALFactory
{
	/// <summary>
    /// Abstract Factory pattern to create the DAL��
	/// </summary>
	public sealed class DataAccess
	{
        private static readonly string path = ConfigurationManager.AppSettings["DAL"];        
		public DataAccess()
		{ }

        #region CreateObject 

		//��ʹ�û���
        private static object CreateObjectNoCache(string path,string CacheKey)
		{		
			try
			{
				object objType = Assembly.Load(path).CreateInstance(CacheKey);	
				return objType;
			}
			catch//(System.Exception ex)
			{
				//string str=ex.Message;// ��¼������־
				return null;
			}			
			
        }
		//ʹ�û���
		private static object CreateObject(string path,string CacheKey)
		{			
			object objType = DataCache.GetCache(CacheKey);
			if (objType == null)
			{
				try
				{
					objType = Assembly.Load(path).CreateInstance(CacheKey);					
					DataCache.SetCache(CacheKey, objType);// д�뻺��
				}
				catch//(System.Exception ex)
				{
					//string str=ex.Message;// ��¼������־
				}
			}
			return objType;
		}
        #endregion

        #region CreateSysManage
        public static HOT.IDAL.ISysManage CreateSysManage()
		{
			//��ʽ1			
			//return (HOT.IDAL.ISysManage)Assembly.Load(path).CreateInstance(path+".SysManage");

			//��ʽ2 			
			string CacheKey = path+".SysManage";	
			object objType=CreateObject(path,CacheKey);
            return (HOT.IDAL.ISysManage)objType;		
		}
		#endregion
        /// <summary>
        /// ����AL_Ad���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IAd CreateAd()
        {

            string CacheKey = path + ".Ad";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAd)objType;
        }

        /// <summary>
        /// ����AL_AdGroup���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IAdGroup CreateAdGroup()
        {

            string CacheKey = path + ".AdGroup";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdGroup)objType;
        }
        /// <summary>
        /// ����AL_Employment���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IEmployment CreateEmployment()
        {

            string CacheKey = path + ".Employment";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IEmployment)objType;
        }
        /// <summary>
        /// ����AL_Order���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IOrder CreateOrder()
        {

            string CacheKey = path + ".Order";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IOrder)objType;
        }
        /// <summary>
        /// ����AL_OrderReport���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IOrderReport CreateOrderReport()
        {

            string CacheKey = path + ".OrderReport";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IOrderReport)objType;
        }
        /// <summary>
        /// ����AL_Site���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.ISite CreateSite()
        {

            string CacheKey = path + ".Site";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISite)objType;
        }
        /// <summary>
        /// ����AL_SiteClass���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.ISiteClass CreateSiteClass()
        {

            string CacheKey = path + ".SiteClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISiteClass)objType;
        }
        ///// <summary>
        ///// ����AL_User���ݲ�ӿ�
        ///// </summary>
        //public static HOT.IDAL.IUser CreateUser()
        //{

        //    string CacheKey = path + ".User";
        //    object objType = CreateObject(path, CacheKey);
        //    return (HOT.IDAL.IUser)objType;
        //}
        /// <summary>
        /// ����AL_Zone���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IZone CreateZone()
        {

            string CacheKey = path + ".Zone";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZone)objType;
        }
        /// <summary>
        /// ����AL_ZoneClass���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IZoneClass CreateZoneClass()
        {

            string CacheKey = path + ".ZoneClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZoneClass)objType;
        }
        /// <summary>
        /// ����AL_ZoneSize���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IZoneSize CreateZoneSize()
        {

            string CacheKey = path + ".ZoneSize";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IZoneSize)objType;
        }


}
}