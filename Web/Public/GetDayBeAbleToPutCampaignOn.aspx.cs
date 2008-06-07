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
                    test();
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

        private void test()
        {
            XmlDocument dom = new XmlDocument();;
            XmlNode nd = dom.CreateNode(XmlNodeType.XmlDeclaration, "<?xml version='1.0' encoding='UTF-8'?>", "");
            dom.AppendChild(nd);

            XmlElement root = dom.CreateElement("putCampaignOn");

            XmlElement child;
            for (int i = 1; i <= 10; i++)
            {
                child = dom.CreateElement("day_of_month");
                child.InnerText = i.ToString();
                root.AppendChild(child);
            }

            for (int i = 12; i <= 15; i++)
            {
                child = dom.CreateElement("day_of_month");
                child.InnerText = i.ToString();
                root.AppendChild(child);
            }

            dom.AppendChild(root);

            dom.Save(Response.OutputStream);
        }
    }
}
