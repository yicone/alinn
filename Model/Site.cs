using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Site 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Site
    {
        public Site()
        { }
        #region Model
        private Guid _siteid;
        private Guid _userid;
        private string _sitename;
        private string _siteurl;
        private int? _siteclass;
        private int? _sextype;
        private int? _agetype;
        private string _employments;
        private string _taste;
        private string _description;
        private int? _auditState;

        /// <summary>
        /// 
        /// </summary>
        public Guid SiteId
        {
            set { _siteid = value; }
            get { return _siteid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public Guid UserId
        {
            set { _userid = value; }
            get { return _userid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string SiteName
        {
            set { _sitename = value; }
            get { return _sitename; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string SiteUrl
        {
            set { _siteurl = value; }
            get { return _siteurl; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? SiteClass
        {
            set { _siteclass = value; }
            get { return _siteclass; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? SexType
        {
            set { _sextype = value; }
            get { return _sextype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? AgeType
        {
            set { _agetype = value; }
            get { return _agetype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Employments
        {
            set { _employments = value; }
            get { return _employments; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Taste
        {
            set { _taste = value; }
            get { return _taste; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Description
        {
            set { _description = value; }
            get { return _description; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? AuditState
        {
            get { return _auditState; }
            set { _auditState = value; }
        }
        #endregion Model

    }
}

