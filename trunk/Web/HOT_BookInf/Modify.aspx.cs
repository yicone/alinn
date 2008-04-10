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
namespace Maticsoft.Web.HOT_BookInf
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
			
private void ShowInfo(int BookInfoId)
{
	HOT.BLL.HOT_BookInf bll=new HOT.BLL.HOT_BookInf();
	HOT.Model.HOT_BookInf model=bll.GetModel(BookInfoId);
	this.lblBookInfoId.Text=model.BookInfoId.ToString();
	this.txtBookClassId.Text=model.BookClassId.ToString();
	this.txtBookName.Text=model.BookName;
	this.txtISBN.Text=model.ISBN;
	this.txtAuthor.Text=model.Author;
	this.txtTranslator.Text=model.Translator;
	this.txtInvestigator.Text=model.Investigator;
	this.txtBookConcern.Text=model.BookConcern.ToString();
	this.txtBookSize.Text=model.BookSize;
	this.txtPrintSheet.Text=model.PrintSheet.ToString();
	this.txtWords.Text=model.Words.ToString();
	this.txtPublishYear.Text=model.PublishYear.ToString();
	this.txtEdition.Text=model.Edition.ToString();
	this.txtPrintTime.Text=model.PrintTime.ToString();
	this.txtPrintNum.Text=model.PrintNum.ToString();
	this.txtBookPrice.Text=model.BookPrice.ToString();
	this.txtBindingId.Text=model.BindingId.ToString();
	this.txtPages.Text=model.Pages.ToString();
	this.txtImages.Text=model.Images;
	this.txtState.Text=model.State.ToString();
	this.txtRecommendation.Text=model.Recommendation;
	this.txtContent.Text=model.Content;
	this.txtList.Text=model.List;
	this.txtDownLoad.Text=model.DownLoad;
	this.txtAddDate.Text=model.AddDate.ToString();

}
		protected void btnAdd_Click(object sender, EventArgs e)
		{
			
	string strErr="";
	if(!PageValidate.IsNumber(txtBookClassId.Text))
	{
		strErr+="BookClassId不是数字！\\n";	
	}
	if(this.txtBookName.Text =="")
	{
		strErr+="BookName不能为空！\\n";	
	}
	if(this.txtISBN.Text =="")
	{
		strErr+="ISBN不能为空！\\n";	
	}
	if(this.txtAuthor.Text =="")
	{
		strErr+="Author不能为空！\\n";	
	}
	if(this.txtTranslator.Text =="")
	{
		strErr+="Translator不能为空！\\n";	
	}
	if(this.txtInvestigator.Text =="")
	{
		strErr+="Investigator不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtBookConcern.Text))
	{
		strErr+="BookConcern不是数字！\\n";	
	}
	if(this.txtBookSize.Text =="")
	{
		strErr+="BookSize不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtPrintSheet.Text))
	{
		strErr+="PrintSheet不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtWords.Text))
	{
		strErr+="Words不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtPublishYear.Text))
	{
		strErr+="PublishYear不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtEdition.Text))
	{
		strErr+="Edition不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtPrintTime.Text))
	{
		strErr+="PrintTime不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtPrintNum.Text))
	{
		strErr+="PrintNum不是数字！\\n";	
	}
	if(!PageValidate.IsDecimal(txtBookPrice.Text))
	{
		strErr+="BookPrice不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtBindingId.Text))
	{
		strErr+="BindingId不是数字！\\n";	
	}
	if(!PageValidate.IsNumber(txtPages.Text))
	{
		strErr+="Pages不是数字！\\n";	
	}
	if(this.txtImages.Text =="")
	{
		strErr+="Images不能为空！\\n";	
	}
	if(!PageValidate.IsNumber(txtState.Text))
	{
		strErr+="State不是数字！\\n";	
	}
	if(this.txtRecommendation.Text =="")
	{
		strErr+="Recommendation不能为空！\\n";	
	}
	if(this.txtContent.Text =="")
	{
		strErr+="Content不能为空！\\n";	
	}
	if(this.txtList.Text =="")
	{
		strErr+="List不能为空！\\n";	
	}
	if(this.txtDownLoad.Text =="")
	{
		strErr+="DownLoad不能为空！\\n";	
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
	int BookClassId=int.Parse(this.txtBookClassId.Text);
	string BookName=this.txtBookName.Text;
	string ISBN=this.txtISBN.Text;
	string Author=this.txtAuthor.Text;
	string Translator=this.txtTranslator.Text;
	string Investigator=this.txtInvestigator.Text;
	int BookConcern=int.Parse(this.txtBookConcern.Text);
	string BookSize=this.txtBookSize.Text;
	int PrintSheet=int.Parse(this.txtPrintSheet.Text);
	int Words=int.Parse(this.txtWords.Text);
	int PublishYear=int.Parse(this.txtPublishYear.Text);
	int Edition=int.Parse(this.txtEdition.Text);
	int PrintTime=int.Parse(this.txtPrintTime.Text);
	int PrintNum=int.Parse(this.txtPrintNum.Text);
	decimal BookPrice=decimal.Parse(this.txtBookPrice.Text);
	int BindingId=int.Parse(this.txtBindingId.Text);
	int Pages=int.Parse(this.txtPages.Text);
	string Images=this.txtImages.Text;
	int State=int.Parse(this.txtState.Text);
	string Recommendation=this.txtRecommendation.Text;
	string Content=this.txtContent.Text;
	string List=this.txtList.Text;
	string DownLoad=this.txtDownLoad.Text;
	DateTime AddDate=DateTime.Parse(this.txtAddDate.Text);


	HOT.Model.HOT_BookInf model=new HOT.Model.HOT_BookInf();
	model.BookClassId=BookClassId;
	model.BookName=BookName;
	model.ISBN=ISBN;
	model.Author=Author;
	model.Translator=Translator;
	model.Investigator=Investigator;
	model.BookConcern=BookConcern;
	model.BookSize=BookSize;
	model.PrintSheet=PrintSheet;
	model.Words=Words;
	model.PublishYear=PublishYear;
	model.Edition=Edition;
	model.PrintTime=PrintTime;
	model.PrintNum=PrintNum;
	model.BookPrice=BookPrice;
	model.BindingId=BindingId;
	model.Pages=Pages;
	model.Images=Images;
	model.State=State;
	model.Recommendation=Recommendation;
	model.Content=Content;
	model.List=List;
	model.DownLoad=DownLoad;
	model.AddDate=AddDate;
	HOT.BLL.HOT_BookInf bll=new HOT.BLL.HOT_BookInf();
	bll.Update(model);
		}

    }
}
