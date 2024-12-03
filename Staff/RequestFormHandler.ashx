<%@ WebHandler Language="C#" Class="RequestFormHandler" %>

using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Globalization;
//using DBConnection;
using System.Text;
//using MUEIS;
/// <summary>
/// Author: Anussara Wanwang
/// Create date: 06-10-2013
/// Description:Handler staff เพื่อไปเรียกใช้ function ที่ PanelRequestStaff.cs
/// </summary>
public class RequestFormHandler : IHttpHandler {

    string _StaffID;
    public HttpContext cTmp;
    public void ProcessRequest (HttpContext context)
    {
        cTmp = context;
        Login _login = new Login("staff");
        _StaffID = _login.Username;
        string _authen = _login.Authen;

        if (_authen == "true")
        {
            string _action = cTmp.Request["action"];
            switch (_action)
            {
                case "loadFromApprovReqAdmin": loadFromApprovReqAdmin(); break;
                case "loadFromSearchReqAdmin": loadFromSearchReqAdmin(); break;
                case "loadFromTabs3": loadFromTabs3(); break;
                case "searchByStdInfor": searchByStdInfor(); break;
                case "getHtmlDdlProgram": getHtmlDdlProgram(); break;
                case "getNonApprReqFormList": getNonApprReqFormList(); break;
                case "getDialogStudentReqFormDetail": getDialogStudentReqFormDetail(); break;
                case "SearchMultiStdInfor": SearchMultiStdInfor(); break;
                case "cancelStdReqForm": cancelStdReqForm(); break;
                case "listReqFormDocument": listReqFormDocument(cTmp); break;
                case "SaveProjectDocument": SaveProjectDocument(cTmp); break;
                case "deleteDocument": deleteDocument(cTmp); break;
                case "actualReqForm": actualReqForm(cTmp); break;
                case "SearchStdPreGraduateStatus": SearchStdPreGraduateStatus(cTmp); break;
                // case "SelectDdlFaculty": SelectDdlFaculty(); break;    
                default: break;
            }
        }
    }

    /// <summary>
    /// Method Name :loadFromApprovReqAdmin
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:หน้าอนุมัติใบคำร้อง (tabs-1)
    /// Parameter : N/A
    /// </summary>
    public void loadFromApprovReqAdmin()
    {
        string _html = PanelRequestStaff.FromApproTabs1();
        cTmp.Response.Write(_html);
    }//End loadFromApprovReqAdmin

    /// <summary>
    /// Method Name :loadFromSearchReqAdmin
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ค้นหานักศึกษาที่ทีใบคำร้อง (tabs-2)
    /// Parameter : N/A
    /// </summary>
    public void loadFromSearchReqAdmin()
    {
        string _html = PanelRequestStaff.FromApproTabs2(_StaffID);
        cTmp.Response.Write(_html);
    }//End loadFromSearchReqAdmin

    /// <summary>
    /// Method Name :loadFromTabs3
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ค้นหานักศึกษาเพื่อตรวจสอบสถานะการดำเนินการ (tabs-3)
    /// Parameter : N/A
    /// </summary>
    public void loadFromTabs3()
    {
        string _html = PanelRequestStaff.FromApproTabs3(_StaffID);
        cTmp.Response.Write(_html);
    }//End LoadFromTab3

    /// <summary>
    /// Method Name :getHtmlDdlProgram
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ข้อมูลหลักสูตร
    /// Parameter : N/A
    /// </summary>
    public void getHtmlDdlProgram()
    {
        string _facCode = cTmp.Request["facCode"];
        string _html = PanelRequestStaff.getHtmlDdlProgram(_facCode);
        cTmp.Response.Write(_html);
    }//End getHtmlDdlProgram

    /// <summary>
    /// Method Name :getNonApprReqFormList
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงใบคำร้องที่ยังไม่อนุมัติ (tabs-1)
    /// Parameter : N/A
    /// </summary>
    public void getNonApprReqFormList()
    {
        string _html = PanelRequestStaff.getNonApprReqFormList(_StaffID);
        cTmp.Response.Write(_html);
    }//End getNonApprReqFormList

    /// <summary>
    /// Method Name :searchByStdInfor
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ค้นหาข้อมูลใบคำร้องของนักศึกษา (tabs-2)
    /// Parameter : N/A
    /// </summary>
    public void searchByStdInfor()
    {
        string _searchStdInfor = cTmp.Request["stdInfor"];
        string _searchQuarter = cTmp.Request["quarter"];
        string _html = PanelRequestStaff.searchByStdInfor(_searchQuarter, _searchStdInfor);
        cTmp.Response.Write(_html);
    }//End searchByStdInfor

