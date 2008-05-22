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
using HOT.Common;

namespace Web
{
    public partial class ZoneDesigner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region MyRegion
            Debug.Assert(Session["ZoneId"] != null);

            if (Session["ZoneId"] == null)
                Response.Redirect("/Member/Zone/SiteManager.aspx");
            #endregion

            if (!Page.IsPostBack)
            {
                //将ZoneId传递给JS使用（降低了安全性）
                hdn_zoneid.Value = Session["ZoneId"].ToString();

                hdn_dbaction.Value = "update";
                //UNDONE: 参数验证交由客户端脚本处理
                
                Guid zoneId;
                if (GuidHelper.TryParse(Session["ZoneId"].ToString(), out zoneId))
                {
                    SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier)
                    };
                    parameters[0].Value = zoneId;
                    SqlDataReader sdr = DbHelperSQL.RunProcedure("UP_GetZoneStyle", parameters);
                    while (sdr.Read())
                    {
                        string zoneStyle = sdr["zonestyle"].ToString();
                        string zoneSize = sdr["sizecode"].ToString();

                        if (zoneStyle != "")
                        {
                            hdn_zonestyle.Value = zoneStyle;
                        }
                        if (zoneSize != "")
                        {
                            hdn_zonesize.Value = zoneSize;
                        }
                    }
                }//end if
            }//end if
        }
    }
}
