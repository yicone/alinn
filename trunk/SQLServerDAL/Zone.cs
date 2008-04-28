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
    public class Zone : IZone
    {
        public Zone()
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
        public void Add(HOT.Model.Zone model)
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
					new SqlParameter("@NeedAuditing", SqlDbType.TinyInt,1),
					new SqlParameter("@AllowAdultAd", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText),
					new SqlParameter("@WeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@RecommendWeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@ZoneState", SqlDbType.TinyInt,1),
                    new SqlParameter("@ZoneStyle", SqlDbType.VarChar, 100)};
            //yicone
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.ZoneName;
            parameters[3].Value = model.SiteId;
            parameters[4].Value = model.MediaType;
            parameters[5].Value = model.InFirst;
            parameters[6].Value = model.SizeId;
            parameters[7].Value = model.TransType;
            parameters[8].Value = model.ClassIds;
            parameters[9].Value = model.Keywords;
            parameters[10].Value = model.NeedAuditing;
            parameters[11].Value = model.AllowAdultAd;
            parameters[12].Value = model.Description;
            parameters[13].Value = model.ZoneCode;
            parameters[14].Value = model.WeekPrice;
            parameters[15].Value = model.RecommendWeekPrice;
            parameters[16].Value = model.ZoneState;
            parameters[17].Value = model.ZoneStyle;

            DbHelperSQL.RunProcedure("UP_AL_Zone_ADD", parameters, out rowsAffected);
            //yicone
            model.ZoneId = new Guid(parameters[0].Value.ToString());
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
					new SqlParameter("@MediaType", SqlDbType.TinyInt,1),
					new SqlParameter("@InFirst", SqlDbType.TinyInt,1),
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@TransType", SqlDbType.TinyInt,1),
					new SqlParameter("@ClassIds", SqlDbType.NVarChar,7),
					new SqlParameter("@Keywords", SqlDbType.NVarChar,136),
					new SqlParameter("@NeedAuditing", SqlDbType.TinyInt,1),
					new SqlParameter("@AllowAdultAd", SqlDbType.TinyInt,1),
					new SqlParameter("@Description", SqlDbType.NText),
					new SqlParameter("@ZoneCode", SqlDbType.NText),
					new SqlParameter("@WeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@RecommendWeekPrice", SqlDbType.Decimal,9),
					new SqlParameter("@ZoneState", SqlDbType.TinyInt,1),
                    new SqlParameter("@ZoneStyle", SqlDbType.VarChar, 100)};
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
            parameters[10].Value = model.NeedAuditing;
            parameters[11].Value = model.AllowAdultAd;
            parameters[12].Value = model.Description;
            parameters[13].Value = model.ZoneCode;
            parameters[14].Value = model.WeekPrice;
            parameters[15].Value = model.RecommendWeekPrice;
            parameters[16].Value = model.ZoneState;
            parameters[17].Value = model.ZoneStyle;


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
        public HOT.Model.Zone GetModel(Guid ZoneId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = ZoneId;

            HOT.Model.Zone model = new HOT.Model.Zone();
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
                model.ZoneStyle = ds.Tables[0].Rows[0]["ZoneStyle"].ToString();
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
            strSql.Append("select ZoneId,UserId,ZoneName,SiteId,MediaType,InFirst,SizeId,TransType,ClassIds,Keywords,NeedAuditing,AllowAdultAd,Description,ZoneCode,WeekPrice,RecommendWeekPrice,ZoneState,ZoneStyle ");
            strSql.Append(" FROM AL_Zone ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 获得分页数据列表
        /// powered by FZF 20080422
        /// </summary>
        /// <param name="strWhere">查询条件</param>
        /// <returns>dataset</returns>
        public DataSet GetList(int startIndex,int endIndex,int doCount)
        {
            SqlParameter[] parameters = { new SqlParameter("@startIndex", SqlDbType.Int,4),
                                          new SqlParameter("@endIndex",SqlDbType.Int,4),
                                          new SqlParameter("@docount",SqlDbType.TinyInt)};
            parameters[0].Value =startIndex;
            parameters[1].Value = endIndex;
            parameters[2].Value = doCount;
            return DbHelperSQL.RunProcedure("MY_AL_ZonePage", parameters, "ds");
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

