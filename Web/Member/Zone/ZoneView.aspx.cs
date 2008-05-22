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
using System.Text;
using HOT.Common;
using HOT.BLL;
using System.Diagnostics;

namespace Web
{
    public partial class ZoneView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region MyRegion
            Debug.Assert(Session["ZoneId"] != null);

            if (Session["ZoneId"] == null)
                Response.Redirect("/Member/Zone/SiteManager.aspx");
            #endregion
        }

        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            Debug.Assert(row != null, "DataChecker.sql,zone+site");
            DataRow dr = ((DataRowView)FormView1.DataItem).Row;

            //广告位信息
            Literal lZoneName = (Literal)row.FindControl("zoneName");
            lZoneName.Text = dr["zoneName"].ToString();

            Literal lTransType = (Literal)row.FindControl("transType");
            string transtype;
            if (EnumHelper.TryGetEnumItemDescription<TransType>(dr["transType"], out transtype))   //将数值转换为描述文字
            {
                lTransType.Text = transtype;
            }

            Literal lMediaType = (Literal)row.FindControl("mediaType");
            string mediaType;
            if (EnumHelper.TryGetEnumItemDescription<MediaType>(dr["mediaType"], out mediaType))   //将数值转换为描述文字
            {
                lMediaType.Text = mediaType;
            }

            Literal lInFirstpage = (Literal)row.FindControl("inFirstpage");
            string inFirstpage;
            if (EnumHelper.TryGetEnumItemDescription<InFirstpage>(dr["inFirstpage"], out inFirstpage))   //将数值转换为描述文字
            {
                lInFirstpage.Text = inFirstpage;
            }

            Literal lSizeCode = (Literal)row.FindControl("sizeCode");
            lSizeCode.Text = dr["sizeCode"].ToString();

            Literal lZoneDesp = (Literal)row.FindControl("zoneDesp");
            lZoneDesp.Text = dr["zoneDesp"].ToString();
            //广告位扩展信息
            Literal lZoneClasses = (Literal)row.FindControl("zoneClasses");

            string classIds = Convert.ToString(dr["zoneClassids"]);
            lZoneClasses.Text = (classIds != "") ? GetZoneClassString(classIds) : "";  //将ID转换为文字

            Literal lZoneKeywords = (Literal)row.FindControl("zoneKeywords");
            lZoneKeywords.Text = dr["keywords"].ToString();

            //网站信息
            Literal lSiteName = (Literal)row.FindControl("siteName");
            lSiteName.Text = dr["siteName"].ToString();

            Literal lSiteUrl = (Literal)row.FindControl("siteUrl");
            lSiteUrl.Text = dr["siteUrl"].ToString();

            Literal lSiteDesp = (Literal)row.FindControl("siteDesp");
            lSiteDesp.Text = dr["siteDesp"].ToString();

            Literal lSiteClass = (Literal)row.FindControl("siteClass");
            lSiteClass.Text = dr["siteClass"].ToString();

            Literal lSexType = (Literal)row.FindControl("sexType");
            lSexType.Text = dr["sexType"].ToString();

            Literal lAgeType = (Literal)row.FindControl("ageType");
            lAgeType.Text = dr["ageType"].ToString();

            Literal lEmployments = (Literal)row.FindControl("employments");
            string employmentIds = Convert.ToString(dr["employmentids"]);
            lEmployments.Text = (employmentIds != "") ? GetSiteEmploymentTypeString(employmentIds) : ""; //将ID转换为文字

            Literal lTaste = (Literal)row.FindControl("taste");
            lTaste.Text = dr["taste"].ToString();

            //修改链接
            HyperLink linkEditZoneInfo = (HyperLink)row.FindControl("linkEditZoneInfo");
            linkEditZoneInfo.NavigateUrl = "/Member/Zone/Zone.aspx?action=update&zoneid=" + dr["ZoneId"];

            HyperLink linkEditZoneClass = (HyperLink)row.FindControl("linkEditZoneClass");
            linkEditZoneClass.NavigateUrl = "/Member/Zone/ZoneCategory.aspx?action=update&zoneid=" + dr["ZoneId"];

            HyperLink linkEditSiteInfo = (HyperLink)row.FindControl("linkEditSiteInfo");
            linkEditSiteInfo.NavigateUrl = "/Member/Zone/Site.aspx?action=update&siteid=" + dr["SiteId"];
        }

        private string GetSiteEmploymentTypeString(string employmentIds)
        {
            string employmentTypeString = "";
            StringBuilder sb = new StringBuilder();
            SqlParameter[] parameters = {
                        new SqlParameter("EmploymentIds", SqlDbType.NVarChar, 100) };
            parameters[0].Value = employmentIds;
            SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetEmploymentListByEmploymentIds", parameters);
            while (sdr.Read())
            {
                sb.Append(sdr.GetString(1));
                sb.Append(",");
            }

            int length = sb.Length;
            employmentTypeString = (length > 0) ? sb.Remove(length - 1, 1).ToString() : "";
            return employmentTypeString;
        }

        private string GetZoneClassString(string classIds)
        {
            string zoneClassString = "";
            StringBuilder sb = new StringBuilder();
            SqlParameter[] parameters = {
                        new SqlParameter("ClassIds", SqlDbType.NVarChar, 14) };
            parameters[0].Value = classIds;
            SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneClassListByClassIds", parameters);
            while (sdr.Read())
            {
                sb.Append(sdr.GetString(1));
                sb.Append(",");
            }

            int length = sb.Length;
            zoneClassString = (length > 0) ? sb.Remove(length - 1, 1).ToString() : "";
            return zoneClassString;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = Session["ZoneId"];
        }
    }
}
