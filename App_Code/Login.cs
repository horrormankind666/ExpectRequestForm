using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using finService;
using System.Net;

/// <summary>
/// Summary description for Login
/// ใช้สำหรับตรวจสอบสิทธิ์ในการเข้าใช้งานระบบนักศึกษา
/// </summary>
public class Login
{

    private string _uId;

    public string UId
    {
        get { return _uId; }
        set { _uId = value; }
    }
    private string _userType;

    public string UserType
    {
        get { return _userType; }
        set { _userType = value; }
    }
    private string _fullNameTh;

    public string FullNameTh
    {
        get { return _fullNameTh; }
        set { _fullNameTh = value; }
    }
    private string _fullNameEn;

    public string FullNameEn
    {
        get { return _fullNameEn; }
        set { _fullNameEn = value; }
    }
    private string _authen;

    public string Authen
    {
        get { return _authen; }
        set { _authen = value; }
    }
    private string _username;

    public string Username
    {
        get { return _username; }
        set { _username = value; }
    }

    private string _studentId;

    public string StudentId
    {
      get { return _studentId; }
      set { _studentId = value; }
    }

    private string _studentCode;

    public string StudentCode
    {
        get { return _studentCode; }
        set { _studentCode = value; }
    }


    private string _message;

    public string Message
    {
        get { return _message; }
        set { _message = value; }
    }

    private string _depCode;

    public string DepCode
    {
        get { return _depCode; }
        set { _depCode = value; }
    }

    private string _strResult;

    public string StrResult
    {
        get { return _strResult; }
        set { _strResult = value; }
    }

    private string _urlStaffLogin = "http://www.student.mahidol.ac.th/infinity/authen/staffLogin.aspx";

    public string UrlStaffLogin
    {
        get { return _urlStaffLogin; }
        set { _urlStaffLogin = value; }
    }

    private string _urlStudentLogin = "http://www.student.mahidol.ac.th/infinity/authen/studentLogin.aspx";

