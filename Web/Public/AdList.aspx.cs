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
using HOT.DBUtility;

namespace Web.Ad
{
    public partial class AdList : System.Web.UI.Page
    {
        string Where = " Where AL_Zone.ZoneState=1";
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "广告列表";
            string inClass = "";
            string key = "";
            if (this.Request.QueryString["ClassId"] != null)
            {
                int parentId = int.Parse(this.Request.QueryString["ClassId"].ToString());
                //判断是否是一级目录：
                if (CheckParent(parentId))
                {
                    DataSet dataset = GetSonClasses(parentId);
                    inClass = GetSqlWhere(dataset);
                }
                else
                {
                    inClass = " and classids like '%," + parentId.ToString() + "' or classids like '" + parentId.ToString() + ",%' or classids like '%," + parentId.ToString() + ",%'";
                }
            }
            if (this.Request.QueryString["Key"] != null)
            {
                key = " and keywords like '%" + this.Request.QueryString["Key"] + "%'";
            }
            Where += this.rblInFirst.SelectedValue.ToString() + this.ddlPricePerK.SelectedValue.ToString()+this.ddlVisteNumPerDay.SelectedValue.ToString()+inClass+key;
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            //if (!IsPostBack)
            //{
            DataSet ds = zBLL.GetList(AspNetPager1.StartRecordIndex, 10, 1,Where);
            AspNetPager1.RecordCount = int.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString());
            dlZoneDataBind(Where);
            //}
            if (!IsPostBack)
            {
                dlClassesDataBind();
            }
        }
        private void dlZoneDataBind(string strWhere)
        {
            HOT.BLL.Zone zBLL = new HOT.BLL.Zone();
            DataSet ds = new DataSet();
            ds = zBLL.GetList(AspNetPager1.StartRecordIndex, 10, 0,Where);
            this.dlZone.DataSource = ds;
            this.dlZone.DataBind();
        }

        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            dlZoneDataBind(Where);
        }
        //判断是否是一级目录：
        protected bool CheckParent(int partentId)
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();
            zcModel = zcBLL.GetModel(partentId);
            if (zcModel.ParentId == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //得到一级目录下的所有子目录
        protected DataSet GetSonClasses(int parentId)
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            HOT.Model.ZoneClass zcModel = new HOT.Model.ZoneClass();

            DataSet ds = new DataSet();
            ds = zcBLL.GetList("ParentId=" + parentId.ToString());
            return ds;
        }
        protected string GetSqlWhere(DataSet ds)
        {
            string strWhere = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string classId = "";
                classId = ds.Tables[0].Rows[i]["ClassId"].ToString();
                strWhere += "  and classids like '%," + classId + "' or classids like '" + classId + ",%' or classids like '%," + classId + ",%'";
            }
            return strWhere;
        }
        /// <summary>
        ///一级目录绑定
        ///powered by fzf 20080516
        /// </summary>
        protected void dlClassesDataBind()
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            this.dlClasses.DataSource = zcBLL.GetList("ParentId=0");
            this.dlClasses.DataBind();
        }

        protected void dlClasses_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataList dataList = (DataList)e.Item.FindControl("dlSonClasses");
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                //获取广告组ID
                dlSonClassesDataBind(int.Parse(rowv["ClassId"].ToString()), dataList);
            }
        }

        protected void dlSonClassesDataBind(int? parentId, DataList dl)
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            dl.DataSource = zcBLL.GetList("ParentId=" + parentId.ToString());
            dl.DataBind();
        }
    }
}
