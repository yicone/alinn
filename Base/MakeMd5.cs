using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Security.Cryptography;
using System.Text; 

namespace HOT.Common
{
/// <summary>
/// Md5 的摘要说明
/// </summary>
public class MakeMd5
{
    #region 加密密码，Md5(string str1)
    public static string MakeMd5Pwd(string str1)
    {
        string cl1 = str1;
        string pwd = "";
        MD5 md5 = MD5.Create();
        // 加密后是一个字节类型的数组 
        byte[] s = md5.ComputeHash(Encoding.Unicode.GetBytes(cl1));
        // 通过使用循环，将字节类型的数组转换为字符串，此字符串是常规字符格式化所得 
        for (int i = 0; i < s.Length; i++)
        {
            // 将得到的字符串使用十六进制类型格式。格式后的字符是小写的字母，如果使用大写（X）则格式后的字符是大写字符 
            pwd = pwd + s[i].ToString("x");
        }
        return pwd;
    }
    #endregion 
}
}
