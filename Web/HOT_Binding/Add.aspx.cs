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
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        		protected void Page_LoadComplete(object sender, EventArgs e)
		{
			(Master.FindControl("lblTitle") as Label).Text = "��Ϣ���";
		}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(this.txtBinding.Text =="")
	{
		strErr+="Binding����Ϊ�գ�\\n";	
	}
	if(this.txtDescription.Text =="")
	{
		strErr+="Description����Ϊ�գ�\\n";	
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
	bll.Add(model);
		}

    }
}
