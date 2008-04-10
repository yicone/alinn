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
namespace Maticsoft.Web.HOT_BookClass
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
			
private void ShowInfo(int BookClassId)
{
	HOT.BLL.HOT_BookClass bll=new HOT.BLL.HOT_BookClass();
	HOT.Model.HOT_BookClass model=bll.GetModel(BookClassId);
	this.lblBookClassId.Text=model.BookClassId.ToString();
	this.txtBookClassName.Text=model.BookClassName;
	this.txtSonId.Text=model.SonId.ToString();
	this.txtBookClassInfo.Text=model.BookClassInfo;

}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(this.txtBookClassName.Text =="")
	{
		strErr+="BookClassName不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtSonId.Text))
	{
		strErr+="SonId不是数字！\\n";	
	}
	if(this.txtBookClassInfo.Text =="")
	{
		strErr+="BookClassInfo不能为空！\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	string BookClassName=this.txtBookClassName.Text;
	int SonId=int.Parse(this.txtSonId.Text);
	string BookClassInfo=this.txtBookClassInfo.Text;


	HOT.Model.HOT_BookClass model=new HOT.Model.HOT_BookClass();
	model.BookClassName=BookClassName;
	model.SonId=SonId;
	model.BookClassInfo=BookClassInfo;
	HOT.BLL.HOT_BookClass bll=new HOT.BLL.HOT_BookClass();
	bll.Update(model);
		}

    }
}
