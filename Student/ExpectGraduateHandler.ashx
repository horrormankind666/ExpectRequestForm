<%@ WebHandler Language="C#" Class="ExpectGraduateHandler" %>

using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;

public class ExpectGraduateHandler : IHttpHandler {

    public HttpContext _c;
    public string _studentCode =string.Empty;
    public erfPanelStudent _MgDataStd = new erfPanelStudent();
    public string _gethtml;

    public void ProcessRequest (HttpContext context)
    {
        Login _login = new Login("STUDENT");
        string _studentId = _login.StudentId;
        StudentInfo _stdInfo = new StudentInfo(_studentId);
        _studentCode = _stdInfo.StudentCode;
        if (_login.Authen == "true")
        {
            _c = context;
            string _action = _c.Request["action"];
            switch (_action)
            {

                case "checkStdPermission":checkStdPermission(context); break;
                case "checkStudentConfirm": checkStudentConfirm(context); break;
                case "getStudentInfo":getStudentInfo(context); break;
                case "getStudentMoreInfo":getStudentMoreInfo(context); break;
                case "setExpectGraduateStatus":setExpectGraduateStatus(context); break;
                case "setEditInformation":setEditInformation(context); break;
                case "getHtmlChangeTitle":getTitleList(context); break;
                case "getHtmlChangeNationality":getNationalityList(context); break;
                case "SaveProjectDocument": SaveProjectDocument(context); break;
                case "listReqFormDocument": listReqFormDocument(context); break;
                case "deleteDocument": deleteDocument(context); break;
                case "getStdReqFormList": getStdReqFormList(context); break;
                case "cancelStudentReqform": cancelStudentReqform(context); break;
                default: break;

            }

        }//End Authen
        else
        {
            _c.Response.Redirect("/studentAuthen/studentlogin.aspx");
        }//End No Authen
    }

    /// <summary>
    /// Method Name :checkStdPermission
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ตรวจสอบชั้นปีของนักศึกษา ว่าสามารถเข้าระบบได้หรือไม่
    /// Parameter : N/A
    /// </summary>
    public void checkStdPermission(HttpContext c)
    {
        string _returnPermission = erfPanelStudent.checkStudentPermision(_studentCode);
        c.Response.Write(_returnPermission);
    }

    /// <summary>
    /// Method Name :checkStudentConfirm
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ยืนยันข้อมูลถูกต้อง
    /// Parameter : N/A
    /// </summary>
    public void checkStudentConfirm(HttpContext c)
    {
        string _html = erfPanelStudent.checkStudentConfirm(_studentCode);
        c.Response.Write(_html);

    }

