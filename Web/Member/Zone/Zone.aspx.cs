using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using HOT.DBUtility;
using System.Collections.Generic;
using System.Diagnostics;
using HOT.Common;

//��ҳ����Ҫ��ӵ��ֶ�
//���λ���ơ�������ݡ��������λ�á�ѡ����λ�ߴ硢ѡ��Ʒ����͡����λ����

namespace Web
{
    public partial class Zone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                #region �����������
                string lowerAction = Request.QueryString["action"];
                object oZoneId = Session["ZoneId"];          //�����޸Ĺ��λ
                string sSiteId = Request.QueryString["siteid"]; //������ӹ��λ
                Uri requestUri = Request.UrlReferrer;

                if (string.IsNullOrEmpty(lowerAction) || (lowerAction != "update" && lowerAction != "new")
                        || requestUri == null)
                {

                    Response.Redirect("/Member/Zone/SiteManager.aspx");
                }
                #endregion

                #region ��ʼ��ά���򵼸�ҳ��״̬�ı���
                string[] dbFields = new string[] { 
                        "ZoneName", "SizeId", "SizeCode", "MediaType", "TransType",
                        "WeekPrice", "InFirst", "NeedAuditing", "ZoneDesp", "ClassIds",
                        "Keywords", "AllowAdultAd", "RecommendWeekPrice" };
                HtmlInputHidden[] hiddens = new HtmlInputHidden[] { hdn_zonename, hdn_sizeid, hdn_zonesize, hdn_mediatype, hdn_transtype,
                            hdn_weekprice, hdn_infirstpage, hdn_needauditing, hdn_zonedesp, hdn_classids,
                            hdn_keywords, hdn_allowadultad, hdn_recommendweekprice };

                Debug.Assert(hiddens.Length == dbFields.Length);
                Dictionary<string, HtmlInputHidden> dict = InitHiddenControlDict(hiddens);
                #endregion


                if (lowerAction == "update")
                {
                    if (oZoneId == null)
                        Response.Redirect("/Member/Zone/SiteManager.aspx");

                    hdn_dbaction.Value = "update";
                    //�޸�Zone������Ϣ
                    Guid zoneId;
                    if (GuidHelper.TryParse(Session["ZoneId"].ToString(), out zoneId))
                    {
                        SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier) };

                        parameters[0].Value = zoneId;
                        SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneInfoExtForZone", parameters);
                        while (sdr.Read())
                        {
                            for (int i = 0; i < hiddens.Length; i++)
                            {
                                string id = hiddens[i].ClientID;
                                string dbFieldName = dbFields[i];

                                dict[id].Value = sdr[dbFieldName].ToString();
                            }
                        }
                    }//end if
                }
                else
                {
                    Debug.Assert(lowerAction == "new", "����˶����ϲ��Ĳ�����֤�Ƿ�������");

                    string lowerLastPageUrl = requestUri.AbsolutePath.ToLower();
                    if (lowerLastPageUrl.Contains("zonecategory.aspx"))
                    {
                        #region ʵ���������򵼸�ҳ���е������һ����
                        //��ZoneCategory.aspx����
                        foreach (KeyValuePair<string, HtmlInputHidden> kvp in dict)
                        {
                            string hiddenId = kvp.Key;
                            HtmlInputHidden hidden = kvp.Value;
                            string hiddenValue = Request.Form[kvp.Key];

                            if (!string.IsNullOrEmpty(hiddenValue))
                            {
                                //Ϊ���ؿؼ���ֵ
                                hidden.Value = hiddenValue;
                            }
                        }
                        #endregion
                    }
                    else if (lowerLastPageUrl.Contains("sitemanager.aspx"))
                    {
                        if (string.IsNullOrEmpty(sSiteId))
                        {
                            Response.Redirect("/Member/Zone/SiteManager.aspx");
                        }

                        hdn_dbaction.Value = "new";
                        //!NOTE!
                        Session["SiteId"] = sSiteId;
                        Session.Remove("ZoneId");
                    }
                }
            }
        }

        private Dictionary<string, HtmlInputHidden> InitHiddenControlDict(HtmlInputHidden[] hiddens)
        {
            Dictionary<string, HtmlInputHidden> dict = new Dictionary<string, HtmlInputHidden>();

            foreach (HtmlInputHidden hdn in hiddens)
            {
                dict.Add(hdn.ClientID, hdn);
            }

            return dict;
        }
    }
}
