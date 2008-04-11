using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类Webs 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class Webs
	{
		public Webs()
		{}
		#region Model
		private string _webid;
		private string _userid;
		private string _webname;
		private string _weburl;
		private int? _webclass;
		private int? _sextype;
		private int? _agetype;
		private int? _employment;
		private string _taste;
		private string _description;
		/// <summary>
		/// 
		/// </summary>
		public string WebId
		{
			set{ _webid=value;}
			get{return _webid;}
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
		public string WebName
		{
			set{ _webname=value;}
			get{return _webname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string WebUrl
		{
			set{ _weburl=value;}
			get{return _weburl;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? WebClass
		{
			set{ _webclass=value;}
			get{return _webclass;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? SexType
		{
			set{ _sextype=value;}
			get{return _sextype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? AgeType
		{
			set{ _agetype=value;}
			get{return _agetype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Employment
		{
			set{ _employment=value;}
			get{return _employment;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Taste
		{
			set{ _taste=value;}
			get{return _taste;}
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

