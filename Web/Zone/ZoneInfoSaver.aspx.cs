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
using System.Diagnostics;

namespace Web
{
    public partial class ZoneInfoSaver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.Assert(Request.UrlReferrer != null);
            string lastPageUrl = Request.UrlReferrer.AbsolutePath;

            Guid zoneId = new Guid();
            string strZoneId = Request.Form["zoneid"];
            bool updateFlag = (string.IsNullOrEmpty(strZoneId) || (GuidHelper.TryParse(strZoneId, out zoneId) && zoneId != Guid.Empty));
            HOT.BLL.Zone zoneManager = new HOT.BLL.Zone();
            HOT.Model.Zone model = (!updateFlag) ? zoneManager.GetModel(zoneId) : new HOT.Model.Zone();

            if (lastPageUrl.Contains("ZoneCategory.aspx"))
            {
                try
                {
                    model.ZoneName = Request.Form["zonename"];
                    model.UserId = Guid.NewGuid();              //UNDONE:!!!从cookie中取
                    model.SiteId = new Guid(Request.Form["siteid"]);
                    model.MediaType = int.Parse(Request.Form["mediatype"]);
                    model.InFirst = int.Parse(Request.Form["infirstpage"]);
                    model.SizeId = Int32.Parse(Request.Form["sizeid"]);
                    model.TransType = Int32.Parse(Request.Form["transtype"]);
                    model.ClassIds = Request.Form["classids"];
                    model.Keywords = Request.Form["keywords"];
                    model.NeedAuditing = Int32.Parse(Request.Form["needauditing"]);
                    model.Description = Request.Form["zonedesp"];
                    decimal weekprice;
                    if (decimal.TryParse(Request.Form["weekprice"], out weekprice))
                    {
                        model.WeekPrice = weekprice;
                    }
                    //zonestate不在此处修改
                    //allowadultad, recommendweekprice暂时不用
                    //广告位样式不在此处修改
                    if (updateFlag)
                        zoneManager.Add(model);
                    else
                        zoneManager.Update(model);
                    //添加/修改成功后，都将zoneid写入隐藏字段
                    zoneId = model.ZoneId;
                }
                
                catch
                {
                    //TODO:显示错误的页面，可能是Zone.aspx, 实验用Page.PreviousPage
                    throw;
                }

                Response.Write(zoneId.ToString());
                Response.End();
            }
            else if (lastPageUrl.Contains("ZoneDesigner.aspx"))
            {
                try
                {
                    model.ZoneStyle = Request.Form["zonestyle"];

                    zoneManager.Update(model);
                }
                catch
                {
                    throw;
                }

                Response.End();
            }
            else
            {
                Debug.Assert(false);
            }
        }
    }
}
