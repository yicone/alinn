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
                "hdn_zonecatids",       //���λԸ��е��е��Ĺ�����s
                "hdn_zonetype",         //���λ֧�ֵĹ��ý����ʽ�����֡�ͼƬ��flash������ͬʱ�ṩ
                "hdn_transtype", //? 7
                "hdn_sizecode", //34
                "hdn_size", //250x250
                "hdn_zoneid",
                "hdn_zonename",
                "hdn_weekprice",
                "hdn_zonedesp",
                "hdn_infirstpage",    //����ҳ��������ҳ
                "hdn_allowauditad",
                "hdn_keywords",
                "hdn_recommendweekprice",   //�Ƽ��۸�
                "hdn_tagids",       //?
                "hdn_tagnames", //?
                "hdn_distype", //? 1
                "hdn_needauditing" //0
            };
        }
    }
}
