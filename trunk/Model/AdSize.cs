using System;
namespace HOT.Model
{
	/// <summary>
	/// ʵ����AdSize ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
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

