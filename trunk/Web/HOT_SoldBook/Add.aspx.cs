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
namespace Maticsoft.Web.HOT_SoldBook
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
	if(!PageValidate.IsNumber(txtGrade.Text))
	{
		strErr+="Grade不是数字！\\n";	
	}
	if(!PageValidate.IsDecimal(txtBookPrice.Text))
	{
		strErr+="BookPrice不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtNumber.Text))
	{
		strErr+="Number不是数字！\\n";	
	}
	if(this.txtDescription.Text =="")
	{
		strErr+="Description不能为空！\\n";	
	}
	if(!PageValidate.IsDateTime(txtAddDate.Text))
	{
		strErr+="AddDate不是时间格式！\\n";	
	}

	if(strErr!="")
	{
		MessageBox.Show(this,strErr);
		return;
	}
	int Grade=int.Parse(this.txtGrade.Text);
	decimal BookPrice=decimal.Parse(this.txtBookPrice.Text);
	int Number=int.Parse(this.txtNumber.Text);
	string Description=this.txtDescription.Text;
	DateTime AddDate=DateTime.Parse(this.txtAddDate.Text);


	HOT.Model.HOT_SoldBook model=new HOT.Model.HOT_SoldBook();
	model.Grade=Grade;
	model.BookPrice=BookPrice;
	model.Number=Number;
	model.Description=Description;
	model.AddDate=AddDate;
	HOT.BLL.HOT_SoldBook bll=new HOT.BLL.HOT_SoldBook();
	bll.Add(model);
		}

    }
}
