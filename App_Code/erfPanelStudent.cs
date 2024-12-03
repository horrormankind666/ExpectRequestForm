using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for erfPanelStudent
/// </summary>
public class erfPanelStudent
{
    public string _html = "";
    /// <summary>
    /// Method Name :AddJQuery
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:Header HTML หน้านักศึกษา
    /// </summary>
    /// <param name="_page"></param>
    public static void AddJQuery(Page _page)
    {
        string _jsMin = "<script src='../js/jquery-1.9.1.js' type='text/javascript'></script>";
        string _jsUi = "<script src='../js/jquery-ui-1.10.3.custom.min.js' type='text/javascript'></script>";
        string _css = "<link href='../css/redmond/jquery-ui-1.10.3.custom.min.css' rel='stylesheet' type='text/css' />";
        _page.Header.Controls.Add(new LiteralControl(_css));
        _page.Header.Controls.Add(new LiteralControl(_jsMin));
        _page.Header.Controls.Add(new LiteralControl(_jsUi));
    }

    /// <summary>
    /// Method Name :checkStudentPermision
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ตรวจสอบการเข้าใช้ระบบตรวจสอบข้อมูลนักศึกาาที่คากดว่าจะสำเร็จการศึกษา ต้องเป็นปี 4 หรือ 6 ถึงจะใช้งานระบบได้ checkStudentPermision
    /// </summary>
    /// <param name="_GStudentID">รหัสนักศึกษา</param>
    /// <returns></returns>
    public static string checkStudentPermision(string _studentCode)
    {
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();
        string _query = @"SELECT * FROM infinity..fnc_expGetListstdPermission('" + _studentCode + "')";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, _Conn);
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        string _stdPermission = "";
        if (_ds.Tables[0].Rows.Count != 0)
        {
            _stdPermission = _ds.Tables[0].Rows[0]["stdPermission"].ToString();
        }

        _ds.Dispose();
        _adp.Dispose();

        //20231203 anussara.wan Insert expPreGraduateStatusProfile เมื่อ _stdPermission = O (อนุญาตให้ตรวจสอบจบ)
        if (_stdPermission == "0")
        {         
            string _sql;
            _sql = @"infinity..sp_expSetInserteExpPreGraduateStatusProfile '" + _studentCode + "'";
            //สั่งให้ execute
            SqlCommand _cmd = new SqlCommand(_sql, _Conn);
            _cmd.ExecuteNonQuery();
        }

