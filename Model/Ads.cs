using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类Ads 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class Ads
	{
		public Ads()
		{}
		#region Model
		private string _adid;
		private string _userid;
		private string _siteId;
		private int? _isword;
		private int? _isimg;
		private int? _position;
		private int? _size;
		private int? _type;
		private string _classes;
		private string _keywords;
		private string _titlecolor;
		private string _contentcolor;
		private string _urlcolor;
		private string _bordercolor;
		private string _bgcolor;
		private string _grounding;
		private string _bgimg;
		private string _corner;
		private int? _islocked;
		private int? _needcheck;
		private string _description;
		/// <summary>
		/// 
		/// </summary>
		public string AdId
		{
			set{ _adid=value;}
			get{return _adid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UserId
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string SiteId
		{
			set{ _siteId=value;}
			get{return _siteId;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsWord
		{
			set{ _isword=value;}
			get{return _isword;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsImg
		{
			set{ _isimg=value;}
			get{return _isimg;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Position
		{
			set{ _position=value;}
			get{return _position;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Size
		{
			set{ _size=value;}
			get{return _size;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Type
		{
			set{ _type=value;}
			get{return _type;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Classes
		{
			set{ _classes=value;}
			get{return _classes;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string KeyWords
		{
			set{ _keywords=value;}
			get{return _keywords;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TitleColor
		{
			set{ _titlecolor=value;}
			get{return _titlecolor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ContentColor
		{
			set{ _contentcolor=value;}
			get{return _contentcolor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string UrlColor
		{
			set{ _urlcolor=value;}
			get{return _urlcolor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string BorderColor
		{
			set{ _bordercolor=value;}
			get{return _bordercolor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string BgColor
		{
			set{ _bgcolor=value;}
			get{return _bgcolor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Grounding
		{
			set{ _grounding=value;}
			get{return _grounding;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string BgImg
		{
			set{ _bgimg=value;}
			get{return _bgimg;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Corner
		{
			set{ _corner=value;}
			get{return _corner;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsLocked
		{
			set{ _islocked=value;}
			get{return _islocked;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? NeedCheck
		{
			set{ _needcheck=value;}
			get{return _needcheck;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Description
		{
			set{ _description=value;}
			get{return _description;}
		}
		#endregion Model

	}
}

