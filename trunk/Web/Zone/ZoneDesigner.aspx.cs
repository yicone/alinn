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
using HOT.DBUtility;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Diagnostics;

namespace Web
{
    public partial class ZoneDesigner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //string oper = Request.QueryString["oper"]; 
                ////hdn_returnpage.Value = Request.QueryString["returnpage"];
                //if (!String.IsNullOrEmpty(oper) && oper.ToLower() == "edit")
                //{
                    //UNDONE: 参数验证交由客户端脚本处理
                    hdn_zoneid.Value = Session["ZoneId"].ToString();
                    Guid zoneId = new Guid(hdn_zoneid.Value);
                   
                    SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier)
                    };
                    parameters[0].Value = zoneId;
                    SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneStyle", parameters);
                    while (sdr.Read())
                    {
                        string zoneStyle = sdr["zonestyle"].ToString();
                        string zoneSize = sdr["sizecode"].ToString();

                        if(zoneStyle != "")
                        {
                            hdn_zonestyle.Value = zoneStyle;
                        }
                        if (zoneSize != "")
                        {
                            hdn_zonesize.Value = zoneSize;
                        }
                    }
                //}
                //else
                //{
                //    //Debug.Assert(Request.UrlReferrer != null);
                //    //string lastPageUrl = Request.UrlReferrer.AbsolutePath;

                //    Dictionary<string, HtmlInputHidden> dict = new Dictionary<string, HtmlInputHidden>();
                //    string[] hiddenInputIds = new string[] { 
                //        "hdn_zoneid", "hdn_zonename", "hdn_sizeid", "hdn_zonesize", "hdn_mediatype", "hdn_transtype", 
                //        "hdn_weekprice", "hdn_infirstpage", "hdn_needauditing", "hdn_zonedesp", "hdn_classids", 
                //        "hdn_keywords", "hdn_allowadultad", "hdn_recommendweekprice","hdn_siteid" };

                //    string[] dbFields = new string[] { 
                //        "ZoneId", "ZoneName", "SizeId", "SizeCode", "MediaType", "TransType",
                //        "WeekPrice", "InFirst", "NeedAuditing", "ZoneDesp", "ClassIds",
                //        "Keywords", "AllowAdultAd", "RecommendWeekPrice", "SiteId" };

                //    Debug.Assert(hiddenInputIds.Length == dbFields.Length);

                //    //InitHiddenParamDict(hiddenInputIds, dict);
                //}
            }
        }

        private void InitHiddenParamDict(string[] hiddenInputIds, Dictionary<string, HtmlInputHidden> dict)
        {
            foreach (string id in hiddenInputIds)
            {
                Debug.Assert(FindControl(id) != null, id);

                dict.Add(id, FindControl(id) as HtmlInputHidden);
            }
        }
    }
}
