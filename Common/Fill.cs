using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Text;

using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using Microsoft.VisualBasic;
using System.IO;
using System.Security.Permissions;
using System.Collections;

namespace HOT.Common
{
   public class Fill
    {
        #region file类

        /// <summary>
        /// 得到网站的真实路径
        /// </summary>
        /// <returns></returns>
        public static string GetTrueWebSitePath()
        {
            string path = HttpContext.Current.Request.Path;
            if (path.LastIndexOf("/") != path.IndexOf("/"))
            {
                path = path.Substring(path.IndexOf("/"), path.LastIndexOf("/") + 1);
            }
            else
            {
                path = "/";
            }
            return path;

        }

        /// <summary>
        /// 文件是否存在
        /// </summary>
        /// <param name="filePath">相对路径</param>
        /// <returns></returns>
        public static bool FileExists(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
                return false;
            filePath = HttpContext.Current.Server.MapPath(filePath);
            DirectoryInfo dirInfo = new DirectoryInfo(filePath);
            if (dirInfo.Exists)
                return true;
            return false;
        }

        /// <summary>
        /// 创建目录
        /// </summary>
        /// <param name="filePath">相对路径</param>
        /// <returns>是否成功</returns>
        public static bool CreateDirectory(string filePath)
        {
            if (string.IsNullOrEmpty(filePath))
                return false;
            filePath = HttpContext.Current.Server.MapPath(filePath);
            DirectoryInfo dirInfo = new DirectoryInfo(filePath);
            if (dirInfo.Exists)
                return true;
            try
            {
                Directory.CreateDirectory(filePath);
                return true;
            }
            catch
            {
                return false;
            }
        }

        #endregion 
    }
}
