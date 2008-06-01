using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类Store。
    /// </summary>
    public class Store : IStore
    {
        public Store()
        { }
        #region  成员方法

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid StoreId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@StoreId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = StoreId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Store_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.Store model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@StoreId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Date", SqlDbType.DateTime)};
            parameters[0].Value = model.StoreId;
            parameters[1].Value = model.ZoneId;
            parameters[2].Value = model.UserId;
            parameters[3].Value = model.Date;

            DbHelperSQL.RunProcedure("UP_AL_Store_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.Store model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@StoreId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Date", SqlDbType.DateTime)};
            parameters[0].Value = model.StoreId;
            parameters[1].Value = model.ZoneId;
            parameters[2].Value = model.UserId;
            parameters[3].Value = model.Date;

            DbHelperSQL.RunProcedure("UP_AL_Store_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid StoreId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@StoreId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = StoreId;

            DbHelperSQL.RunProcedure("UP_AL_Store_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.Store GetModel(Guid StoreId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@StoreId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = StoreId;

            HOT.Model.Store model = new HOT.Model.Store();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Store_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["StoreId"].ToString() != "")
                {
                    model.StoreId = new Guid(ds.Tables[0].Rows[0]["StoreId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["ZoneId"].ToString() != "")
                {
                    model.ZoneId = new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Date"].ToString() != "")
                {
                    model.Date = DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString());
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
            strSql.Append("select StoreId,ZoneId,UserId,Date ");
            strSql.Append(" FROM AL_Store ");
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
            parameters[0].Value = "AL_Store";
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

