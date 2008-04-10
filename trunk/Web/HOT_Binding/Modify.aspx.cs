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
namespace Maticsoft.Web.HOT_Binding
{
    public partial class Modify : System.Web.UI.Page
    {       

        		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			(Master.FindControl("lblTitle") as Label).Text = "信息修改";
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
			
private void ShowInfo(int BindingId)
{
	HOT.BLL.HOT_Binding bll=new HOT.BLL.HOT_Binding();
	HOT.Model.HOT_Binding model=bll.GetModel(BindingId);
	this.lblBindingId.Text=model.BindingId.ToString();
	this.txtBinding.Text=model.Binding;
	this.txtDescription.Text=model.Description;

}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(this.txtBinding.Text =="")
	{
		strErr+="Binding不能为空！\\n";	
	}
	if(this.txtDescription.Text =="")
	{
		strErr+="Description不能为空！\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	string Binding=this.txtBinding.Text;
	string Description=this.txtDescription.Text;


	HOT.Model.HOT_Binding model=new HOT.Model.HOT_Binding();
	model.Binding=Binding;
	model.Description=Description;
	HOT.BLL.HOT_Binding bll=new HOT.BLL.HOT_Binding();
	bll.Update(model);
		}

    }
}
