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
                #region 输入参数检验
                string lowerAction = Request.QueryString["action"];
                object oZoneId = Session["ZoneId"];          //用于修改广告位
                string sSiteId = Request.QueryString["siteid"]; //用于添加广告位
                Uri requestUri = Request.UrlReferrer;

                if (string.IsNullOrEmpty(lowerAction) || (lowerAction != "update" && lowerAction != "new")
                        || requestUri == null)
                {

                    Response.Redirect("/Member/Zone/SiteManager.aspx");
                }
                #endregion

                #region 初始化维护向导各页面状态的变量
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
                }
                else
                {
                    Debug.Assert(lowerAction == "new", "请检查此断言上部的参数验证是否完整！");

                    string lowerLastPageUrl = requestUri.AbsolutePath.ToLower();
                    if (lowerLastPageUrl.Contains("zonecategory.aspx"))
                    {
                        #region 实现数据在向导各页面中的连贯和一致性
                        //从ZoneCategory.aspx返回
                        foreach (KeyValuePair<string, HtmlInputHidden> kvp in dict)
                        {
                            string hiddenId = kvp.Key;
                            HtmlInputHidden hidden = kvp.Value;
                            string hiddenValue = Request.Form[kvp.Key];

                            if (!string.IsNullOrEmpty(hiddenValue))
                            {
                                //为隐藏控件赋值
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
