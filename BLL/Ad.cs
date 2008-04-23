using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���Ad ��ժҪ˵����
	/// </summary>
	public class Ad
	{
		private readonly IAd dal=DataAccess.CreateAd();
		public Ad()
		{}
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid AdId)
		{
			return dal.Exists(AdId);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Add(HOT.Model.Ad model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.Ad model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(Guid AdId)
		{
			dal.Delete(AdId);
		}
        /// <summary>
        /// ������ɾ������
        /// </summary>
        /// <param name="strWhere"></param>
        public void Delete(string strWhere)
        {
            dal.Delete(strWhere);
        }
		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.Ad GetModel(Guid AdId)
		{
			return dal.GetModel(AdId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
		/// </summary>
		public HOT.Model.Ad GetModelByCache(Guid AdId)
		{
			string CacheKey = "AdModel-" + AdId;
			object objModel = HOT.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(AdId);
					if (objModel != null)
					{
						int ModelCache = HOT.Common.ConfigHelper.GetConfigInt("ModelCache");
						HOT.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (HOT.Model.Ad)objModel;
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}
		/// <summary>
		/// ��������б�
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  ��Ա����
	}
}

