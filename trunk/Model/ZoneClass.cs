using System;
namespace HOT.Model
{
	/// <summary>
	/// ʵ����ZoneClass ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class ZoneClass
	{
		public ZoneClass()
		{}
		#region Model
		private int _classid;
		private string _classname;
		private int? _parentid;
		/// <summary>
		/// 
		/// </summary>
		public int ClassId
		{
			set{ _classid=value;}
			get{return _classid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ClassName
		{
			set{ _classname=value;}
			get{return _classname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? ParentId
		{
			set{ _parentid=value;}
			get{return _parentid;}
		}
		#endregion Model

	}
}

