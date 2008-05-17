using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dlClassesDataBind();
                gvecBox1DataBind();
            }
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
                dlSonClassesDataBind(int.Parse(rowv["ClassId"].ToString()),dataList);
            }
        }

        protected void dlSonClassesDataBind(int? parentId,DataList dl)
        {
            HOT.BLL.ZoneClass zcBLL = new HOT.BLL.ZoneClass();
            dl.DataSource = zcBLL.GetList("ParentId=" + parentId.ToString());
            dl.DataBind();
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
        protected void gvecBox1DataBind()
        {
            int parentId = 2;
            DataSet ds = new DataSet();
            ds = GetSonClasses(parentId);
            string strWhere = GetSqlWhere(ds);
            HOT.BLL.Zone zBLL=new HOT.BLL.Zone();
            ds = zBLL.GetList(0, 8, 0, strWhere);
            this.gvecBox1.DataSource = ds;
            this.gvecBox1.DataBind();
        }
    }
}
