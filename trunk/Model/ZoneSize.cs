using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类AL_ZoneSize 。(属性说明自动提取数据库字段的描述信息)
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
        /// 例如, 760x90
        /// </summary>
        public string ZoneSize
        {
            set { _zonesize = value; }
            get { return _zonesize; }
        }
        /// <summary>
        /// 1:横幅, 2:垂直, 3:巨幅, 4:小幅
        /// </summary>
        public int? SizeType
        {
            set { _sizetype = value; }
            get { return _sizetype; }
        }
        #endregion Model

    }
}