    /// <summary>
    /// Method Name :getStudentInfo
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงข้อมูลนักศึกษา
    /// Parameter : N/A
    /// </summary>
    public void getStudentInfo(HttpContext c)
    {
        _gethtml = _MgDataStd.getStudentInfo(_studentCode);
        c.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :getStudentMoreInfo
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงข้อมูลที่อยู่
    /// Parameter : N/A
    /// </summary>
    public void getStudentMoreInfo(HttpContext c)
    {
        _gethtml = _MgDataStd.getStudentMoreInfo(_studentCode);
        c.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :setExpectGraduateStatus
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:ตรวจสอบการเข้ามายืนยันข้อมูลถูกต้อง
    /// Parameter : N/A
    /// </summary>
    public void setExpectGraduateStatus(HttpContext context)
    {
        _gethtml = _MgDataStd.setExpectGradStatus(_studentCode);
        context.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :getStdReqFormList
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงใบคำร้องของนักศึกษา
    /// Parameter : N/A
    /// </summary>
    public void getStdReqFormList(HttpContext c)
    {
        //string _studentID = c.Request["studentID"];
        // string _quarter = c.Request["quarter"];
        //_gethtml = _MgDataStd.getStdReqFormList(_quarter,_studentID);
        _gethtml = erfPanelStudent.getStdReqFormList(_studentCode);
        c.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :setEditInformation
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:บันทึกสถานะว่ามีการยื่นใบคำร้องขอแก้ไขข้อมูล ใน StudentStatus = 2
    /// Parameter : N/A
    /// </summary>
    public void setEditInformation(HttpContext c)
    {
        string _countReq;
        //StringBuilder _xml = new StringBuilder();
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();
        string _query = "select COUNT(ReqFormNo) as CountReqForm" +
                        " from infinity..RequestForm" +
                        " where StudentID = '" + _studentCode + "'" +
                        " and ReqFormStatus = '0' and ReqFormType = '1'" +
                        "  and ((FacApprove is null or FacApprove = '1') or (EduApprove is null or EduApprove ='1'))";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, _Conn);
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        _countReq = _ds.Tables[0].Rows[0]["CountReqForm"].ToString();

        _ds.Dispose();
        _adp.Dispose();
        SqlCommand _cmd;
        if (_countReq == "0")
        {
            _query = "update Infinity..expPreGraduateStatusProfile" +
                        " set PreGraduateStatus = '2'" +
                        ",UpdateBy='"+_studentCode+"'" +
                        ",UpdatedDate=getdate()"+
                        " where StudentCode ='" + _studentCode + "'";
            //_res = "บันทึกข้อมูลเรียบร้อยแล้ว";
        }
        else
        {
            //_xml.Append("นักศึกษามีข้อมูลใบคำร้องอยู่อยู่ในระบบแล้ว ดำเนินการยกเลิกใบคำร้อง");
            _query = "update Infinity..expPreGraduateStatusProfile" +
                    " set PreGraduateStatus = '3'" +
                    ",UpdateBy='"+_studentCode+"'" +
                    ",UpdatedDate=getdate()"+
                    " where StudentCode ='" + _studentCode + "'";
            //_res = "พบใบคำร้องที่ยังดำเนินการไม่แล้วเสร็จในระบบ ไม่สามารถยืนยันความถูกต้องของข้อมูลได้!!!";

        }
        _cmd = new SqlCommand(_query, _Conn);
        _cmd.ExecuteNonQuery();
        c.Response.Write(_countReq);

    }

    /// <summary>
    /// Method Name :getTitleList
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงคำนำหน้าชื่อของนักศึกษา
    /// Parameter : N/A
    /// </summary>
    public void getTitleList(HttpContext c)
    {
        _gethtml = _MgDataStd.getTitleList(_studentCode);
        c.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :getNationalityList
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงสัญชาติของนักศึกษา
    /// Parameter : N/A
    /// </summary>
    public void getNationalityList(HttpContext c)
    {
        _gethtml = _MgDataStd.getNationalityList();
        c.Response.Write(_gethtml);
    }

    /// <summary>
    /// Method Name :SaveProjectDocument
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:บันทึกเอกสารแนบ
    /// Parameter : N/A
    /// </summary>
    public void SaveProjectDocument(HttpContext c)//บันทึกเอกสารเข้าระบบ
    {
        //set reqformtype 1 = ใบคำร้องคาดว่าจะสำเร็จการศึกษา
        string _reqFormType = "1";
        string _docName = c.Request["docName"];
        string _quarter = c.Request["quarter"];
        string _student = c.Request["student"];
        string _reqFormNo = c.Request["reqFormNo"];

        string _script = "";
        string _Res = "";
        string _query = "";
        SqlCommand _cmd;
        SqlDataAdapter _adp;
        DataSet _ds;

        DirectoryInfo DirInfo = new DirectoryInfo(c.Server.MapPath("~/EvidenceDocument/" + _student + "/" + _quarter + "/" + _reqFormNo + "/"));  // ต้องเป็นตัวแปรโฟลเดอร์ด้วยนะ
        if (!DirInfo.Exists)
        {
            DirInfo.Create();
        }
        string _currentPath = c.Server.MapPath("~/EvidenceDocument/" + _student + "/" + _quarter + "/" + _reqFormNo + "/");
        string _strFile = Path.GetFileName(c.Request.Files[0].FileName);
        string _extFile = Path.GetExtension(c.Request.Files[0].FileName.ToLower());
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
                    c.Request.Files[0].SaveAs(_url);
                    _query = "insert into infinity..ReqFormDocument(Quarter,StudentID,ReqFormNo,ReqFormType,DocName,DocFileName,DocLink,DocStatus,ModifiedDate)" +
                    "select '" + _quarter + "','" + _student + "','" + _reqFormNo + "','" + _reqFormType + "','" + _docName + "','" + _strFile + "','" + _url + "','0',getdate()";

                    _cmd = new SqlCommand(_query, _Conn);
                    _cmd.ExecuteNonQuery();

                    _Res = "บันทึกเอกสารเรียบร้อยแล้ว";
                }
                else
                {
                    _Res = "ไฟล์เอกสารนี้มีการบันทึกไปแล้ว";
                }

            }
            catch (Exception ex)
            {
                _Res = "ไม่สามารถบันทึกข้อมูลได้ เนื่องจากไฟล์เอกสารมีปัญหา กรุณาติดต่อเจ้าหน้าที่ 02-849-6227";
            }
        }
        else
        {
            _Res = "กรุณาเลือกไฟล์ที่ต้องการอัพโหลด";
        }

        _script = "<script type='text/javascript'> ";
        _script += "javascript:this.parent.ResponseBeforeUpload('" + _Res + "','" + _reqFormNo + "');";  //credit by p' tor และขโมยจากไอ้ตั๊มมา!!!
        _script += " </script>";
        c.Response.Write(_script);
    }//End SaveProjectDocument

    /// <summary>
    /// Method Name :listReqFormDocument
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:แสดงรายการเอกสารแนบ
    /// Parameter : N/A
    /// </summary>
    public void listReqFormDocument(HttpContext c) //รายการเอกสารประกอบใน Dialog box ที่แสดงใน Dialog box
    {
        string _reqFormNo = c.Request["reqFormNo"];
        string _quarter = c.Request["quarter"];
        string _student = c.Request["student"];

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
        string _path = HttpContext.Current.Request.ApplicationPath.ToString();
        for (int i = 0; i < _row; i++)
        {
            _docName = _ds.Tables[0].Rows[i]["DocName"].ToString();
            _docID = _ds.Tables[0].Rows[i]["DocID"].ToString();
            _docFilename = _ds.Tables[0].Rows[i]["DocFileName"].ToString();
            _DocLink = _ds.Tables[0].Rows[i]["DocLink"].ToString();
            //_DocLink = _ds.Tables[0].Rows[i]["DocLinkSmart"].ToString();
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
                
                _txtExtention = _path+"/images/icon/Image_icon.png";
                //_txtExtention = "../../images/icon/Image_icon.png";
            }
            else if ((_docFilename.IndexOf(".doc") != -1) || (_docFilename.IndexOf(".docx") != -1))
            {
                //_txtExtention = "word";
                //_txtExtention = "../../images/icon/DOC_icon.gif";
                _txtExtention = _path+"/images/icon/DOC_icon.gif";
            }
            else if ((_docFilename.IndexOf(".xlsx") != -1) || (_docFilename.IndexOf(".xls") != -1))
            {
                //_txtExtention = "excel";
                //_txtExtention = "../../images/icon/excel.gif";
                _txtExtention = _path+"/images/icon/excel.gif";
            }
            else if ((_docFilename.IndexOf(".pdf") != -1))
            {
                //_txtExtention = "pdf";
                //_txtExtention = "../../images/icon/pdf.png";
                _txtExtention = _path+"/images/icon/pdf.png";
            }
            else if ((_docFilename.IndexOf(".pptx") != -1) || (_docFilename.IndexOf(".ppt") != -1))
            {
                //_txtExtention = "powerpoint";
                //_txtExtention = "../../images/icon/ppt_icon.png";
                _txtExtention = _path+"/images/icon/ppt_icon.png";
            }
            else
            {
                //_txtExtention = "no";
                //_txtExtention = "../../images/icon/Unknown.png";
                _txtExtention = _path+"/images/icon/Unknown.png";
            }



            if (_path == "/")
            {
                _path = "";

            }
            //string _linkFile = _path + "/EvidenceDocument/" + _student + "/" + _quarter + "/" + _reqFormNo + "/" + _docFilename;
            // string _linkFile = _path + _DocLink;
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
        c.Response.Write(_html);
    }//End listReqFormDocument

    /// <summary>
    /// Method Name :deleteDocument
    /// Author: Anussara Wanwang
    /// Create date: 15-10-2013
    /// Description:ลบเอกสารแนบ
    /// Parameter : N/A
    /// </summary>
    public void deleteDocument(HttpContext c)
    {
        string _reqFormNo = c.Request["reqFormNo"];
        string _docID = c.Request["docID"];
        string _quarter = c.Request["quarter"];
        string _studentID = c.Request["studentID"];

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
    /// Method Name :cancelStudentReqform
    /// Author: Anussara Wanwang
    /// Create date: 25-10-2013
    /// Description:ยกเลิกใบคำร้อง
    /// Parameter : N/A
    /// </summary>
    public void cancelStudentReqform(HttpContext c) {
        string _StudentId = c.Request["studentID"];
        string _quarter = c.Request["quarter"];
        string _reqFormNo = c.Request["reqFormNo"];
        string _reqFormType = c.Request["reqFormType"];
        StringBuilder _xml = new StringBuilder();
        string _sql = @"infinity..sp_expSetUpdateReqForm '" + _StudentId + "','" + _quarter + "','" + _reqFormNo + "','" + _reqFormType + "'";
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();

        SqlCommand _cmd = new SqlCommand(_sql, _Conn);
        _cmd.ExecuteNonQuery();
        _Conn.Close();
        _xml.Append("บันทึกการยกเลิกใบคำร้องเรียบร้อยแล้ว");
        c.Response.Write(_xml);
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}