using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类Webs。
	/// </summary>
	public class Webs:IWebs
	{
		public Webs()
		{}
		#region  成员方法

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(string WebId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@WebId", SqlDbType.VarChar,50)};
			parameters[0].Value = WebId;

			int result= DbHelperSQL.RunProcedure("UP_AL_Webs_Exists",parameters,out rowsAffected);
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
		public void Add(HOT.Model.Webs model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@WebId", SqlDbType.VarChar,16),
					new SqlParameter("@UserId", SqlDbType.VarChar,16),
					new SqlParameter("@WebName", SqlDbType.NVarChar,32),
					new SqlParameter("@WebUrl", SqlDbType.NVarChar,128),
					new SqlParameter("@WebClass", SqlDbType.Int,4),
					new SqlParameter("@SexType", SqlDbType.TinyInt,1),
					new SqlParameter("@AgeType", SqlDbType.TinyInt,1),
					new SqlParameter("@Employment", SqlDbType.Int,4),
					new SqlParameter("@Taste", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NText)};
			parameters[0].Value = model.WebId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.WebName;
			parameters[3].Value = model.WebUrl;
			parameters[4].Value = model.WebClass;
			parameters[5].Value = model.SexType;
			parameters[6].Value = model.AgeType;
			parameters[7].Value = model.Employment;
			parameters[8].Value = model.Taste;
			parameters[9].Value = model.Description;

			DbHelperSQL.RunProcedure("UP_AL_Webs_ADD",parameters,out rowsAffected);
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.Webs model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@WebId", SqlDbType.VarChar,16),
					new SqlParameter("@UserId", SqlDbType.VarChar,16),
					new SqlParameter("@WebName", SqlDbType.NVarChar,32),
					new SqlParameter("@WebUrl", SqlDbType.NVarChar,128),
					new SqlParameter("@WebClass", SqlDbType.Int,4),
					new SqlParameter("@SexType", SqlDbType.TinyInt,1),
					new SqlParameter("@AgeType", SqlDbType.TinyInt,1),
					new SqlParameter("@Employment", SqlDbType.Int,4),
					new SqlParameter("@Taste", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NText)};
			parameters[0].Value = model.WebId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.WebName;
			parameters[3].Value = model.WebUrl;
			parameters[4].Value = model.WebClass;
			parameters[5].Value = model.SexType;
			parameters[6].Value = model.AgeType;
			parameters[7].Value = model.Employment;
			parameters[8].Value = model.Taste;
			parameters[9].Value = model.Description;

			DbHelperSQL.RunProcedure("UP_AL_Webs_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(string WebId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@WebId", SqlDbType.VarChar,50)};
			parameters[0].Value = WebId;

			DbHelperSQL.RunProcedure("UP_AL_Webs_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Webs GetModel(string WebId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@WebId", SqlDbType.VarChar,50)};
			parameters[0].Value = WebId;

			HOT.Model.Webs model=new HOT.Model.Webs();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_Webs_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				model.WebId=ds.Tables[0].Rows[0]["WebId"].ToString();
				model.UserId=ds.Tables[0].Rows[0]["UserId"].ToString();
				model.WebName=ds.Tables[0].Rows[0]["WebName"].ToString();
				model.WebUrl=ds.Tables[0].Rows[0]["WebUrl"].ToString();
				if(ds.Tables[0].Rows[0]["WebClass"].ToString()!="")
				{
					model.WebClass=int.Parse(ds.Tables[0].Rows[0]["WebClass"].ToString());
				}
				if(ds.Tables[0].Rows[0]["SexType"].ToString()!="")
				{
					model.SexType=int.Parse(ds.Tables[0].Rows[0]["SexType"].ToString());
				}
				if(ds.Tables[0].Rows[0]["AgeType"].ToString()!="")
				{
					model.AgeType=int.Parse(ds.Tables[0].Rows[0]["AgeType"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Employment"].ToString()!="")
				{
					model.Employment=int.Parse(ds.Tables[0].Rows[0]["Employment"].ToString());
				}
				model.Taste=ds.Tables[0].Rows[0]["Taste"].ToString();
				model.Description=ds.Tables[0].Rows[0]["Description"].ToString();
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
			strSql.Append("select WebId,UserId,WebName,WebUrl,WebClass,SexType,AgeType,Employment,Taste,Description ");
			strSql.Append(" FROM AL_Webs ");
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
			parameters[0].Value = "AL_Webs";
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

