using System;
namespace HOT.Model
{
	/// <summary>
	/// ʵ����AdClass ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class AdClass
	{
		public AdClass()
		{}
		#region Model
		private int _adclassid;
		private string _adclassname;
		private int? _parentid;
		/// <summary>
		/// 
		/// </summary>
		public int AdClassId
		{
			set{ _adclassid=value;}
			get{return _adclassid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AdClassName
		{
			set{ _adclassname=value;}
			get{return _adclassname;}
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

