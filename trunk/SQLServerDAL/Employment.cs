using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类Employment。
	/// </summary>
	public class Employment:IEmployment
	{
		public Employment()
		{}
		#region  成员方法

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("EmploymentId", "AL_Employment"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int EmploymentId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			int result= DbHelperSQL.RunProcedure("UP_AL_Employment_Exists",parameters,out rowsAffected);
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
		public int Add(HOT.Model.Employment model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4),
					new SqlParameter("@EmploymentName", SqlDbType.NVarChar,20)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.EmploymentName;

			DbHelperSQL.RunProcedure("UP_AL_Employment_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.Employment model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4),
					new SqlParameter("@EmploymentName", SqlDbType.NVarChar,20)};
			parameters[0].Value = model.EmploymentId;
			parameters[1].Value = model.EmploymentName;

			DbHelperSQL.RunProcedure("UP_AL_Employment_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int EmploymentId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			DbHelperSQL.RunProcedure("UP_AL_Employment_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Employment GetModel(int EmploymentId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			HOT.Model.Employment model=new HOT.Model.Employment();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_Employment_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["EmploymentId"].ToString()!="")
				{
					model.EmploymentId=int.Parse(ds.Tables[0].Rows[0]["EmploymentId"].ToString());
				}
				model.EmploymentName=ds.Tables[0].Rows[0]["EmploymentName"].ToString();
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
			strSql.Append("select EmploymentId,EmploymentName ");
			strSql.Append(" FROM AL_Employment ");
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
			parameters[0].Value = "AL_Employment";
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

