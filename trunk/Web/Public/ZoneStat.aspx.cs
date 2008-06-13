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
using HOT.Common;
using HOT.DBUtility;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Net;

namespace Web
{
    //这个页面关系到MONEY啊！
    public partial class ZoneStat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strZoneId = Request.Form["zoneid"];
            string zoneHref = Request.Form["zonehref"];
            string action = Request.Form["action"];

            #region 参数验证
            if (string.IsNullOrEmpty(strZoneId) || string.IsNullOrEmpty(zoneHref) || string.IsNullOrEmpty(action)) return;

            Guid zoneId;
            if (!GuidHelper.TryParse(strZoneId, out zoneId)) return;
            if (action != "click" && action != "refresh") return; 
            #endregion

            #region 防作弊算法
            //TODO:防止恶意刷新
            //TODO:防止跨过页面直接访问统计服务，增加加密字符串
            #region 防止将广告位放在非注册站点上
            string sqlString = "select SiteUrl from al_zone join al_site on al_zone.siteid = al_site.siteid where zoneid = @zoneid";
            SqlParameter[] sqlParams = {
                new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier)
            };
            sqlParams[0].Value = zoneId;
            object oSiteUrl = DbHelperSQL.GetSingle(sqlString, sqlParams);
            if(oSiteUrl == DBNull.Value || oSiteUrl == null) return;
            string siteUrl = oSiteUrl.ToString();
            if (!zoneHref.Contains(siteUrl)) return; 
            #endregion

            #endregion

            if (action == "click")
            {
                SqlParameter[] paramters = {
                    new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier),
                    new SqlParameter("ClickTime", SqlDbType.Int, 4)
                };
                paramters[0].Value = zoneId;
                paramters[1].Direction = ParameterDirection.Output;

                int rowAffected;
                int dbResult;
                dbResult = DbHelperSQL.RunProcedure("UP_CountClickTime", paramters, out  rowAffected);
                Debug.Assert(rowAffected == 1);
                Debug.Assert(dbResult == 0);
            }
            else if (action == "refresh")
            {
                SqlParameter[] paramters = {
                    new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier),
                    new SqlParameter("PV", SqlDbType.Int, 4)
                };
                paramters[0].Value = zoneId;
                paramters[1].Direction = ParameterDirection.Output;

                int rowAffected;
                int dbResult;
                dbResult = DbHelperSQL.RunProcedure("UP_CountPV", paramters, out  rowAffected);
                Debug.Assert(rowAffected == 1);
            }

        }

        /// <summary>
        /// 取得域名的IP(d)
        /// </summary>
        /// <param name="hostName"></param>
        /// <returns></returns>
        private static IPAddress[] HostName2IP(string hostName)
        {
            IPAddress[] addresses;

            IPHostEntry iphost = Dns.GetHostEntry(hostName);
            addresses = iphost.AddressList;

            return addresses;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strIP"></param>
        /// <returns></returns>
        private static string IP2HostName(string strIP)
        {
            string hostName = null;
            IPAddress ip;
            bool formatCorrect = IPAddress.TryParse(strIP, out ip);
            if(formatCorrect)
            {
                IPHostEntry iphost = Dns.GetHostEntry(ip);
                hostName = iphost.HostName;
            }

            return hostName;
        }
    }
}
