using System;
namespace HOT.Model
{
	/// <summary>
	/// ʵ����SiteClass ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class SiteClass
	{
		public SiteClass()
		{}
		#region Model
		private int _classid;
		private string _classname;
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
		#endregion Model

	}
}

