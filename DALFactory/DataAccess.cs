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
        /// ����User���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IUser CreateUser()
        {

            string CacheKey = path + ".User";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IUser)objType;
        }
        /// <summary>
        /// ����AdClass���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IAdClass CreateAdClass()
        {

            string CacheKey = path + ".AdClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdClass)objType;
        }

        /// <summary>
        /// ����Ads���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IAds CreateAds()
        {

            string CacheKey = path + ".Ads";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAds)objType;
        }


        /// <summary>
        /// ����AdSize���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IAdSize CreateAdSize()
        {

            string CacheKey = path + ".AdSize";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IAdSize)objType;
        }


        /// <summary>
        /// ����Employment���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.IEmployment CreateEmployment()
        {

            string CacheKey = path + ".Employment";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.IEmployment)objType;
        }


        /// <summary>
        /// ����SiteClass���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.ISiteClass CreateSiteClass()
        {

            string CacheKey = path + ".SiteClass";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISiteClass)objType;
        }


        /// <summary>
        /// ����Site���ݲ�ӿ�
        /// </summary>
        public static HOT.IDAL.ISite CreateSite()
        {

            string CacheKey = path + ".Site";
            object objType = CreateObject(path, CacheKey);
            return (HOT.IDAL.ISite)objType;
        }

}
}