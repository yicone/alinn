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
namespace Maticsoft.Web.HOT_Config
{
    public partial class Modify : System.Web.UI.Page
    {       

        		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			(Master.FindControl("lblTitle") as Label).Text = "��Ϣ�޸�";
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
	this.txtSiteName.Text=model.SiteName;
	this.txtSiteUrl.Text=model.SiteUrl;
	this.txtWebmasterName.Text=model.WebmasterName;
	this.txtWebmasterEmail.Text=model.WebmasterEmail;
	this.txtCopyright.Text=model.Copyright;
	this.txtHitsOfHot.Text=model.HitsOfHot.ToString();
	this.txtEnableUserReg.Text=model.EnableUserReg;
	this.txtUserName_RegDisabled.Text=model.UserName_RegDisabled;
	this.txtUserNumber.Text=model.UserNumber.ToString();
	this.txtBookNumber.Text=model.BookNumber.ToString();

}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(this.txtSiteName.Text =="")
	{
		strErr+="SiteName����Ϊ�գ�\\n";	
	}
	if(this.txtSiteUrl.Text =="")
	{
		strErr+="SiteUrl����Ϊ�գ�\\n";	
	}
	if(this.txtWebmasterName.Text =="")
	{
		strErr+="WebmasterName����Ϊ�գ�\\n";	
	}
	if(this.txtWebmasterEmail.Text =="")
	{
		strErr+="WebmasterEmail����Ϊ�գ�\\n";	
	}
	if(this.txtCopyright.Text =="")
	{
		strErr+="Copyright����Ϊ�գ�\\n";	
	}
	if(!PageValidate.IsNumber(txtHitsOfHot.Text))
	{
		strErr+="HitsOfHot�������֣�\\n";	
	}
	if(this.txtEnableUserReg.Text =="")
	{
		strErr+="EnableUserReg����Ϊ�գ�\\n";	
	}
	if(this.txtUserName_RegDisabled.Text =="")
	{
		strErr+="UserName_RegDisabled����Ϊ�գ�\\n";	
	}
	if(!PageValidate.IsNumber(txtUserNumber.Text))
	{
		strErr+="UserNumber�������֣�\\n";	
	}
	if(!PageValidate.IsNumber(txtBookNumber.Text))
	{
		strErr+="BookNumber�������֣�\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	string SiteName=this.txtSiteName.Text;
	string SiteUrl=this.txtSiteUrl.Text;
	string WebmasterName=this.txtWebmasterName.Text;
	string WebmasterEmail=this.txtWebmasterEmail.Text;
	string Copyright=this.txtCopyright.Text;
	int HitsOfHot=int.Parse(this.txtHitsOfHot.Text);
	string EnableUserReg=this.txtEnableUserReg.Text;
	string UserName_RegDisabled=this.txtUserName_RegDisabled.Text;
	int UserNumber=int.Parse(this.txtUserNumber.Text);
	int BookNumber=int.Parse(this.txtBookNumber.Text);


	HOT.Model.HOT_Config model=new HOT.Model.HOT_Config();
	model.SiteName=SiteName;
	model.SiteUrl=SiteUrl;
	model.WebmasterName=WebmasterName;
	model.WebmasterEmail=WebmasterEmail;
	model.Copyright=Copyright;
	model.HitsOfHot=HitsOfHot;
	model.EnableUserReg=EnableUserReg;
	model.UserName_RegDisabled=UserName_RegDisabled;
	model.UserNumber=UserNumber;
	model.BookNumber=BookNumber;
	HOT.BLL.HOT_Config bll=new HOT.BLL.HOT_Config();
	bll.Update(model);
		}

    }
}
