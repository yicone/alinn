using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Order 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Order
    {
        public Order()
        { }
        #region Model
        private Guid _orderid;
        private string _ordername;
        private Guid _userid;
        private Guid _adid;
        private string _title;
        private Guid _zoneid;
        private DateTime? _startdate;
        private DateTime? _enddate;
        private int? _auditstate;
        private decimal? _perpoint;
        private decimal? _everydayprice;
        private decimal? _price;
        private int? _payment;
        private DateTime? _createdate;
        /// <summary>
        /// 
        /// </summary>
        public Guid OrderId
        {
            set { _orderid = value; }
            get { return _orderid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string OrderName
        {
            set { _ordername = value; }
            get { return _ordername; }
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
        public Guid AdId
        {
            set { _adid = value; }
            get { return _adid; }
        }
        public string Title
        {
            set { _title = value; }
            get { return _title; }
        }
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
        public DateTime? StartDate
        {
            set { _startdate = value; }
            get { return _startdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? EndDate
        {
            set { _enddate = value; }
            get { return _enddate; }
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
        public decimal? PerPoint
        {
            set { _perpoint = value; }
            get { return _perpoint; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? EverydayPrice
        {
            set { _everydayprice = value; }
            get { return _everydayprice; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? Price
        {
            set { _price = value; }
            get { return _price; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Payment
        {
            set { _payment = value; }
            get { return _payment; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        #endregion Model

    }
}

