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
                #region 输入参数检验
                string lowerAction = Request.QueryString["action"];
                object oZoneId = Session["ZoneId"]; //用于修改广告位
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
                    //TODO:获取较少的数据（只需获取分类和关键字）!
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
                else
                {
                    Debug.Assert(lowerAction == "new", "请检查此断言上部的参数验证是否完整！");

                    string lowerLastPageUrl = requestUri.AbsolutePath.ToLower();
                    if (lowerLastPageUrl.Contains("zone.aspx"))
                    {
                        hdn_dbaction.Value = "new";

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

        //将多选项序列化为如"0,2,3,5"的格式
        private string SerializeSelectedCategories()
        {
            StringBuilder sbCategories = new StringBuilder();
            foreach (ListItem li in this.lbSelected.Items)
            {
                sbCategories.Append(li.Value);
                sbCategories.Append(",");
            }

            string categories = (sbCategories.Length > 0) ? (sbCategories.Remove(sbCategories.Length - 1, 1).ToString()) : string.Empty;
            return categories;
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
