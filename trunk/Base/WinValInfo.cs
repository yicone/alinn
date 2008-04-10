using System;
using System.Collections.Generic;
using System.Text;

namespace HOT.Common
{
    public class WinValInfo
    {
        /// <summary>
        /// 气泡验证控件
        /// </summary>
        private string m_tipname;
        private string m_tipfolder;
        private string m_tipcss;
        private string m_tipjs;

        public string TipName
        {
            set
            {
                m_tipname = value;
            }
            get
            {
                return m_tipname;
            }
        }

        public string TipFolder
        {
            set
            {
                m_tipfolder = value;
            }
            get
            {
                return m_tipfolder;
            }
        }

        public string TipCss
        {
            set
            {
                m_tipcss = value;
            }
            get
            {
                return m_tipcss;
            }
        }

        public string TipJs
        {
            set
            {
                m_tipjs = value;
            }
            get
            {
                return m_tipjs;
            }
        }
    }
}
