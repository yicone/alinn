using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类Ads。
	/// </summary>
	public class Ads:IAds
	{
		public Ads()
		{}
		#region  成员方法

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(string AdId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.VarChar,50)};
			parameters[0].Value = AdId;

			int result= DbHelperSQL.RunProcedure("UP_AL_Ads_Exists",parameters,out rowsAffected);
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
		public void Add(HOT.Model.Ads model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.VarChar,16),
					new SqlParameter("@UserId", SqlDbType.VarChar,16),
					new SqlParameter("@SiteId", SqlDbType.VarChar,16),
					new SqlParameter("@IsWord", SqlDbType.TinyInt,1),
					new SqlParameter("@IsImg", SqlDbType.TinyInt,1),
					new SqlParameter("@Position", SqlDbType.TinyInt,1),
					new SqlParameter("@Size", SqlDbType.Int,4),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@Classes", SqlDbType.NVarChar,7),
					new SqlParameter("@KeyWords", SqlDbType.NVarChar,136),
					new SqlParameter("@TitleColor", SqlDbType.VarChar,6),
					new SqlParameter("@ContentColor", SqlDbType.NVarChar,300),
					new SqlParameter("@UrlColor", SqlDbType.VarChar,6),
					new SqlParameter("@BorderColor", SqlDbType.VarChar,6),
					new SqlParameter("@BgColor", SqlDbType.VarChar,6),
					new SqlParameter("@Grounding", SqlDbType.VarChar,6),
					new SqlParameter("@BgImg", SqlDbType.NVarChar,50),
					new SqlParameter("@Corner", SqlDbType.NVarChar,50),
					new SqlParameter("@IsLocked", SqlDbType.TinyInt,1),
					new SqlParameter("@NeedCheck", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText)};
			parameters[0].Value = model.AdId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.SiteId;
			parameters[3].Value = model.IsWord;
			parameters[4].Value = model.IsImg;
			parameters[5].Value = model.Position;
			parameters[6].Value = model.Size;
			parameters[7].Value = model.Type;
			parameters[8].Value = model.Classes;
			parameters[9].Value = model.KeyWords;
			parameters[10].Value = model.TitleColor;
			parameters[11].Value = model.ContentColor;
			parameters[12].Value = model.UrlColor;
			parameters[13].Value = model.BorderColor;
			parameters[14].Value = model.BgColor;
			parameters[15].Value = model.Grounding;
			parameters[16].Value = model.BgImg;
			parameters[17].Value = model.Corner;
			parameters[18].Value = model.IsLocked;
			parameters[19].Value = model.NeedCheck;
			parameters[20].Value = model.Description;

			DbHelperSQL.RunProcedure("UP_AL_Ads_ADD",parameters,out rowsAffected);
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.Ads model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.VarChar,16),
					new SqlParameter("@UserId", SqlDbType.VarChar,16),
					new SqlParameter("@SiteId", SqlDbType.VarChar,16),
					new SqlParameter("@IsWord", SqlDbType.TinyInt,1),
					new SqlParameter("@IsImg", SqlDbType.TinyInt,1),
					new SqlParameter("@Position", SqlDbType.TinyInt,1),
					new SqlParameter("@Size", SqlDbType.Int,4),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@Classes", SqlDbType.NVarChar,7),
					new SqlParameter("@KeyWords", SqlDbType.NVarChar,136),
					new SqlParameter("@TitleColor", SqlDbType.VarChar,6),
					new SqlParameter("@ContentColor", SqlDbType.NVarChar,300),
					new SqlParameter("@UrlColor", SqlDbType.VarChar,6),
					new SqlParameter("@BorderColor", SqlDbType.VarChar,6),
					new SqlParameter("@BgColor", SqlDbType.VarChar,6),
					new SqlParameter("@Grounding", SqlDbType.VarChar,6),
					new SqlParameter("@BgImg", SqlDbType.NVarChar,50),
					new SqlParameter("@Corner", SqlDbType.NVarChar,50),
					new SqlParameter("@IsLocked", SqlDbType.TinyInt,1),
					new SqlParameter("@NeedCheck", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText)};
			parameters[0].Value = model.AdId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.SiteId;
			parameters[3].Value = model.IsWord;
			parameters[4].Value = model.IsImg;
			parameters[5].Value = model.Position;
			parameters[6].Value = model.Size;
			parameters[7].Value = model.Type;
			parameters[8].Value = model.Classes;
			parameters[9].Value = model.KeyWords;
			parameters[10].Value = model.TitleColor;
			parameters[11].Value = model.ContentColor;
			parameters[12].Value = model.UrlColor;
			parameters[13].Value = model.BorderColor;
			parameters[14].Value = model.BgColor;
			parameters[15].Value = model.Grounding;
			parameters[16].Value = model.BgImg;
			parameters[17].Value = model.Corner;
			parameters[18].Value = model.IsLocked;
			parameters[19].Value = model.NeedCheck;
			parameters[20].Value = model.Description;

			DbHelperSQL.RunProcedure("UP_AL_Ads_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(string AdId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.VarChar,50)};
			parameters[0].Value = AdId;

			DbHelperSQL.RunProcedure("UP_AL_Ads_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Ads GetModel(string AdId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.VarChar,50)};
			parameters[0].Value = AdId;

			HOT.Model.Ads model=new HOT.Model.Ads();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_Ads_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				model.AdId=ds.Tables[0].Rows[0]["AdId"].ToString();
				model.UserId=ds.Tables[0].Rows[0]["UserId"].ToString();
				model.SiteId=ds.Tables[0].Rows[0]["SiteId"].ToString();
				if(ds.Tables[0].Rows[0]["IsWord"].ToString()!="")
				{
					model.IsWord=int.Parse(ds.Tables[0].Rows[0]["IsWord"].ToString());
				}
				if(ds.Tables[0].Rows[0]["IsImg"].ToString()!="")
				{
					model.IsImg=int.Parse(ds.Tables[0].Rows[0]["IsImg"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Position"].ToString()!="")
				{
					model.Position=int.Parse(ds.Tables[0].Rows[0]["Position"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Size"].ToString()!="")
				{
					model.Size=int.Parse(ds.Tables[0].Rows[0]["Size"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Type"].ToString()!="")
				{
					model.Type=int.Parse(ds.Tables[0].Rows[0]["Type"].ToString());
				}
				model.Classes=ds.Tables[0].Rows[0]["Classes"].ToString();
				model.KeyWords=ds.Tables[0].Rows[0]["KeyWords"].ToString();
				model.TitleColor=ds.Tables[0].Rows[0]["TitleColor"].ToString();
				model.ContentColor=ds.Tables[0].Rows[0]["ContentColor"].ToString();
				model.UrlColor=ds.Tables[0].Rows[0]["UrlColor"].ToString();
				model.BorderColor=ds.Tables[0].Rows[0]["BorderColor"].ToString();
				model.BgColor=ds.Tables[0].Rows[0]["BgColor"].ToString();
				model.Grounding=ds.Tables[0].Rows[0]["Grounding"].ToString();
				model.BgImg=ds.Tables[0].Rows[0]["BgImg"].ToString();
				model.Corner=ds.Tables[0].Rows[0]["Corner"].ToString();
				if(ds.Tables[0].Rows[0]["IsLocked"].ToString()!="")
				{
					model.IsLocked=int.Parse(ds.Tables[0].Rows[0]["IsLocked"].ToString());
				}
				if(ds.Tables[0].Rows[0]["NeedCheck"].ToString()!="")
				{
					model.NeedCheck=int.Parse(ds.Tables[0].Rows[0]["NeedCheck"].ToString());
				}
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
			strSql.Append("select AdId,UserId,SiteId,IsWord,IsImg,Position,Size,Type,Classes,KeyWords,TitleColor,ContentColor,UrlColor,BorderColor,BgColor,Grounding,BgImg,Corner,IsLocked,NeedCheck,Description ");
			strSql.Append(" FROM AL_Ads ");
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
			parameters[0].Value = "AL_Ads";
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

