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
    /// ����ΪӮ������֤�ؼ�
    /// ����:walkman
    /// ����:winstepscn@163.com
    /// QQ:27800640
    /// </summary>
    public class WinVal
    {
        #region ˽�г�Ա
        private  bool m_isAutoClose = true;  //�Զ��ر�
        private  bool m_isfilterClose = true; //�Ƿ񵭳�Ч���ر�
        private  int m_closeTime = 2500; //�رյȴ�ʱ��,��λms
        private  string m_filesFolder = "WinValidatorFiles";
        private string m_winvalStyle = "rightpoptip";
        private static List<WinValInfo> infoList = new List<WinValInfo>();
        #endregion

        #region ����

        /// <summary>
        /// �Ƿ��Զ��ر�
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
        /// �Ƿ񽥱�ر�
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
        /// �Զ��رյȴ���ʱ��
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
        /// �ؼ���Դ�ļ��е�����
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
        /// ��ʾ��ʽ���磺rightpoptip��toppoptip��buttompoptip
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
        /// ��ǰ�ؼ��İ汾��
        /// </summary>
        public string Version
        {
            get
            {
                return "2008-2-14 Ver1.1";
            }
        }
        #endregion

        #region ����
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
                ClientDeal.JsAlert("���ء�" + xmlfile + "���ļ�ʧ�ܣ���ȷ���ļ�δ�𻵡�\n ������Ϣ��" + ex.StackTrace, false);
                return;
            }
        }

        /// <summary>
        /// ����������֤�ؼ���������֮���������
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
                ClientDeal.JsAlert("���ء�" + m_filesFolder + "���ļ���ʧ�ܣ���ȷ���ļ����Ƿ���ڡ�",false);
                return;
            }

            StringBuilder sb = new StringBuilder();
            sb.Append("\n");
            sb.Append("//����ΪӮ(http://www.winsteps.cn)������֤�ؼ�JS�ο�ʼ" + "\n");
            sb.Append("var __Win__IsAutoClose = " + m_isAutoClose.ToString().ToLower()+ ";\n");
            sb.Append("var __Win__IsFilterClose = " + m_isfilterClose.ToString().ToLower() + ";\n");
            sb.Append("var __Win__CloseWaitTime = " + m_closeTime.ToString().ToLower() + ";\n");
            sb.Append("//Js�ν���" + "\n");
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
                ClientDeal.JsAlert("�������ô��󣺸�������֤�ؼ�û�С�" + m_winvalStyle + "������ʽ��", false);
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
