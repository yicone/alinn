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
using System.Text;

namespace Web
{
    public partial class ZoneCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string[] hdnParams = new string[]{"hdn_siteid",
                    "hdn_sitename",
                    "hdn_siteurl",
                    "hdn_zonecatids",
                    "hdn_mediatype",
                    "hdn_transtype",
                    "hdn_zonesize",       
                    "hdn_zoneid",      
                    "hdn_zonename",     
                    "hdn_weekprice",    
                    "hdn_zonedesp",   
                    "hdn_infirstpage", 
                    "hdn_allowadultad",  
                    "hdn_keywords",
                    "hdn_recommendweekprice",
                    "hdn_needauditing",
                    "hdn_classids"
                };

                foreach (string param in hdnParams)
                {
                    //Page.PreviousPage.FindControl
                    (FindControl(param) as HtmlInputHidden).Value = Request.Form[param];
                }


                lbUnselect.Items.Add(new ListItem());
                txtKeyword.Text = hdn_keywords.Value;
            }
        }

        protected void ddlParentCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            if (lbSelected.Items.Count == 0 ||
                SerializeSelectedCategories().IndexOf(lbUnselect.SelectedValue) == -1)
            {
                int selectedIndex = lbUnselect.SelectedIndex;

                lbSelected.Items.Add(lbUnselect.SelectedItem);
                lbUnselect.SelectedIndex = -1;
            }
        }

        protected void btnUnselect_Click(object sender, EventArgs e)
        {
            int selectedIndex = lbSelected.SelectedIndex;

            lbSelected.SelectedIndex = -1;
            lbSelected.Items.RemoveAt(selectedIndex);

        }

        private string SerializeSelectedCategories()
        {
            //将多选项序列化为如"0,2,3,5"的格式
            StringBuilder sbCategories = new StringBuilder();
            foreach (ListItem li in this.lbSelected.Items)
            {
                sbCategories.Append(li.Value);
                sbCategories.Append(",");
            }

            string categories = (sbCategories.Length > 0) ? (sbCategories.Remove(sbCategories.Length - 1, 1).ToString()) : string.Empty;
            return categories;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string classIds = SerializeSelectedCategories();
            hdn_classids.Value = classIds;
            hdn_keywords.Value = txtKeyword.Text.Trim();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Server.Transfer(Page.PreviousPage.
        }
    }
}
