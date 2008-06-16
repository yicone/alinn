using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类ZoneLocation。
	/// </summary>
	public class ZoneLocation:IZoneLocation
	{
		public ZoneLocation()
		{}
		#region  成员方法

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("UrlId", "AL_ZoneLocation"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int UrlId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@UrlId", SqlDbType.Int,4)};
			parameters[0].Value = UrlId;

			int result= DbHelperSQL.RunProcedure("UP_AL_ZoneLocation_Exists",parameters,out rowsAffected);
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
		public int Add(HOT.Model.ZoneLocation model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@UrlId", SqlDbType.Int,4),
					new SqlParameter("@Url", SqlDbType.NVarChar,1024),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.Url;
			parameters[2].Value = model.ZoneId;
			parameters[3].Value = model.CreateDate;

			DbHelperSQL.RunProcedure("UP_AL_ZoneLocation_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.ZoneLocation model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@UrlId", SqlDbType.Int,4),
					new SqlParameter("@Url", SqlDbType.NVarChar,1024),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
			parameters[0].Value = model.UrlId;
			parameters[1].Value = model.Url;
			parameters[2].Value = model.ZoneId;
			parameters[3].Value = model.CreateDate;

			DbHelperSQL.RunProcedure("UP_AL_ZoneLocation_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int UrlId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@UrlId", SqlDbType.Int,4)};
			parameters[0].Value = UrlId;

			DbHelperSQL.RunProcedure("UP_AL_ZoneLocation_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.ZoneLocation GetModel(int UrlId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@UrlId", SqlDbType.Int,4)};
			parameters[0].Value = UrlId;

			HOT.Model.ZoneLocation model=new HOT.Model.ZoneLocation();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_ZoneLocation_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["UrlId"].ToString()!="")
				{
					model.UrlId=int.Parse(ds.Tables[0].Rows[0]["UrlId"].ToString());
				}
				model.Url=ds.Tables[0].Rows[0]["Url"].ToString();
				if(ds.Tables[0].Rows[0]["ZoneId"].ToString()!="")
				{
					model.ZoneId=new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
				}
				if(ds.Tables[0].Rows[0]["CreateDate"].ToString()!="")
				{
					model.CreateDate=DateTime.Parse(ds.Tables[0].Rows[0]["CreateDate"].ToString());
				}
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
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select UrlId,Url,ZoneId,CreateDate ");
			strSql.Append(" FROM AL_ZoneLocation ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
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
			parameters[0].Value = "AL_ZoneLocation";
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