    public string UrlStudentLogin
    {
        get { return _urlStudentLogin; }
        set { _urlStudentLogin = value; }
    }

    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : Login()
    /// Param : string _ownerType=ประเภทผู้ใช้งาน
    /// Description : ตรวจสอบการ Login
    /// </summary>
	public Login(string _ownerType)
	{
		//
		// TODO: Add constructor logic here
		//
        
        Finservice _serAuthen = new Finservice();

        try
        {
            _strResult = HttpContext.Current.Request.Cookies[_ownerType]["result"].ToString();
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
|           SecurityProtocolType.Tls11
|           SecurityProtocolType.Tls12
|           SecurityProtocolType.Ssl3;
            DataSet _ds = _serAuthen.info(_strResult);

            

            int _row = _ds.Tables[0].Rows.Count;

            if (_row > 0)
            {
                _uId = _ds.Tables[0].Rows[0]["uid"].ToString();
                _userType = _ds.Tables[0].Rows[0]["userType"].ToString();
                _fullNameEn = _ds.Tables[0].Rows[0]["fullNameEn"].ToString();
                _fullNameTh = _ds.Tables[0].Rows[0]["fullNameTh"].ToString();
                _depCode = _ds.Tables[0].Rows[0]["depCode"].ToString();
                _authen = _ds.Tables[0].Rows[0]["authen"].ToString();
                _message = _ds.Tables[0].Rows[0]["msg"].ToString();
                _username = _ds.Tables[0].Rows[0]["username"].ToString();
                _studentId = _ds.Tables[0].Rows[0]["studentid"].ToString();
                _studentCode = _ds.Tables[0].Rows[0]["studentcode"].ToString();
            }


        }
        catch (Exception _ex)
        {
            
            _uId = "";
            _userType = "";
            _fullNameEn = "";
            _fullNameTh = "";
            _authen = "false";
            _username = "";
            _message = "Service error : " + _ex.Message;
            _studentId = "";
            //***************************************************จำลอง Authen
            /*จำลอง Authen*/
            string _bStudentId = null, _bUsername = null;
            _bStudentId = "STD256304346"; //STD255900406  SA STD255603111 KA    STD256500047
            _bUsername = "busarut.bun";//jansanee.chi,chaweewan.att,busarut.bun
            try
            {
                _bStudentId = HttpContext.Current.Request.Cookies["sysTest"]["studentId"].ToString();
                _bUsername = HttpContext.Current.Request.Cookies["sysTest"]["username"].ToString();
            }
            catch (Exception _ex2)
            {
            }


            if (HttpContext.Current.Request.ServerVariables["SERVER_NAME"] == "localhost" || _bStudentId != null || _bUsername != null)
            {



                _uId = "U0001";
                _userType = _ownerType;
                _fullNameEn = "fullNameEn";
                _fullNameTh = "fullNameTh";
                _authen = "true";
                _username = _bUsername;
                _message = "Service error : " + _ex.Message;
                _studentId = _bStudentId; //"STD255704328";

            }//จบ Authen
            //************************************************************** จบจำลอง Authen         
        }
    }

    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : SetLogin()
    /// Param : string _uId=รหัสมหาวิทยาลัย,string _username=ผู้ใช้งาน
    /// ,string _userType=ประเภทผู้ใช้งาน,string _fullNameTh=ชื่อไทย
    /// ,string _fullNameEn=ชื่ออังกฤษ,string _authen=รหัสผ่านถูกต้อง
    /// ,string _studentId=รหัสนักศึกษา,string _message=ข้อความแจ้ง
    /// Description : กำหนดข้อมูล
    /// </summary>
    public void  SetLogin(string _uId,string _username,string _userType,string _fullNameTh,string _fullNameEn,string _authen,string _studentId,string _message){
        this.UId = _uId;
        this.Username = _username;
        this.UserType = _userType;
        this.FullNameTh = _fullNameTh;
        this.FullNameEn = _fullNameEn;
        this.Authen = _authen;
        this.StudentId = _studentId;
        this.Message = _message;

    }


    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : UserGetListSystemAccess()
    /// Param : string _username=รหัสผู้ใช้
    /// Description : รายการระบบ ที่สามารถเข้าถึง
    /// </summary>
    public DataSet UserGetListSystemAccess(string _username){

        string _quary = "sp_autUserGetListSystemAccess '"  + _username +  "'";
        DataSet _ds=MyConfig.ExecuteDb(_quary);       
        return _ds;
    }


    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : isAccess()
    /// Param : string _username=รหัสผู้ใช้, string _subSystemId=รหัสระบบ
    /// Description : ตรวจสอบว่า ระบบที่ระบุสามารถเข้าใช้งานได้หรือไม่
    /// </summary>
    public bool isAccess(string _username, string _subSystemId)
    {
        bool _access = false;
        DataSet _ds = UserGetListSystemAccess(_username);

        DataRow[] _dr = _ds.Tables[0].Select("subSystemId='" + _subSystemId + "'");
        int _row = _dr.Length;

        if (_row > 0)
        {
            _access = true;
        }

        return _access;
    }
    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : GetListFacultyAccess()
    /// Param : string _username=รหัสผู้ใช้งาน,string _systemGroup=กลุ่มระบบ
    /// Description : รายการคณะ ที่มีสิทธิ์เข้าถึง
    /// </summary>
    public static DataSet GetListFacultyAccess(string _username,string _systemGroup)
    {

        string _quary = "Select * From fnc_autGetListFacultyAccess('" + _username + "','" + _systemGroup + "') '";
        DataSet _ds = MyConfig.ExecuteDb(_quary);
        return _ds;
    }

    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-12-01
    /// Method : GetListProgramAccess()
    /// Param : string _facultyId=รหัสคณะ,string _username=ชื่อผู้ใช้งาน,string _systemGroup=กลุ่มระบบ
    /// Description : รายการหลักสูตร ที่มีสิทธิ์เข้าถึง
    /// </summary>
    public static DataSet GetListProgramAccess(string _facultyId,string _username,string _systemGroup)
    {

        string _quary = "Select * From fnc_autGetListProgramAccess('" + _username + "','" + _facultyId + "','" + _systemGroup + "')";
        DataSet _ds = MyConfig.ExecuteDb(_quary);
        return _ds;
    }

   
}