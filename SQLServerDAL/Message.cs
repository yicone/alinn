using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类Message。
    /// </summary>
    public class Message : IMessage
    {
        public Message()
        { }
        #region  成员方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int MessageId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@MessageId", SqlDbType.Int,4)};
            parameters[0].Value = MessageId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Message_Exists", parameters, out rowsAffected);
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
        public int Add(HOT.Model.Message model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@MessageId", SqlDbType.Int,4),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,200),
					new SqlParameter("@MessageContent", SqlDbType.NVarChar,1000),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.ZoneId;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.MessageContent;
            parameters[5].Value = model.CreateDate;

            DbHelperSQL.RunProcedure("UP_AL_Message_ADD", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.Message model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@MessageId", SqlDbType.Int,4),
					new SqlParameter("@UserId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@ZoneId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,200),
					new SqlParameter("@MessageContent", SqlDbType.NVarChar,1000),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.MessageId;
            parameters[1].Value = model.UserId;
            parameters[2].Value = model.ZoneId;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.MessageContent;
            parameters[5].Value = model.CreateDate;

            DbHelperSQL.RunProcedure("UP_AL_Message_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(int MessageId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@MessageId", SqlDbType.Int,4)};
            parameters[0].Value = MessageId;

            DbHelperSQL.RunProcedure("UP_AL_Message_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.Message GetModel(int MessageId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@MessageId", SqlDbType.Int,4)};
            parameters[0].Value = MessageId;

            HOT.Model.Message model = new HOT.Model.Message();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Message_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["MessageId"].ToString() != "")
                {
                    model.MessageId = int.Parse(ds.Tables[0].Rows[0]["MessageId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["UserId"].ToString() != "")
                {
                    model.UserId = new Guid(ds.Tables[0].Rows[0]["UserId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["ZoneId"].ToString() != "")
                {
                    model.ZoneId = new Guid(ds.Tables[0].Rows[0]["ZoneId"].ToString());
                }
                model.Title = ds.Tables[0].Rows[0]["Title"].ToString();
                model.MessageContent = ds.Tables[0].Rows[0]["MessageContent"].ToString();
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
        /// 获得数据列表
        /// powered by FZF
        /// </summary>
        /// <param name="strWhere">查询条件</param>
        /// <returns>dataset</returns>
        public DataSet GetList(string strWhere)
        {
            SqlParameter[] parameters = { new SqlParameter("@strWhere", SqlDbType.NVarChar, 1000) };
            parameters[0].Value = strWhere;
            return DbHelperSQL.RunProcedure("UP_AL_Message_GetListWhere", parameters, "ds");
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
            parameters[0].Value = "AL_Message";
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

