using System;
namespace HOT.Model
{
	/// <summary>
	/// ʵ����Employment ��(����˵���Զ���ȡ���ݿ��ֶε�������Ϣ)
	/// </summary>
	public class Employment
	{
		public Employment()
		{}
		#region Model
		private int _employmentid;
		private string _employmentname;
		/// <summary>
		/// 
		/// </summary>
		public int EmploymentId
		{
			set{ _employmentid=value;}
			get{return _employmentid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string EmploymentName
		{
			set{ _employmentname=value;}
			get{return _employmentname;}
		}
		#endregion Model

	}
}

