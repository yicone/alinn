using System;
namespace HOT.Model
{
    /// <summary>
    /// ʵ����OrderReport ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
    /// </summary>
    public class OrderReport
    {
        public OrderReport()
        { }
        #region Model
        private Guid _orderreportid;
        private DateTime? _date;
        private Guid _orderid;
        private int? _pv;
        private int? _pointnum;
        private decimal? _price;
        /// <summary>
        /// 
        /// </summary>
        public Guid OrderReportId
        {
            set { _orderreportid = value; }
            get { return _orderreportid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? Date
        {
            set { _date = value; }
            get { return _date; }
        }
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
        public int? PV
        {
            set { _pv = value; }
            get { return _pv; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? PointNum
        {
            set { _pointnum = value; }
            get { return _pointnum; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? Price
        {
            set { _price = value; }
            get { return _price; }
        }
        #endregion Model

    }
}

