using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;


public partial class Student_RequestMainWebform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        erfPanelStudent.AddJQuery(Page);
        //Login Student
        Login _login = new Login("STUDENT");
        string _studentId = _login.StudentId;

        StudentInfo _stdInfo = new StudentInfo(_studentId);
        string _studentCode = _stdInfo.StudentCode;

        if (_login.Authen == "true")
        {
            divUserStaff.InnerHtml = _studentCode;
            getDdlTitle(_studentCode);
            getDdlNationality();
            getDdlHProvince();
            string _action = Request["action"];
            switch (_action)
            {
                case "saveReqForm": saveReqForm(_studentCode); break;
                default: break;
            }

        }//End Authen
        else
        {
            Response.Redirect("https://smartedu.mahidol.ac.th/authen/login.aspx");
        }//End No Authen
    }

    /// <summary>
    /// Method Name :getDdlTitle
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงคำนำหน้าชื่อใน ddl
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public void getDdlTitle(string _studentCode)
    {
        string _query = "select T.TitleCode,T.TitleEName,T.TitleTName" +
                        " from infinity..vw_refStdStudent S" +
                        " left join infinity..vwBTitle T" +
                        " on S.enGenderInitials = T.Sex" +
                        " where studentCode='" + _studentCode + "'";

        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _titleTName, _titleCode;

        if (_row != 0)
        {
            ddlTitle.Items.Add(new ListItem("--กรุณาเลือกคำนำหน้านาม--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _titleCode = _ds.Tables[0].Rows[i]["TitleCode"].ToString();
                _titleTName = _ds.Tables[0].Rows[i]["TitleTName"].ToString();

                ddlTitle.Items.Add(new ListItem(_titleTName, _titleCode));
            }
        }
        else
        {
            ddlTitle.Items.Add(new ListItem("--ไม่พบข้อมูล--", "1"));
        }

        _ds.Dispose();
        _adp.Dispose();

    }

    /// <summary>
    /// Method Name :getDdlNationality
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงสัญชาติใน ddl
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public void getDdlNationality()
    {
        string _query = "select *" +
                        " from Infinity..vwBNationality";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _nationCode, _nationEName;

        if (_row != 0)
        {
            ddlNationality.Items.Add(new ListItem("--กรุณาเลือกสัญชาติ--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _nationCode = _ds.Tables[0].Rows[i]["NationalityCode"].ToString();
                _nationEName = _ds.Tables[0].Rows[i]["NationalityEname"].ToString();

                ddlNationality.Items.Add(new ListItem(_nationEName, _nationCode));
            }
        }
        else
        {
            ddlNationality.Items.Add(new ListItem("--ไม่พบข้อมูล--", "1"));
        }

        _ds.Dispose();
        _adp.Dispose();

    }

    /// <summary>
    /// Method Name :getDdlHProvince
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงจังหวัดใน ddl
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public void getDdlHProvince()
    {
        string _query = "select *" +
                        " from Infinity..plcProvince" +
                        " where plcCountryId='217'" +
                        " order by provinceNameTH";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _provinceID, _provinceTName;

        if (_row != 0)
        {
            ddlHProvince.Items.Add(new ListItem("--กรุณาเลือกจังหวัด--", "0"));
            ddlCProvince.Items.Add(new ListItem("--กรุณาเลือกจังหวัด--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _provinceID = _ds.Tables[0].Rows[i]["id"].ToString();
                _provinceTName = _ds.Tables[0].Rows[i]["provinceNameTH"].ToString();

                ddlHProvince.Items.Add(new ListItem(_provinceTName, _provinceID));
                ddlCProvince.Items.Add(new ListItem(_provinceTName, _provinceID));
            }
        }
        else
        {
            ddlHProvince.Items.Add(new ListItem("--ไม่พบข้อมูล--", "1"));
            ddlCProvince.Items.Add(new ListItem("--ไม่พบข้อมูล--", "1"));
        }

        _ds.Dispose();
        _adp.Dispose();

    }

    /// <summary>
    /// Method Name :saveReqForm
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:บันทึกข้อมูลใบคำร้อง
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public void saveReqForm(string _studentCode)
    {
        string _changeType = "";
        // variable for change or edit name
        string _cTName = "-";
        string _cTLastname = "-";
        string _cEName = "-";
        string _cELastname = "-";
        string _eTName = "-";
        string _eTLastname = "-";
        string _eEName = "-";
        string _eELastname = "-";

        //variable for change other
        string _idNo = "-";
        string _title = "-";
        string _birthDate = "-";
        string _nationality = "-";
        string _gender = "-";

        //variable for change HomeAddr
        string _hHomeNo = "-";
        string _hMoo = "-";
        string _hVillage = "-";
        string _hAlley = "-";
        string _hRoad = "-";
        string _hDistrict = "-";
        string _hCanton = "-";
        string _hProvince = "-";
        string _hPostCode = "-";
        string _hPhone = "-";

        //variable for change CurrAddr
        string _cHomeNo = "-";
        string _cMoo = "-";
        string _cVillage = "-";
        string _cAlley = "-";
        string _cRoad = "-";
        string _cDistrict = "-";
        string _cCanton = "-";
        string _cProvince = "-";
        string _cPostCode = "-";
        string _cPhone = "-";

        if (rdChangeName.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "1";
            }
            else
            {
                _changeType += "#1";
            }

            _cTName = txtThaiName.Value;
            _cTLastname = txtThaiLastname.Value;
            _cEName = txtEName.Value;
            _cELastname = txtELastname.Value;
        }

        if (rdEditName.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "2";
            }
            else
            {
                _changeType += "#2";
            }
            _eTName = txtThaiName.Value;
            _eTLastname = txtThaiLastname.Value;
            _eEName = txtEName.Value;
            _eELastname = txtELastname.Value;
        }

        if (rdChangeID.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "3";
            }
            else
            {
                _changeType += "#3";
            }
            _idNo = txtID.Value;
        }

        if (rdChangeTitle.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "4";
            }
            else
            {
                _changeType += "#4";
            }
            _title = ddlTitle.Value;
            //_title = $("#ddlTitle").val();
        }

        if (rdChangeBirthDate.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "5";
            }
            else
            {
                _changeType += "#5";
            }
            //_birthDate = "Convert(Date,'" + txtDate.Value + "')";
            _birthDate = txtDate.Value.ToString();
        }

        if (rdChangeNationality.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "6";
            }
            else
            {
                _changeType += "#6";
            }
            _nationality = ddlNationality.Value;
        }

        if (rdChangeGender.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "7";
            }
            else
            {
                _changeType += "#7";
            }
            _gender = ddlGender.Value;
        }

        if (chkChangeHomeAddr.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "8";
            }
            else
            {
                _changeType += "#8";
            }


            _hHomeNo = txtHHomeNo.Value;
            if (txtHMoo.Value != "")
            {
                _hMoo = txtHMoo.Value;
            }
            if (txtHVillageName.Value != "")
            {
                _hVillage = txtHVillageName.Value;
            }
            if (txtHAlley.Value != "")
            {
                _hAlley = txtHAlley.Value;
            }
            _hRoad = txtHRoad.Value;
            _hDistrict = txtHDistrict.Value;
            _hCanton = txtHCanton.Value;
            _hProvince = ddlHProvince.Value;
            _hPostCode = txtHPostCode.Value;
            _hPhone = txtHPhone.Value;
        }

        if (chkChangeCurrAddr.Checked)
        {
            if (_changeType == "" || _changeType == null)
            {
                _changeType = "9";
            }
            else
            {
                _changeType += "#9";
            }
            _cHomeNo = txtCHomeNo.Value;

            if (txtCMoo.Value != "")
            {
                _cMoo = txtCMoo.Value;
            }

            if (txtCVillageName.Value != "")
            {
                _cVillage = txtCVillageName.Value;
            }

            if (txtCAlley.Value != "")
            {
                _cAlley = txtCAlley.Value;
            }
            _cRoad = txtCRoad.Value;
            _cDistrict = txtCDistrict.Value;
            _cCanton = txtCCanton.Value;
            _cProvince = ddlCProvince.Value;
            _cPostCode = txtCPostCode.Value;
            _cPhone = txtCPhone.Value;
        }

        //_stdLogin.SetProperty("student");
        //_GstudentID = _stdLogin.UserName;
        //string _studentID = _GstudentID.Substring(1, _GstudentID.Length - 1);
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();
        SqlCommand _cmd;

        string _reqFormNo = "";
        // string _quarter = ddlQuarter.Value;
        //ไปดึงข้อมูล Quarter จากตาราง expEventCalendar
        string _quarter = "";
        string _queryQuarter = "SELECT TOP 1 AcaYear,Semester,right(AcaYear,2)+left(semester,1) As [Quarter] FROM Infinity..expEventCalendar ORDER BY AcaYear DESC";
        SqlDataAdapter _adp1 = new SqlDataAdapter(_queryQuarter, _Conn);
        DataSet _ds1 = new DataSet();

        _adp1.Fill(_ds1);
        _quarter = _ds1.Tables[0].Rows[0]["Quarter"].ToString();
        _ds1.Dispose();
        _adp1.Dispose();

        string _query = "select [infinity].[dbo].[fnc_GenerateReqFormID]('" + _quarter + "') As ReqFormNo";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, _Conn);
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        _reqFormNo = _ds.Tables[0].Rows[0]["ReqFormNo"].ToString();
        _ds.Dispose();
        _adp.Dispose();

        // insert into MUEIS..RequestForm
        string _reqType = "1"; //set reqType = 1 ExpectToGrad
        int _reqAmount = 20; //set reqAmount = 20 

        string _sql;
        _sql = @"infinity..sp_expSetListInsertRequestFrom '" + _studentCode + "','" + _reqFormNo + "','" + _quarter + "','" + _reqType + "'," + _reqAmount + ",'" + _changeType + "','" + _cTName + "','" + _cTLastname + "','" + _cEName + "','" + _cELastname + "','" + _eTName + "','" + _eTLastname + "','" + _eEName + "','" + _eELastname + "','" + _idNo + "','" + _title + "','" + _birthDate + "','" + _nationality + "','" + _gender + "','" + _hHomeNo + "','" + _hMoo + "','" + _hVillage + "','" + _hAlley + "','" + _hRoad + "','" + _hDistrict + "','" + _hCanton + "','" + _hProvince + "','" + _hPostCode + "','" + _hPhone + "','" + _cHomeNo + "','" + _cMoo + "','" + _cVillage + "','" + _cAlley + "','" + _cRoad + "','" + _cDistrict + "','" + _cCanton + "','" + _cProvince + "','" + _cPostCode + "','" + _cPhone + "'";
        //สั่งให้ execute
        _cmd = new SqlCommand(_sql, _Conn);
        int _result = (int)_cmd.ExecuteScalar();

        _ds.Dispose();
        _adp.Dispose();
        string _openPage = "";
        if (_result == 1)
        {
            _openPage = "<script type='text/javascript'>javascript:this.parent.displayDialogAttachFile('" + _studentCode + "','" + _quarter + "','" + _reqFormNo + "');</script>";
            Response.Write(_openPage);
        }
        else if (_result == 0)
        {
            _openPage = "<script type='text/javascript'>javascript:this.parent.showAlertErrorReqform();</script>";
            Response.Write(_openPage);
        }
    }

}