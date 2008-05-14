using System;
namespace HOT.Model
{
	/// <summary>
	/// 实体类AdGroup 。(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	public class AdGroup
	{
		public AdGroup()
		{}
		#region Model
		private Guid _adgroupid;
		private string _groupname;
		private Guid _userid;
		private int _class;
		private string _keywords;
		/// <summary>
		/// 
		/// </summary>
		public Guid AdGroupId
		{
			set{ _adgroupid=value;}
			get{return _adgroupid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string GroupName
		{
			set{ _groupname=value;}
			get{return _groupname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public Guid UserId
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int Class
		{
			set{ _class=value;}
			get{return _class;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string KeyWords
		{
			set{ _keywords=value;}
			get{return _keywords;}
		}
		#endregion Model

	}
}

