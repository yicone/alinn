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

namespace Web
{
    public partial class ZoneDesigner : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            string[] hdnParams = { 
                "TradeMAMA",        //?5
                "returnzoneview",    //?
                "actioncontrol",    //? "addzone"
                "hdn_siteid", 
                "hdn_sitename", 
                "hdn_siteurl", 
                "hdn_zonecatids",       //广告位愿意承担承担的广告分类s
                "hdn_zonetype",         //广告位支持的广告媒体形式，文字、图片和flash、二者同时提供
                "hdn_transtype", //? 7
                "hdn_sizecode", //34
                "hdn_size", //250x250
                "hdn_zoneid",
                "hdn_zonename",
                "hdn_weekprice",
                "hdn_zonedesp",
                "hdn_infirstpage",    //在首页，不在首页
                "hdn_allowauditad",
                "hdn_keywords",
                "hdn_recommendweekprice",   //推荐价格
                "hdn_tagids",       //?
                "hdn_tagnames", //?
                "hdn_distype", //? 1
                "hdn_needauditing" //0
            };
        }
    }
}
