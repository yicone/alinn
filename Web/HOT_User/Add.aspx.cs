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
using LTP.Common;
namespace Maticsoft.Web.HOT_User
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			(Master.FindControl("lblTitle") as Label).Text = "信息添加";
		}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(!PageValidate.IsNumber(txtRoleID.Text))
	{
		strErr+="RoleID不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtUserType.Text))
	{
		strErr+="UserType不是数字！\\n";	
	}
	if(this.txtUserName.Text =="")
	{
		strErr+="UserName不能为空！\\n";	
	}
	if(this.txtUserPassword.Text =="")
	{
		strErr+="UserPassword不能为空！\\n";	
	}
	if(this.txtQuestion.Text =="")
	{
		strErr+="Question不能为空！\\n";	
	}
	if(this.txtAnswer.Text =="")
	{
		strErr+="Answer不能为空！\\n";	
	}
	if(this.txtEmail.Text =="")
	{
		strErr+="Email不能为空！\\n";	
	}
	if(this.txtAddress.Text =="")
	{
		strErr+="Address不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtPostCode.Text))
	{
		strErr+="PostCode不是数字！\\n";	
	}
	if(this.txtTelephone.Text =="")
	{
		strErr+="Telephone不能为空！\\n";	
	}
	if(this.txtMobile.Text =="")
	{
		strErr+="Mobile不能为空！\\n";	
	}
	if(this.txtQQ.Text =="")
	{
		strErr+="QQ不能为空！\\n";	
	}
	if(this.txtUserFace.Text =="")
	{
		strErr+="UserFace不能为空！\\n";	
	}
	if(!PageValidate.IsDateTime(txtRegTime.Text))
	{
		strErr+="RegTime不是时间格式！\\n";	
	}
	if(!PageValidate.IsDateTime(txtLastLoginTime.Text))
	{
		strErr+="LastLoginTime不是时间格式！\\n";	
	}
	if(this.txtLastLoginIP.Text =="")
	{
		strErr+="LastLoginIP不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtLoginTimes.Text))
	{
		strErr+="LoginTimes不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtUserPoint.Text))
	{
		strErr+="UserPoint不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtUserBooks.Text))
	{
		strErr+="UserBooks不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtConsumePoint.Text))
	{
		strErr+="ConsumePoint不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtUnreadMsg.Text))
	{
		strErr+="UnreadMsg不是数字！\\n";	
	}
	if(this.txtIsLocked.Text =="")
	{
		strErr+="IsLocked不能为空！\\n";	
	}
	if(this.txtUserSetting.Text =="")
	{
		strErr+="UserSetting不能为空！\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	int RoleID=int.Parse(this.txtRoleID.Text);
	int UserType=int.Parse(this.txtUserType.Text);
	string UserName=this.txtUserName.Text;
	string UserPassword=this.txtUserPassword.Text;
	string Question=this.txtQuestion.Text;
	string Answer=this.txtAnswer.Text;
	string Email=this.txtEmail.Text;
	string Address=this.txtAddress.Text;
	int PostCode=int.Parse(this.txtPostCode.Text);
	string Telephone=this.txtTelephone.Text;
	string Mobile=this.txtMobile.Text;
	string QQ=this.txtQQ.Text;
	string UserFace=this.txtUserFace.Text;
	DateTime RegTime=DateTime.Parse(this.txtRegTime.Text);
	DateTime LastLoginTime=DateTime.Parse(this.txtLastLoginTime.Text);
	string LastLoginIP=this.txtLastLoginIP.Text;
	int LoginTimes=int.Parse(this.txtLoginTimes.Text);
	int UserPoint=int.Parse(this.txtUserPoint.Text);
	int UserBooks=int.Parse(this.txtUserBooks.Text);
	int ConsumePoint=int.Parse(this.txtConsumePoint.Text);
	int UnreadMsg=int.Parse(this.txtUnreadMsg.Text);
	string IsLocked=this.txtIsLocked.Text;
	string UserSetting=this.txtUserSetting.Text;


	HOT.Model.HOT_User model=new HOT.Model.HOT_User();
	model.RoleID=RoleID;
	model.UserType=UserType;
	model.UserName=UserName;
	model.UserPassword=UserPassword;
	model.Question=Question;
	model.Answer=Answer;
	model.Email=Email;
	model.Address=Address;
	model.PostCode=PostCode;
	model.Telephone=Telephone;
	model.Mobile=Mobile;
	model.QQ=QQ;
	model.UserFace=UserFace;
	model.RegTime=RegTime;
	model.LastLoginTime=LastLoginTime;
	model.LastLoginIP=LastLoginIP;
	model.LoginTimes=LoginTimes;
	model.UserPoint=UserPoint;
	model.UserBooks=UserBooks;
	model.ConsumePoint=ConsumePoint;
	model.UnreadMsg=UnreadMsg;
	model.IsLocked=IsLocked;
	model.UserSetting=UserSetting;
	HOT.BLL.HOT_User bll=new HOT.BLL.HOT_User();
	bll.Add(model);
		}

    }
}
