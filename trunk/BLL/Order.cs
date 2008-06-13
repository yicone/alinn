using System;
using System.Data;
using HOT.Common;
using HOT.Model;
using HOT.DALFactory;
using HOT.IDAL;
namespace HOT.BLL
{
	/// <summary>
	/// ҵ���߼���Order ��ժҪ˵����
	/// </summary>
	public class Order
	{
		private readonly IOrder dal=DataAccess.CreateOrder();
		public Order()
		{}
		#region  ��Ա����
		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(Guid OrderId)
		{
			return dal.Exists(OrderId);
		}
        /// <summary>
        /// �Ƿ���Թ���
        /// </summary>
        public bool Exists(Guid zoneId, DateTime date)
        {
            return dal.Exists(zoneId, date);
        }
		/// <summary>
		/// ����һ������
		/// </summary>
		public void Add(HOT.Model.Order model)
		{
			dal.Add(model);
		}

		/// <summary>
		/// ����һ������
		/// </summary>
		public void Update(HOT.Model.Order model)
		{
			dal.Update(model);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(Guid OrderId)
		{
			dal.Delete(OrderId);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.Order GetModel(Guid OrderId)
		{
			return dal.GetModel(OrderId);
		}

		/// <summary>
		/// �õ�һ������ʵ�壬�ӻ����С�
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
        /// �õ�һ������ʵ��BY UserId
        /// powered by fzf 20080511
        /// </summary>
        public HOT.Model.Order GetModelByUserId(Guid UserId)
        {
            return dal.GetModelByUserId(UserId);
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

