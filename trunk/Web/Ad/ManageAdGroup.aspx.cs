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
/*
 * powered by FZF
 * 20080421
 */
namespace Web.User
{
    public partial class ManageAdGroup : System.Web.UI.Page
    {
        public DataList dlAD = new DataList();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserId"]="936DA01F-9ABD-4D9D-80C7-02AF85C822A7";
            //if (!IsPostBack)
            //{
                dlAdGroupDateBind();
            //}
        }
        //一级datalist数据绑定
        private void dlAdGroupDateBind()
        {
            HOT.BLL.AdGroup agBLL = new HOT.BLL.AdGroup();
            DataSet ds = new DataSet();
            string strWhere = "UserId='936DA01F-9ABD-4D9D-80C7-02AF85C822A7'";
            ds=agBLL.GetList(strWhere);
            this.dlAdGroup.DataSource = ds;
            this.dlAdGroup.DataBind();
        }

        protected void btnGroupName_Click(object sender, EventArgs e)
        {
            
        }

//二级datalist数据绑定
        protected void dlAdGroup_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataList dataList = (DataList)e.Item.FindControl("dlAD");
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                Guid guid=new Guid(rowv["AdGroupId"].ToString());
                HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
                HOT.Model.AdGroup adgModel = new HOT.Model.AdGroup();
                adgModel = adgBLL.GetModel(guid);
                HOT.BLL.ZoneClass acBLL = new HOT.BLL.ZoneClass();
                HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
                HOT.Model.ZoneClass zcParentModel = new HOT.Model.ZoneClass();
                zcModel = acBLL.GetModel(adgModel.Class);
                zcParentModel = acBLL.GetModel(zcModel.ParentId);
                Label labZoneClass = (Label)e.Item.FindControl("labZoneClass");
                labZoneClass.Text = zcParentModel.ClassName.ToString() + " > " + zcModel.ClassName.ToString();
                Label labKeyWords = (Label)e.Item.FindControl("labKeyWords");
                labKeyWords.Text = adgModel.KeyWords.ToString();
                if (guid.ToString().Length > 0)
                {
                    HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
                    DataSet ds = adBLL.GetList(guid.ToString());
                    if (ds != null)
                    {
                        try
                        {
                            dataList.DataSource = ds;
                            dataList.DataBind();
                            dlAD = dataList;
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                    }
                }
            }
        }
        protected void dlAdGroup_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Guid guid =new Guid(dlAdGroup.DataKeys[e.Item.ItemIndex].ToString());
            if (e.CommandName == "DeleteGroup")
            {
                HOT.BLL.AdGroup agBLL = new HOT.BLL.AdGroup();
                agBLL.Delete(guid);
                //同步删除此广告组下的所有广告
                HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
                adBLL.Delete("AdGroupId='" + guid.ToString() + "'");
                //再次数据绑定
                dlAdGroupDateBind();
            }
            if (e.CommandName == "AddAd")
            {
                Response.Redirect("NewAd.aspx?AdGruopId=" + guid.ToString());
            }
        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewGroup.aspx");
        }

        protected void dlAD_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image imgImg = (Image)e.Item.FindControl("ImgImg");
                Label labTitle = (Label)e.Item.FindControl("labTitle");
                Label labContent = (Label)e.Item.FindControl("labContent");
                imgImg.Visible = false;
                labTitle.Visible = false;
                labContent.Visible = false;
                if (imgImg.ImageUrl.Length<=0)
                {
                    imgImg.Visible = false;
                    labTitle.Visible = true;
                    labContent.Visible = true;
                }
                else
                {
                    imgImg.Visible = true;
                    labTitle.Visible = false;
                    labContent.Visible = false;
                }
            }
        }

        protected void dlAD_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //DataList dlAD = new DataList();
            //dlAD = (DataList)e.Item.FindControl("dlAD");
            Guid guid = new Guid(dlAD.DataKeys[e.Item.ItemIndex].ToString());
            if (e.CommandName == "EditeAd")
            {
                Response.Redirect("EditeAd.aspx?AdId=" + guid.ToString());
            }
            if (e.CommandName == "DeleteAd")
            {
                HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
                adBLL.Delete(guid);
                this.dlAdGroup.DataBind();
                this.dlAD.DataBind();
            }
        }
    }
}
