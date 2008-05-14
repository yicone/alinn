using System;
namespace HOT.Model
{
    /// <summary>
    /// 实体类User 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class User
    {
        public User()
        { }
        #region Model
        private Guid _userid;
        private int? _roleid;
        private string _email;
        private string _nickname;
        private string _userpassword;
        private string _companyname;
        private string _companyaddress;
        private string _linkman;
        private string _telephone;
        private string _mobile;
        private string _qq;
        private string _msn;
        private string _introducer;
        private DateTime? _lastlogintime;
        private string _lastloginip;
        private int? _logintimes;
        private int? _islocked;
        private string _activecode;
        private DateTime? _regtime;
        private string _school;
        private string _proxy;
        
        /// <summary>
        /// 
        /// </summary>
        public Guid UserId
        {
            set { _userid = value; }
            get { return _userid; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string School
        {
            set { _school = value; }
            get { return _school; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Proxy
        {
            set { _proxy = value; }
            get { return _proxy; }
        }

        
        /// <summary>
        /// 
        /// </summary>
        public int? RoleID
        {
            set { _roleid = value; }
            get { return _roleid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NickName
        {
            set { _nickname = value; }
            get { return _nickname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string UserPassword
        {
            set { _userpassword = value; }
            get { return _userpassword; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyName
        {
            set { _companyname = value; }
            get { return _companyname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyAddress
        {
            set { _companyaddress = value; }
            get { return _companyaddress; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string LinkMan
        {
            set { _linkman = value; }
            get { return _linkman; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Telephone
        {
            set { _telephone = value; }
            get { return _telephone; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Mobile
        {
            set { _mobile = value; }
            get { return _mobile; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string QQ
        {
            set { _qq = value; }
            get { return _qq; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Msn
        {
            set { _msn = value; }
            get { return _msn; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Introducer
        {
            set { _introducer = value; }
            get { return _introducer; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? LastLoginTime
        {
            set { _lastlogintime = value; }
            get { return _lastlogintime; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string LastLoginIP
        {
            set { _lastloginip = value; }
            get { return _lastloginip; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? LoginTimes
        {
            set { _logintimes = value; }
            get { return _logintimes; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? IsLocked
        {
            set { _islocked = value; }
            get { return _islocked; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ActiveCode
        {
            set { _activecode = value; }
            get { return _activecode; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? RegTime
        {
            set { _regtime = value; }
            get { return _regtime; }
        }
        #endregion Model

    }

    /// <summary>
    /// 实体类UserTemp 。(属性说明自动提取数据库字段的描述信息)
    /// </summary>
    public class UserTemp
    {
        public UserTemp()
        { }
        #region Model
        private Guid _userid;
        private int? _roleid;
        private string _email;
        private string _nickname;
        private string _userpassword;
        private string _companyname;
        private string _companyaddress;
        private string _linkman;
        private string _telephone;
        private string _mobile;
        private string _qq;
        private string _msn;
        private string _introducer;
        private string _activecode;
        private string _regtime;
        private string regIP;
        private string _school;
        private string _proxy;


        /// <summary>
        /// 
        /// </summary>
        public string School
        {
            set { _school = value; }
            get { return _school; }
        }

        /// <summary>
        /// 
        /// </summary>
        public string Proxy
        {
            set { _proxy = value; }
            get { return _proxy; }
        }

        public Guid UserId
        {
            set { _userid = value; }
            get { return _userid; }
        }

        public string RegIP
        {
            set { regIP = value; }
            get { return regIP; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? RoleID
        {
            set { _roleid = value; }
            get { return _roleid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string NickName
        {
            set { _nickname = value; }
            get { return _nickname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string UserPassword
        {
            set { _userpassword = value; }
            get { return _userpassword; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyName
        {
            set { _companyname = value; }
            get { return _companyname; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyAddress
        {
            set { _companyaddress = value; }
            get { return _companyaddress; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string LinkMan
        {
            set { _linkman = value; }
            get { return _linkman; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Telephone
        {
            set { _telephone = value; }
            get { return _telephone; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Mobile
        {
            set { _mobile = value; }
            get { return _mobile; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string QQ
        {
            set { _qq = value; }
            get { return _qq; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Msn
        {
            set { _msn = value; }
            get { return _msn; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Introducer
        {
            set { _introducer = value; }
            get { return _introducer; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ActiveCode
        {
            set { _activecode = value; }
            get { return _activecode; }
        }

        public string RegTime
        {
            get { return this._regtime; }
            set { _regtime = value; }
        }
        
        #endregion Model

    }
}

