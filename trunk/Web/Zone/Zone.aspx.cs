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

//此页面需要添加的字段
//广告位名称、广告内容、广告所在位置、选择广告位尺寸、选择计费类型、广告位描述

namespace Web
{
    public partial class Zone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string[] hdnParams = new string[]{"hdn_siteid",
                    "hdn_sitename",
                    "hdn_siteurl",
                    "hdn_zonecatids",
                    "hdn_mediatype",
                    "hdn_transtype",
                    "hdn_zonesize",       
                    "hdn_zoneid",      
                    "hdn_zonename",     
                    "hdn_weekprice",    
                    "hdn_zonedesp",   
                    "hdn_infirstpage", 
                    "hdn_allowadultad",  
                    "hdn_keywords",
                    "hdn_recommendweekprice",
                    "hdn_needauditing",
                    "hdn_classids"
                };

                foreach (string param in hdnParams)
                {
                    //Page.PreviousPage.FindControl
                    (FindControl(param) as HtmlInputHidden).Value = Request.Form[param];
                }
                
            }
        }
    }
}
