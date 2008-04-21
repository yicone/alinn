using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类ZoneSize。
    /// </summary>
    public class ZoneSize : IZoneSize
    {
        public ZoneSize()
        { }
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int SizeId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SizeId", SqlDbType.Int,4)};
            parameters[0].Value = SizeId;

            int result = DbHelperSQL.RunProcedure("UP_AL_ZoneSize_Exists", parameters, out rowsAffected);
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
        public int Add(HOT.Model.ZoneSize model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@SizeCode", SqlDbType.VarChar,10),
					new SqlParameter("@SizeType", SqlDbType.Int,4)};
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.SizeCode;
            parameters[2].Value = model.SizeType;

            DbHelperSQL.RunProcedure("UP_AL_ZoneSize_ADD", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.ZoneSize model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@SizeCode", SqlDbType.VarChar,10),
					new SqlParameter("@SizeType", SqlDbType.Int,4)};
            parameters[0].Value = model.SizeId;
            parameters[1].Value = model.SizeCode;
            parameters[2].Value = model.SizeType;

            DbHelperSQL.RunProcedure("UP_AL_ZoneSize_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(int SizeId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@SizeId", SqlDbType.Int,4)};
            parameters[0].Value = SizeId;

            DbHelperSQL.RunProcedure("UP_AL_ZoneSize_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.ZoneSize GetModel(int SizeId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@SizeId", SqlDbType.Int,4)};
            parameters[0].Value = SizeId;

            HOT.Model.ZoneSize model = new HOT.Model.ZoneSize();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_ZoneSize_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["SizeId"].ToString() != "")
                {
                    model.SizeId = int.Parse(ds.Tables[0].Rows[0]["SizeId"].ToString());
                }
                model.SizeCode = ds.Tables[0].Rows[0]["SizeCode"].ToString();
                if (ds.Tables[0].Rows[0]["SizeType"].ToString() != "")
                {
                    model.SizeType = int.Parse(ds.Tables[0].Rows[0]["SizeType"].ToString());
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
            strSql.Append("select SizeId,SizeCode,SizeType ");
            strSql.Append(" FROM AL_ZoneSize ");
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
            parameters[0].Value = "AL_ZoneSize";
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

