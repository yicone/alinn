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
        //接受POST参数，对Zone进行修改或添加
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.Assert(Request.UrlReferrer != null, "不能获取向此页发送POST的页面名称！");

            string lastPageUrl = Request.UrlReferrer.AbsolutePath;
            HOT.BLL.Zone zoneManager = new HOT.BLL.Zone();
            HOT.Model.Zone model;
            Guid zoneId;
            string dbAction = Request.Form["dbaction"];

            //NOTE!解决ZoneCategory提交修改时的问题
            if (dbAction == "new" && Session["ZoneId"] != null && GuidHelper.TryParse(Session["ZoneId"].ToString(), out zoneId) && zoneId != Guid.Empty)
            {
                dbAction = "update";
            }

            if (dbAction == "new")
            {
                Debug.Assert(lastPageUrl.Contains("ZoneCategory.aspx"));
                model = new HOT.Model.Zone();

                model.UserId = new Guid(Session["UserId"].ToString());
                model.SiteId = new Guid(Request.Form["siteid"]);
                #region 添加广告位
                model.ZoneName = Request.Form["zonename"];
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

                zoneManager.Add(model);
                #endregion
                zoneId = model.ZoneId;
                //note!
                Session["ZoneId"] = zoneId.ToString();

                Response.Write(zoneId.ToString());
                Response.End(); 
            }
            else if (dbAction == "update")
            {
                Debug.Assert(Session["ZoneId"] != null, "没有从Session中得到ZoneId！");

                bool correct = GuidHelper.TryParse(Session["ZoneId"].ToString(), out zoneId);
                Debug.Assert(correct && zoneId != Guid.Empty, "来自Session的ZoneId格式异常！");

                model = zoneManager.GetModel(zoneId);
                //zonestate不在此处修改
                //allowadultad, recommendweekprice暂时不用

                if (lastPageUrl.Contains("ZoneCategory.aspx"))
                {
                    #region 修改广告位分类
                    model.ClassIds = Request.Form["classids"];
                    model.Keywords = Request.Form["keywords"];

                    zoneManager.Update(model);
                    #endregion
                    zoneId = model.ZoneId;

                    Response.Write(zoneId.ToString());
                    Response.End(); 
                }
                else if (lastPageUrl.Contains("Zone.aspx"))
                {
                    #region 修改广告位基本信息
                    model.ZoneName = Request.Form["zonename"];
                    model.MediaType = int.Parse(Request.Form["mediatype"]);
                    model.InFirst = int.Parse(Request.Form["infirstpage"]);
                    model.SizeId = Int32.Parse(Request.Form["sizeid"]);
                    model.TransType = Int32.Parse(Request.Form["transtype"]);
                    model.NeedAuditing = Int32.Parse(Request.Form["needauditing"]);
                    model.Description = Request.Form["zonedesp"];
                    decimal weekprice;
                    if (decimal.TryParse(Request.Form["weekprice"], out weekprice))
                    {
                        model.WeekPrice = weekprice;
                    }

                    zoneManager.Update(model); 
                    #endregion
                    zoneId = model.ZoneId;

                    Response.Write(zoneId.ToString());
                    Response.End();
                }
                else if (lastPageUrl.Contains("ZoneDesigner.aspx"))
                {
                    #region 修改广告位样式
                    model.ZoneStyle = Request.Form["zonestyle"];

                    zoneManager.Update(model); 
                    #endregion
                    zoneId = model.ZoneId;

                    Response.Write(zoneId.ToString());
                    Response.End();
                }
            }
            else if (dbAction == "del")
            {
                Debug.Assert(Session["ZoneId"] != null, "没有从Session中得到ZoneId！");

                bool correct = GuidHelper.TryParse(Session["ZoneId"].ToString(), out zoneId);
                Debug.Assert(correct && zoneId != Guid.Empty, "来自Session的ZoneId格式异常！");

                zoneManager.Delete(zoneId);

                Response.Write(zoneId.ToString());
                Response.End();
            }
        }
    }
}
