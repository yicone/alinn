using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类Message 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Message
    {
        public Message()
        { }
        #region Model
        private int _messageid;
        private Guid _userid;
        private Guid _zoneid;
        private string _title;
        private string _messagecontent;
        private DateTime? _createdate;
        /// <summary>
        /// 
        /// </summary>
        public int MessageId
        {
            set { _messageid = value; }
            get { return _messageid; }
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
        public Guid ZoneId
        {
            set { _zoneid = value; }
            get { return _zoneid; }
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
        public string MessageContent
        {
            set { _messagecontent = value; }
            get { return _messagecontent; }
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

