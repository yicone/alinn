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
            this.Page.Title = "广告组管理";
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
            string strWhere = "UserId='"+HOT.BLL.User.GetLoginUser().ToString()+"'";
            ds=agBLL.GetList(strWhere);
            this.dlAdGroup.DataSource = ds;
            this.dlAdGroup.DataBind();
        }

        protected void btnGroupName_Click(object sender, EventArgs e)
        {
            
        }

//二级datalist数据绑定，包括广告组的相关信息显示
        protected void dlAdGroup_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataList dataList = (DataList)e.Item.FindControl("dlAD");
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                //获取广告组ID
                Guid guid=new Guid(rowv["AdGroupId"].ToString());
                HOT.BLL.AdGroup adgBLL = new HOT.BLL.AdGroup();
                HOT.Model.AdGroup adgModel = new HOT.Model.AdGroup();
                //取得广告组相关信息
                adgModel = adgBLL.GetModel(guid);
                HOT.BLL.ZoneClass acBLL = new HOT.BLL.ZoneClass();
                HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
                HOT.Model.ZoneClass zcParentModel = new HOT.Model.ZoneClass();
                zcModel = acBLL.GetModel(adgModel.Class);

                Label labZoneClass = (Label)e.Item.FindControl("labZoneClass");
                if (zcModel.ParentId == 0)
                { 
                    labZoneClass.Text = zcModel.ClassName.ToString(); 
                }
                else
                {
                    zcParentModel = acBLL.GetModel(zcModel.ParentId);
                    labZoneClass.Text = zcParentModel.ClassName.ToString() + " > " + zcModel.ClassName.ToString();
                }
                
                Label labKeyWords = (Label)e.Item.FindControl("labKeyWords");
                labKeyWords.Text = adgModel.KeyWords.ToString();
                if (guid.ToString().Length > 0)
                {
                    HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
                    //获得广告组下所有广告列表。
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
                Session["AdGroupIdToBeAdd"] = guid;
                Response.Redirect("/Member/Ad/NewAd.aspx?AdGroupId=" + guid.ToString(), true);
            }
        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Member/Ad/NewGroup.aspx");
        }

        protected void dlAD_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image imgImg = (Image)e.Item.FindControl("ImgImg");
                Label labTitle = (Label)e.Item.FindControl("labTitle");
                Label labContent = (Label)e.Item.FindControl("labContent");
                imgImg.Visible = false;
                labContent.Visible = false;
                if (imgImg.ImageUrl.Length<28)
                {
                    imgImg.Visible = false;
                    labContent.Visible = true;
                }
                else
                {
                    imgImg.Visible = true;
                    labContent.Visible = false;
                }
            }
        }

        protected void dlAD_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //DataList dlAD = new DataList();
            //dlAD = (DataList)e.Item.FindControl("dlAD");
            DataList dl = new DataList();
            dl=(DataList)source;
            //Guid guid = new Guid(dlAD.DataKeys[e.Item.ItemIndex].ToString());
            Guid guid = new Guid(dl.DataKeys[e.Item.ItemIndex].ToString());
            if (e.CommandName == "EditeAd")
            {
                Session["AdIdToBeEdited"] = guid;
                Response.Redirect("/Member/Ad/EditeAd.aspx?AdId=" + guid.ToString());
            }
            if (e.CommandName == "DeleteAd")
            {
                HOT.BLL.Ad adBLL = new HOT.BLL.Ad();
                adBLL.Delete(guid);
                this.dlAdGroup.DataBind();
                //this.dlAD.DataBind();
                dl.DataBind();
            }
        }
        /// <summary>
        /// 返回状态信息
        /// powered by fzf 22080513 00:59
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public static string adState(int i)
        { 
            string state="";
            switch(i)
            {
                case 0:
                    state="未审核";
                    break;
                case 1:
                    state = "审核通过";
                    break;
                case 2:
                    state = "审核拒绝";
                    break;
                default:
                    state = "未知状态";
                    break;
            }
            return state;
        }
    }
}
