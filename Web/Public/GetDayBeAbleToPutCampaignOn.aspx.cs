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
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace Web.Public
{
    public partial class GetDayBeAbleToPutCampaignOn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string[] querys = new string[]{"zoneid", "year", "month", "during"};
                Dictionary<string, string> dict = GetValidQueryStringDictionary(querys);

                if (dict != null)
                {
                    //TODO:将test替换为从数据库返回的真实数据
                    int[] test = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
                    ResponseToAJAX(test);
                    Response.End();
                }
            }
        }

        private Dictionary<string, string> GetValidQueryStringDictionary(string[] querys)
        {
            Dictionary<string, string> dict = new Dictionary<string, string>(querys.Length);
            foreach (string str in querys)
            {
                string value =Request.QueryString[str];
                if (string.IsNullOrEmpty(value))
                {
                    return null;
                }

                dict.Add(str, value);
            }

            return dict;
        }

        private void ResponseToAJAX(int[] days)
        {
            XmlDocument dom = new XmlDocument();;
            XmlNode nd = dom.CreateNode(XmlNodeType.XmlDeclaration, "<?xml version='1.0' encoding='UTF-8'?>", "");
            dom.AppendChild(nd);

            XmlElement root = dom.CreateElement("putCampaignOn");

            XmlElement child;
            for (int i = 0; i < days.Length; i++)
            {
                child = dom.CreateElement("day_of_month");
                child.InnerText = days[i].ToString();
                root.AppendChild(child);
            }

            dom.AppendChild(root);

            dom.Save(Response.OutputStream);
        }
        public ArrayList getCouldBuy(Guid zoneId)
        {
            int year = DateTime.Now.Year;
            int month=DateTime.Now.Month;
            int today = DateTime.Now.Day;
            ArrayList arraylist = new ArrayList();
           int daysCount=HOT.Common.Date.GetMonthDaysCount(year, month);
           for (int i = 1; i <= daysCount; i++)
           { 
               int add=i-today;
               DateTime datetime = DateTime.Now.AddDays(add);
              HOT.BLL.Order oBLL = new HOT.BLL.Order();
              if (oBLL.Exists(zoneId, datetime))
              {
                  arraylist.Add(datetime.Day);
              }
           }
           return arraylist;
        }
    }
}
