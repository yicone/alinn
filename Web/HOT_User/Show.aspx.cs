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

namespace Maticsoft.Web.HOT_User
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
		
private void ShowInfo(int UserID)
{
	HOT.BLL.HOT_User bll=new HOT.BLL.HOT_User();
	HOT.Model.HOT_User model=bll.GetModel(UserID);
	this.lblRoleID.Text=model.RoleID.ToString();
	this.lblUserType.Text=model.UserType.ToString();
	this.lblUserName.Text=model.UserName;
	this.lblUserPassword.Text=model.UserPassword;
	this.lblQuestion.Text=model.Question;
	this.lblAnswer.Text=model.Answer;
	this.lblEmail.Text=model.Email;
	this.lblAddress.Text=model.Address;
	this.lblPostCode.Text=model.PostCode.ToString();
	this.lblTelephone.Text=model.Telephone;
	this.lblMobile.Text=model.Mobile;
	this.lblQQ.Text=model.QQ;
	this.lblUserFace.Text=model.UserFace;
	this.lblRegTime.Text=model.RegTime.ToString();
	this.lblLastLoginTime.Text=model.LastLoginTime.ToString();
	this.lblLastLoginIP.Text=model.LastLoginIP;
	this.lblLoginTimes.Text=model.LoginTimes.ToString();
	this.lblUserPoint.Text=model.UserPoint.ToString();
	this.lblUserBooks.Text=model.UserBooks.ToString();
	this.lblConsumePoint.Text=model.ConsumePoint.ToString();
	this.lblUnreadMsg.Text=model.UnreadMsg.ToString();
	this.lblIsLocked.Text=model.IsLocked;
	this.lblUserSetting.Text=model.UserSetting;

}

    }
}
