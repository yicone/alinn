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

namespace Maticsoft.Web.HOT_BookInf
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
		
private void ShowInfo(int BookInfoId)
{
	HOT.BLL.HOT_BookInf bll=new HOT.BLL.HOT_BookInf();
	HOT.Model.HOT_BookInf model=bll.GetModel(BookInfoId);
	this.lblBookClassId.Text=model.BookClassId.ToString();
	this.lblBookName.Text=model.BookName;
	this.lblISBN.Text=model.ISBN;
	this.lblAuthor.Text=model.Author;
	this.lblTranslator.Text=model.Translator;
	this.lblInvestigator.Text=model.Investigator;
	this.lblBookConcern.Text=model.BookConcern.ToString();
	this.lblBookSize.Text=model.BookSize;
	this.lblPrintSheet.Text=model.PrintSheet.ToString();
	this.lblWords.Text=model.Words.ToString();
	this.lblPublishYear.Text=model.PublishYear.ToString();
	this.lblEdition.Text=model.Edition.ToString();
	this.lblPrintTime.Text=model.PrintTime.ToString();
	this.lblPrintNum.Text=model.PrintNum.ToString();
	this.lblBookPrice.Text=model.BookPrice.ToString();
	this.lblBindingId.Text=model.BindingId.ToString();
	this.lblPages.Text=model.Pages.ToString();
	this.lblImages.Text=model.Images;
	this.lblState.Text=model.State.ToString();
	this.lblRecommendation.Text=model.Recommendation;
	this.lblContent.Text=model.Content;
	this.lblList.Text=model.List;
	this.lblDownLoad.Text=model.DownLoad;
	this.lblAddDate.Text=model.AddDate.ToString();

}

    }
}
