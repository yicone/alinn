using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Web;
using System.Collections;
using System.Xml;

namespace HOT.Common
{

    /// <summary>
    /// 步步为赢气泡验证控件
    /// 作者:walkman
    /// 邮箱:winstepscn@163.com
    /// QQ:27800640
    /// </summary>
    public class WinVal
    {
        #region 私有成员
        private  bool m_isAutoClose = true;  //自动关闭
        private  bool m_isfilterClose = true; //是否淡出效果关闭
        private  int m_closeTime = 2500; //关闭等待时间,单位ms
        private  string m_filesFolder = "WinValidatorFiles";
        private string m_winvalStyle = "rightpoptip";
        private static List<WinValInfo> infoList = new List<WinValInfo>();
        #endregion

        #region 属性

        /// <summary>
        /// 是否自动关闭
        /// </summary>
        public  bool IsAutoClose
        {
            set
            {
                m_isAutoClose = value;
            }
            get
            {
                return m_isAutoClose;
            }
        }

        /// <summary>
        /// 是否渐变关闭
        /// </summary>
        public  bool IsFilterClose
        {
            set
            {
                m_isfilterClose = value;
            }
            get
            {
                return m_isfilterClose;
            }
        }

        /// <summary>
        /// 自动关闭等待的时间
        /// </summary>
        public  int CloseTime
        {
            set
            {
                m_closeTime = value;
            }
            get
            {
                return m_closeTime;
            }
        }

       
        /// <summary>
        /// 控件资源文件夹的名称
        /// </summary>
        public  string FilesFolder
        {
            set
            {
                m_filesFolder = value;
            }
            get
            {
                return m_filesFolder;
            }
        }

        /// <summary>
        /// 显示样式，如：rightpoptip、toppoptip、buttompoptip
        /// </summary>
        public string ValStyle
        {
            set
            {
                m_winvalStyle = value;
            }
            get
            {
                return m_winvalStyle;
            }
        }

        /// <summary>
        /// 当前控件的版本号
        /// </summary>
        public string Version
        {
            get
            {
                return "2008-2-14 Ver1.1";
            }
        }
        #endregion

        #region 方法
        private  void ReadXmlToHashTable()
        {
            string applicationPath = HttpContext.Current.Request.ApplicationPath;
            if (applicationPath != "/")
            {
                applicationPath = applicationPath + "/";
            }
            string xmlfile = applicationPath + m_filesFolder + "/config.xml";
            try
            {
                XmlDocument doc = new XmlDocument();

                doc.Load(HttpContext.Current.Server.MapPath(xmlfile));
                XmlNodeList nodes = doc.SelectNodes("//xmlRoot/Tips");
                foreach (XmlNode node in nodes)
                {
                    WinValInfo info = new WinValInfo();
                    XmlDocument doc2 = new XmlDocument();
                    doc2.LoadXml(node.OuterXml);
                    info.TipName = doc2.SelectSingleNode("//Tips/tipname").InnerXml;
                    info.TipCss = doc2.SelectSingleNode("//Tips/tipcss").InnerXml;
                    info.TipFolder = doc2.SelectSingleNode("//Tips/tipfolder").InnerXml;
                    info.TipJs = doc2.SelectSingleNode("//Tips/tipjs").InnerXml;
                    infoList.Add(info);
                }
            }
            catch (Exception ex)
            {
                ClientDeal.JsAlert("加载“" + xmlfile + "”文件失败，请确定文件未损坏。\n 错误信息：" + ex.StackTrace, false);
                return;
            }
        }

        /// <summary>
        /// 设置气泡验证控件，设置完之后才起作用
        /// </summary>
        public  void SetValidator()
        {
            if (infoList.Count == 0)
                ReadXmlToHashTable();
           
            string applicationPath = HttpContext.Current.Request.ApplicationPath;
            if (applicationPath != "/")
            {
                applicationPath = applicationPath + "/";
            }
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(applicationPath + m_filesFolder)))
            {
                ClientDeal.JsAlert("加载“" + m_filesFolder + "”文件夹失败，请确定文件夹是否存在。",false);
                return;
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("\n");
            sb.Append("//步步为赢(http://www.winsteps.cn)气泡验证控件JS段开始" + "\n");
            sb.Append("var __Win__IsAutoClose = " + m_isAutoClose.ToString().ToLower()+ ";\n");
            sb.Append("var __Win__IsFilterClose = " + m_isfilterClose.ToString().ToLower() + ";\n");
            sb.Append("var __Win__CloseWaitTime = " + m_closeTime.ToString().ToLower() + ";\n");
            sb.Append("//Js段结束" + "\n");
            ClientDeal.ExecuteJs(sb.ToString(),false);
            
            bool havingstyle = false;
            WinValInfo info = new WinValInfo();
            for (int i = 0, k = infoList.Count; i < k; i++)
            {
                WinValInfo tmpinfo = (WinValInfo)infoList[i];
                if (m_winvalStyle == tmpinfo.TipName)
                {
                    info = tmpinfo;
                    havingstyle = true;
                   break;
                }
            }
            if (!havingstyle)
            {
                ClientDeal.JsAlert("参数设置错误：该气泡验证控件没有“" + m_winvalStyle + "”的样式。", false);
                return;
            }
            else
            {
                ClientDeal.IncludeCssFile(applicationPath + m_filesFolder + "/" + info.TipFolder + "/" + info.TipCss);
                ClientDeal.IncludeJsFile(applicationPath + m_filesFolder + "/lib/common.js", false);
                ClientDeal.IncludeJsFile(applicationPath + m_filesFolder + "/" + info.TipFolder + "/" + info.TipJs, false);
            }
        }

        
        #endregion
    }
}
