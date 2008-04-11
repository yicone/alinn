using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// 数据访问类User。
    /// </summary>
    public class User : IUser
    {
        public User()
        { }
        #region  成员方法

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string UserID)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,50)};
            parameters[0].Value = UserID;

            int result = DbHelperSQL.RunProcedure("UP_AL_User_Exists", parameters, out rowsAffected);
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
        public void Add(HOT.Model.User model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,16),
					new SqlParameter("@RoleID", SqlDbType.Int,4),
					new SqlParameter("@Email", SqlDbType.NVarChar,50),
					new SqlParameter("@NickName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserPassword", SqlDbType.NVarChar,16),
					new SqlParameter("@CompanyName", SqlDbType.NVarChar,200),
					new SqlParameter("@CompanyAddress", SqlDbType.NVarChar,500),
					new SqlParameter("@LinkMan", SqlDbType.NVarChar,8),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,50),
					new SqlParameter("@Mobile", SqlDbType.NVarChar,50),
					new SqlParameter("@QQ", SqlDbType.NVarChar,50),
					new SqlParameter("@Msn", SqlDbType.NVarChar,50),
					new SqlParameter("@Introducer", SqlDbType.VarChar,16),
					new SqlParameter("@LastLoginTime", SqlDbType.DateTime),
					new SqlParameter("@LastLoginIP", SqlDbType.NVarChar,15),
					new SqlParameter("@LoginTimes", SqlDbType.Int,4),
					new SqlParameter("@IsLocked", SqlDbType.TinyInt,1),
					new SqlParameter("@ActiveCode", SqlDbType.VarChar,16),
					new SqlParameter("@RegTime", SqlDbType.DateTime)};
            parameters[0].Value = model.UserID;
            parameters[1].Value = model.RoleID;
            parameters[2].Value = model.Email;
            parameters[3].Value = model.NickName;
            parameters[4].Value = model.UserPassword;
            parameters[5].Value = model.CompanyName;
            parameters[6].Value = model.CompanyAddress;
            parameters[7].Value = model.LinkMan;
            parameters[8].Value = model.Telephone;
            parameters[9].Value = model.Mobile;
            parameters[10].Value = model.QQ;
            parameters[11].Value = model.Msn;
            parameters[12].Value = model.Introducer;
            parameters[13].Value = model.LastLoginTime;
            parameters[14].Value = model.LastLoginIP;
            parameters[15].Value = model.LoginTimes;
            parameters[16].Value = model.IsLocked;
            parameters[17].Value = model.ActiveCode;
            parameters[18].Value = model.RegTime;

            DbHelperSQL.RunProcedure("UP_AL_User_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.User model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,16),
					new SqlParameter("@RoleID", SqlDbType.Int,4),
					new SqlParameter("@Email", SqlDbType.NVarChar,50),
					new SqlParameter("@NickName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserPassword", SqlDbType.NVarChar,16),
					new SqlParameter("@CompanyName", SqlDbType.NVarChar,200),
					new SqlParameter("@CompanyAddress", SqlDbType.NVarChar,500),
					new SqlParameter("@LinkMan", SqlDbType.NVarChar,8),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,50),
					new SqlParameter("@Mobile", SqlDbType.NVarChar,50),
					new SqlParameter("@QQ", SqlDbType.NVarChar,50),
					new SqlParameter("@Msn", SqlDbType.NVarChar,50),
					new SqlParameter("@Introducer", SqlDbType.VarChar,16),
					new SqlParameter("@LastLoginTime", SqlDbType.DateTime),
					new SqlParameter("@LastLoginIP", SqlDbType.NVarChar,15),
					new SqlParameter("@LoginTimes", SqlDbType.Int,4),
					new SqlParameter("@IsLocked", SqlDbType.TinyInt,1),
					new SqlParameter("@ActiveCode", SqlDbType.VarChar,16),
					new SqlParameter("@RegTime", SqlDbType.DateTime)};
            parameters[0].Value = model.UserID;
            parameters[1].Value = model.RoleID;
            parameters[2].Value = model.Email;
            parameters[3].Value = model.NickName;
            parameters[4].Value = model.UserPassword;
            parameters[5].Value = model.CompanyName;
            parameters[6].Value = model.CompanyAddress;
            parameters[7].Value = model.LinkMan;
            parameters[8].Value = model.Telephone;
            parameters[9].Value = model.Mobile;
            parameters[10].Value = model.QQ;
            parameters[11].Value = model.Msn;
            parameters[12].Value = model.Introducer;
            parameters[13].Value = model.LastLoginTime;
            parameters[14].Value = model.LastLoginIP;
            parameters[15].Value = model.LoginTimes;
            parameters[16].Value = model.IsLocked;
            parameters[17].Value = model.ActiveCode;
            parameters[18].Value = model.RegTime;

            DbHelperSQL.RunProcedure("UP_AL_User_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(string UserID)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,50)};
            parameters[0].Value = UserID;

            DbHelperSQL.RunProcedure("UP_AL_User_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.User GetModel(string UserID)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,50)};
            parameters[0].Value = UserID;

            HOT.Model.User model = new HOT.Model.User();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_User_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                model.UserID = ds.Tables[0].Rows[0]["UserID"].ToString();
                if (ds.Tables[0].Rows[0]["RoleID"].ToString() != "")
                {
                    model.RoleID = int.Parse(ds.Tables[0].Rows[0]["RoleID"].ToString());
                }
                model.Email = ds.Tables[0].Rows[0]["Email"].ToString();
                model.NickName = ds.Tables[0].Rows[0]["NickName"].ToString();
                model.UserPassword = ds.Tables[0].Rows[0]["UserPassword"].ToString();
                model.CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                model.CompanyAddress = ds.Tables[0].Rows[0]["CompanyAddress"].ToString();
                model.LinkMan = ds.Tables[0].Rows[0]["LinkMan"].ToString();
                model.Telephone = ds.Tables[0].Rows[0]["Telephone"].ToString();
                model.Mobile = ds.Tables[0].Rows[0]["Mobile"].ToString();
                model.QQ = ds.Tables[0].Rows[0]["QQ"].ToString();
                model.Msn = ds.Tables[0].Rows[0]["Msn"].ToString();
                model.Introducer = ds.Tables[0].Rows[0]["Introducer"].ToString();
                if (ds.Tables[0].Rows[0]["LastLoginTime"].ToString() != "")
                {
                    model.LastLoginTime = DateTime.Parse(ds.Tables[0].Rows[0]["LastLoginTime"].ToString());
                }
                model.LastLoginIP = ds.Tables[0].Rows[0]["LastLoginIP"].ToString();
                if (ds.Tables[0].Rows[0]["LoginTimes"].ToString() != "")
                {
                    model.LoginTimes = int.Parse(ds.Tables[0].Rows[0]["LoginTimes"].ToString());
                }
                if (ds.Tables[0].Rows[0]["IsLocked"].ToString() != "")
                {
                    model.IsLocked = int.Parse(ds.Tables[0].Rows[0]["IsLocked"].ToString());
                }
                model.ActiveCode = ds.Tables[0].Rows[0]["ActiveCode"].ToString();
                if (ds.Tables[0].Rows[0]["RegTime"].ToString() != "")
                {
                    model.RegTime = DateTime.Parse(ds.Tables[0].Rows[0]["RegTime"].ToString());
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
            strSql.Append("select UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime ");
            strSql.Append(" FROM AL_User ");
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
            parameters[0].Value = "AL_User";
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

