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

using HOT.BLL;
using HOT.Model;

public partial class Admin_top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ChkAdminLogin();
    }

    /// <summary>
    /// 更新系统缓存
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>  
    protected void btnRefreshSystemCache_ServerClick(object sender, EventArgs e)
    {
        //RefreshSystemCache();

    }
}
