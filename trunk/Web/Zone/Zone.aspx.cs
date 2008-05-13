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
            if (!Page.IsPostBack)
            {
                Debug.Assert(Request.UrlReferrer != null, "ZoneView.aspx页面不允许直接访问！");

                if (Request.UrlReferrer == null) 
                    Response.Redirect("SiteManager.aspx", true);

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
                else if (lastPageUrl.Contains("ZoneView.aspx"))
                {
                    //修改Zone基本信息
                    if (!string.IsNullOrEmpty(Request.QueryString["zoneid"]))
                    {
                        hdn_dbaction.Value = "update";

                        SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier) };

                        Guid zoneId;
                        GuidHelper.TryParse(Session["ZoneId"].ToString(),  out zoneId);
                        parameters[0].Value = zoneId;
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
                else if (lastPageUrl.Contains("SiteManager.aspx"))
                {
                    //新增广告位
                    string action = Request.QueryString["action"];
                    string strSiteId;
                    if (action == "new")
                    {
                        hdn_dbaction.Value = "new";

                        strSiteId = Request.QueryString["siteid"];
                        hdn_siteid.Value = strSiteId;
                    }
                }
                else
                {
                    Debug.Assert(false, "从未知页面请求Zone.aspx！");
                }
            }
        }

        private void InitHiddenParamDict(string[] hiddenInputIds, Dictionary<string, HtmlInputHidden> dict)
        {
            Control contentPlaceHolder = this.Master.FindControl("_mainContent");
            
            foreach (string id in hiddenInputIds)
            {
                Debug.Assert(contentPlaceHolder.FindControl(id) != null, id + "尚不存在于页面中！");

                dict.Add(id, FindControl(id) as HtmlInputHidden);
            }
        }
    }
}
