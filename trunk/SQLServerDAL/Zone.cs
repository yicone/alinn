using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using Maticsoft.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类AL_Zone。
    /// </summary>
    public class AL_Zone : IAL_Zone
    {
        public AL_Zone()
        { }
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

            int result = DbHelperSQL.RunProcedure("UP_AL_Zone_Exists", parameters, out rowsAffected);
            if (result == 1)
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
        public void Add(HOT.Model.AL_Zone model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneName", SqlDbType.NVarChar,50),
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@MediaType", SqlDbType.TinyInt,1),
					new SqlParameter("@InFirst", SqlDbType.TinyInt,1),
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@TransType", SqlDbType.TinyInt,1),
					new SqlParameter("@ClassIds", SqlDbType.NVarChar,7),
					new SqlParameter("@Keywords", SqlDbType.NVarChar,136),
					new SqlParameter("@TitleColor", SqlDbType.VarChar,6),
					new SqlParameter("@DescriptionColor", SqlDbType.NVarChar,6),
					new SqlParameter("@LinkColor", SqlDbType.VarChar,6),
					new SqlParameter("@BorderColor", SqlDbType.VarChar,6),
					new SqlParameter("@BgColor", SqlDbType.VarChar,6),
					new SqlParameter("@Grounding", SqlDbType.VarChar,6),
					new SqlParameter("@BgImg", SqlDbType.NVarChar,50),
					new SqlParameter("@CornerImg", SqlDbType.NVarChar,50),
					new SqlParameter("@NeedAuditing", SqlDbType.TinyInt,1),
					new SqlParameter("@AllowAdultAd", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText),
					new SqlParameter("@WeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@RecommendWeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@ZoneState", SqlDbType.TinyInt,1)};
            parameters[0].Value = model.ZoneId;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.ZoneName;
            parameters[3].Value = model.SiteId;
            parameters[4].Value = model.MediaType;
            parameters[5].Value = model.InFirst;
            parameters[6].Value = model.SizeId;
            parameters[7].Value = model.TransType;
            parameters[8].Value = model.ClassIds;
            parameters[9].Value = model.Keywords;
            parameters[10].Value = model.TitleColor;
            parameters[11].Value = model.DescriptionColor;
            parameters[12].Value = model.LinkColor;
            parameters[13].Value = model.BorderColor;
            parameters[14].Value = model.BgColor;
            parameters[15].Value = model.Grounding;
            parameters[16].Value = model.BgImg;
            parameters[17].Value = model.CornerImg;
            parameters[18].Value = model.NeedAuditing;
            parameters[19].Value = model.AllowAdultAd;
            parameters[20].Value = model.Description;
            parameters[21].Value = model.ZoneCode;
            parameters[22].Value = model.WeekPrice;
            parameters[23].Value = model.RecommendWeekPrice;
            parameters[24].Value = model.ZoneState;

            DbHelperSQL.RunProcedure("UP_AL_Zone_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.AL_Zone model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneName", SqlDbType.NVarChar,50),
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@MediaType", SqlDbType.TinyInt,1),
					new SqlParameter("@InFirst", SqlDbType.TinyInt,1),
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@TransType", SqlDbType.TinyInt,1),
					new SqlParameter("@ClassIds", SqlDbType.NVarChar,7),
					new SqlParameter("@Keywords", SqlDbType.NVarChar,136),
					new SqlParameter("@TitleColor", SqlDbType.VarChar,6),
					new SqlParameter("@DescriptionColor", SqlDbType.NVarChar,6),
					new SqlParameter("@LinkColor", SqlDbType.VarChar,6),
					new SqlParameter("@BorderColor", SqlDbType.VarChar,6),
					new SqlParameter("@BgColor", SqlDbType.VarChar,6),
					new SqlParameter("@Grounding", SqlDbType.VarChar,6),
					new SqlParameter("@BgImg", SqlDbType.NVarChar,50),
					new SqlParameter("@CornerImg", SqlDbType.NVarChar,50),
					new SqlParameter("@NeedAuditing", SqlDbType.TinyInt,1),
					new SqlParameter("@AllowAdultAd", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText),
					new SqlParameter("@WeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@RecommendWeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@ZoneState", SqlDbType.TinyInt,1)};
            parameters[0].Value = model.ZoneId;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.ZoneName;
            parameters[3].Value = model.SiteId;
            parameters[4].Value = model.MediaType;
            parameters[5].Value = model.InFirst;
            parameters[6].Value = model.SizeId;
            parameters[7].Value = model.TransType;
            parameters[8].Value = model.ClassIds;
            parameters[9].Value = model.Keywords;
            parameters[10].Value = model.TitleColor;
            parameters[11].Value = model.DescriptionColor;
            parameters[12].Value = model.LinkColor;
            parameters[13].Value = model.BorderColor;
            parameters[14].Value = model.BgColor;
            parameters[15].Value = model.Grounding;
            parameters[16].Value = model.BgImg;
            parameters[17].Value = model.CornerImg;
            parameters[18].Value = model.NeedAuditing;
            parameters[19].Value = model.AllowAdultAd;
            parameters[20].Value = model.Description;
            parameters[21].Value = model.ZoneCode;
            parameters[22].Value = model.WeekPrice;
            parameters[23].Value = model.RecommendWeekPrice;
            parameters[24].Value = model.ZoneState;

            DbHelperSQL.RunProcedure("UP_AL_Zone_Update", parameters, out rowsAffected);
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

            DbHelperSQL.RunProcedure("UP_AL_Zone_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.AL_Zone GetModel(Guid ZoneId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = ZoneId;

            HOT.Model.AL_Zone model = new HOT.Model.AL_Zone();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Zone_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["ZoneId"].ToString() != "")
                {
                    model.ZoneId = new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                model.ZoneName = ds.Tables[0].Rows[0]["ZoneName"].ToString();
                if (ds.Tables[0].Rows[0]["SiteId"].ToString() != "")
                {
                    model.SiteId = new Guid(ds.Tables[0].Rows[0]["SiteId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["MediaType"].ToString() != "")
                {
                    model.MediaType = int.Parse(ds.Tables[0].Rows[0]["MediaType"].ToString());
                }
                if (ds.Tables[0].Rows[0]["InFirst"].ToString() != "")
                {
                    model.InFirst = int.Parse(ds.Tables[0].Rows[0]["InFirst"].ToString());
                }
                if (ds.Tables[0].Rows[0]["SizeId"].ToString() != "")
                {
                    model.SizeId = int.Parse(ds.Tables[0].Rows[0]["SizeId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["TransType"].ToString() != "")
                {
                    model.TransType = int.Parse(ds.Tables[0].Rows[0]["TransType"].ToString());
                }
                model.ClassIds = ds.Tables[0].Rows[0]["ClassIds"].ToString();
                model.Keywords = ds.Tables[0].Rows[0]["Keywords"].ToString();
                model.TitleColor = ds.Tables[0].Rows[0]["TitleColor"].ToString();
                model.DescriptionColor = ds.Tables[0].Rows[0]["DescriptionColor"].ToString();
                model.LinkColor = ds.Tables[0].Rows[0]["LinkColor"].ToString();
                model.BorderColor = ds.Tables[0].Rows[0]["BorderColor"].ToString();
                model.BgColor = ds.Tables[0].Rows[0]["BgColor"].ToString();
                model.Grounding = ds.Tables[0].Rows[0]["Grounding"].ToString();
                model.BgImg = ds.Tables[0].Rows[0]["BgImg"].ToString();
                model.CornerImg = ds.Tables[0].Rows[0]["CornerImg"].ToString();
                if (ds.Tables[0].Rows[0]["NeedAuditing"].ToString() != "")
                {
                    model.NeedAuditing = int.Parse(ds.Tables[0].Rows[0]["NeedAuditing"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AllowAdultAd"].ToString() != "")
                {
                    model.AllowAdultAd = int.Parse(ds.Tables[0].Rows[0]["AllowAdultAd"].ToString());
                }
                model.Description = ds.Tables[0].Rows[0]["Description"].ToString();
                model.ZoneCode = ds.Tables[0].Rows[0]["ZoneCode"].ToString();
                if (ds.Tables[0].Rows[0]["WeekPrice"].ToString() != "")
                {
                    model.WeekPrice = decimal.Parse(ds.Tables[0].Rows[0]["WeekPrice"].ToString());
                }
                if (ds.Tables[0].Rows[0]["RecommendWeekPrice"].ToString() != "")
                {
                    model.RecommendWeekPrice = decimal.Parse(ds.Tables[0].Rows[0]["RecommendWeekPrice"].ToString());
                }
                if (ds.Tables[0].Rows[0]["ZoneState"].ToString() != "")
                {
                    model.ZoneState = int.Parse(ds.Tables[0].Rows[0]["ZoneState"].ToString());
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
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,TitleColor,DescriptionColor,LinkColor,BorderColor,BgColor,Grounding,BgImg,CornerImg,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState ");
            strSql.Append(" FROM AL_Zone ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
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

