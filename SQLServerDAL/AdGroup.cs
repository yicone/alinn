using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类AdGroup。
	/// </summary>
	public class AdGroup:IAdGroup
	{
		public AdGroup()
		{}
		#region  成员方法

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid AdGroupId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = AdGroupId;

			int result= DbHelperSQL.RunProcedure("UP_AL_AdGroup_Exists",parameters,out rowsAffected);
			if(result==1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		///  增加一条数据
		/// </summary>
		public void Add(HOT.Model.AdGroup model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@GroupName", SqlDbType.NVarChar,40),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Class", SqlDbType.Int,4),
					new SqlParameter("@KeyWords", SqlDbType.NVarChar,136)};
			parameters[0].Value = model.AdGroupId;
			parameters[1].Value = model.GroupName;
			parameters[2].Value = model.UserId;
			parameters[3].Value = model.Class;
			parameters[4].Value = model.KeyWords;

			DbHelperSQL.RunProcedure("UP_AL_AdGroup_ADD",parameters,out rowsAffected);
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.AdGroup model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@GroupName", SqlDbType.NVarChar,40),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Class", SqlDbType.Int,4),
					new SqlParameter("@KeyWords", SqlDbType.NVarChar,136)};
			parameters[0].Value = model.AdGroupId;
			parameters[1].Value = model.GroupName;
			parameters[2].Value = model.UserId;
			parameters[3].Value = model.Class;
			parameters[4].Value = model.KeyWords;

			DbHelperSQL.RunProcedure("UP_AL_AdGroup_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(Guid AdGroupId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = AdGroupId;

			DbHelperSQL.RunProcedure("UP_AL_AdGroup_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.AdGroup GetModel(Guid AdGroupId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = AdGroupId;

			HOT.Model.AdGroup model=new HOT.Model.AdGroup();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_AdGroup_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["AdGroupId"].ToString()!="")
				{
					model.AdGroupId=new Guid(ds.Tables[0].Rows[0]["AdGroupId"].ToString());
				}
				model.GroupName=ds.Tables[0].Rows[0]["GroupName"].ToString();
				if(ds.Tables[0].Rows[0]["UserId"].ToString()!="")
				{
					model.UserId=new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Class"].ToString()!="")
				{
					model.Class=int.Parse(ds.Tables[0].Rows[0]["Class"].ToString());
				}
				model.KeyWords=ds.Tables[0].Rows[0]["KeyWords"].ToString();
				return model;
			}
			else
			{
				return null;
			}
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
        //public DataSet GetList(string strWhere)
        //{
        //    StringBuilder strSql=new StringBuilder();
        //    strSql.Append("select AdGroupId,GroupName,UserId,Class,KeyWords ");
        //    strSql.Append(" FROM AL_AdGroup ");
        //    if(strWhere.Trim()!="")
        //    {
        //        strSql.Append(" where "+strWhere);
        //    }
        //    return DbHelperSQL.Query(strSql.ToString());
        //}

        /*----------------------------
         * powered by FZF 
         * 20080418
         * 获得指定条件的数据列表
         */

        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <param name="strWhere">查询条件</param>
        /// <returns>dataset</returns>
        public DataSet GetList(string strWhere)
        {
            SqlParameter[] parameters = { new SqlParameter("@strWhere", SqlDbType.NVarChar,300) };
            parameters[0].Value = strWhere;
            return DbHelperSQL.RunProcedure("UP_AL_AdGroup_GetListWhere", parameters, "ds");
        }

        /// <summary>
        /// 获得分页数据列表
        /// powered by FZF 20080422
        /// </summary>
        /// <param name="strWhere">查询条件</param>
        /// <returns>dataset</returns>
        public DataSet GetList(int startIndex, int endIndex,int doCount,string userId)
        {
            SqlParameter[] parameters = { new SqlParameter("@startIndex", SqlDbType.Int,4),
                                          new SqlParameter("@endIndex",SqlDbType.Int,4),
                                          new SqlParameter("@doCount",SqlDbType.TinyInt),
                                          new SqlParameter("@userId",SqlDbType.VarChar,300)};
            parameters[0].Value = startIndex;
            parameters[1].Value = endIndex;
            parameters[2].Value = doCount;
            parameters[3].Value = userId;
            return DbHelperSQL.RunProcedure("MY_AL_AdGroupPage", parameters, "ds");
        }
		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "AL_AdGroup";
			parameters[1].Value = "ID";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  成员方法
	}
}

