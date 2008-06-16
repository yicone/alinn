using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类ZoneLocation 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class ZoneLocation
	{
		public ZoneLocation()
		{}
		#region Model
		private int _urlid;
		private string _url;
		private Guid _zoneid;
		private DateTime? _createdate;
		/// <summary>
		/// 
		/// </summary>
		public int UrlId
		{
			set{ _urlid=value;}
			get{return _urlid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Url
		{
			set{ _url=value;}
			get{return _url;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid ZoneId
		{
			set{ _zoneid=value;}
			get{return _zoneid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CreateDate
		{
			set{ _createdate=value;}
			get{return _createdate;}
		}
		#endregion Model

	}
}

