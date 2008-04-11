using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//�����������
namespace HOT.SQLServerDAL
{
	/// <summary>
	/// ���ݷ�����AdClass��
	/// </summary>
	public class AdClass:IAdClass
	{
		public AdClass()
		{}
		#region  ��Ա����

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("AdClassId", "AL_AdClass"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int AdClassId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdClassId", SqlDbType.Int,4)};
			parameters[0].Value = AdClassId;

			int result= DbHelperSQL.RunProcedure("UP_AL_AdClass_Exists",parameters,out rowsAffected);
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
		public int Add(HOT.Model.AdClass model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdClassId", SqlDbType.Int,4),
					new SqlParameter("@AdClassName", SqlDbType.NVarChar,10),
					new SqlParameter("@ParentId", SqlDbType.Int,4)};
			parameters[0].Direction = ParameterDirection.Output;
			parameters[1].Value = model.AdClassName;
			parameters[2].Value = model.ParentId;

			DbHelperSQL.RunProcedure("UP_AL_AdClass_ADD",parameters,out rowsAffected);
			return (int)parameters[0].Value;
		}

		/// <summary>
		///  ����һ������
		/// </summary>
		public void Update(HOT.Model.AdClass model)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdClassId", SqlDbType.Int,4),
					new SqlParameter("@AdClassName", SqlDbType.NVarChar,10),
					new SqlParameter("@ParentId", SqlDbType.Int,4)};
			parameters[0].Value = model.AdClassId;
			parameters[1].Value = model.AdClassName;
			parameters[2].Value = model.ParentId;

			DbHelperSQL.RunProcedure("UP_AL_AdClass_Update",parameters,out rowsAffected);
		}

		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public void Delete(int AdClassId)
		{
			int rowsAffected;
			SqlParameter[] parameters = {
					new SqlParameter("@AdClassId", SqlDbType.Int,4)};
			parameters[0].Value = AdClassId;

			DbHelperSQL.RunProcedure("UP_AL_AdClass_Delete",parameters,out rowsAffected);
		}

		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public HOT.Model.AdClass GetModel(int AdClassId)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@AdClassId", SqlDbType.Int,4)};
			parameters[0].Value = AdClassId;

			HOT.Model.AdClass model=new HOT.Model.AdClass();
			DataSet ds= DbHelperSQL.RunProcedure("UP_AL_AdClass_GetModel",parameters,"ds");
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["AdClassId"].ToString()!="")
				{
					model.AdClassId=int.Parse(ds.Tables[0].Rows[0]["AdClassId"].ToString());
				}
				model.AdClassName=ds.Tables[0].Rows[0]["AdClassName"].ToString();
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
			strSql.Append("select AdClassId,AdClassName,ParentId ");
			strSql.Append(" FROM AL_AdClass ");
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
			parameters[0].Value = "AL_AdClass";
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

