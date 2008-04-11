using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类AdSize 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class AdSize
	{
		public AdSize()
		{}
		#region Model
		private int _sizeid;
		private int? _width;
		private int? _height;
		/// <summary>
		/// 
		/// </summary>
		public int SizeId
		{
			set{ _sizeid=value;}
			get{return _sizeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Width
		{
			set{ _width=value;}
			get{return _width;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Height
		{
			set{ _height=value;}
			get{return _height;}
		}
		#endregion Model

	}
}

