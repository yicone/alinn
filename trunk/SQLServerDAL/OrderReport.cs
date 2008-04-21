using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类OrderReport。
    /// </summary>
    public class OrderReport : IOrderReport
    {
        public OrderReport()
        { }
        #region  成员方法

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid OrderReportId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderReportId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderReportId;

            int result = DbHelperSQL.RunProcedure("UP_AL_OrderReport_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.OrderReport model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderReportId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Date", SqlDbType.DateTime),
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@PV", SqlDbType.Int,4),
					new SqlParameter("@PointNum", SqlDbType.Int,4),
					new SqlParameter("@Price", SqlDbType.Decimal,9)};
            parameters[0].Value = model.OrderReportId;
            parameters[1].Value = model.Date;
            parameters[2].Value = model.OrderId;
            parameters[3].Value = model.PV;
            parameters[4].Value = model.PointNum;
            parameters[5].Value = model.Price;

            DbHelperSQL.RunProcedure("UP_AL_OrderReport_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.OrderReport model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderReportId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Date", SqlDbType.DateTime),
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@PV", SqlDbType.Int,4),
					new SqlParameter("@PointNum", SqlDbType.Int,4),
					new SqlParameter("@Price", SqlDbType.Decimal,9)};
            parameters[0].Value = model.OrderReportId;
            parameters[1].Value = model.Date;
            parameters[2].Value = model.OrderId;
            parameters[3].Value = model.PV;
            parameters[4].Value = model.PointNum;
            parameters[5].Value = model.Price;

            DbHelperSQL.RunProcedure("UP_AL_OrderReport_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid OrderReportId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderReportId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderReportId;

            DbHelperSQL.RunProcedure("UP_AL_OrderReport_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.OrderReport GetModel(Guid OrderReportId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@OrderReportId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderReportId;

            HOT.Model.OrderReport model = new HOT.Model.OrderReport();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_OrderReport_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["OrderReportId"].ToString() != "")
                {
                    model.OrderReportId = new Guid(ds.Tables[0].Rows[0]["OrderReportId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Date"].ToString() != "")
                {
                    model.Date = DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString());
                }
                if (ds.Tables[0].Rows[0]["OrderId"].ToString() != "")
                {
                    model.OrderId = new Guid(ds.Tables[0].Rows[0]["OrderId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["PV"].ToString() != "")
                {
                    model.PV = int.Parse(ds.Tables[0].Rows[0]["PV"].ToString());
                }
                if (ds.Tables[0].Rows[0]["PointNum"].ToString() != "")
                {
                    model.PointNum = int.Parse(ds.Tables[0].Rows[0]["PointNum"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Price"].ToString() != "")
                {
                    model.Price = decimal.Parse(ds.Tables[0].Rows[0]["Price"].ToString());
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
            strSql.Append("select OrderReportId,Date,OrderId,PV,PointNum,Price ");
            strSql.Append(" FROM AL_OrderReport ");
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
            parameters[0].Value = "AL_OrderReport";
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

