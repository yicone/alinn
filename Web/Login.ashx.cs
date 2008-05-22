using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

namespace Web
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class LoginHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                context.Response.Redirect("/NotAuthorized.aspx");
            }
            else
            {
                string loginUrl;
                string returnUrl = context.Request.Params["returnUrl"];

                if(returnUrl.Contains("/Admin/"))
                {
                    loginUrl = "/AdminLogin.aspx";
                }
                else
                {
                    loginUrl = "/Public/Login.aspx";
                }

                if (!string.IsNullOrEmpty(context.Request.Params["returnUrl"]))
                {
                    loginUrl = loginUrl + "?returnUrl=" + HttpUtility.UrlEncode(context.Request.Params["returnUrl"]);
                }
                context.Response.Redirect(loginUrl);
            }
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}
