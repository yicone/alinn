using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Web.User
{
    public class Common
    {
        public static string GetUserIP()
        {
            return HttpContext.Current.Request.UserHostAddress;
        }

        public static string GetActiveCode()
        {
            Random random = new Random();
            return random.Next(10000000, 99999999).ToString();
        }
    }


}
