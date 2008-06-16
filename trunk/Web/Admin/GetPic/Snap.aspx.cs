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
using System.Drawing.Imaging;
namespace Snap
{
    public partial class Snap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = string.Empty;
            url = Request.QueryString[0];
            try
            {
                GetImage thumb = new GetImage(url, 1024, 768, 320, 240);
                System.Drawing.Bitmap x = thumb.GetBitmap();
                x.Save(Response.OutputStream, ImageFormat.Jpeg);
                Response.ContentType = "image/jpeg";
            }
            catch
            {
                
            }            
        }
    }
}
