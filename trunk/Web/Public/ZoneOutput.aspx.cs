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
using HOT.Model;
using HOT.BLL;
using System.Diagnostics;
using HOT.Common;
using System.Data.SqlClient;

namespace Web
{
    public partial class ZoneOutput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string json = "'[" + Request.QueryString["titlecolor"];
            json += "," + Request.QueryString["titlecolor"];
            json += "," + Request.QueryString["textcolor"];
            json += "," + Request.QueryString["linkcolor"];
            json += "," + Request.QueryString["bordercolor"];
            json += "," + Request.QueryString["backgroundcolor"];
            json += "," + Request.QueryString["groundingcolor"];
            json += "," + Request.QueryString["cornerstyle"];
            json += "," + Request.QueryString["backgroundimage"];
            json += "," + Request.QueryString["iconimage"];
            json += "]'";

            hdn_jsonstyle.Value = json;
            hdn_sizecode.Value = Request.QueryString["sizecode"];
            hdn_layouttype.Value = Request.QueryString["layouttype"];
            hdn_zoneid.Value = Request.QueryString["zoneid"];
            hdn_zonehref.Value = Request.QueryString["zonehref"];

            Guid zoneId;
            if (GuidHelper.TryParse(hdn_zoneid.Value, out zoneId))
            {
                HOT.Model.Order order = GetActiveOrder(zoneId);
                if (order != null)
                {
                    if (IsPaid(order))
                    {
                        Guid adId = order.AdId;
                        RenderZone(adId);
                        return;
                    }
                }

                RenderDefaultZone(zoneId);
            }
        }


        #region 通过查询判断输出什么样的广告形式和内容

        //是否广告主已经支付了广告的费用
        private bool IsPaid(HOT.Model.Order order)
        {
            bool isPaid = false;
            if (order.Payment.HasValue)
            {
                isPaid = (order.Payment == 1);
            }
            return isPaid;
        }

        //取得广告位
        private HOT.Model.Order GetActiveOrder(Guid zoneId)
        {
            //是否订单已被网站主通过审核
            //0:未审核，1审核通过，2审核拒绝，3过期
            //select * from al_order where auditastate == 1 and zoneid = ' + zoneid
            HOT.Model.Order order = null;
            HOT.BLL.Order orderManager = new HOT.BLL.Order();

            Guid orderId = Guid.Empty;
            #region 数据库中取值
            SqlParameter[] parameters = {
                        new SqlParameter("ZoneId", SqlDbType.UniqueIdentifier)
                    };
            Debug.Assert(hdn_zoneid.Value != "");
            parameters[0].Value = new Guid(hdn_zoneid.Value);
            SqlDataReader sdr = HOT.DBUtility.DbHelperSQL.RunProcedure("UP_GetActiveOrder", parameters);
            while (sdr.Read())
            {
                orderId = sdr.GetGuid(0);
                break;
            } 

            #endregion

            if (orderId != Guid.Empty)
            {
                order = orderManager.GetModel(orderId);
            }
            return order;
        }

        private HOT.Model.Ad GetAd(Guid adId)
        {
            HOT.BLL.Ad adManager = new HOT.BLL.Ad();
            HOT.Model.Ad ad = adManager.GetModel(adId);
            return ad;
        }
        #endregion

        #region 不同形式的广告及内容的输出
        private void RenderZone(Guid adId)
        {
            //设置是否显示默认广告
            hdn_isdefaultzone.Value = "false";

            HOT.Model.Ad ad = GetAd(adId);
            if (ad.IsText.HasValue && ad.IsText.Value == 1)
            {
                hdn_mediatype.Value = "text";
                //取出文字广告的内容，交给JS来处理
                hdn_title.Value = ad.Title;
                hdn_text.Value = ad.Content;
                hdn_link.Value = ad.Url;
            }
            else 
            {
                Debug.Assert(ad.IsText.HasValue && ad.IsText.Value == 0);
                hdn_mediatype.Value = "picture";
                //取出图片广告的图片路径，交给JS来处理
                hdn_imagepath.Value = ad.Img;
            }
        }

        private void RenderDefaultZone(object zoneId)
        {
            hdn_isdefaultzone.Value = "true";
            //throw new Exception("The method or operation is not implemented.");
            //TODO;根据广告位创建时选择的MediaType显示不同的默认广告
            //文字和图片多选时，选择图片？
        }
        #endregion
    }
}
