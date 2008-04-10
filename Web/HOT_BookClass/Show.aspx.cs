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

namespace Maticsoft.Web.HOT_BookClass
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
		
private void ShowInfo(int BookClassId)
{
	HOT.BLL.HOT_BookClass bll=new HOT.BLL.HOT_BookClass();
	HOT.Model.HOT_BookClass model=bll.GetModel(BookClassId);
	this.lblBookClassName.Text=model.BookClassName;
	this.lblSonId.Text=model.SonId.ToString();
	this.lblBookClassInfo.Text=model.BookClassInfo;

}

    }
}
