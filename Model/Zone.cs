using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Zone 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Zone
    {
        public Zone()
        { }
        #region Model
        private Guid _zoneid;
        private Guid _userid;
        private string _zonename;
        private Guid _siteid;
        private int? _mediatype;
        private int? _infirst;
        private int? _sizeid;
        private int? _transtype;
        private string _classids;
        private string _keywords;
        private string _titlecolor;
        private string _descriptioncolor;
        private string _linkcolor;
        private string _bordercolor;
        private string _bgcolor;
        private string _grounding;
        private string _bgimg;
        private string _cornerimg;
        private int? _needauditing;
        private int? _allowadultad;
        private string _description;
        private string _zonecode;
        private decimal? _weekprice;
        private decimal? _recommendweekprice;
        private int? _zonestate;
        /// <summary>
        /// 
        /// </summary>
        public Guid ZoneId
        {
            set { _zoneid = value; }
            get { return _zoneid; }
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
        public string ZoneName
        {
            set { _zonename = value; }
            get { return _zonename; }
        }
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
        public int? MediaType
        {
            set { _mediatype = value; }
            get { return _mediatype; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? InFirst
        {
            set { _infirst = value; }
            get { return _infirst; }
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
        /// 计费方式
        /// </summary>
        public int? TransType
        {
            set { _transtype = value; }
            get { return _transtype; }
        }
        /// <summary>
        /// 所属分类（多项）
        /// </summary>
        public string ClassIds
        {
            set { _classids = value; }
            get { return _classids; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Keywords
        {
            set { _keywords = value; }
            get { return _keywords; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string TitleColor
        {
            set { _titlecolor = value; }
            get { return _titlecolor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string DescriptionColor
        {
            set { _descriptioncolor = value; }
            get { return _descriptioncolor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string LinkColor
        {
            set { _linkcolor = value; }
            get { return _linkcolor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BorderColor
        {
            set { _bordercolor = value; }
            get { return _bordercolor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BgColor
        {
            set { _bgcolor = value; }
            get { return _bgcolor; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Grounding
        {
            set { _grounding = value; }
            get { return _grounding; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string BgImg
        {
            set { _bgimg = value; }
            get { return _bgimg; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CornerImg
        {
            set { _cornerimg = value; }
            get { return _cornerimg; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? NeedAuditing
        {
            set { _needauditing = value; }
            get { return _needauditing; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? AllowAdultAd
        {
            set { _allowadultad = value; }
            get { return _allowadultad; }
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
        public string ZoneCode
        {
            set { _zonecode = value; }
            get { return _zonecode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? WeekPrice
        {
            set { _weekprice = value; }
            get { return _weekprice; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? RecommendWeekPrice
        {
            set { _recommendweekprice = value; }
            get { return _recommendweekprice; }
        }
        /// <summary>
        /// 0:上架,1:下架,2:未激活,3:拒绝
        /// </summary>
        public int? ZoneState
        {
            set { _zonestate = value; }
            get { return _zonestate; }
        }
        #endregion Model

    }
}

