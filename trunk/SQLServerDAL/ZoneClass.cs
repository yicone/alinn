using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//�����������
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// ���ݷ�����ZoneClass��
	/// </summary>
	public class ZoneClass:IZoneClass
	{
		public ZoneClass()
		{}
		#region  ��Ա����

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("ClassId", "AL_ZoneClass"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int ClassId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ClassId", SqlDbType.Int,4)};
			parameters[0].Value = ClassId;

			int result= DbHelperSQL.RunProcedure("UP_AL_ZoneClass_Exists",parameters,out rowsAffected);
			if(result==1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		///  ����һ������
		/// </summary>
		public int Add(HOT.Model.ZoneClass model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ClassId", SqlDbType.Int,4),
					new SqlParameter("@ClassName", SqlDbType.NVarChar,10),
					new SqlParameter("@ParentId", SqlDbType.Int,4)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.ClassName;
			parameters[2].Value = model.ParentId;

			DbHelperSQL.RunProcedure("UP_AL_ZoneClass_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  ����һ������
		/// </summary>
		public void Update(HOT.Model.ZoneClass model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ClassId", SqlDbType.Int,4),
					new SqlParameter("@ClassName", SqlDbType.NVarChar,10),
					new SqlParameter("@ParentId", SqlDbType.Int,4)};
			parameters[0].Value = model.ClassId;
			parameters[1].Value = model.ClassName;
			parameters[2].Value = model.ParentId;

			DbHelperSQL.RunProcedure("UP_AL_ZoneClass_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int ClassId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@ClassId", SqlDbType.Int,4)};
			parameters[0].Value = ClassId;

			DbHelperSQL.RunProcedure("UP_AL_ZoneClass_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.ZoneClass GetModel(int? ClassId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@ClassId", SqlDbType.Int,4)};
			parameters[0].Value = ClassId;

			HOT.Model.ZoneClass model=new HOT.Model.ZoneClass();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_ZoneClass_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["ClassId"].ToString()!="")
				{
					model.ClassId=int.Parse(ds.Tables[0].Rows[0]["ClassId"].ToString());
				}
				model.ClassName=ds.Tables[0].Rows[0]["ClassName"].ToString();
				if(ds.Tables[0].Rows[0]["ParentId"].ToString()!="")
				{
					model.ParentId=int.Parse(ds.Tables[0].Rows[0]["ParentId"].ToString());
				}
				return model;
			}
			else
			{
				return null;
			}
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ClassId,ClassName,ParentId ");
			strSql.Append(" FROM AL_ZoneClass ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}
        /// <summary>
        /// ���ǰN�������б�
        /// </summary>
        public DataSet GetList(int topN,string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top ");
            strSql.Append(topN.ToString());
            strSql.Append(" ClassId,ClassName,ParentId ");
            strSql.Append(" FROM AL_ZoneClass ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
		/*
		/// <summary>
		/// ��ҳ��ȡ�����б�
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
			parameters[0].Value = "AL_ZoneClass";
			parameters[1].Value = "ID";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  ��Ա����
	}
}