    /// <summary>
    /// Method Name :searchByStdInfor
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ค้นหาข้อมูลใบคำร้องของนักศึกษา (tabs-2)
    /// Parameter : N/A
    /// </summary>
    public void getDialogStudentReqFormDetail()
    {
        string _StudentID = cTmp.Request["studentID"];
        string _reqQuarter = cTmp.Request["quarter"];
        string _reqNo = cTmp.Request["reqFormNo"];
        string _html = PanelRequestStaff.getDialogStudentReqFormDetail(_StudentID, _reqQuarter, _reqNo);
        cTmp.Response.Write(_html);
    }//End getStudentReqFormDetail

    /// <summary>
    /// Method Name :SearchMultiStdInfor
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ค้นหาข้อมูลใบคำร้องของนักศึกษารายคณะหลักสูตร (tabs-2)
    /// Parameter : N/A
    /// </summary>
    public void SearchMultiStdInfor()
    {
        string _filterQuarter = cTmp.Request["quarter"];
        string _filterStatus = cTmp.Request["reqStatus"];
        string _filterFacCode = cTmp.Request["facCode"];
        string _filterProg = cTmp.Request["prog"];
        string _filterMajor = cTmp.Request["major"];
        string _filterGroupNum = cTmp.Request["groupNum"];
        string _html = PanelRequestStaff.SearchMultiStdInfor(_filterQuarter, _filterStatus, _filterFacCode, _filterProg, _filterMajor, _filterGroupNum);
        cTmp.Response.Write(_html);
    }//End SearchMultiStdInfor

    /// <summary>
    /// Method Name :cancelStdReqForm
    /// Author: Anussara Wanwang
    /// Create date: 13-10-2013
    /// Description:ยกเลิกใบคำร้อง
    /// Parameter : N/A
    /// </summary>
    public void cancelStdReqForm()
    {
        string _studentID = cTmp.Request["studentID"];
        string _quarter = cTmp.Request["quarter"];
        string _reqForm = cTmp.Request["reqFormNo"];
        string _html = PanelRequestStaff.cancelStdReqForm(_studentID, _quarter, _reqForm);
        cTmp.Response.Write(_html);
    }//End cancelStdReqForm

    /// <summary>
    /// Method Name :SaveProjectDocument
    /// Author: Anussara Wanwang
    /// Create date: 13-10-2013
    /// Description:บันทึกเอกสารการข้อแก้ไขข้อมูลเข้าระบบ
    /// Parameter : N/A
    /// </summary>
    public void SaveProjectDocument(HttpContext cTmp)//บันทึกเอกสารเข้าระบบ
    {
        //set reqformtype 1 = ใบคำร้องคาดว่าจะสำเร็จการศึกษา
        string _reqFormType = "1";
        string _docName = cTmp.Request["docName"];
        string _quarter = cTmp.Request["quarter"];
        string _student = cTmp.Request["student"];
        string _reqFormNo = cTmp.Request["reqFormNo"];

        string _script = "";
        string _Res = "";
        string _query = "";
        SqlCommand _cmd;
        SqlDataAdapter _adp;
        DataSet _ds;

        DirectoryInfo DirInfo = new DirectoryInfo(cTmp.Server.MapPath("~/EvidenceDocument/" + _StaffID + "/" + _quarter + "/" + _reqFormNo + "/"));  // ต้องเป็นตัวแปรโฟลเดอร์ด้วยนะ
        if (!DirInfo.Exists)
        {
            DirInfo.Create();
        }
        string _currentPath = cTmp.Server.MapPath("~/EvidenceDocument/" + _StaffID + "/" + _quarter + "/" + _reqFormNo + "/");
        string _strFile = Path.GetFileName(cTmp.Request.Files[0].FileName);
        string _extFile = Path.GetExtension(cTmp.Request.Files[0].FileName.ToLower());
        if (_strFile != "")
        {
            try
            {
                string _url = _currentPath + _strFile;
                SqlConnection _Conn = MyConfig.GetConnect();
                _Conn.Open();
                _Res = "ไฟล์เอกสารนี้มีการบันทึกไปแล้ว";
                if (!File.Exists(_url))
                {
                    cTmp.Request.Files[0].SaveAs(_url);
                    _query = "insert into infinity..ReqFormDocument(Quarter,StudentID,ReqFormNo,ReqFormType,DocName,DocFileName,DocLink,DocStatus,ModifiedDate)" +
                    "select '" + _quarter + "','" + _student + "','" + _reqFormNo + "','" + _reqFormType + "','" + _docName + "','" + _strFile + "','" + _url + "','0',getdate()";

                    _cmd = new SqlCommand(_query, _Conn);
                    _cmd.ExecuteNonQuery();

                    _Res = "บันทึกเอกสารเรียบร้อยแล้ว";
                }

            }
            catch (Exception ex)
            {
                _Res = "ไม่สามารถบันทึกข้อมูล File เอกสารได้ เนื่องจาก File มีขนาดใหญ่เกินไป";
            }
        }
        else
        {
            _Res = "กรุณาเลือกไฟล์ที่ต้องการอัพโหลด";
        }

        _script = "<script type='text/javascript'> ";
        _script += "javascript:this.parent.ResponseBeforeUpload('" + _Res + "','" + _reqFormNo + "');";  //credit by p' tor และขโมยจากไอ้ตั๊มมา!!!
        _script += " </script>";
        cTmp.Response.Write(_script);
    }//End SaveProjectDocument

