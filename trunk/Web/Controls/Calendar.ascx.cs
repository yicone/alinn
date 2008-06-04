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

namespace Web.Controls
{
    public partial class Calendar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int day = DateTime.Now.Day;
            int dayOfWeek =getDayOfWeek(DateTime.Now.DayOfWeek.ToString());
            getLabelText(day, dayOfWeek);
            getLabelStyle(day,dayOfWeek);
        }
        protected void getLabelText(int day,int dayOfWeek)
        {
            for (int i = 0; i <= 41; i++)
            {
                Label label = (Label)FindControl("lab" + i.ToString());
                int text=HOT.Common.Date.GetDay(DateTime.Now, -dayOfWeek) + i;
                int monthDaysCount=HOT.Common.Date.GetMonthDaysCount(DateTime.Now.Year,DateTime.Now.Month);
                if (text <= monthDaysCount)
                {
                    label.Text = text.ToString();
                }
                if(text>monthDaysCount&&text<=(monthDaysCount+HOT.Common.Date.GetMonthDaysCount(DateTime.Now.AddMonths(1).Year,DateTime.Now.AddMonths(1).Month)))
                {
                    label.Text = (i - monthDaysCount + HOT.Common.Date.GetDay(DateTime.Now, -dayOfWeek)).ToString();                    
                }
                if (text > monthDaysCount - text + monthDaysCount + HOT.Common.Date.GetMonthDaysCount(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month))
                {
                    label.Text = (i - (monthDaysCount - HOT.Common.Date.GetDay(DateTime.Now, -dayOfWeek) + monthDaysCount + HOT.Common.Date.GetMonthDaysCount(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month))).ToString();
                }
            }
        }
        protected void getLabelStyle(int day,int dayOfWeek)
        {
            //今天以前的效果
            for (int i = 0; i < dayOfWeek; i++)
            {
                Label label = (Label)FindControl("lab" + i.ToString());
                label.BackColor = System.Drawing.Color.FromArgb(238, 233, 233);
            }
            //今天的效果
            Label labToday = (Label)FindControl("lab" + (day-1).ToString());
            labToday.BackColor = System.Drawing.Color.FromArgb(238, 154,0);
            labToday.BorderColor = System.Drawing.Color.FromArgb(205, 133, 0);
            //今天以后29天的效果
            for (int i = day + 1; i <= day + 29; i++)
            {
                Label labCanBuy = (Label)FindControl("lab" + (i - 1).ToString());
                labCanBuy.BackColor = System.Drawing.Color.FromArgb(202, 255, 112);
            }
        }
        protected void getBuyDays()
        {
            Response.Write("<script>alert('OK');</script>");
        }
        protected int getDayOfWeek(string dayOfWeek)
        {
            dayOfWeek = dayOfWeek.ToLower();
            int index = 0;
            switch (dayOfWeek)
            { 
                case "sunday":
                    index = 0;
                    break;
                case "monday":
                    index = 1;
                    break;
                case "tuesday":
                    index = 2;
                    break;
                case "wednesday":
                    index = 3;
                    break;
                case "thursday":
                    index = 4;
                    break;
                case "friday":
                    index = 5;
                    break;
                case "saturday":
                    index=6;
                    break;
            }
            return index;
        }
    }
}