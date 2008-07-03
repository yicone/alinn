using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using HOT.IDAL;
using HOT.DBUtility;//�����������
namespace HOT.SQLServerDAL
{
    /// <summary>
    /// ���ݷ�����Ad��
    /// </summary>
    public class Ad : IAd
    {
        public Ad()
        { }
        #region  ��Ա����

        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(Guid AdId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = AdId;

            int result = DbHelperSQL.RunProcedure("UP_AL_Ad_Exists", parameters, out rowsAffected);
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
        /// �ж�ͬһ����������Ƿ���ĳһ��С�Ĺ��
        /// </summary>
        /// <param name="size">����СID</param>
        /// <param name="adGroupId">�����ID</param>
        /// <returns></returns>
        public bool Exists(int? sizeId,Guid adGroupId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                    new SqlParameter("@sizeId",SqlDbType.Int,4),
					new SqlParameter("@adGroupId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = sizeId;
            parameters[1].Value = adGroupId;
            int result = DbHelperSQL.RunProcedure("MY_AL_Ad_ExistsBySizeAndGroupId", parameters, out rowsAffected);
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
        ///  ����һ�����
        /// </summary>
        public void Add(HOT.Model.Ad model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@AdGroupId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@IsText", SqlDbType.TinyInt,1),
					new SqlParameter("@Title", SqlDbType.NVarChar,40),
					new SqlParameter("@Content", SqlDbType.NVarChar,120),
					new SqlParameter("@Url", SqlDbType.NVarChar,1024),
					new SqlParameter("@UrlText", SqlDbType.NVarChar,256),
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@Img", SqlDbType.NVarChar,100)};
            parameters[0].Value = model.AdId;
            parameters[1].Value = model.AdGroupId;
            parameters[2].Value = model.IsText;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.Content;
            parameters[5].Value = model.Url;
            parameters[6].Value = model.UrlText;
            parameters[7].Value = model.SizeId;
            parameters[8].Value = model.Img;

            DbHelperSQL.RunProcedure("UP_AL_Ad_ADD", parameters, out rowsAffected);
        }

        /// <summary>
        ///  ����һ������
        /// </summary>
        public void Update(HOT.Model.Ad model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Title", SqlDbType.NVarChar,40),
					new SqlParameter("@Content", SqlDbType.NVarChar,120),
					new SqlParameter("@Url", SqlDbType.NVarChar,1024),
					new SqlParameter("@UrlText", SqlDbType.NVarChar,256),
					new SqlParameter("@SizeId", SqlDbType.Int,4),
					new SqlParameter("@AuditState", SqlDbType.TinyInt,1),
					new SqlParameter("@Img", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.AdId;
            parameters[1].Value = model.Title;
            parameters[2].Value = model.Content;
            parameters[3].Value = model.Url;
            parameters[4].Value = model.UrlText;
            parameters[5].Value = model.SizeId;
            parameters[6].Value = model.AuditState;
            parameters[7].Value = model.Img;

            DbHelperSQL.RunProcedure("UP_AL_Ad_Update", parameters, out rowsAffected);
        }

        /// <summary>
        /// ɾ��һ������by AdId
        /// powered by FZF 20080421
        /// </summary>
        public void Delete(Guid AdId)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = AdId;

            DbHelperSQL.RunProcedure("UP_AL_Ad_Delete", parameters, out rowsAffected);
        }

        public void Delete(string strWhere)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
					new SqlParameter("@StrWhere", SqlDbType.VarChar,300)};
            parameters[0].Value = strWhere;

            DbHelperSQL.RunProcedure("UP_AL_Ad_DeleteWhere", parameters, out rowsAffected);
        }
        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public HOT.Model.Ad GetModel(Guid AdId)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@AdId", SqlDbType.UniqueIdentifier)};
            parameters[0].Value = AdId;

            HOT.Model.Ad model = new HOT.Model.Ad();
            DataSet ds = DbHelperSQL.RunProcedure("UP_AL_Ad_GetModel", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["AdId"].ToString() != "")
                {
                    model.AdId = new Guid(ds.Tables[0].Rows[0]["AdId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AdGroupId"].ToString() != "")
                {
                    model.AdGroupId = new Guid(ds.Tables[0].Rows[0]["AdGroupId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["IsText"].ToString() != "")
                {
                    model.IsText = int.Parse(ds.Tables[0].Rows[0]["IsText"].ToString());
                }
                model.Title = ds.Tables[0].Rows[0]["Title"].ToString();
                model.Content = ds.Tables[0].Rows[0]["Content"].ToString();
                model.Url = ds.Tables[0].Rows[0]["Url"].ToString();
                model.UrlText = ds.Tables[0].Rows[0]["UrlText"].ToString();
                if (ds.Tables[0].Rows[0]["SizeId"].ToString() != "")
                {
                    model.SizeId = int.Parse(ds.Tables[0].Rows[0]["SizeId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AuditState"].ToString() != "")
                {
                    model.AuditState = int.Parse(ds.Tables[0].Rows[0]["AuditState"].ToString());
                }
                model.Img = ds.Tables[0].Rows[0]["Img"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// ��where�����µõ�һ��ʵ��select top1* from table where strWhere
        /// powered by FZF 20080425
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public HOT.Model.Ad GetModel(string strWhere)
        {
            SqlParameter[] parameters = {
					new SqlParameter("@strWhere", SqlDbType.VarChar,500)};
            parameters[0].Value = strWhere;

            HOT.Model.Ad model = new HOT.Model.Ad();
            DataSet ds = DbHelperSQL.RunProcedure("MY_AL_Ad_GetModelByWhere", parameters, "ds");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["AdId"].ToString() != "")
                {
                    model.AdId = new Guid(ds.Tables[0].Rows[0]["AdId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AdGroupId"].ToString() != "")
                {
                    model.AdGroupId = new Guid(ds.Tables[0].Rows[0]["AdGroupId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["IsText"].ToString() != "")
                {
                    model.IsText = int.Parse(ds.Tables[0].Rows[0]["IsText"].ToString());
                }
                model.Title = ds.Tables[0].Rows[0]["Title"].ToString();
                model.Content = ds.Tables[0].Rows[0]["Content"].ToString();
                model.Url = ds.Tables[0].Rows[0]["Url"].ToString();
                model.UrlText = ds.Tables[0].Rows[0]["UrlText"].ToString();
                if (ds.Tables[0].Rows[0]["SizeId"].ToString() != "")
                {
                    model.SizeId = int.Parse(ds.Tables[0].Rows[0]["SizeId"].ToString());
                }
                if (ds.Tables[0].Rows[0]["AuditState"].ToString() != "")
                {
                    model.AuditState = int.Parse(ds.Tables[0].Rows[0]["AuditState"].ToString());
                }
                model.Img = ds.Tables[0].Rows[0]["Img"].ToString();
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// ��������б�
        /// powered by FZF
        /// </summary>
        /// <param name="strWhere">��ѯ����</param>
        /// <returns>dataset</returns>
        public DataSet GetList(string strWhere)
        {
            SqlParameter[] parameters = { new SqlParameter("@strWhere", SqlDbType.NVarChar, 300) };
            parameters[0].Value = strWhere;
            return DbHelperSQL.RunProcedure("UP_AL_Ad_GetListWhere", parameters, "ds");
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
            parameters[0].Value = "AL_Ad";
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

