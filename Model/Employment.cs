using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类Employment 。(属性说明自动提取数据库字段的描述信息)
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

