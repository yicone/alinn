using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类News。
	/// </summary>
	public class News:INews
	{
		public News()
		{}
		#region  成员方法

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("NewsId", "AL_News"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int NewsId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@NewsId", SqlDbType.Int,4)};
			parameters[0].Value = NewsId;

			int result= DbHelperSQL.RunProcedure("UP_AL_News_Exists",parameters,out rowsAffected);
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
		public int Add(HOT.Model.News model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@NewsId", SqlDbType.Int,4),
					new SqlParameter("@ClassId", SqlDbType.Int,4),
					new SqlParameter("@Title", SqlDbType.NVarChar,200),
					new SqlParameter("@Content", SqlDbType.NText),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.ClassId;
			parameters[2].Value = model.Title;
			parameters[3].Value = model.Content;
			parameters[4].Value = model.CreateDate;

			DbHelperSQL.RunProcedure("UP_AL_News_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.News model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@NewsId", SqlDbType.Int,4),
					new SqlParameter("@ClassId", SqlDbType.Int,4),
					new SqlParameter("@Title", SqlDbType.NVarChar,200),
					new SqlParameter("@Content", SqlDbType.NText),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
			parameters[0].Value = model.NewsId;
			parameters[1].Value = model.ClassId;
			parameters[2].Value = model.Title;
			parameters[3].Value = model.Content;
			parameters[4].Value = model.CreateDate;

			DbHelperSQL.RunProcedure("UP_AL_News_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int NewsId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@NewsId", SqlDbType.Int,4)};
			parameters[0].Value = NewsId;

			DbHelperSQL.RunProcedure("UP_AL_News_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.News GetModel(int NewsId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@NewsId", SqlDbType.Int,4)};
			parameters[0].Value = NewsId;

			HOT.Model.News model=new HOT.Model.News();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_News_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["NewsId"].ToString()!="")
				{
					model.NewsId=int.Parse(ds.Tables[0].Rows[0]["NewsId"].ToString());
				}
				if(ds.Tables[0].Rows[0]["ClassId"].ToString()!="")
				{
					model.ClassId=int.Parse(ds.Tables[0].Rows[0]["ClassId"].ToString());
				}
				model.Title=ds.Tables[0].Rows[0]["Title"].ToString();
				model.Content=ds.Tables[0].Rows[0]["Content"].ToString();
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
			strSql.Append("select NewsId,ClassId,Title,Content,CreateDate ");
			strSql.Append(" FROM AL_News ");
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
			parameters[0].Value = "AL_News";
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

