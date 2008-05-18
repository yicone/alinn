using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类News 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class News
	{
		public News()
		{}
		#region Model
		private int _newsid;
		private int? _classid;
		private string _title;
		private string _content;
		private DateTime? _createdate;
		/// <summary>
		/// 
		/// </summary>
		public int NewsId
		{
			set{ _newsid=value;}
			get{return _newsid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? ClassId
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Content
		{
			set{ _content=value;}
			get{return _content;}
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