        return _stdPermission.ToString();
    }//End checkStudentPermision

    /// <summary>
    /// Method Name :checkStudentConfirm
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ตรวจสอบสถานะการยืนยันข้อมูลถูกต้อง
    /// </summary>
    /// <param name="_GStudentID">รหัสนักศึกษา</param>
    /// <returns></returns>
    public static string checkStudentConfirm(string _studentCode)
    {
        string _statusID = "", _status = "";
        StringBuilder _xml = new StringBuilder();
        string _sql = "select * from infinity..fnc_checkPreGraduateStatus('" + _studentCode + "')";
        SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
        {
            _statusID = _ds.Tables[0].Rows[0]["PreGraduateStatus"].ToString();
            _status = _ds.Tables[0].Rows[0]["Prestatus"].ToString();

        }
        _ds.Dispose();
        _adp.Dispose();
        if (_statusID == "1")//ยืนยันข้อมูลแล้ว
        {
            _xml.Append("<div class='ui-state-highlight-complete ui-corner-all' style='margin-top: 20px; padding: 0 .7em;'>" +
                        "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>" +
                        "<strong>สถานะการดำเนินการ : " + _status + "</strong> </p>" +
                        "</div>");
        }
        else if (_statusID == "2")//ดำเนินการแล้ว (ยังไม่เขียนใบคำร้อง)
        {
            _xml.Append("<div class='ui-state-highlight-wait ui-corner-all' style='margin-top: 20px; padding: 0 .7em;'>" +
                "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>" +
                "<strong>สถานะการดำเนินการ : " + _status + "</strong> </p>" +
                "</div>");
        }
        else if (_statusID == "3")//ดำเนินการแล้ว (มีใบคำร้อง)
        {
            _xml.Append("<div class='ui-state-highlight-waitComplete ui-corner-all' style='margin-top: 20px; padding: 0 .7em;'>" +
               "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>" +
               "<strong>สถานะการดำเนินการ : " + _status + "</strong> </p>" +
               "</div>");
        }
        else
        {//ยังไม่ดำเนินการใดๆ
            _xml.Append("<div class='ui-state-highlight-error ui-corner-all' style='margin-top: 20px; padding: 0 .7em;'>" +
               "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>" +
               "<strong>สถานะการดำเนินการ : " + _status + "</strong> </p>" +
               "</div>");
        }

        return _xml.ToString();
    }//End checkStudentConfirm

    /// <summary>
    /// Method Name :getStudentInfo
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Update date: 03-12/2023
    /// Description:แสดงข้อมูลนักศึกษา getStudentInfo
    /// </summary>
    /// <param name="_GStudentID">รหัสนักศึกษา</param>
    /// <returns></returns>
    public string getStudentInfo(string _studentCode)
    {
        string _query = "infinity..sp_expSelectStudentInfo '" + _studentCode + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        string _idCard = "";
        _html = _ds.Tables[0].Rows[0]["Panel"].ToString();
        _idCard = _ds.Tables[0].Rows[0]["IdCard"].ToString();

        _ds.Dispose();
        _adp.Dispose();

        return _html;
    }//End getStudentInfo

    /// <summary>
    /// Method Name :getStudentMoreInfo
    /// Author: Anussara Wanwang
    /// Create date: 11-10-2013
    /// Description:แสดงที่อยู่นักศึกษา getStudentMoreInfo
    /// </summary>
    /// <param name="_GStudentID">รหัสนักศึกษา</param>
    /// <returns></returns>
    public string getStudentMoreInfo(string _studentCode)
    {
        string _query = "infinity..sp_expGetListRequestFormStdInfo '" + _studentCode + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        _html = _ds.Tables[0].Rows[0]["Panel"].ToString();

        _ds.Dispose();
        _adp.Dispose();

        return _html;
    }//End getStudentMoreInfo

    /// <summary>
    /// Method Name :getTitleList
    /// Author: Anussara Wanwang
    /// Create date: 11-10-2013
    /// Update Date: 03-12-2023
    /// Description:แสดงคำนำหน้าชื่อสำหรับแก้ไข getTitleList
    /// </summary>
    /// <param name="_GStudentID">รหัสนักศึกษา</param>
    /// <returns></returns> 
    public string getTitleList(string _studentCode)
    {
        _html = "<select id='ddlTitle' runat='server' style='width:200px;'>";
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
            _html += "<option value='0'>--กรุณาเลือกคำนำหน้านาม--</option>";
            for (int i = 0; i < _row; i++)
            {
                _titleCode = _ds.Tables[0].Rows[i]["TitleCode"].ToString();
                _titleTName = _ds.Tables[0].Rows[i]["TitleTName"].ToString();

                _html += "<option value='" + _titleCode + "'>" + _titleTName + "</option>";
            }
        }
        else
        {
            _html += "<option value='1'>--ไม่พบข้อมูล--</option>";
        }

        _html += "</select>";
        _ds.Dispose();
        _adp.Dispose();
        return _html;
    }//End getTitleList

    /// <summary>
    /// Method Name :getNationalityList
    /// Author: Anussara Wanwang
    /// Create date: 11-10-2013
    /// Update Date: 03-12-2023
    /// Description:แสดงสัญชาติใน Ddl getNationalityList
    /// </summary> 
    public string getNationalityList()
    {
        _html = "<select id='ddlNationality' runat='server' style='width:200px;'>";
        string _query = "select *" +
                        "from Infinity..vwBNationality";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _nationCode, _nationEName;

        if (_row != 0)
        {
            _html += "<option value='0'>--กรุณาเลือกสัญชาติ--</option>";
            for (int i = 0; i < _row; i++)
            {
                _nationCode = _ds.Tables[0].Rows[i]["NationalityCode"].ToString();
                _nationEName = _ds.Tables[0].Rows[i]["NationalityEname"].ToString();

                _html += "<option value='" + _nationCode + "'>" + _nationCode + " : " + _nationEName + "</option>";
            }
        }
        else
        {
            _html += "<option value='1'>--ไม่พบข้อมูล--</option>";
        }

        _html += "</select>";
        _ds.Dispose();
        _adp.Dispose();
        return _html;
    }//End getNationalityList

    /// <summary>
    /// Method Name :getStdReqFormList
    /// Author: Anussara Wanwang
    /// Create date: 11-10-2013
    /// Update date: 03-12-2023
    /// Description:แสดงรายการใบคำรองของนักศึกษา getStdReqFormList
    /// </summary>
    /// <param name="_studentId">รหัสนักศึกษา</param>
    /// <returns></returns>
    public static string getStdReqFormList(string _studentId)
    {
        StringBuilder _xml = new StringBuilder();
        string _quarter;
        _xml.Append("<br/><table id='tblStdReqFormList' border='0' cellpadding='0' cellspacing='0' width='100%' >" +
           "<tr style='height:25px'>" +
           "<th colspan='9' class='ui-state-hover'>" +
           "<table border='0' cellpadding='0' cellspacing='0' width='98%'><tr><td width='30%'> รายการใบคำร้อง</td>" +
                    "<td width='70%' align='center'>" +
                           "<table id='tblIcon' border='0' cellpadding='0' cellspacing='0' width='100%' >" +
                            "<tr style='font-family:Tahoma;font-size:13px;'>" +
                                "<td height='25' align='center' class='ui-widget-content'>" +
                                "<span><img alt='' src='../images/icon/clock-select-remain-icon.png' width='25'/></span>" +
                                "</td>" +
                                "<td align=left class='ui-widget-content'>" +
                                    "&nbsp;<strong>ใบคำร้องอยู่ระหว่างรอการตรวจสอบ</strong>" +
                                "</td>" +
                                "<td height='25' align='center' class='ui-widget-content'>" +
                                "<span><img alt='' src='../images/icon/pass.png' width='25'/></span>" +
                                "</td>" +
                                "<td align=left class='ui-widget-content'>" +
                                    "&nbsp;<strong>ใบคำร้องผ่านการอนุมัติแล้ว</strong>" +
                                "</td>" +
                                "<td height='25' align='center' class='ui-widget-content'>" +
                                "<span><img alt='' src='../images/icon/exclamation-icon.png' width='25'/></span>" +
                                "</td>" +
                                "<td align=left class='ui-widget-content'>" +
                                    "&nbsp;<strong>ใบคำร้องไม่ผ่านการอนุมัติ</strong>" +
                                "</td>" +
                            "</tr>" +
                        "</table>" +
                    "</td></tr></table>" +
            "</th>" +
            "</tr>" +
           "<tr>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ลำดับ</th>" +
           "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='250' align='center' style='font-family:Tahoma;font-size:12px;'>ประเภทใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='200' align='center' style='font-family:Tahoma;font-size:12px;'>เหตุผลที่ไม่อนุมัติใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>พิมพ์ใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>เพิ่มเอกสารแนบ</th>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ยกเลิกใบคำร้อง</th>" +
           "<th class='ui-widget-header' width='200' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%'border='1' cellpadding='0' cellspacing='0'><tr><td colspan='2'  class='ui-widget-header'>สถานะการอนุมัติ</td></tr><tr><td  class='ui-widget-header' width='50%'>เจ้าหน้าที่คณะ</td><td  class='ui-widget-header' width='50%'>กบศ.</td></tr></table></th>" +
           "</tr>");
        string _query = @"select * from infinity..RequestForm F
                        left join infinity..ReqFormType T
                        on F.ReqFormType=T.ReqFormType
                        where F.StudentId ='" + _studentId + "' and F.ReqFormType = '1' order by F.ReqFormNo";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        int _row = _ds.Tables[0].Rows.Count;
        string _reqFormNo, _reqFormType, _remark, _facApprove, _eduApprove, _facIcon = "", _eduIcon = "";
        string _ReqFormStatus, _reqFormDescription;
        if (_row != 0)
        {
            for (int i = 0; i < _row; i++)
            {
                _facIcon = "";
                _eduIcon = "";
                _reqFormNo = _ds.Tables[0].Rows[i]["ReqFormNo"].ToString();
                _reqFormType = _ds.Tables[0].Rows[i]["ReqFormType"].ToString();
                _reqFormDescription = _ds.Tables[0].Rows[i]["Description"].ToString();
                _remark = _ds.Tables[0].Rows[i]["Remark"].ToString();
                _facApprove = _ds.Tables[0].Rows[i]["FacApprove"].ToString();
                _eduApprove = _ds.Tables[0].Rows[i]["EduApprove"].ToString();
                _quarter = _ds.Tables[0].Rows[i]["Quarter"].ToString();
                //_quarter = "601";
                _ReqFormStatus = _ds.Tables[0].Rows[i]["ReqFormStatus"].ToString();

                //เจ้าหน้าที่คณะ
                if ((_facApprove == null || _facApprove == "") & (_ReqFormStatus == "0"))
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='อยู่ระหว่างรอการตรวจสอบ' src='../images/icon/clock-select-remain-icon.png' width='20'/></span>";
                }
                else if (_facApprove == "0" & _ReqFormStatus == "0")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='ผ่านการอนุมัติแล้ว' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_facApprove == "1" & _ReqFormStatus == "0")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='ไม่ผ่านการอนุมัติ' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }
                //เจ้าหน้าที่ กบศ.
                if ((_eduApprove == null || _eduApprove == "") & (_ReqFormStatus == "0"))
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30'><img alt='อยู่ระหว่างรอการตรวจสอบ' src='../images/icon/clock-select-remain-icon.png' width='20' /></span>";
                }
                else if (_eduApprove == "0" & _ReqFormStatus == "0")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='ผ่านการอนุมัติแล้ว' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_eduApprove == "1" & _ReqFormStatus == "0")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='ไม่ผ่านการอนุมัติ' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }

                _xml.Append("<tr>");
                _xml.Append("<td height='30' width='50' align='center' class='ui-widget-content'>" + (i + 1) + "</td>");
                _xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;background-color:green'>" + _reqFormNo + "</td>");
                _xml.Append("<td height='30' width='300' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;font-color:red'>&nbsp;" + _reqFormDescription + "</td>");
                _xml.Append("<td height='30' width='200' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;color:Red;'>&nbsp;" + _remark + "</td>");
                _xml.Append("<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>");
                _xml.Append("<span title='เปิดใบคำร้องเพื่อสั่งพิมพ์' style='cursor:pointer'  class='ui-icon ui-icon-document' onclick='showStudentReqform(" + _studentId + "," + _quarter + "," + _reqFormNo + ");'></span>");
                _xml.Append("</td>");
                //คณะและ กบศ ยังไม่ดำเนินการ ยกเลิกใบคำร้องได้
                if (_ReqFormStatus == "0" & ((_facApprove == null || _facApprove == "") & (_eduApprove == null || _eduApprove == "")))
                {
                    _xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><span title='เพิ่มเอกสารแนบเพื่อประกอบการอนุมัติใบคำร้อง' style='cursor:pointer;align:center'  class='ui-icon ui-icon-folder-open' onclick='displayDialogAttachFile(" + _studentId + "," + _quarter + "," + _reqFormNo + ");'></span> </td>");
                    _xml.Append("<td height='30' width='50' align='center' bgcolor='#9ACD32'>");
                    _xml.Append("<span title='ยกเลิก' style='cursor:pointer' class='ui-icon ui-icon-trash' onclick='cancelStudentReqform(" + _studentId + "," + _quarter + "," + _reqFormNo + "," + _reqFormType + ");'></span>");
                    _xml.Append("</td>");
                }
                //คณะไม่อนุมัติ กบศยังไม่ดำเนินการ ยกเลิกใบคำร้องได้
                else if (_ReqFormStatus == "0" & (_facApprove == "1" & (_eduApprove != null || _eduApprove != "")))
                {
                    _xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><span title='เพิ่มเอกสารแนบเพื่อประกอบการอนุมัติใบคำร้อง' style='cursor:pointer;align:center'  class='ui-icon ui-icon-folder-open' onclick='displayDialogAttachFile(" + _studentId + "," + _quarter + "," + _reqFormNo + ");'></span> </td>");
                    _xml.Append("<td height='30' width='50' align='center' bgcolor='#9ACD32'>");
                    _xml.Append("<span title='ยกเลิก' style='cursor:pointer' class='ui-icon ui-icon-trash' onclick='cancelStudentReqform(" + _studentId + "," + _quarter + "," + _reqFormNo + "," + _reqFormType + ");'></span>");
                    _xml.Append("</td>");
                }
                else
                {
                    if (_ReqFormStatus == "0" & (_facApprove == "0" || _eduApprove == "0"))
                    {
                        _xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>");
                        _xml.Append("<span title='เพิ่มเอกสารแนบเพื่อประกอบการอนุมัติใบคำร้อง' style='cursor:pointer;align:center'  class='ui-icon ui-icon-folder-open' onclick='displayDialogAttachFile(" + _studentId + "," + _quarter + "," + _reqFormNo + ");'></span>");
                        _xml.Append("</td>");
                    }
                    else
                    {
                        _xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>");
                        _xml.Append("<span title='เพิ่มเอกสารไม่ได้' style='cursor:pointer;align:center' class='ui-icon ui-icon-alert'></span>");
                        _xml.Append("</td>");
                    }
                    //_xml.Append("<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>");
                    //_xml.Append("<span title='เพิ่มเอกสารไม่ได้' style='cursor:pointer;align:center' class='ui-icon ui-icon-alert'></span>");
                    //_xml.Append("</td>");
                    _xml.Append("<td height='30' width='50' align='center' bgcolor='#FA8072'>");
                    _xml.Append("<span title='ยกเลิกไม่ได้' style='cursor:pointer' class='ui-icon ui-icon-alert'></span>");
                    _xml.Append("</td>");
                }
                _xml.Append("<td height='30' width='200' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>");
                _xml.Append("<table height='30' width='100%' ><tr><td  class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' " + _facIcon + "</td></tr></table></td>");
                _xml.Append("<td class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' align='center' " + _eduIcon + "</td></tr></table></td></tr></table></td>");
                _xml.Append("</tr>");
            }
        }
        else
        {
            _xml.Append("<tr bgColor='#F5FAFE' style='font-family:Tahoma;font-size:16px;'>" +
                        "<td height='30' align='center' colspan='9' class='ui-widget-content' style='color:red'>ไม่พบข้อมูลใบคำร้อง</td>" +
                    "</tr>");
        }
        _xml.Append("</table>");
        _xml.Append("<br><br>");

        _ds.Dispose();
        _adp.Dispose();

        return _xml.ToString();
    }//End getStdReqFormList

    /// <summary>
    /// Method Name :setExpectGradStatus
    /// Author: Anussara Wanwang
    /// Create date: 12-10-2013
    /// Description:function สำหรับตรวจสอบว่าหากนักศึกษาต้องการยืนยันข้อมูลถูกต้อง มีใบคำร้องค้างในระบบหรือไม่ setExpectGradStatus
    /// </summary>
    /// <param name="_GstudentID">รหัสนักศึกษา</param>
    /// <returns></returns>
    public string setExpectGradStatus(string _studentCode)
    {
        string _chkStdID = _studentCode;
        string _res = "", _countReq = "0";
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();
        string _query = "select COUNT(ReqFormNo) as CountReqForm" +
                        " from infinity..RequestForm" +
                        " where StudentID = '" + _chkStdID + "'" +
                        " and ReqFormStatus = '0' and ReqFormType = '1'" +
                        " and ((FacApprove is null or FacApprove = '1') or (EduApprove is null or EduApprove ='1'))";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, _Conn);
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        _countReq = _ds.Tables[0].Rows[0]["CountReqForm"].ToString();

        _ds.Dispose();
        _adp.Dispose();
        if (_countReq == "0")
        {
            _query = "update Infinity..expPreGraduateStatusProfile" +
                        " set PreGraduateStatus = '1'" +
                        ",UpdateBy='" + _chkStdID + "'" +
                        ",UpdatedDate=getdate()" +
                        " where StudentCode='" + _chkStdID + "'";
            SqlCommand _cmd = new SqlCommand(_query, _Conn);
            _cmd.ExecuteNonQuery();

            _res = "บันทึกข้อมูลเรียบร้อยแล้ว";
        }
        else
        {
            _res = "พบใบคำร้องที่ยังดำเนินการไม่แล้วเสร็จในระบบ ไม่สามารถยืนยันความถูกต้องของข้อมูลได้!!!";
        }

        return _res;
    }//End setExpectGradStatus
}