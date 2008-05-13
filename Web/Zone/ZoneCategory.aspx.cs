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
using System.Text;
using System.Data.SqlClient;
using HOT.Common;
using System.Diagnostics;
using System.Collections.Generic;
using HOT.DBUtility;

namespace Web
{
    public partial class ZoneCategory : System.Web.UI.Page
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

                if (lastPageUrl.Contains("Zone.aspx"))
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
                    if (!string.IsNullOrEmpty(Request.QueryString["zoneid"]))
                    {
                        SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier) };
                        parameters[0].Value = new Guid(Request.QueryString["zoneid"]);
                        SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneInfoExtForZone", parameters);   //TODO:获取较少的数据
                        while (sdr.Read())
                        {
                            for (int i = 0; i < hiddenInputIds.Length; i++)
                            {
                                string id = hiddenInputIds[i];
                                string dbFieldName = dbFields[i];

                                dict[id].Value = sdr[dbFieldName].ToString();
                            }
                        }
                    }
                }
                else
                {
                    Debug.Assert(false);
                }

                #region 恢复本页面的数据
                if (hdn_classids.Value != "")
                {
                    SqlParameter[] parameters = {
                        new SqlParameter("ClassIds", SqlDbType.NVarChar, 14)
                    };
                    parameters[0].Value = hdn_classids.Value;
                    DataSet ds = HOT.DBUtility.DbHelperSQL.RunProcedure("UP_GetZoneClassListByClassIds", parameters, "ZoneClass");

                    string text, value;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        text = dr["ClassName"].ToString();
                        value = dr["ClassId"].ToString();
                        lbSelected.Items.Add(new ListItem(text, value));
                    }
                }

                txtKeywords.Text = hdn_keywords.Value;
                #endregion
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            if (lbUnselect.SelectedIndex != -1)
            {
                if (lbSelected.Items.Count == 0 ||
                    SerializeSelectedCategories().IndexOf(lbUnselect.SelectedValue) == -1)
                {
                    int selectedIndex = lbUnselect.SelectedIndex;

                    lbSelected.Items.Add(lbUnselect.SelectedItem);
                    lbUnselect.SelectedIndex = -1;

                    hdn_classids.Value = SerializeSelectedCategories();
                }
            }
        }

        protected void btnUnselect_Click(object sender, EventArgs e)
        {
            if (lbSelected.SelectedIndex != -1)
            {
                int selectedIndex = lbSelected.SelectedIndex;

                lbSelected.SelectedIndex = -1;
                lbSelected.Items.RemoveAt(selectedIndex);

                hdn_classids.Value = SerializeSelectedCategories();
            }
        }

        private string SerializeSelectedCategories()
        {
            //将多选项序列化为如"0,2,3,5"的格式
            StringBuilder sbCategories = new StringBuilder();
            foreach (ListItem li in this.lbSelected.Items)
            {
                sbCategories.Append(li.Value);
                sbCategories.Append(",");
            }

            string categories = (sbCategories.Length > 0) ? (sbCategories.Remove(sbCategories.Length - 1, 1).ToString()) : string.Empty;
            return categories;
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
