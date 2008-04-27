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

//此页面需要添加的字段
//广告位名称、广告内容、广告所在位置、选择广告位尺寸、选择计费类型、广告位描述

namespace Web
{
    public partial class Zone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Debug.Assert(Request.UrlReferrer != null);
                string lastPageUrl = Request.UrlReferrer.AbsolutePath;

                Dictionary<string, HtmlInputHidden> dict = new Dictionary<string, HtmlInputHidden>();
                string[] hiddenInputIds = new string[] { 
                        "hdn_zoneid", "hdn_zonename", "hdn_sizeid", "hdn_zonesize", "hdn_mediatype", "hdn_transtype", 
                        "hdn_weekprice", "hdn_infirstpage", "hdn_needauditing", "hdn_zonedesp", "hdn_classids", 
                        "hdn_keywords", "hdn_allowadultad", "hdn_recommendweekprice","hdn_siteid" };

                string[] dbFields = new string[] { 
                        "ZoneId", "ZoneName", "SizeId", "SizeCode", "MediaType", "TransType",
                        "WeekPrice", "InFirst", "NeedAuditing", "ZoneDesp", "ClassIds",
                        "Keywords", "AllowAdultAd", "RecommendWeekPrice", "SiteId" };

                Debug.Assert(hiddenInputIds.Length == dbFields.Length);

                InitHiddenParamDict(hiddenInputIds, dict);

                if (lastPageUrl.Contains("ZoneCategory.aspx"))
                {
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
                else if (lastPageUrl.Contains("ZoneView.aspx"))
                {
                    //从ZoneView.aspx进入
                    if (!string.IsNullOrEmpty(Request.QueryString["zoneid"]))
                    {
                        SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier) };
                        parameters[0].Value = new Guid(Request.QueryString["zoneid"]);
                        SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneInfoExtForZone", parameters);
                        while (sdr.Read())
                        {
                            for (int i = 0; i < hiddenInputIds.Length; i++)
                            {
                                string id = hiddenInputIds[i];
                                string dbFieldName = dbFields[i];

                                dict[id].Value = sdr[dbFieldName].ToString();
                            }
                        }
                    }//end if
                }//end if
                else {
                    Debug.Assert(false);
                }
            }
        }

        private void InitHiddenParamDict(string[] hiddenInputIds, Dictionary<string, HtmlInputHidden> dict)
        {
            foreach (string id in hiddenInputIds)
            {
                Debug.Assert(FindControl(id) != null);

                dict.Add(id, FindControl(id) as HtmlInputHidden);
            }
        }
    }
}
