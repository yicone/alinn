using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类Site。
    /// </summary>
    public class Site : ISite
    {
        public Site()
        { }
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid SiteId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = SiteId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Site_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.Site model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@SiteName", SqlDbType.NVarChar,32),
					new SqlParameter("@SiteUrl", SqlDbType.NVarChar,128),
					new SqlParameter("@SiteClass", SqlDbType.Int,4),
					new SqlParameter("@SexType", SqlDbType.TinyInt,1),
					new SqlParameter("@AgeType", SqlDbType.TinyInt,1),
					new SqlParameter("@Employments", SqlDbType.VarChar,100),
					new SqlParameter("@Taste", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NText)};
            parameters[0].Value = model.SiteId;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.SiteName;
            parameters[3].Value = model.SiteUrl;
            parameters[4].Value = model.SiteClass;
            parameters[5].Value = model.SexType;
            parameters[6].Value = model.AgeType;
            parameters[7].Value = model.Employments;
            parameters[8].Value = model.Taste;
            parameters[9].Value = model.Description;

            DbHelperSQL.RunProcedure("UP_AL_Site_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.Site model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@SiteName", SqlDbType.NVarChar,32),
					new SqlParameter("@SiteUrl", SqlDbType.NVarChar,128),
					new SqlParameter("@SiteClass", SqlDbType.Int,4),
					new SqlParameter("@SexType", SqlDbType.TinyInt,1),
					new SqlParameter("@AgeType", SqlDbType.TinyInt,1),
					new SqlParameter("@Employments", SqlDbType.VarChar,100),
					new SqlParameter("@Taste", SqlDbType.NVarChar,60),
					new SqlParameter("@Description", SqlDbType.NText)};
            parameters[0].Value = model.SiteId;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.SiteName;
            parameters[3].Value = model.SiteUrl;
            parameters[4].Value = model.SiteClass;
            parameters[5].Value = model.SexType;
            parameters[6].Value = model.AgeType;
            parameters[7].Value = model.Employments;
            parameters[8].Value = model.Taste;
            parameters[9].Value = model.Description;

            DbHelperSQL.RunProcedure("UP_AL_Site_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid SiteId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = SiteId;

            DbHelperSQL.RunProcedure("UP_AL_Site_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.Site GetModel(Guid SiteId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@SiteId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = SiteId;

            HOT.Model.Site model = new HOT.Model.Site();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Site_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["SiteId"].ToString() != "")
                {
                    model.SiteId = new Guid(ds.Tables[0].Rows[0]["SiteId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                model.SiteName = ds.Tables[0].Rows[0]["SiteName"].ToString();
                model.SiteUrl = ds.Tables[0].Rows[0]["SiteUrl"].ToString();
                if (ds.Tables[0].Rows[0]["SiteClass"].ToString() != "")
                {
                    model.SiteClass = int.Parse(ds.Tables[0].Rows[0]["SiteClass"].ToString());
                }
                if (ds.Tables[0].Rows[0]["SexType"].ToString() != "")
                {
                    model.SexType = int.Parse(ds.Tables[0].Rows[0]["SexType"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AgeType"].ToString() != "")
                {
                    model.AgeType = int.Parse(ds.Tables[0].Rows[0]["AgeType"].ToString());
                }
                model.Employments = ds.Tables[0].Rows[0]["Employments"].ToString();
                model.Taste = ds.Tables[0].Rows[0]["Taste"].ToString();
                model.Description = ds.Tables[0].Rows[0]["Description"].ToString();
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
            strSql.Append("select SiteId,UserId,SiteName,SiteUrl,SiteClass,SexType,AgeType,Employments,Taste,Description ");
            strSql.Append(" FROM AL_Site ");
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
            parameters[0].Value = "AL_Site";
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

