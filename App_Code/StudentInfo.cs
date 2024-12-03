using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for StudentInfo
/// </summary>
public class StudentInfo
{

    string _statusTh;

    public string StatusTh
    {
        get { return _statusTh; }
        set { _statusTh = value; }
    }
    string _statusEn;

    public string StatusEn
    {
        get { return _statusEn; }
        set { _statusEn = value; }
    }
    string _stdNameTh;

    public string StdNameTh
    {
        get { return _stdNameTh; }
        set { _stdNameTh = value; }
    }
    string _stdNameEn;

    public string StdNameEn
    {
        get { return _stdNameEn; }
        set { _stdNameEn = value; }
    }
    string _facultyCode;

    public string FacultyCode
    {
        get { return _facultyCode; }
        set { _facultyCode = value; }
    }
    string _facultyNameTh;

    public string FacultyNameTh
    {
        get { return _facultyNameTh; }
        set { _facultyNameTh = value; }
    }
    string _facultyNameEn;

    public string FacultyNameEn
    {
        get { return _facultyNameEn; }
        set { _facultyNameEn = value; }
    }
    string _programNameTh;

    public string ProgramNameTh
    {
        get { return _programNameTh; }
        set { _programNameTh = value; }
    }
    string _programNameEn;

    public string ProgramNameEn
    {
        get { return _programNameEn; }
        set { _programNameEn = value; }
    }
    string _idCard;

    public string IdCard
    {
        get { return _idCard; }
        set { _idCard = value; }
    }
    string _studentId;

    public string StudentId
    {
        get { return _studentId; }
        set { _studentId = value; }
    }
    string _isData;

    public string IsData
    {
        get { return _isData; }
        set { _isData = value; }
    }
    string _studentCode;

    public string StudentCode
    {
        get { return _studentCode; }
        set { _studentCode = value; }
    }
    string _programCode;

    public string ProgramCode
    {
        get { return _programCode; }
        set { _programCode = value; }
    }
    string _majorCode;

    public string MajorCode
    {
        get { return _majorCode; }
        set { _majorCode = value; }
    }
    string _groupNum;

    public string GroupNum
    {
        get { return _groupNum; }
        set { _groupNum = value; }
    }
    string _pCode;

    public string PCode
    {
        get { return _pCode; }
        set { _pCode = value; }
    }



    string _birthDate;

    public string BirthDate
    {
        get { return _birthDate; }
        set { _birthDate = value; }
    }

    string _age;

    public string Age
    {
        get { return _age; }
        set { _age = value; }
    }

    string _no;

    public string No
    {
        get { return _no; }
        set { _no = value; }
    }

    string _moo;

    public string Moo
    {
        get { return _moo; }
        set { _moo = value; }
    }

    string _soi;

    public string Soi
    {
        get { return _soi; }
        set { _soi = value; }
    }

    string _road;

    public string Road
    {
        get { return _road; }
        set { _road = value; }
    }

    string _thSubDistrict;

    public string ThSubDistrict
    {
        get { return _thSubDistrict; }
        set { _thSubDistrict = value; }
    }


    string _enSubDistrict;

    public string EnSubDistrict
    {
        get { return _enSubDistrict; }
        set { _enSubDistrict = value; }
    }


    string _thDistrict;

    public string ThDistrict
    {
        get { return _thDistrict; }
        set { _thDistrict = value; }
    }

    string _enDistrict;

    public string EnDistrict
    {
        get { return _enDistrict; }
        set { _enDistrict = value; }
    }


    string _thProvince;

    public string ThProvince
    {
        get { return _thProvince; }
        set { _thProvince = value; }
    }



    string _enProvince;

    public string EnProvince
    {
        get { return _enProvince; }
        set { _enProvince = value; }
    }



    string _zipCode;

    public string ZipCode
    {
        get { return _zipCode; }
        set { _zipCode = value; }
    }

    string _phoneSTD;

    public string phoneSTD
    {
        get { return _phoneSTD; }
        set { _phoneSTD = value; }
    }

    string _dayOfBirth;

    public string DayOfBirth
    {
        get { return _dayOfBirth; }
        set { _dayOfBirth = value; }
    }


    string _monthNameOfBirth;

    public string MonthNameOfBirth
    {
        get { return _monthNameOfBirth; }
        set { _monthNameOfBirth = value; }
    }

    string _yearOfBirth;

    public string YearOfBirth
    {
        get { return _yearOfBirth; }
        set { _yearOfBirth = value; }
    }


    string _admissionType;

    public string AdmissionType
    {
        get { return _admissionType; }
        set { _admissionType = value; }
    }
    string _urlPic;

    public string UrlPic
    {
        get { return _urlPic; }
        set { _urlPic = value; }
    }
    string _quotaCode;

    public string QuotaCode
    {
        get { return _quotaCode; }
        set { _quotaCode = value; }
    }
    string _programNameTHGuarantee;

    public string programNameTHGuarantee
    {
        get {return _programNameTHGuarantee; }
        set { _programNameTHGuarantee = value; }
    }
    string _forProgramNameTHGuarantee;

    public string forProgramNameTHGuarantee
    {
        get { return _forProgramNameTHGuarantee; }
        set { _forProgramNameTHGuarantee = value; }
    }

    string _acaYear;

    public string acaYear
    {
        get { return _acaYear; }
        set { _acaYear = value; }
    }

    string _blood;

    public string blood
    {
        get { return _blood; }
        set { _blood = value; }
    }

    string _religion;

    public string religion
    {
        get { return _religion; }
        set { _religion = value; }
    }


    string _diseasesDetail;

    public string diseasesDetail
    {
        get { return _diseasesDetail; }
        set { _diseasesDetail = value; }
    }

    string _addrTel;

