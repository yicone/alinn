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
    public partial class EffectReport : System.Web.UI.Page
    {
        public static DateTime dt_today = DateTime.Today;
        public static DateTime dt_lastmonthday = dt_today.AddMonths(-1);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CalendarExtender2.SelectedDate = dt_today;
            this.CalendarExtender1.SelectedDate = dt_lastmonthday;
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
                e.Command.Parameters[2].Value = dt_lastmonthday.ToShortDateString();
                e.Command.Parameters[3].Value = dt_today.ToShortDateString();
            }
            else
            {
                e.Command.Parameters[1].Value = this.DropDownList1.SelectedValue;
                e.Command.Parameters[2].Value = this.TextBox1.Text;
                e.Command.Parameters[3].Value = this.TextBox2.Text;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}
