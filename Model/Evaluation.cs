using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类AL_Evaluation 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class Evaluation
    {
        public Evaluation()
        { }
        #region Model
        private Guid _evaluationid;
        private Guid _orderid;
        private int? _score;
        private int? _type;
        private string _descriptiont;
        private DateTime? _createdate;
        /// <summary>
        /// 
        /// </summary>
        public Guid EvaluationId
        {
            set { _evaluationid = value; }
            get { return _evaluationid; }
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
        public int? Score
        {
            set { _score = value; }
            get { return _score; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Type
        {
            set { _type = value; }
            get { return _type; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Descriptiont
        {
            set { _descriptiont = value; }
            get { return _descriptiont; }
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

