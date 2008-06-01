using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Store 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Store
    {
        public Store()
        { }
        #region Model
        private Guid _storeid;
        private Guid _zoneid;
        private Guid _userid;
        private DateTime? _date;
        /// <summary>
        /// 
        /// </summary>
        public Guid StoreId
        {
            set { _storeid = value; }
            get { return _storeid; }
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
        public Guid UserId
        {
            set { _userid = value; }
            get { return _userid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? Date
        {
            set { _date = value; }
            get { return _date; }
        }
        #endregion Model

    }
}