    /// <summary>
    /// Method Name :listReqFormDocument
    /// Author: Anussara Wanwang
    /// Create date: 13-10-2013
    /// Description:รายการเอกสารประกอบใน Dialog box ที่แสดงใน Dialog box
    /// Parameter : N/A
    /// </summary>
    public void listReqFormDocument(HttpContext cTmp)
    {
        string _reqFormNo = cTmp.Request["reqFormNo"];
        string _quarter = cTmp.Request["quarter"];
        string _student = cTmp.Request["student"];

        string _html = @"
            <table style='width: 100%;'  border='0' cellpadding='0' cellspacing='0'>
                       <tr  class='textB' style='height: 24px;'>
                       <td colspan='5' class='ui-state-default' align='center'>
                         &nbsp;รายการเอกสารประกอบ
                       </td>
                       </tr>
                         <tr class='textB' style='height: 24px;'>
                       <td align='center'  class='ui-state-hover' style='width: 8%;' >
                       ลำดับ
                       </td>
                       <td align='center'  class='ui-state-hover' style='width: 38%;' >
                       ชื่อเอกสาร
                       </td>
                       <td align='center'  class='ui-state-hover' style='width: 38%;' >
                       ชื่อไฟล์
                       </td>
                       <td align='center'  class='ui-state-hover' style='width: 8%;' >
                       เปิด
                       </td>
                       <td align='center'  class='ui-state-hover' style='width: 8%;' >
                       ลบ
                       </td>
                       </tr>  ";
        string _pathRoot = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
        //        // ตรวจสอบว่ามีเอกสารเดิมอยู่หรือไม่
        //        ProgramProjectDB _DD = new ProgramProjectDB();
        string _query = @"infinity..sp_expGetReqFormDocument '" + _student + "','" + _quarter + "','" + _reqFormNo + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        int _row = _ds.Tables[0].Rows.Count;
        string _docName = "", _docID = "", _docFilename = "",_DocLink = "";
        string _txtExtention = "";
        for (int i = 0; i < _row; i++)
        {
            _docName = _ds.Tables[0].Rows[i]["DocName"].ToString();
            _docID = _ds.Tables[0].Rows[i]["DocID"].ToString();
            _docFilename = _ds.Tables[0].Rows[i]["DocFileName"].ToString();
            _DocLink = _ds.Tables[0].Rows[i]["DocLink"].ToString();

            _html += @" 
                        <tr style='height: 24px;'>
                       <td align='center' class='ui-widget-content' >
                       " + (i + 1) + "                         </td>  ";
            _html += @"        <td align='left' class='ui-widget-content' >
                        " + _docName + "                       </td>                   ";
            _html += @"        <td align='left' class='ui-widget-content' >
                        " + _docFilename + "                       </td>                   ";
            _html += @"        <td align='center' class='ui-widget-content' > ";

            if (_docFilename.IndexOf(".jpg") != -1 || _docFilename.IndexOf(".gif") != -1)
            {
                //_txtExtention = "picture";
                _txtExtention = "../images/icon/Image_icon.png";
            }
            else if ((_docFilename.IndexOf(".doc") != -1) || (_docFilename.IndexOf(".docx") != -1))
            {
                //_txtExtention = "word";
                _txtExtention = "../images/icon/DOC_icon.gif";
            }
            else if ((_docFilename.IndexOf(".xlsx") != -1) || (_docFilename.IndexOf(".xls") != -1))
            {
                //_txtExtention = "excel";
                _txtExtention = "../images/icon/excel.gif";
            }
            else if ((_docFilename.IndexOf(".pdf") != -1))
            {
                //_txtExtention = "pdf";
                _txtExtention = "../images/icon/pdf.png";
            }
            else if ((_docFilename.IndexOf(".pptx") != -1) || (_docFilename.IndexOf(".ppt") != -1))
            {
                //_txtExtention = "powerpoint";
                _txtExtention = "../images/icon/ppt_icon.png";
            }
            else
            {
                //_txtExtention = "no";
                _txtExtention = "../images/icon/Unknown.png";
            }


            string _path = HttpContext.Current.Request.ApplicationPath.ToString();
            if (_path == "/")
            {
                _path = "";

            }
            // string _linkFile = _path + "/EvidenceDocument/" + _StaffID + "/" + _quarter + "/" + _reqFormNo + "/" + _docFilename;
            //string _linkFile = _path + _DocLink;
            string _linkFile = _DocLink;
            _html += "   <img title='เปิดเอกสาร'  src='" + _txtExtention + "' style='width:20px;height:20px;cursor:pointer;'  onclick=\"OpenFile('" + _linkFile + "');\"  />  </td>   ";
            _html += @"  <td align='center' class='ui-widget-content' > 
                       <span title='ลบเอกสาร
' style='cursor:pointer'  class='ui-icon ui-icon-trash' onclick=delDocument('" + _reqFormNo + "','" + _docID + "','" + _student + "','" + _quarter + "');/></span> </td>          </tr>  ";
        }

        if (_row == 0)
        {
            _html += @" 
                        <tr style='height: 24px;'>
                       <td align='center' class='ui-widget-content' >
                       -
                       </td>
                        <td align='center' class='ui-widget-content' >
                        -
                       </td>
                       <td align='center' class='ui-widget-content' >
                        -
                       </td>
                            <td align='center' class='ui-widget-content' >
                     -
                       </td>   
                            <td align='center' class='ui-widget-content' >
                     -
                       </td>   
                       </tr>  ";
        }
        _html += " </table>  ";
        cTmp.Response.Write(_html);
    }//End listReqFormDocument

