using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//�����������
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// ���ݷ�����Employment��
	/// </summary>
	public class Employment:IEmployment
	{
		public Employment()
		{}
		#region  ��Ա����

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("EmploymentId", "AL_Employment"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int EmploymentId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			int result= DbHelperSQL.RunProcedure("UP_AL_Employment_Exists",parameters,out rowsAffected);
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
		public int Add(HOT.Model.Employment model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4),
					new SqlParameter("@EmploymentName", SqlDbType.NVarChar,20)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.EmploymentName;

			DbHelperSQL.RunProcedure("UP_AL_Employment_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  ����һ������
		/// </summary>
		public void Update(HOT.Model.Employment model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4),
					new SqlParameter("@EmploymentName", SqlDbType.NVarChar,20)};
			parameters[0].Value = model.EmploymentId;
			parameters[1].Value = model.EmploymentName;

			DbHelperSQL.RunProcedure("UP_AL_Employment_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int EmploymentId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			DbHelperSQL.RunProcedure("UP_AL_Employment_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.Employment GetModel(int EmploymentId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@EmploymentId", SqlDbType.Int,4)};
			parameters[0].Value = EmploymentId;

			HOT.Model.Employment model=new HOT.Model.Employment();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_Employment_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["EmploymentId"].ToString()!="")
				{
					model.EmploymentId=int.Parse(ds.Tables[0].Rows[0]["EmploymentId"].ToString());
				}
				model.EmploymentName=ds.Tables[0].Rows[0]["EmploymentName"].ToString();
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
			strSql.Append("select EmploymentId,EmploymentName ");
			strSql.Append(" FROM AL_Employment ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
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
			parameters[0].Value = "AL_Employment";
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

