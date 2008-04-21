using System;
namespace HOT.Model
{
    /// <summary>
    /// ʵ����ZoneSize ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
    /// </summary>
    public class ZoneSize
    {
        public ZoneSize()
        { }
        #region Model
        private int _sizeid;
        private string _sizecode;
        private int? _sizetype;
        /// <summary>
        /// 
        /// </summary>
        public int SizeId
        {
            set { _sizeid = value; }
            get { return _sizeid; }
        }
        /// <summary>
        /// ����, 760x90
        /// </summary>
        public string SizeCode
        {
            set { _sizecode = value; }
            get { return _sizecode; }
        }
        /// <summary>
        /// 1:���, 2:��ֱ, 3:�޷�, 4:С��
        /// </summary>
        public int? SizeType
        {
            set { _sizetype = value; }
            get { return _sizetype; }
        }
        #endregion Model

    }
}

