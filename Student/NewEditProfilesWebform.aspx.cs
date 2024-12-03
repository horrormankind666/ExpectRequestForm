using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Student_NewEditProfilesWebform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //เรียกใช้ class Header
        erfPanelStudent.AddJQuery(Page);
        //End
        Login _login = new Login("STUDENT");
        string _studentId = _login.StudentId;

        StudentInfo _stdInfo = new StudentInfo(_studentId);
        string _studentCode = _stdInfo.StudentCode;

        if (_login.Authen == "true")
        {
            getReqFormDetail();

        }//End Authen
        else
        {
            Response.Redirect("https://smartedu.mahidol.ac.th/authen/login.aspx");
        }//End No Authen
        
    }

    /// <summary>
    /// Method Name :getReqFormDetail
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Change date: 22-11-2021
    /// Change date: 08-12-2023
    /// Change By: anussara.wan
    /// Description:ใช้เพื่อแสดงรายละเอียดของข้อมูลใบคำร้อง
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public void getReqFormDetail()
    {
        string _studentID = Request["studentid"];
        string _quarter = Request["quarter"];
        string _reqFormNo = Request["reqFormNo"];
        string _changeType = "", _ReqFormStatus = "";
        lbGradeYear.Text = "25" + _quarter.Substring(0, 2);
        string _sql = @"select *,(select TitleTName from infinity..vwBTitle where TitleCode=E.OldTitle) as OldTitleName
                         ,(select TitleTName from infinity..vwBTitle where TitleCode=E.NewTitle) as NewTitleName
                         ,DAY(E.CreateDate) as reqDay
                         ,case when month(E.CreateDate) ='01' then 'มกราคม'
                               when month(E.CreateDate) ='02' then 'กุมภาพันธ์'
                               when month(E.CreateDate) ='03' then 'มีนาคม'
                               when month(E.CreateDate) ='04' then 'เมษายน'
                               when month(E.CreateDate) ='05' then 'พฤษภาคม'
                               when month(E.CreateDate) ='06' then 'มิถุนายน'
                               when month(E.CreateDate) ='07' then 'กรกฎาคม'
                               when month(E.CreateDate) ='08' then 'สิงหาคม'
                               when month(E.CreateDate) ='09' then 'กันยายน'
                               when month(E.CreateDate) ='10' then 'ตุลาคม'
                               when month(E.CreateDate) ='11' then 'พฤศจิกายน'
                               when month(E.CreateDate) ='12' then 'ธันวาคม' end AS reqMonth
                         ,(year(E.CreateDate)+543) AS reqYear
                         ,(select provinceNameTH from Infinity..plcProvince where id = E.OldHProvinceID) as OldHProvinceName
                         ,(select provinceNameTH from Infinity..plcProvince where id = E.NewHProvinceID) as NewHProvinceName
                         ,(select provinceNameTH from Infinity..plcProvince where id = E.OldCProvinceID) as OldCProvinceName
                         ,(select provinceNameTH from Infinity..plcProvince where id = E.NewCProvinceID) as NewCProvinceName
                         ,RF.ReqFormStatus 
                          FROM infinity..vw_refStdStudent S
                          LEFT JOIN infinity..ReqFormExpectGrad E ON S.studentCode = E.StudentID
                          LEFT JOIN infinity..RequestForm RF ON S.StudentID = RF.StudentID and E.ReqFormNo = RF.ReqFormNo
                          WHERE E.Quarter='" + _quarter + "' and S.studentCode ='" + _studentID + "' and E.ReqFormNo='" + _reqFormNo + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        if (_ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
            {
                lbStdName.Text = _ds.Tables[0].Rows[i]["fullNameTh"].ToString();
                spStdName.InnerHtml = _ds.Tables[0].Rows[i]["fullNameTh"].ToString();
                lbStdID.Text = _ds.Tables[0].Rows[i]["studentCode"].ToString();
                lbFaculty.Text = _ds.Tables[0].Rows[i]["facNameTh"].ToString();
                lbProgram.Text = _ds.Tables[0].Rows[i]["progNameTh"].ToString();
                lbDay.Text = _ds.Tables[0].Rows[i]["reqDay"].ToString();
                lbMonth.Text = _ds.Tables[0].Rows[i]["reqMonth"].ToString();
                lbYear.Text = _ds.Tables[0].Rows[i]["reqYear"].ToString();
                _changeType = _ds.Tables[0].Rows[i]["ChangeType"].ToString();
                _ReqFormStatus = _ds.Tables[0].Rows[i]["ReqFormStatus"].ToString();

                if (_ReqFormStatus == "1")
                {
                    lbalert.Text = "ใบคำร้องถูกยกเลิก";
                    lbalert1.Text = "ใบคำร้องถูกยกเลิก";
                }
                string[] _arrChangeType = _changeType.Split('#');
                for (int j = 0; j < _arrChangeType.Length; j++)
                {
                    if (_arrChangeType[j] == "1")
                    {
                        chkChangeName.Checked = true;
                        lbOldCThaiName.Text = _ds.Tables[0].Rows[i]["fullNameTh"].ToString();
                        lbNewCThaiName.Text = _ds.Tables[0].Rows[i]["ChangeTName"].ToString() + "  " + _ds.Tables[0].Rows[i]["ChangeTLastname"].ToString();
                        lbOldCEngName.Text = _ds.Tables[0].Rows[i]["fullNameEn"].ToString();
                        lbNewCEngName.Text = _ds.Tables[0].Rows[i]["ChangeEName"].ToString() + "  " + _ds.Tables[0].Rows[i]["ChangeELastname"].ToString();
                    }
                    else if (_arrChangeType[j] == "2")
                    {
                        chkEditName.Checked = true;
                        lbOldEThaiName.Text = _ds.Tables[0].Rows[i]["fullNameTh"].ToString();
                        lbNewEThaiName.Text = _ds.Tables[0].Rows[i]["EditTName"].ToString() + "  " + _ds.Tables[0].Rows[i]["EditTLastname"].ToString();
                        lbOldEEngName.Text = _ds.Tables[0].Rows[i]["fullNameEn"].ToString();
                        lbNewEEngName.Text = _ds.Tables[0].Rows[i]["EditEName"].ToString() + "  " + _ds.Tables[0].Rows[i]["EditELastame"].ToString();
                    }
                    else if (_arrChangeType[j] == "3")
                    {
                        chkOther.Checked = true;
                        lbOldEditOther.Text = "เลขประจำตัวประชาชน " + _ds.Tables[0].Rows[i]["OldID"].ToString();
                        lbNewEditOther.Text = _ds.Tables[0].Rows[i]["NewID"].ToString();
                    }
                    else if (_arrChangeType[j] == "4")
                    {
                        chkOther.Checked = true;
                        lbOldEditOther.Text = "คำนำหน้านาม " + _ds.Tables[0].Rows[i]["OldTitleName"].ToString();
                        lbNewEditOther.Text = _ds.Tables[0].Rows[i]["NewTitleName"].ToString();
                    }
                    else if (_arrChangeType[j] == "5")
                    {
                        chkOther.Checked = true;
                        lbOldEditOther.Text = "วันเดือนปีเกิด " + (_ds.Tables[0].Rows[i]["OldBirthDate"].ToString()).Substring(0, 10);
                        lbNewEditOther.Text = (_ds.Tables[0].Rows[i]["NewBirthDate"].ToString()).Substring(0, 10);
                    }
                    else if (_arrChangeType[j] == "6")
                    {
                        chkOther.Checked = true;
                        lbOldEditOther.Text = "สัญชาติ " + _ds.Tables[0].Rows[i]["OldNationality"].ToString();
                        lbNewEditOther.Text = _ds.Tables[0].Rows[i]["NewNationality"].ToString();
                    }
                    else if (_arrChangeType[j] == "7")
                    {
                        chkOther.Checked = true;
                        string _oldGender = _ds.Tables[0].Rows[i]["OldGender"].ToString() == "M" ? "ชาย" : "หญิง";
                        string _newGender = _ds.Tables[0].Rows[i]["NewGender"].ToString() == "M" ? "ชาย" : "หญิง";
                        lbOldEditOther.Text = "เพศ " + _oldGender;
                        lbNewEditOther.Text = _newGender;
                    }
                    else if (_arrChangeType[j] == "8")
                    {
                        chkHomeAddr.Checked = true;
                        lbOldHHomeNo.Text = _ds.Tables[0].Rows[i]["OldHHomeNo"].ToString();
                        lbOldHMoo.Text = _ds.Tables[0].Rows[i]["OldHMoo"].ToString();
                        lbOldHVillage.Text = _ds.Tables[0].Rows[i]["OldHVillage"].ToString();
                        lbOldHAlley.Text = _ds.Tables[0].Rows[i]["OldHSoi"].ToString();
                        lbOldHRoad.Text = _ds.Tables[0].Rows[i]["OldHRoad"].ToString();
                        lbOldHDistrict.Text = _ds.Tables[0].Rows[i]["OldHDistrict"].ToString();
                        lbOldHCanton.Text = _ds.Tables[0].Rows[i]["OldHCanton"].ToString();
                        lbOldHProvince.Text = _ds.Tables[0].Rows[i]["OldHProvinceName"].ToString();
                        lbOldHPostCode.Text = _ds.Tables[0].Rows[i]["OldHPostCode"].ToString();
                        lbOldHPhone.Text = _ds.Tables[0].Rows[i]["OldHPhone"].ToString();

                        lbNewHHomeNo.Text = _ds.Tables[0].Rows[i]["NewHHomeNo"].ToString();
                        lbNewHMoo.Text = _ds.Tables[0].Rows[i]["NewHMoo"].ToString();
                        lbNewHVillage.Text = _ds.Tables[0].Rows[i]["NewHVillage"].ToString();
                        lbNewHAlley.Text = _ds.Tables[0].Rows[i]["NewHSoi"].ToString();
                        lbNewHRoad.Text = _ds.Tables[0].Rows[i]["NewHRoad"].ToString();
                        lbNewHDistrict.Text = _ds.Tables[0].Rows[i]["NewHDistrict"].ToString();
                        lbNewHCanton.Text = _ds.Tables[0].Rows[i]["NewHCanton"].ToString();
                        lbNewHProvince.Text = _ds.Tables[0].Rows[i]["NewHProvinceName"].ToString();
                        lbNewHPostCode.Text = _ds.Tables[0].Rows[i]["NewHPostCode"].ToString();
                        lbNewHPhone.Text = _ds.Tables[0].Rows[i]["NewHPhone"].ToString();

                    }
                    else if (_arrChangeType[j] == "9")
                    {
                        chkCurrAddr.Checked = true;
                        lbOldCHomeNo.Text = _ds.Tables[0].Rows[i]["OldCHomeNo"].ToString();
                        lbOldCMoo.Text = _ds.Tables[0].Rows[i]["OldCMoo"].ToString();
                        lbOldCVillage.Text = _ds.Tables[0].Rows[i]["OldCVillage"].ToString();
                        lbOldCAlley.Text = _ds.Tables[0].Rows[i]["OldCSoi"].ToString();
                        lbOldCRoad.Text = _ds.Tables[0].Rows[i]["OldCRoad"].ToString();
                        lbOldCDistrict.Text = _ds.Tables[0].Rows[i]["OldCDistrict"].ToString();
                        lbOldCCanton.Text = _ds.Tables[0].Rows[i]["OldCCanton"].ToString();
                        lbOldCProvince.Text = _ds.Tables[0].Rows[i]["OldCProvinceName"].ToString();
                        lbOldCPostCode.Text = _ds.Tables[0].Rows[i]["OldCPostCode"].ToString();
                        lbOldCPhone.Text = _ds.Tables[0].Rows[i]["OldCPhone"].ToString();

                        lbNewCHomeNo.Text = _ds.Tables[0].Rows[i]["NewCHomeNo"].ToString();
                        lbNewCMoo.Text = _ds.Tables[0].Rows[i]["NewCMoo"].ToString();
                        lbNewCVillage.Text = _ds.Tables[0].Rows[i]["NewCVillage"].ToString();
                        lbNewCAlley.Text = _ds.Tables[0].Rows[i]["NewCSoi"].ToString();
                        lbNewCRoad.Text = _ds.Tables[0].Rows[i]["NewCRoad"].ToString();
                        lbNewCDistrict.Text = _ds.Tables[0].Rows[i]["NewCDistrict"].ToString();
                        lbNewCCanton.Text = _ds.Tables[0].Rows[i]["NewCCanton"].ToString();
                        lbNewCProvince.Text = _ds.Tables[0].Rows[i]["NewCProvinceName"].ToString();
                        lbNewCPostCode.Text = _ds.Tables[0].Rows[i]["NewCPostCode"].ToString();
                        lbNewCPhone.Text = _ds.Tables[0].Rows[i]["NewCPhone"].ToString();
                    }

                }

            }
        }
        else
        {
            Response.Redirect("https://smartedu.mahidol.ac.th/expectRequestForm/Student/RequestMainWebform.aspx");
        }

        _ds.Dispose();
        _adp.Dispose();

    }
}