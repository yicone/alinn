using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// 数据访问类Zone。
	/// </summary>
	public class Zone:IZone
	{
		public Zone()
		{}
		#region  成员方法

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(Guid ZoneId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = ZoneId;

			int result= DbHelperSQL.RunProcedure("UP_AL_Zone_Exists",parameters,out rowsAffected);
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
		public void Add(HOT.Model.Zone model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneName", SqlDbType.NVarChar,50),
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
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
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText)};
			parameters[0].Value = model.ZoneId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.ZoneName;
			parameters[3].Value = model.SiteId;
			parameters[4].Value = model.IsWord;
			parameters[5].Value = model.IsImg;
			parameters[6].Value = model.Position;
			parameters[7].Value = model.Size;
			parameters[8].Value = model.Type;
			parameters[9].Value = model.Classes;
			parameters[10].Value = model.KeyWords;
			parameters[11].Value = model.TitleColor;
			parameters[12].Value = model.ContentColor;
			parameters[13].Value = model.UrlColor;
			parameters[14].Value = model.BorderColor;
			parameters[15].Value = model.BgColor;
			parameters[16].Value = model.Grounding;
			parameters[17].Value = model.BgImg;
			parameters[18].Value = model.Corner;
			parameters[19].Value = model.IsLocked;
			parameters[20].Value = model.NeedCheck;
			parameters[21].Value = model.Description;
			parameters[22].Value = model.ZoneCode;

			DbHelperSQL.RunProcedure("UP_AL_Zone_ADD",parameters,out rowsAffected);
		}

		/// <summary>
		///  更新一条数据
		/// </summary>
		public void Update(HOT.Model.Zone model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneName", SqlDbType.NVarChar,50),
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
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
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText)};
			parameters[0].Value = model.ZoneId;
			parameters[1].Value = model.UserId;
			parameters[2].Value = model.ZoneName;
			parameters[3].Value = model.SiteId;
			parameters[4].Value = model.IsWord;
			parameters[5].Value = model.IsImg;
			parameters[6].Value = model.Position;
			parameters[7].Value = model.Size;
			parameters[8].Value = model.Type;
			parameters[9].Value = model.Classes;
			parameters[10].Value = model.KeyWords;
			parameters[11].Value = model.TitleColor;
			parameters[12].Value = model.ContentColor;
			parameters[13].Value = model.UrlColor;
			parameters[14].Value = model.BorderColor;
			parameters[15].Value = model.BgColor;
			parameters[16].Value = model.Grounding;
			parameters[17].Value = model.BgImg;
			parameters[18].Value = model.Corner;
			parameters[19].Value = model.IsLocked;
			parameters[20].Value = model.NeedCheck;
			parameters[21].Value = model.Description;
			parameters[22].Value = model.ZoneCode;

			DbHelperSQL.RunProcedure("UP_AL_Zone_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(Guid ZoneId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = ZoneId;

			DbHelperSQL.RunProcedure("UP_AL_Zone_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public HOT.Model.Zone GetModel(Guid ZoneId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier)};
			parameters[0].Value = ZoneId;

			HOT.Model.Zone model=new HOT.Model.Zone();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_Zone_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["ZoneId"].ToString()!="")
				{
					model.ZoneId=new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
				}
				if(ds.Tables[0].Rows[0]["UserId"].ToString()!="")
				{
					model.UserId=new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
				}
				model.ZoneName=ds.Tables[0].Rows[0]["ZoneName"].ToString();
				if(ds.Tables[0].Rows[0]["SiteId"].ToString()!="")
				{
					model.SiteId=new Guid(ds.Tables[0].Rows[0]["SiteId"].ToString());
				}
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
				model.ZoneCode=ds.Tables[0].Rows[0]["ZoneCode"].ToString();
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
			strSql.Append("select ZoneId,UserId,ZoneName,SiteId,IsWord,IsImg,Position,Size,Type,Classes,KeyWords,TitleColor,ContentColor,UrlColor,BorderColor,BgColor,Grounding,BgImg,Corner,IsLocked,NeedCheck,Description,ZoneCode ");
			strSql.Append(" FROM AL_Zone ");
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
			parameters[0].Value = "AL_Zone";
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

