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

namespace Maticsoft.Web.HOT_Config
{
    public partial class Show : System.Web.UI.Page
    {        
        		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			(Master.FindControl("lblTitle") as Label).Text = "œÍœ∏–≈œ¢";
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null || Request.Params["id"].Trim() != "")
				{
					string id = Request.Params["id"];
					ShowInfo(int.Parse(id));
				}
			}
		}
		
private void ShowInfo(int ID)
{
	HOT.BLL.HOT_Config bll=new HOT.BLL.HOT_Config();
	HOT.Model.HOT_Config model=bll.GetModel(ID);
	this.lblSiteName.Text=model.SiteName;
	this.lblSiteUrl.Text=model.SiteUrl;
	this.lblWebmasterName.Text=model.WebmasterName;
	this.lblWebmasterEmail.Text=model.WebmasterEmail;
	this.lblCopyright.Text=model.Copyright;
	this.lblHitsOfHot.Text=model.HitsOfHot.ToString();
	this.lblEnableUserReg.Text=model.EnableUserReg;
	this.lblUserName_RegDisabled.Text=model.UserName_RegDisabled;
	this.lblUserNumber.Text=model.UserNumber.ToString();
	this.lblBookNumber.Text=model.BookNumber.ToString();

}

    }
}
