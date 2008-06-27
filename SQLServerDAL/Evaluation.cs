using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类AL_Evaluation。
    /// </summary>
    public class AL_Evaluation : IEvaluation
    {
        public AL_Evaluation()
        { }
        #region  成员方法

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(Guid EvaluationId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@EvaluationId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = EvaluationId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Evaluation_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.Evaluation model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@EvaluationId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Score", SqlDbType.TinyInt,1),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@Descriptiont", SqlDbType.NVarChar,300),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.EvaluationId;
            parameters[1].Value = model.OrderId;
            parameters[2].Value = model.Score;
            parameters[3].Value = model.Type;
            parameters[4].Value = model.Descriptiont;
            parameters[5].Value = model.CreateDate;

            DbHelperSQL.RunProcedure("UP_AL_Evaluation_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.Evaluation model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@EvaluationId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@OrderId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Score", SqlDbType.TinyInt,1),
					new SqlParameter("@Type", SqlDbType.TinyInt,1),
					new SqlParameter("@Descriptiont", SqlDbType.NVarChar,300),
					new SqlParameter("@CreateDate", SqlDbType.DateTime)};
            parameters[0].Value = model.EvaluationId;
            parameters[1].Value = model.OrderId;
            parameters[2].Value = model.Score;
            parameters[3].Value = model.Type;
            parameters[4].Value = model.Descriptiont;
            parameters[5].Value = model.CreateDate;

            DbHelperSQL.RunProcedure("UP_AL_Evaluation_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid EvaluationId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@EvaluationId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = EvaluationId;

            DbHelperSQL.RunProcedure("UP_AL_Evaluation_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.Evaluation GetModel(Guid EvaluationId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@EvaluationId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = EvaluationId;

            HOT.Model.Evaluation model = new HOT.Model.Evaluation();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Evaluation_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["EvaluationId"].ToString() != "")
                {
                    model.EvaluationId = new Guid(ds.Tables[0].Rows[0]["EvaluationId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["OrderId"].ToString() != "")
                {
                    model.OrderId = new Guid(ds.Tables[0].Rows[0]["OrderId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Score"].ToString() != "")
                {
                    model.Score = int.Parse(ds.Tables[0].Rows[0]["Score"].ToString());
                }
                if (ds.Tables[0].Rows[0]["Type"].ToString() != "")
                {
                    model.Type = int.Parse(ds.Tables[0].Rows[0]["Type"].ToString());
                }
                model.Descriptiont = ds.Tables[0].Rows[0]["Descriptiont"].ToString();
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
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select EvaluationId,OrderId,Score,Type,Descriptiont,CreateDate ");
            strSql.Append(" FROM AL_Evaluation ");
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
            parameters[0].Value = "AL_Evaluation";
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

