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
	bll.Add(model);
		}

    }
}
