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
using System.Drawing;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;

namespace Web.User
{
    public partial class BuildImageCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //生成4位的验证码
            string strCode = RndNum(4);
            HttpCookie ValidCode = new HttpCookie("ImageV", strCode);
            Response.Cookies.Add(ValidCode);
            this.ValidateCode(strCode);
        }

        /// <summary>
        /// 生成随机数图片
        /// </summary>
        /// <param name="VNum"></param>
        private void ValidateCode(string RandomCode)
        {

            int drawWidth = RandomCode.Length * 20;
            int drawHeight = 35;
            Bitmap drawImage = new Bitmap(drawWidth, drawHeight);
            Graphics drawGraphics = Graphics.FromImage(drawImage);

            try
            {
                drawGraphics.Clear(Color.White);		//清空背景颜色

                Random random = new Random();
                for (int i = 0; i < 35; i++)
                {
                    int x1 = random.Next(drawImage.Width);
                    int x2 = random.Next(drawImage.Width);
                    int y1 = random.Next(drawImage.Height);
                    int y2 = random.Next(drawImage.Height);
                    drawGraphics.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
                }

                //文字字体
                Font drowFont = new Font("Arial Black", 14, (System.Drawing.FontStyle.Italic));

                //文字画刷
                LinearGradientBrush drowBrush = new LinearGradientBrush(new Rectangle(0, 0, drawImage.Width, drawImage.Height), Color.Blue, Color.DarkGoldenrod, 1.2f, true);
                drawGraphics.DrawString(RandomCode, drowFont, drowBrush, 2, 2);

                //画图片的前景噪音点
                for (int i = 0; i < 100; i++)
                {
                    int x = random.Next(drawImage.Width);
                    int y = random.Next(drawImage.Height);
                    drawImage.SetPixel(x, y, Color.FromArgb(random.Next()));
                }

                //画图片的边框线
                drawGraphics.DrawRectangle(new Pen(Color.Silver), 0, 0, drawImage.Width - 1, drawImage.Height - 1);

                MemoryStream ms = new MemoryStream();
                drawImage.Save(ms, ImageFormat.Jpeg);
                Response.ClearContent();
                Response.ContentType = "image/Jpeg";
                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
            finally
            {
                drawGraphics.Dispose();
                drawImage.Dispose();
            }
        }

        /// <summary>
        /// 生成随机码
        /// </summary>
        /// <param name="VcodeNum"></param>
        /// <returns></returns>
        private string RndNum(int VcodeNum)
        {
            //string Vchar = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
            string Vchar = "2,3,4,5,6,7,8,9,a,b,d,e,f,h,l,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z";
            Vchar = Vchar.ToUpper();
            string[] VcArray = Vchar.Split(',');
            string VNum = string.Empty;
            int temp = -1;

            Random rand = new Random();

            for (int i = 1; i < VcodeNum + 1; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
                }

                int t = rand.Next(29);
                if (temp != -1 && temp == t)
                {
                    return RndNum(VcodeNum);
                }
                temp = t;
                VNum += VcArray[t];
            }
            return VNum;
        }
    }
}
