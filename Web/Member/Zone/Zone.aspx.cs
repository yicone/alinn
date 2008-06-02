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

//此页面需要添加的字段
//广告位名称、广告内容、广告所在位置、选择广告位尺寸、选择计费类型、广告位描述

namespace Web
{
    public partial class Zone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region MyRegion
#if DEBUG
            if(Request.QueryString["action"] == "update")
                Debug.Assert(Session["ZoneId"] != null);
            else
                Debug.Assert(Session["ZoneId"] == null);
#endif

            if (Session["ZoneId"] == null && Request.QueryString["action"] == "update")
                Response.Redirect("/Member/Zone/SiteManager.aspx");
            #endregion

            if (!Page.IsPostBack)
            {
                #region MyRegion
                Debug.Assert(Request.UrlReferrer != null, "ZoneView.aspx页面不允许直接访问！");

                if (Request.UrlReferrer == null)
                    Response.Redirect("/Member/Zone/SiteManager.aspx", true); 
                #endregion

                string lowerLastPageUrl = Request.UrlReferrer.AbsolutePath.ToLower();

                #region MyRegion
                Dictionary<string, HtmlInputHidden> dict = new Dictionary<string, HtmlInputHidden>();

                HtmlInputHidden[] hiddens = new HtmlInputHidden[] { hdn_zonename, hdn_sizeid, hdn_zonesize, hdn_mediatype, hdn_transtype,
                            hdn_weekprice, hdn_infirstpage, hdn_needauditing, hdn_zonedesp, hdn_classids,
                            hdn_keywords, hdn_allowadultad, hdn_recommendweekprice, hdn_siteid }; 
                InitHiddenParamDict(hiddens, dict);

                string[] dbFields = new string[] { 
                        "ZoneName", "SizeId", "SizeCode", "MediaType", "TransType",
                        "WeekPrice", "InFirst", "NeedAuditing", "ZoneDesp", "ClassIds",
                        "Keywords", "AllowAdultAd", "RecommendWeekPrice", "SiteId" };

                Debug.Assert(hiddens.Length == dbFields.Length); 

                #endregion

                

                if (lowerLastPageUrl.Contains("zonecategory.aspx"))
                {
                    //修改未添加到数据库的Zone基本信息
                    Debug.Assert(hdn_dbaction.Value == "new");

                    #region 实现数据在向导各页面中的连贯和一致性
                    //从ZoneCategory.aspx返回
                    foreach (KeyValuePair<string, HtmlInputHidden> kvp in dict)
                    {
                        if (kvp.Value != null)
                        {
                            string paramValue = Request.Form[kvp.Key];
                            if (!string.IsNullOrEmpty(paramValue))
                            {
                                //为隐藏控件赋值
                                kvp.Value.Value = paramValue;
                            }
                        }
                    }
                    #endregion
                }
                else if (lowerLastPageUrl.Contains("zoneview.aspx"))
                {
                    hdn_dbaction.Value = "update";
                    //修改Zone基本信息
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
                }//end if
                else if (lowerLastPageUrl.Contains("sitemanager.aspx"))
                {
                    //新增广告位
                    Debug.Assert(Request.QueryString["action"] == "new");

                    hdn_dbaction.Value = "new";
                    hdn_siteid.Value = Request.QueryString["siteid"];
                    //!NOTE!
                    Session.Remove("ZoneId");
                }
                else
                {
                    Debug.Assert(false, "从未知页面请求Zone.aspx！");
                }
            }
        }

        private void InitHiddenParamDict(HtmlInputHidden[] hiddens, Dictionary<string, HtmlInputHidden> dict)
        {
            foreach (HtmlInputHidden hdn in hiddens)
            {
                dict.Add(hdn.ClientID, hdn);
            }
        }
    }
}
