using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类Order。
    /// </summary>
    public class Order : IOrder
    {
        public Order()
        { }
        #region  成员方法

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid OrderId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Order_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.Order model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@OrderName", SqlDbType.NVarChar,200),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@StartDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@AuditState", SqlDbType.TinyInt,1),
					new SqlParameter("@PerPoint", SqlDbType.Decimal,9),
					new SqlParameter("@EverydayPrice", SqlDbType.Decimal,9),
					new SqlParameter("@Price", SqlDbType.Decimal,9)};
            parameters[0].Value = model.OrderId;
            parameters[1].Value = model.OrderName;
            parameters[2].Value = model.UserId;
            parameters[3].Value = model.AdId;
            parameters[4].Value = model.ZoneId;
            parameters[5].Value = model.StartDate;
            parameters[6].Value = model.EndDate;
            parameters[7].Value = model.AuditState;
            parameters[8].Value = model.PerPoint;
            parameters[9].Value = model.EverydayPrice;
            parameters[10].Value = model.Price;

            DbHelperSQL.RunProcedure("UP_AL_Order_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.Order model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@OrderName", SqlDbType.NVarChar,200),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@StartDate", SqlDbType.DateTime),
					new SqlParameter("@EndDate", SqlDbType.DateTime),
					new SqlParameter("@AuditState", SqlDbType.TinyInt,1),
					new SqlParameter("@PerPoint", SqlDbType.Decimal,9),
					new SqlParameter("@EverydayPrice", SqlDbType.Decimal,9),
					new SqlParameter("@Price", SqlDbType.Decimal,9),
					new SqlParameter("@Payment", SqlDbType.TinyInt,1),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.OrderId;
            parameters[1].Value = model.OrderName;
            parameters[2].Value = model.UserId;
            parameters[3].Value = model.AdId;
            parameters[4].Value = model.ZoneId;
            parameters[5].Value = model.StartDate;
            parameters[6].Value = model.EndDate;
            parameters[7].Value = model.AuditState;
            parameters[8].Value = model.PerPoint;
            parameters[9].Value = model.EverydayPrice;
            parameters[10].Value = model.Price;
            parameters[11].Value = model.Payment;
            parameters[12].Value = model.CreateDate;

            DbHelperSQL.RunProcedure("UP_AL_Order_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid OrderId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderId;

            DbHelperSQL.RunProcedure("UP_AL_Order_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.Order GetModel(Guid OrderId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = OrderId;

            HOT.Model.Order model = new HOT.Model.Order();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Order_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["OrderId"].ToString() != "")
                {
                    model.OrderId = new Guid(ds.Tables[0].Rows[0]["OrderId"].ToString());
                }
                model.OrderName = ds.Tables[0].Rows[0]["OrderName"].ToString();
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AdId"].ToString() != "")
                {
                    model.AdId = new Guid(ds.Tables[0].Rows[0]["AdId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["ZoneId"].ToString() != "")
                {
                    model.ZoneId = new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["StartDate"].ToString() != "")
                {
                    model.StartDate = DateTime.Parse(ds.Tables[0].Rows[0]["StartDate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["EndDate"].ToString() != "")
                {
                    model.EndDate = DateTime.Parse(ds.Tables[0].Rows[0]["EndDate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AuditState"].ToString() != "")
                {
                    model.AuditState = int.Parse(ds.Tables[0].Rows[0]["AuditState"].ToString());
                }
                if (ds.Tables[0].Rows[0]["PerPoint"].ToString() != "")
                {
                    model.PerPoint = decimal.Parse(ds.Tables[0].Rows[0]["PerPoint"].ToString());
                }
                if (ds.Tables[0].Rows[0]["EverydayPrice"].ToString() != "")
                {
                    model.EverydayPrice = decimal.Parse(ds.Tables[0].Rows[0]["EverydayPrice"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Price"].ToString() != "")
                {
                    model.Price = decimal.Parse(ds.Tables[0].Rows[0]["Price"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Payment"].ToString() != "")
                {
                    model.Payment = int.Parse(ds.Tables[0].Rows[0]["Payment"].ToString());
                }
                if (ds.Tables[0].Rows[0]["CreateDate"].ToString() != "")
                {
                    model.CreateDate = DateTime.Parse(ds.Tables[0].Rows[0]["CreateDate"].ToString());
                }
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 得到一个对象实体BY UserId
        /// powered by fzf 20080511
        /// </summary>
        public HOT.Model.Order GetModelByUserId(Guid UserId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = UserId;

            HOT.Model.Order model = new HOT.Model.Order();
            DataSet ds = DbHelperSQL.RunProcedure("MY_AL_ShowOrderByUserId", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["OrderId"].ToString() != "")
                {
                    model.OrderId = new Guid(ds.Tables[0].Rows[0]["OrderId"].ToString());
                }
                model.OrderName = ds.Tables[0].Rows[0]["OrderName"].ToString();
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AdId"].ToString() != "")
                {
                    model.AdId = new Guid(ds.Tables[0].Rows[0]["AdId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["ZoneId"].ToString() != "")
                {
                    model.ZoneId = new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["StartDate"].ToString() != "")
                {
                    model.StartDate = DateTime.Parse(ds.Tables[0].Rows[0]["StartDate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["EndDate"].ToString() != "")
                {
                    model.EndDate = DateTime.Parse(ds.Tables[0].Rows[0]["EndDate"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AuditState"].ToString() != "")
                {
                    model.AuditState = int.Parse(ds.Tables[0].Rows[0]["AuditState"].ToString());
                }
                if (ds.Tables[0].Rows[0]["PerPoint"].ToString() != "")
                {
                    model.PerPoint = decimal.Parse(ds.Tables[0].Rows[0]["PerPoint"].ToString());
                }
                if (ds.Tables[0].Rows[0]["EverydayPrice"].ToString() != "")
                {
                    model.EverydayPrice = decimal.Parse(ds.Tables[0].Rows[0]["EverydayPrice"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Price"].ToString() != "")
                {
                    model.Price = decimal.Parse(ds.Tables[0].Rows[0]["Price"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Payment"].ToString() != "")
                {
                    model.Payment = int.Parse(ds.Tables[0].Rows[0]["Payment"].ToString());
                }
                if (ds.Tables[0].Rows[0]["CreateDate"].ToString() != "")
                {
                    model.CreateDate = DateTime.Parse(ds.Tables[0].Rows[0]["CreateDate"].ToString());
                }
                    model.Title = ds.Tables[0].Rows[0]["Title"].ToString();
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
            strSql.Append("select OrderId,OrderName,UserId,AdId,ZoneId,StartDate,EndDate,AuditState,PerPoint,EverydayPrice,Price,Payment,CreateDate ");
            strSql.Append(" FROM AL_Order ");
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
            parameters[0].Value = "AL_Order";
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

