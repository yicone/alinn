using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Ad 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Ad
    {
        public Ad()
        { }
        #region Model
        private Guid _adid;
        private Guid _adgroupid;
        private int? _istext;
        private string _title;
        private string _content;
        private string _url;
        private string _urltext;
        private int? _sizeid;
        private int? _auditstate;
        private string _img;
        /// <summary>
        /// 
        /// </summary>
        public Guid AdId
        {
            set { _adid = value; }
            get { return _adid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public Guid AdGroupId
        {
            set { _adgroupid = value; }
            get { return _adgroupid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? IsText
        {
            set { _istext = value; }
            get { return _istext; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Content
        {
            set { _content = value; }
            get { return _content; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Url
        {
            set { _url = value; }
            get { return _url; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string UrlText
        {
            set { _urltext = value; }
            get { return _urltext; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? SizeId
        {
            set { _sizeid = value; }
            get { return _sizeid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? AuditState
        {
            set { _auditstate = value; }
            get { return _auditstate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Img
        {
            set { _img = value; }
            get { return _img; }
        }
        #endregion Model

    }
}

