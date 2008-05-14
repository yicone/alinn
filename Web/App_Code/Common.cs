using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
	public Common()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    

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
