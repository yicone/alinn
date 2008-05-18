using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//请先添加引用
using System.Collections;
using System.Diagnostics;
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
        public bool Exists(string email)
        {
            //int rowsAffected;
            //SqlParameter[] parameters = {
            //        new SqlParameter("@Email", SqlDbType.VarChar,50)};
            //parameters[0].Value = email;

            //int result = DbHelperSQL.RunProcedure("UP_AL_User_Exists", parameters, out rowsAffected);
            //if (result == 1)
            //{
            //    return true;
            //}
            //else
            //{
            //    return false;
            //}
            string sql = "select * from AL_UserTemp where email=@email select * from AL_User  where  email=@email ";

            SqlParameter[] parameters = { new SqlParameter("@email", SqlDbType.VarChar, 50) };
            parameters[0].Value = email;

            if (DbHelperSQL.GetSingle(sql, parameters) != null)
                return true;
            else
                return false;
        }

        /// <summary>
        ///  增加一条数据
        /// </summary>
        public void Add(HOT.Model.User model)
        {
            //int rowsAffected;
            SqlParameter[] parameters = {
					//new SqlParameter("@UserID", SqlDbType.VarChar,16),
					new SqlParameter("@RoleID", SqlDbType.Int,4),
					new SqlParameter("@Email", SqlDbType.NVarChar,50),
					new SqlParameter("@NickName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserPassword", SqlDbType.NVarChar,50),
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
            //parameters[0].Value = model.UserID;
            parameters[0].Value = model.RoleID;
            parameters[1].Value = model.Email;
            parameters[2].Value = model.NickName;
            parameters[3].Value = model.UserPassword;
            parameters[4].Value = model.CompanyName;
            parameters[5].Value = model.CompanyAddress;
            parameters[6].Value = model.LinkMan;
            parameters[7].Value = model.Telephone;
            parameters[8].Value = model.Mobile;
            parameters[9].Value = model.QQ;
            parameters[10].Value = model.Msn;
            parameters[11].Value = model.Introducer;
            parameters[12].Value = model.LastLoginTime;
            parameters[13].Value = model.LastLoginIP;
            parameters[14].Value = model.LoginTimes;
            parameters[15].Value = model.IsLocked;
            parameters[16].Value = model.ActiveCode;
            parameters[17].Value = model.RegTime;

            string sql = "insert into AL_User(UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime) values(newid(),@RoleID,@Email,@NickName,@UserPassword,@CompanyName,@CompanyAddress,@LinkMan,@Telephone,@Mobile,@QQ,@Msn,@Introducer,@LastLoginTime,@LastLoginIP,@LoginTimes,@IsLocked,@ActiveCode,@RegTime)";
            //DbHelperSQL.RunProcedure("UP_AL_User_ADD", parameters, out rowsAffected);

            DbHelperSQL.ExecuteSql(sql, parameters);
        }

        public void Add(HOT.Model.UserTemp model)
        {
            string sql = "insert into AL_UserTemp(RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,ActiveCode,RegIP,RegTime) values(@RoleID,@Email,@NickName,@UserPassword,@CompanyName,@CompanyAddress,@LinkMan,@Telephone,@Mobile,@QQ,@Msn,@Introducer,@ActiveCode,@RegIP,@RegTime)";

            SqlParameter[] parameters = {
					
					new SqlParameter("@RoleID", SqlDbType.Int,4),
					new SqlParameter("@Email", SqlDbType.NVarChar,50),
					new SqlParameter("@NickName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserPassword", SqlDbType.NVarChar,50),
					new SqlParameter("@CompanyName", SqlDbType.NVarChar,200),
					new SqlParameter("@CompanyAddress", SqlDbType.NVarChar,500),
					new SqlParameter("@LinkMan", SqlDbType.NVarChar,8),
					new SqlParameter("@Telephone", SqlDbType.NVarChar,50),
					new SqlParameter("@Mobile", SqlDbType.NVarChar,50),
					new SqlParameter("@QQ", SqlDbType.NVarChar,50),
					new SqlParameter("@Msn", SqlDbType.NVarChar,50),
					new SqlParameter("@Introducer", SqlDbType.VarChar,16),
					new SqlParameter("@ActiveCode", SqlDbType.VarChar,16),
                    new SqlParameter("@RegIP", SqlDbType.VarChar,16),
                    new SqlParameter("@RegTime", SqlDbType.VarChar,16)};

            parameters[0].Value = model.RoleID;
            parameters[1].Value = model.Email;
            parameters[2].Value = model.NickName;
            parameters[3].Value = model.UserPassword;
            parameters[4].Value = model.CompanyName;
            parameters[5].Value = model.CompanyAddress;
            parameters[6].Value = model.LinkMan;
            parameters[7].Value = model.Telephone;
            parameters[8].Value = model.Mobile;
            parameters[9].Value = model.QQ;
            parameters[10].Value = model.Msn;
            parameters[11].Value = model.Introducer;
            parameters[12].Value = model.ActiveCode;
            parameters[13].Value = model.RegIP;
            parameters[14].Value = model.RegTime;

            DbHelperSQL.ExecuteSql(sql, parameters);

        }

        /// <summary>
        ///  更新一条数据
        /// </summary>
        public void Update(HOT.Model.User model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					//new SqlParameter("@UserID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@RoleID", SqlDbType.Int,4),
					new SqlParameter("@Email", SqlDbType.NVarChar,50),
					new SqlParameter("@NickName", SqlDbType.NVarChar,50),
					new SqlParameter("@UserPassword", SqlDbType.NVarChar,50),
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
					new SqlParameter("@RegTime", SqlDbType.DateTime),
                    new SqlParameter("@School", SqlDbType.NVarChar,50),
                    new SqlParameter("@Proxy", SqlDbType.NVarChar,50)};
            //parameters[0].Value = model.UserID;
            //parameters[1].Value = model.RoleID;
            //parameters[2].Value = model.Email;
            //parameters[3].Value = model.NickName;
            //parameters[4].Value = model.UserPassword;
            //parameters[5].Value = model.CompanyName;
            //parameters[6].Value = model.CompanyAddress;
            //parameters[7].Value = model.LinkMan;
            //parameters[8].Value = model.Telephone;
            //parameters[9].Value = model.Mobile;
            //parameters[10].Value = model.QQ;
            //parameters[11].Value = model.Msn;
            //parameters[12].Value = model.Introducer;
            //parameters[13].Value = model.LastLoginTime;
            //parameters[14].Value = model.LastLoginIP;
            //parameters[15].Value = model.LoginTimes;
            //parameters[16].Value = model.IsLocked;
            //parameters[17].Value = model.ActiveCode;
            //parameters[18].Value = model.RegTime;
            parameters[0].Value = model.RoleID;
            parameters[1].Value = model.Email;
            parameters[2].Value = model.NickName;
            parameters[3].Value = model.UserPassword;
            parameters[4].Value = model.CompanyName;
            parameters[5].Value = model.CompanyAddress;
            parameters[6].Value = model.LinkMan;
            parameters[7].Value = model.Telephone;
            parameters[8].Value = model.Mobile;
            parameters[9].Value = model.QQ;
            parameters[10].Value = model.Msn;
            parameters[11].Value = model.Introducer;
            parameters[12].Value = model.LastLoginTime;
            parameters[13].Value = model.LastLoginIP;
            parameters[14].Value = model.LoginTimes;
            parameters[15].Value = model.IsLocked;
            parameters[16].Value = model.ActiveCode;
            parameters[17].Value = model.RegTime;
            parameters[18].Value = model.School;
            parameters[19].Value = model.Proxy;

            DbHelperSQL.RunProcedure("UP_AL_User_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public void Delete(Guid UserId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@UserID", SqlDbType.VarChar,50)};
            parameters[0].Value = UserId;

            DbHelperSQL.RunProcedure("UP_AL_User_Delete", parameters, out rowsAffected);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public HOT.Model.User GetModel(Guid UserId)
        {
            //Debug.Assert(false, "由于改写，请重新运行代码生成工具，补全此部分！");
            //return null;
            string sql = "select * from AL_User where userid=@userid";
            SqlParameter[] parameters = {
					new SqlParameter("@userid", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = UserId;

            HOT.Model.User model = new HOT.Model.User();
            DataSet ds = DbHelperSQL.Query(sql, parameters);
            //DataSet ds = DbHelperSQL.RunProcedure("UP_AL_User_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                model.UserId = UserId;
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
                model.School = ds.Tables[0].Rows[0]["School"].ToString();
                model.Proxy = ds.Tables[0].Rows[0]["Proxy"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }

        public HOT.Model.User GetModel(string email)
        {
            string sql = "select * from AL_User where email=@email";
            SqlParameter[] parameters = {
					new SqlParameter("@email", SqlDbType.VarChar,50)};
            parameters[0].Value = email;

            HOT.Model.User model = new HOT.Model.User();
            DataSet ds = DbHelperSQL.Query(sql, parameters);
            //DataSet ds = DbHelperSQL.RunProcedure("UP_AL_User_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                model.UserId = new Guid(ds.Tables[0].Rows[0]["UserID"].ToString());
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
                model.School = ds.Tables[0].Rows[0]["School"].ToString();
                model.Proxy = ds.Tables[0].Rows[0]["Proxy"].ToString();
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
            strSql.Append("select UserID,RoleID,Email,NickName,UserPassword,CompanyName,CompanyAddress,LinkMan,Telephone,Mobile,QQ,Msn,Introducer,LastLoginTime,LastLoginIP,LoginTimes,IsLocked,ActiveCode,RegTime,School,Proxy ");
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

        /// <summary>
        /// 是否存在记录
        /// </summary>
        /// <param name="email"></param>
        /// <param name="passWord"></param>
        /// <returns></returns>
        public Guid Exists(string email, string passWord)
        {
            string sql = "select userid from AL_User where email=@email and userpassword=@passWord";
            SqlParameter[] parameters = {
                new SqlParameter("@email",SqlDbType.NVarChar,50),
                new SqlParameter("@passWord",SqlDbType.NVarChar,50)
            };
            parameters[0].Value = email;
            parameters[1].Value = passWord;

            object o = DbHelperSQL.GetSingle(sql, parameters);

            if (o == null)
                return Guid.Empty;
            return (Guid)o;

            
        }

        public bool Exists(Guid userId, string passWord)
        {
            throw new NotImplementedException();
        }

        public bool Exists(Guid userId)
        {
            throw new NotImplementedException();
        }

        public HOT.Model.User GetModel(string email, string ActiveCode)
        {
            string sql = "select * from AL_User where email=@email and activecode=@activecode";

            SqlParameter[] parameters = {
                new SqlParameter("@email",SqlDbType.VarChar,50),
                new SqlParameter("@activecode",SqlDbType.VarChar,16)};

            parameters[0].Value = email;
            parameters[1].Value = ActiveCode;

            DataSet ds = DbHelperSQL.Query(sql, parameters);
            HOT.Model.User model = new HOT.Model.User();
            if (ds.Tables[0].Rows.Count > 0)
            {
                //model.UserID = ds.Tables[0].Rows[0]["UserID"].ToString();
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
                model.ActiveCode = ds.Tables[0].Rows[0]["ActiveCode"].ToString();
                if (ds.Tables[0].Rows[0]["RegTime"].ToString() != "")
                {
                    model.RegTime = DateTime.Parse(ds.Tables[0].Rows[0]["RegTime"].ToString());
                }
                model.School = ds.Tables[0].Rows[0]["School"].ToString();
                model.Proxy = ds.Tables[0].Rows[0]["Proxy"].ToString();

                return model;
            }
            else
            {
                return null;
            }
        }

        public HOT.Model.UserTemp GetModelTemp(string email)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@email", SqlDbType.VarChar,50)};
            parameters[0].Value = email;

            HOT.Model.UserTemp model = new HOT.Model.UserTemp();
            //DataSet ds = DbHelperSQL.RunProcedure("UP_AL_User_GetModel", parameters, "ds");
            string sql = "select * from AL_UserTemp where email=@email";
            DataSet ds = DbHelperSQL.Query(sql, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //model.UserID = ds.Tables[0].Rows[0]["UserID"].ToString();
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
                model.ActiveCode = ds.Tables[0].Rows[0]["ActiveCode"].ToString();
                if (ds.Tables[0].Rows[0]["RegTime"].ToString() != "")
                {
                    model.RegTime = ds.Tables[0].Rows[0]["RegTime"].ToString();
                }
                model.School = ds.Tables[0].Rows[0]["School"].ToString();
                model.Proxy = ds.Tables[0].Rows[0]["Proxy"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 获取该用户推荐的人
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns>逗号分隔的ID串</returns>
        public string GetIntroducer(Guid UserId)
        {
            System.Text.StringBuilder sb = new StringBuilder();

            string sql = string.Format("select introducer from AL_User where introducer='{0}'", UserId);
            DataSet ds = DbHelperSQL.Query(sql);
            DataRowCollection rowlist = ds.Tables[0].Rows;
            for (int i = 0; i < rowlist.Count; i++)
            {
                sb.AppendFormat(",{0}", rowlist[i].ItemArray.GetValue(0).ToString());
            }

            string sbstr = sb.ToString();

            if (sbstr.Length == 0)
                return null;
            return sbstr.Substring(1, sbstr.Length - 1);
        }


        public bool ExsitsIP(string userIP, DateTime dateTime)
        {
            string sql = string.Format("select * from AL_UserTemp where RegTime='{0}' and RegIP='{1}'", dateTime.ToShortDateString(), userIP);

            if (DbHelperSQL.GetSingle(sql) != null)
                return true;
            else
                return false;
        }

        #endregion  成员方法
    }
}