    /// <summary>
    /// Method Name :deleteDocument
    /// Author: Anussara Wanwang
    /// Create date: 13-10-2013
    /// Description:ลบเอกสาร
    /// Parameter : N/A
    /// </summary>
    public void deleteDocument(HttpContext cTmp)
    {
        string _reqFormNo = cTmp.Request["reqFormNo"];
        string _docID = cTmp.Request["docID"];
        string _quarter = cTmp.Request["quarter"];
        string _studentID = cTmp.Request["studentID"];

        string _query = "update infinity..ReqFormDocument" +
                        " set DocStatus='1'" +
                        " where Quarter='" + _quarter + "' and StudentID='" + _studentID + "' and ReqFormNo='" + _reqFormNo + "'" +
                        " and DocID='" + _docID + "'";

        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();

        SqlCommand _cmd = new SqlCommand(_query, _Conn);
        _cmd.ExecuteNonQuery();
        _Conn.Close();
    }//End deleteDocument

    /// <summary>
    /// Method Name :actualReqForm
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:อนุมัติใบคำร้องสำหรับเจ้าหน้าที่
    /// Parameter : N/A
    /// </summary>
    public void actualReqForm(HttpContext cTmp)
    {
        string _reqFormNo = cTmp.Request["reqFormNo"];
        string _quarter = cTmp.Request["quarter"];
        string _studentID = cTmp.Request["studentID"];
        string _actualStat = cTmp.Request["actualStatus"];
        string _reqRemark = cTmp.Request["remark"];
        string _html = PanelRequestStaff.setActualReqForm(_studentID, _quarter, _reqFormNo, _actualStat, _reqRemark, _StaffID);
        cTmp.Response.Write(_html);
    }//End actualReqForm

    /// <summary>
    /// Method Name :SearchStdPreGraduateStatus
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:ค้นหาสถานะการดำเนินการของนักศึกษา
    /// Parameter : N/A
    /// </summary>
    public void SearchStdPreGraduateStatus(HttpContext cTmp)
    {
        string _search = cTmp.Request["search"];
        string _program = cTmp.Request["program"];
        string _html = PanelRequestStaff.SearchStdPreGraduateStatus(_search, _program, _StaffID);
        cTmp.Response.Write(_html);
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
