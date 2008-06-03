using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Web.Member.Zone
{
    public partial class OrderViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                //First initialize the page
                //DataList1.DataBind();
            }
            else
            {
                //When post back\
                DataList1.DataBind();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //Creat a query about
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = HOT.BLL.User.GetLoginUser(); //UNDONE: JUST FOR TEST
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = HOT.BLL.User.GetLoginUser(); //UNDONE: JUST FOR TEST
            if (!Page.IsPostBack)
            {
                e.Command.Parameters[1].Value = Guid.Empty;
                e.Command.Parameters[2].Value = " ";
                e.Command.Parameters[3].Value = " ";
            }
            else
            {
                e.Command.Parameters[1].Value = this.DropDownList1.SelectedValue;
                e.Command.Parameters[2].Value = this.TextBox1.Text;
                e.Command.Parameters[3].Value = this.TextBox2.Text;
            }
        }
    }
}