    public string addrTel
    {
        get { return _addrTel; }
        set { _addrTel = value; }
    }

    string _email;

    public string email
    {
        get { return _email; }
        set { _email = value; }
    }


    public StudentInfo(string _studentId)
	{

        GetInfo(_studentId);


	}

    public void GetInfo(string _studentId)
    {
        SetEmpty();
        DataSet _dsStd = erfExpectReqDB.Sp_expStudentInfo(_studentId);
        int _row = _dsStd.Tables[0].Rows.Count;  
           
        // Student Info
        _row = _dsStd.Tables[0].Rows.Count;
        if (_row > 0)
        {
            _isData = "Y";
            _stdNameTh = _dsStd.Tables[0].Rows[0]["stdNameTh"].ToString();
            _stdNameEn = _dsStd.Tables[0].Rows[0]["stdNameEn"].ToString();
            _facultyCode = _dsStd.Tables[0].Rows[0]["facultyCode"].ToString();
            _facultyNameTh = _dsStd.Tables[0].Rows[0]["facultyNameTh"].ToString();
            _facultyNameEn = _dsStd.Tables[0].Rows[0]["facultyNameEn"].ToString();
            _programNameTh = _dsStd.Tables[0].Rows[0]["programNameTh"].ToString();
            _programNameEn = _dsStd.Tables[0].Rows[0]["programNameEn"].ToString();
            _statusTh = _dsStd.Tables[0].Rows[0]["statusTh"].ToString();
            _statusEn = _dsStd.Tables[0].Rows[0]["statusEn"].ToString();
            _studentCode = _dsStd.Tables[0].Rows[0]["studentCode"].ToString();
            _idCard = _dsStd.Tables[0].Rows[0]["idcard"].ToString();
            _programCode = _dsStd.Tables[0].Rows[0]["programCode"].ToString();
            _majorCode = _dsStd.Tables[0].Rows[0]["majorCode"].ToString();
            _groupNum = _dsStd.Tables[0].Rows[0]["groupNum"].ToString();
            _pCode = _dsStd.Tables[0].Rows[0]["pCode"].ToString();
            _phoneSTD = _dsStd.Tables[0].Rows[0]["phoneStudent"].ToString();
            _birthDate = _dsStd.Tables[0].Rows[0]["birthDateTh"].ToString();
            _age = _dsStd.Tables[0].Rows[0]["age"].ToString();
            _no = _dsStd.Tables[0].Rows[0]["addrNo"].ToString();
            _moo = _dsStd.Tables[0].Rows[0]["addrMoo"].ToString();
            _soi = _dsStd.Tables[0].Rows[0]["addrSoi"].ToString();
            _road = _dsStd.Tables[0].Rows[0]["addrStreet"].ToString();
            _thSubDistrict = _dsStd.Tables[0].Rows[0]["addrSubDistrict"].ToString();
            _enSubDistrict = _dsStd.Tables[0].Rows[0]["addrSubDistrict"].ToString();
            _thDistrict = _dsStd.Tables[0].Rows[0]["addrDistrict"].ToString();
            _enDistrict = _dsStd.Tables[0].Rows[0]["addrDistrict"].ToString();
            _thProvince = _dsStd.Tables[0].Rows[0]["addrProvince"].ToString();
            _enProvince = _dsStd.Tables[0].Rows[0]["addrProvince"].ToString();
            _zipCode = _dsStd.Tables[0].Rows[0]["addrZip"].ToString();
            _dayOfBirth = _dsStd.Tables[0].Rows[0]["dayOfBD"].ToString();
            _monthNameOfBirth = _dsStd.Tables[0].Rows[0]["monthOfBD"].ToString();
            _yearOfBirth = _dsStd.Tables[0].Rows[0]["yearOfBD"].ToString();
            _admissionType = _dsStd.Tables[0].Rows[0]["admissionType"].ToString();
            _urlPic = _dsStd.Tables[0].Rows[0]["pictureName"].ToString();
            _quotaCode = _dsStd.Tables[0].Rows[0]["quotaCode"].ToString();
            _acaYear = _dsStd.Tables[0].Rows[0]["yearEntry"].ToString();
            _blood = _dsStd.Tables[0].Rows[0]["enBloodTypeName"].ToString();
            _religion=_dsStd.Tables[0].Rows[0]["thReligionName"].ToString();
            _diseasesDetail = _dsStd.Tables[0].Rows[0]["diseasesDetail"].ToString();
            _email = _dsStd.Tables[0].Rows[0]["email"].ToString();
            _addrTel = _dsStd.Tables[0].Rows[0]["addrTel"].ToString();
        }

    }

    public void SetEmpty()
    {
        _studentId = "";
        _statusTh = "";
        _statusEn = "";
        _stdNameTh = "";
        _stdNameEn = "";
        _facultyCode = "";
        _facultyNameTh = "";
        _facultyNameEn = "";
        _programNameTh = "";
        _programNameEn = "";
        _idCard = "";
        _studentCode = "";
        _programCode = "";
        _majorCode = "";
        _groupNum = "";
        _pCode = "";
        _isData = "N";
        _birthDate="";
        _age = "";
        _no = "";
        _moo = "";
        _soi = "";
        _road = "";
        _thSubDistrict = "";
        _enSubDistrict = "";
        _thDistrict = "";
        _enDistrict = "";
        _thProvince = "";
        _enProvince = "";
        _zipCode = "";
        _phoneSTD = "";
        _dayOfBirth = "";
        _monthNameOfBirth = "";
        _yearOfBirth = "";
        _admissionType="";
        _urlPic="";
        _quotaCode="";
        _programNameTHGuarantee = "";
        _forProgramNameTHGuarantee = "";
        _blood = "";
        _religion = "";
        _diseasesDetail = "";
        _email = "";
        _addrTel = "";

    }
}