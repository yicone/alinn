using System;
namespace HOT.Model
{
    /// <summary>
    /// ʵ����AL_ZoneSize ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
    /// </summary>
    public class AL_ZoneSize
    {
        public AL_ZoneSize()
        { }
        #region Model
        private int _sizeid;
        private string _zonesize;
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
        public string ZoneSize
        {
            set { _zonesize = value; }
            get { return _zonesize; }
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

