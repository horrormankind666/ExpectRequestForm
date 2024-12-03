using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
//using DBConnection;
//using MUEIS;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI;

/// <summary>
/// Author: Anussara Wanwang
/// Create date: 06-09-2013
/// Description:รวม function funtion สำหรับ staff ทั้งหมด จะถูกเรียกใช้โดย Handler staff
/// </summary>
public class PanelRequestStaff
{
    public PanelRequestStaff()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    /// <summary>
    /// Method Name :AddJQuery
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:Add Script Header HTML
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
    /// Method Name :FromApproTabs1
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:รวม panel ย่อย สำหรับ tabs1
    /// Parameter : n/a
    /// </summary>
    public static string FromApproTabs1()
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append(PanelApprovReqTabs1());
        return _xml.ToString();
    }

    /// <summary>
    /// Method Name :FromApproTabs2
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:รวม panel ย่อย สำหรับ tabs2
    /// Parameter : n/a
    /// </summary>
    public static string FromApproTabs2(string _StaffID)
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append(PanelSearchApprovTabs2(_StaffID));
        return _xml.ToString();
    }

    /// <summary>
    /// Method Name :FromApproTabs3
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:รวม panel ย่อย สำหรับ tabs3
    /// Parameter : n/a
    /// </summary>
    public static string FromApproTabs3(string _StaffID)
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append(PanelSearchPregraduateTab3(_StaffID));
        return _xml.ToString();
    }

    /****************************************************Panel********************************/
    /// <summary>
    /// Method Name :PanelApprovReqTabs1
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:panel อนุมัติใบคำร้อง tabs1
    /// Parameter : n/a
    /// </summary>
    public static string PanelApprovReqTabs1()
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append(@"<div id='divNonApprReqFormList'></div>
                                <input type='hidden' id='hddStudentID'/>
                                <input type='hidden' id='hddQuarter' />
                                <input type='hidden' id='hddReqFormNo' />
                                <iframe id='ifmDoc' runat='server' name='ifmDoc' height='0px' width='0px'></iframe>
                                <div id='divApprReqForm'>
                                    <fieldset>
                                        <legend style='font-family: Tahoma; font-size: 13px; font-weight: bold;'>รายละเอียดใบคำร้อง</legend>
                                        <div id='divReqFormDetail'>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend style='font-family: Tahoma; font-size: 13px; font-weight: bold;'>ตรวจสอบเอกสาร</legend>
                                        <div id='divOpenDoc'>
                                            <table id='tblAddDocument' border='0' cellpadding='0' cellspacing='0' width='100%'>
                                                <tr>
                                                    <td class='ui-widget-content' align='center' style='width: 40%;'>
                                                        <table style='width: 100%;' border='0' cellpadding='0' cellspacing='0'>
                                                            <tr style='height: 200px;'>
                                                                <td class='ui-widget-content'>
                                                                    <table cellpadding='0' cellspacing='0' width='100%'>
                                                                        <tr style='height: 28px;'>
                                                                            <td align='left'>
                                                                                &nbsp;&nbsp;ชื่อเอกสาร :
                                                                                <input id='txtDocName' type='text' style='width: 180px; font-size: 11px;' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr style='height: 28px;'>
                                                                            <td align='left'>
                                                                                <div id='divUploadFile'>
                                                                                    &nbsp;&nbsp;ชื่อไฟล์ :
                                                                                    <input type='file' name='fileUpload' id='fileUpload' runat='server' Style='width: 202px;'class='clsBtn'>
                                                                                 </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style='height: 25px;'>
                                                                            <td onclick='_show.SaveNewDoc()' align='center'>
                                                                                <table id='tblAttachFiles' class='clsBtn'>
                                                                                    <tr>
                                                                                        <td width='20' class='ui-icon ui-icon-document'>
                                                                                        </td>
                                                                                        <td width='70'>
                                                                                            แนบเอกสาร
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class='ui-widget-content' style='width: 60%; vertical-align: top;'>
                                                        <div id='divDocumentList'>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style='height: 42px;' class='sizeFont'>
                                                    <td align='center' colspan='3'>
                                                    </td>
                                                </tr>
                                            </table>
                                    </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend style='font-family: Tahoma; font-size: 13px; font-weight: bold;'>ดำเนินการอนุมัติใบคำร้อง</legend>
                                        <table id='tblApprReqForm' border='0' cellpadding='0' cellspacing='0' width='100%'
                                            class='styleTbl'>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td style='font-weight: bold; width: 50%;'>
                                                                <input id='rdApprove' name='rdApprStatus' runat='server' type='radio' onclick='displayDialogDisApprReason();' />อนุมัติ
                                                            </td>
                                                            <td style='font-weight: bold; width: 50%;'>
                                                                <input id='rdDisApprove' name='rdApprStatus' runat='server' type='radio' onclick='displayDialogDisApprReason();' />ไม่อนุมัติ
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset id='fsDisApprReason'>
                                        <legend style='font-family: Tahoma; font-size: 13px; font-weight: bold;'>เหตุผลที่ไม่สามารถดำเนินการอนุมัติใบคำร้องได้</legend>
                                        <div id='divDisApprReason'>
                                            <input id='txtDisApprReason' type='text' style='width: 350px;' value='' />
                                        </div>
                                    </fieldset>");
        return _xml.ToString();
    }//End PanelApprovReqTabs1

    /// <summary>
    /// Method Name :PanelSearchApprovTabs2
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:panel ค้นหาข้อมูลใบคำร้อง tabs2
    /// Parameter : n/a
    /// </summary>
    public static string PanelSearchApprovTabs2(string _StaffID)
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append("<table id='tblFilter' width='100%' align='center' style='border: 1px solid steelBlue;' cellpadding='1' cellspacing='1' >" +
                                   " <tr align='left' style='height: 30px;'>" +
                                        "<td class='ui-widget-header' style='padding-left: 20px;' colspan='5'>" +
                                           " ข้อมูลใบคำร้องคาดว่าจะสำเร็จการศึกษา" +
                                       " </td>" +
                                   " </tr>" +
                                   " <tr style='font-family: Tahoma; font-size: 13px;'>" +
                                        "<td height='30' style='font-weight: bold; width: 10%;' bgcolor='#99ccff' align='right'" +
                                          "  colspan='2'>" +
                                           " โปรดระบุรหัสนักศึกษา/ชื่อ/นามสกุล" +
                                        "</td>" +
                                        "<td colspan='3' height='30' style='font-weight: bold; width: 18%;'>" +
                                            "<table width='100%'>" +
                                                "<tr>" +
                                                    "<td style='width: 50%;' align='right'>" +
                                                        "<input type='text' id='txtSearchStudent' style='width: 300px;' />" +
                                                    "</td>" +
                                                    "<td style='width: 50%;' align='right' onclick='_show.searchByStdInfor()'>" +
                                                        "<table class='clsBtn'>" +
                                                            "<tr>" +
                                                                "<td width='20' class='ui-icon ui-icon-search'>" +
                                                                "</td>" +
                                                                "<td>" +
                                                                    "ค้นหาจากข้อมูลนักศึกษา" +
                                                                "</td>" +
                                                            "</tr>" +
                                                        "</table>" +
                                                    "</td>" +
                                                "</tr>" +
                                            "</table>" +
                                        "</td>" +
                                    "</tr>" +
                                    "<tr style='font-family: Tahoma; font-size: 13px;'>" +
                                        "<td height='30' style='font-weight: bold; width: 10%;' bgcolor='#99ccff' align='right'>" +
                                            "ภาคการศึกษา" +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 30%;' bgcolor='#ccffff'>" +
                                            getDdlQuarter() +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 12%;' bgcolor='#99ccff' align='right'>" +
                                           " สถานะใบคำร้อง" +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 30%;' bgcolor='#ccffff'>" +
                                            "<select id='ddlReqStatus' runat='server' style='width: 200px;'>" +
                                                "<option value='0'>ทั้งหมด</option>" +
                                                "<option value='1'>ใบคำร้องที่ถูกยกเลิก</option>" +
                                                "<option value='2'>รอการอนุมัติ</option>" +
                                                "<option value='3'>ผ่านการอนุมัติ</option>" +
                                                "<option value='4'>ไม่ผ่านการอนุมัติ</option>" +
                                            "</select>" +
                                        "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<td height='30' style='font-weight: bold; width: 10%;' bgcolor='#99ccff' align='right'>" +
                                            "คณะ" +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 30%;' bgcolor='#ccffff'>" +
                                            getDdlFaculty(_StaffID) +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 12%;' bgcolor='#99ccff' align='right'>" +
                                            "หลักสูตร" +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 30%;' bgcolor='#ccffff'>" +
                                         "<span id='spProgram'></span>" +
                                        "</td>" +
                                        "<td height='30' style='font-weight: bold; width: 18%;' align='right' onclick='_show.SearchMultiStdInfor()'>" +
                                            "<table class='clsBtn'>" +
                                                "<tr>" +
                                                    "<td width='20' class='ui-icon ui-icon-search'>" +
                                                    "</td>" +
                                                    "<td>" +
                                                        "แสดงข้อมูลใบคำร้อง" +
                                                    "</td>" +
                                                "</tr>" +
                                            "</table>" +
                                        "</td>" +
                                    "</tr>" +
                                "</table>");
        //From Show Table To Search
        _xml.Append(" <div id='divDisplayReqFormByFilter'>" +
                    "</div>");
        return _xml.ToString();
    }//End PanelSearchApprovTabs2

    /// <summary>
    /// Method Name :PanelSearchPregraduateTab3
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:panel ค้นหานักศึกษาเพื่อดูสถานะการเข้ามาดำเนินการตรวจสอบข้อมูลในระบบ
    /// </summary>
    /// <param name="_StaffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string PanelSearchPregraduateTab3(string _StaffID)
    {
        StringBuilder _xml = new StringBuilder();
        //ค้นหาข้อมูล
        _xml.Append("<table width='100%' border='0' cellpadding='0' cellspacing='4'>");
        _xml.Append("<tr>");
        _xml.Append("<td width='55%' class ='ui-state-default' style='text-align:right;'>ค้นหาตาม รหัสนักศึกษา / ชื่อ - นามสกุล :&nbsp;</td>");
        _xml.Append("<td width='40%' class='ui-profile-detail' align='left'>&nbsp;<input type='text' id='txtSearch' name='txtStd' value='' style='width:200px;background-color:#f2f2f2;border:1px solid steelBlue;font-size:14px;color:gray;font-family:tahoma;' /></td>");
        _xml.Append("<td width='5%'><a id='btnSearch' class='FontButton' style='Width:100px;font-size:12px;' onclick='_showTabs3.SearchStdPreGraduateStatus(1)'>ค้นหา</a></td>");
        _xml.Append("</tr>");
        _xml.Append("</table>");
        _xml.Append("<table width='100%' border='0' cellpadding='0' cellspacing='4'>");
        _xml.Append("<tr>");
        _xml.Append("<td width='10%' class ='ui-state-default' style='text-align:right;'>คณะ :&nbsp;</td>");
        _xml.Append("<td width='40%' class='ui-profile-detail'>" + getDdlFacultyTabs3(_StaffID) + "</td>");
        _xml.Append("<td width='10%' class ='ui-state-default' style='text-align:right;'>หลักสูตร :&nbsp;</td>");
        _xml.Append("<td width='35%' class='ui-profile-detail'><span id='spProgram1'></span></td>");
        _xml.Append("<td width='5%'><a  id='btnSearchMulti' class='FontButton'   style='Width:100px;font-size:12px;' onclick='_showTabs3.SearchStdPreGraduateStatus(2)'>แสดงผล</a></td>");
        _xml.Append("</tr>");
        _xml.Append("</table>");
        //แสดงข้อมูล
        _xml.Append("<br>");
        _xml.Append("<div id='divshowStdPregrad' style='height:400px;width:100%;overflow:Auto;position:relative'></div>");
        return _xml.ToString();
    }//End PanelSearchPregraduateTab3

    /// <summary>
    /// Method Name :getDdlQuarter
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:นำภาคการศึกษาจากฐานข้อมูลมาแสดงใน ddl
    /// Parameter : n/a
    /// </summary>
    public static string getDdlQuarter()
    {
        string _query = "select distinct Quarter" +
                        " from infinity..RequestForm" +
                        " order by Quarter desc";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        System.Web.UI.HtmlControls.HtmlSelect ddlQuarter = new System.Web.UI.HtmlControls.HtmlSelect();
        ddlQuarter.Attributes["id"] = "ddlQuarter";
        int _row = _ds.Tables[0].Rows.Count;
        string _quarter;

        if (_row != 0)
        {
            ddlQuarter.Items.Add(new ListItem("--กรุณาเลือกภาคการศึกษา--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _quarter = _ds.Tables[0].Rows[i]["Quarter"].ToString();

                ddlQuarter.Items.Add(new ListItem(_quarter, _quarter));
            }
        }
        else
        {
            ddlQuarter.Items.Add(new ListItem("--ไม่พบข้อมูลใบคำร้อง--", "1"));
        }

        _ds.Dispose();
        _adp.Dispose();

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter stWriter = new System.IO.StringWriter(sb);
        System.Web.UI.HtmlTextWriter htmlWriter = new System.Web.UI.HtmlTextWriter(stWriter);
        ddlQuarter.RenderControl(htmlWriter);

        return sb.ToString();
    }

    /// <summary>
    /// Method Name :getDdlFaculty
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:นำข้อมูลคณะมาใส่ใน ddl
    /// </summary>
    /// <param name="_StaffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string getDdlFaculty(string _StaffID)
    {

        string _checkStatus = "";
        string _StaffType = "", _FacultyCode = "", _FacultyCode1 = "";
        //ตรวจสอบสิทธ์เจ้าหน้าที่ ถ้าเป็น 1 ไม่มีสิทธ์เข้าใช้งานระบบนี้
        _checkStatus = checkUserPermision(_StaffID);
        // if (_checkStatus.IndexOf("#") != -1)
        // {
        string[] _array = _checkStatus.Split('#');
        if (_array.Length == 3)
        {
            _FacultyCode = _array[0];
            _StaffType = _array[1];
            _FacultyCode1 = _array[2];
        }
        string _query = @"infinity..sp_expGetddlFaculty '" + _FacultyCode + "','" + _FacultyCode1 + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        System.Web.UI.HtmlControls.HtmlSelect ddlFaculty = new System.Web.UI.HtmlControls.HtmlSelect();
        ddlFaculty.Attributes["id"] = "ddlFaculty";
        ddlFaculty.Attributes["onchange"] = "_show.getHtmlDdlProgram()";
        int _row = _ds.Tables[0].Rows.Count;
        string _facCode, _facTName;

        if (_row != 0)
        {
            ddlFaculty.Items.Add(new ListItem("--กรุณาเลือกคณะ--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _facCode = _ds.Tables[0].Rows[i]["FacultyCode"].ToString();
                _facTName = _ds.Tables[0].Rows[i]["FactTName"].ToString();

                ddlFaculty.Items.Add(new ListItem(_facCode + " - " + _facTName, _facCode));
            }
        }
        else
        {
            ddlFaculty.Items.Add(new ListItem("--ไม่พบข้อมูลคณะ--", "0"));
        }

        _ds.Dispose();
        _adp.Dispose();


        //  }
        // else
        //{
        //ddlFaculty.Items.Add(new ListItem("--ไม่พบข้อมูลคณะ--", "1"));
        // }
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter stWriter = new System.IO.StringWriter(sb);
        System.Web.UI.HtmlTextWriter htmlWriter = new System.Web.UI.HtmlTextWriter(stWriter);
        ddlFaculty.RenderControl(htmlWriter);
        return sb.ToString();
    }

    /// <summary>
    /// Method Name :getDdlFacultyTabs3
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:นำข้อมูลคณะมาแสดงใน Tabs3 
    /// </summary>
    /// <param name="_StaffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string getDdlFacultyTabs3(string _StaffID)
    {

        string _checkStatus = "";
        string _StaffType = "", _FacultyCode = "", _FacultyCode1 = "";
        //ตรวจสอบสิทธ์เจ้าหน้าที่ ถ้าเป็น 1 ไม่มีสิทธ์เข้าใช้งานระบบนี้
        _checkStatus = checkUserPermision(_StaffID);
        // if (_checkStatus.IndexOf("#") != -1)
        // {
        string[] _array = _checkStatus.Split('#');
        if (_array.Length == 3)
        {
            _FacultyCode = _array[0];
            _StaffType = _array[1];
            _FacultyCode1 = _array[2];
        }
        string _query = @"infinity..sp_expGetddlFaculty '" + _FacultyCode + "','" + _FacultyCode1 + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        System.Web.UI.HtmlControls.HtmlSelect ddlFaculty = new System.Web.UI.HtmlControls.HtmlSelect();
        ddlFaculty.Attributes["id"] = "ddlFaculty";
        ddlFaculty.Attributes["onchange"] = "_showTabs3.getHtmlDdlProgram1()";
        int _row = _ds.Tables[0].Rows.Count;
        string _facCode, _facTName;

        if (_row != 0)
        {
            ddlFaculty.Items.Add(new ListItem("--กรุณาเลือกคณะ--", "0"));
            for (int i = 0; i < _row; i++)
            {
                _facCode = _ds.Tables[0].Rows[i]["FacultyCode"].ToString();
                _facTName = _ds.Tables[0].Rows[i]["FactTName"].ToString();

                ddlFaculty.Items.Add(new ListItem(_facCode + " - " + _facTName, _facCode));
            }
        }
        else
        {
            ddlFaculty.Items.Add(new ListItem("--ไม่พบข้อมูลคณะ--", "0"));
        }

        _ds.Dispose();
        _adp.Dispose();


        //  }
        // else
        //{
        //ddlFaculty.Items.Add(new ListItem("--ไม่พบข้อมูลคณะ--", "1"));
        // }
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter stWriter = new System.IO.StringWriter(sb);
        System.Web.UI.HtmlTextWriter htmlWriter = new System.Web.UI.HtmlTextWriter(stWriter);
        ddlFaculty.RenderControl(htmlWriter);
        return sb.ToString();
    }
    /****************************************************function operator********************************/
    /// <summary>
    /// Method Name :checkUserPermision
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:ตรวจสอบสิทธ์การเข้ามาอนุมัติใบคำร้องของเจ้าหน้าที่ 
    /// </summary>
    /// <param name="_StaffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string checkUserPermision(string _StaffID)
    {
        string _FacultyCode, _StaffType, _FacultyCode1;
        StringBuilder _xml = new StringBuilder();
        string _sql = @"infinity..sp_expGetListstaffPermision '" + _StaffID + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        if (_ds.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
            {
                _FacultyCode = _ds.Tables[0].Rows[0]["FacultyCode"].ToString();
                _FacultyCode1 = _ds.Tables[0].Rows[0]["FacultyCode"].ToString();
                _StaffType = _ds.Tables[0].Rows[0]["StaffType"].ToString();

                _xml.Append(_FacultyCode + "#" + _StaffType + "#" + _FacultyCode1);
            }
        }
        else
        {
            _xml.Append("คุณไม่มีสิทธิ์ในการเข้าใช้งานระบบนี้ กรุณาติดต่อกองบริหารการศึกษา 02-849-45733");
        }

        _ds.Dispose();
        _adp.Dispose();
        return _xml.ToString();
    }//End checkUserPermision

    /// <summary>
    /// Method Name :getNonApprReqFormList
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงรายการใบคำร้องของนักศึกษาที่เจ้าหน้าที่ยังไม่ดำเนินการอนุมัติ getNonApprReqFormList tab-1
    /// </summary>
    /// <param name="_StaffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string getNonApprReqFormList(string _StaffID)
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append("<br/><table id='tblStdReqFormList' border='1' cellpadding='0' cellspacing='0'>" +
                   "<tr style='height:30px;'><th colspan='10' class='ui-state-hover'>รายการใบคำร้องของนักศึกษาที่อยู่ระหว่างรอการอนุมัติ</th></tr>" +
                   "<tr>" +
            //"<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ลำดับ</th>" +
                   "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสนักศึกษา</th>" +
                   "<th class='ui-widget-header' height='30' width='150' align='center' style='font-family:Tahoma;font-size:12px;'>ชื่อ - สกุล</th>" +
                   "<th class='ui-widget-header' height='30' width='70' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสใบคำร้อง</th>" +
                   "<th class='ui-widget-header' height='30' width='300' align='center' style='font-family:Tahoma;font-size:12px;'>ประเภทใบคำร้อง</th>" +
                   "<th class='ui-widget-header' height='30' width='150' align='center' style='font-family:Tahoma;font-size:12px;'>เหตุผลที่ไม่อนุมัติใบคำร้อง</th>" +
                   "<th class='ui-widget-header' height='30' width='65' align='center' style='font-family:Tahoma;font-size:12px;'>เปิด<b>ใบคำร้อง</th>" +
            //"<th class='ui-widget-header' height='30' width='65' align='center' style='font-family:Tahoma;font-size:12px;'>ยกเลิก<b>ใบคำร้อง</th>" +
                   "<th class='ui-widget-header' height='30' width='100' style='font-family:Tahoma;font-size:12px;'>ดำเนินการอนุมัติ</th>" +
                   "</tr>");

        string _checkStatus = "";
        string _StaffType = "", _FacultyCode = "", _FacultyCode1 = "";
        //ตรวจสอบสิทธ์เจ้าหน้าที่ ถ้าเป็น 1 ไม่มีสิทธ์เข้าใช้งานระบบนี้
        _checkStatus = checkUserPermision(_StaffID);
        if (_checkStatus.IndexOf("#") != -1)
        {
            string[] _array = _checkStatus.Split('#');
            if (_array.Length == 3)
            {
                _FacultyCode = _array[0];
                _StaffType = _array[1];
                _FacultyCode1 = _array[2];
            }

            string _sql = @"SELECT F.StudentID
                                ,S.fullNameTh As Name
                                ,LEFT(S.ProgramCode,2) As FacultyCode 
                                ,F.Quarter
                                ,F.ReqFormNo
                                ,F.ReqFormType
                                ,F.Remark
                                ,T.Description
                            FROM infinity..RequestForm F 
                            LEFT JOIN infinity..ReqFormType T on F.ReqFormType=T.ReqFormType
                            LEFT JOIN infinity..vw_refStdStudent S on F.StudentID = S.studentCode
                            WHERE F.ReqFormStatus='0' and s.stsGroup = '00' ";
            if (_StaffType == "StaffEducation")
            {
                _sql += "and F.FacApprove = '0' and (F.EduApprove is null or F.EduApprove = '1')";
            }
            if (_StaffType == "StaffFaculty")
            {
                _sql += "and LEFT(S.ProgramCode,2) in( '" + _FacultyCode + "','" + _FacultyCode1 + "') and (F.FacApprove is null or F.FacApprove = '1')";
            }
            _sql += " Order By F.Quarter DESC";
            SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
            DataSet _ds = new DataSet();
            _adp.Fill(_ds);
            string _studentID, _Name, _quarter, _reqFormNo, _reqFormType, _remark, _cancelStatus = "";
            if (_ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
                {
                    _studentID = _ds.Tables[0].Rows[i]["StudentID"].ToString();
                    _Name = _ds.Tables[0].Rows[i]["Name"].ToString();
                    _quarter = _ds.Tables[0].Rows[i]["Quarter"].ToString();
                    _reqFormNo = _ds.Tables[0].Rows[i]["ReqFormNo"].ToString();
                    _reqFormType = _ds.Tables[0].Rows[i]["Description"].ToString();
                    _remark = _ds.Tables[0].Rows[i]["Remark"].ToString();

                    _cancelStatus = "<span title='ยกเลิกใบคำร้อง' style='cursor:pointer' class='ui-icon ui-icon-trash' onclick='_show.cancelStudentReqform(" + _studentID + "," + _quarter + "," + _reqFormNo + ");'></span>";

                    _xml.Append("<tr>" +
                        //"</td><td height='30' width='50' align='center' class='ui-widget-content'>" + (i + 1) + "</td>" +
                        "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _studentID + "</td>" +
                        "<td height='30' width='150' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>&nbsp;" + _Name + "</td>" +
                        "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _reqFormNo + "</td>" +
                        "<td height='30' width='300' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>&nbsp;" + _reqFormType + "</td>" + //_getData +
                        "<td height='30' width='150' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;color:Red;'>" + _remark + "</td>" +
                        "<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><span title='เปิดเอกสารใบคำร้อง' style='cursor:pointer'  class='ui-icon ui-icon-document' onclick='showStudentReqform(" + _studentID + "," + _quarter + "," + _reqFormNo + ");'></span> </td>" +
                        //"<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _cancelStatus + "</td>" +
                        "<td height='30' width='100' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%' ><tr><td width='100%' align='center'><table><tr><td width='30' class='ui-widget-content' style='cursor:pointer;' onclick='_show.displayDialogApprReqForm(" + _studentID + "," + _quarter + "," + _reqFormNo + ")'><span  height='30' title='ดำเนินการอนุมัติใบคำร้อง'><img alt='' src='../images/icon/document-valid-icon.png' width='20'/></span></td></tr></table></td>" +
                        "</tr></table></td>" +
                        "</tr>");
                }
            }
            else
            {
                if (_StaffType == "StaffEducation")
                {
                    _xml.Append("<tr>" +
                                "<td height='30' align='center' colspan='10' class='ui-state-hover' style='font-family:Tahoma;font-size:12px;color:Red'>ไม่พบข้อมูลใบคำร้องที่อยู่ระหว่างรอการอนุมัติ จากเจ้าหน้าที่กองบริหารการศึกษา</td>" +//อาจเนื่องมาจากเจ้าหน้าที่คณะยังไม่อนุมัติ
                            "</tr>");
                }
                else
                {

                    _xml.Append("<tr>" +
                "<td height='30' align='center' colspan='10' class='ui-state-hover' style='font-family:Tahoma;font-size:12px;color:Red'>ไม่พบข้อมูลใบคำร้องที่อยู่ระหว่างรอการอนุมัติ จากเจ้าหน้าที่คณะ</td>" +
            "</tr>");

                }
            }
            _ds.Dispose();
            _adp.Dispose();
        }
        else
        {
            _xml.Append("<tr>" +
                    "<td height='30' align='center' colspan='10' class='ui-state-hover' style='font-family:Tahoma;font-size:14px;color:red;'>" + _checkStatus + "</td>" +
                "</tr>");
        }
        _xml.Append("</table>");
        _xml.Append("<br><br>");
        return _xml.ToString();
    }//End getNonApprReqFormList

    /// <summary>
    /// Method Name :getHtmlDdlProgram
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:นำข้อมูลหลักสูตรมาแสดงใน ddl
    /// </summary>
    /// <param name="_facCode">รหัสคณะ</param>
    /// <returns></returns>
    public static string getHtmlDdlProgram(string _facCode)
    {
        StringBuilder _xml = new StringBuilder();
        _xml.Append("<select id='ddlProgram' name='ddlProgram' runat='server' style='width:300px'>");
        string _query = "Select * From infinity..vwCProgram where FacultyCode='" + _facCode + "' and Dlevel='B'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        int _row = _ds.Tables[0].Rows.Count;
        string ProgramCode, MajorCode, GroupNum, ProgTname;
        if (_facCode == "0")
        {
            _xml.Append("<option value='0'>--กรุณาเลือกหลักสูตร--</option>");
        }
        else if (_row != 0)
        {
            _xml.Append("<option value='0'>--กรุณาเลือกหลักสูตร--</option>");
            for (int i = 0; i < _row; i++)
            {
                ProgramCode = _ds.Tables[0].Rows[i]["ProgramCode"].ToString();
                MajorCode = _ds.Tables[0].Rows[i]["MajorCode"].ToString();
                GroupNum = _ds.Tables[0].Rows[i]["GroupNum"].ToString();
                ProgTname = _ds.Tables[0].Rows[i]["ProgTname"].ToString();

                _xml.Append("<option value='" + ProgramCode + "#" + MajorCode + "#" + GroupNum + "'>" + ProgramCode + "  " + ProgTname + "</option>");
            }
        }
        else
        {
            _xml.Append("<option value='1'>--ไม่พบหลักสูตร--</option>");
        }

        _xml.Append("</select>");
        _ds.Dispose();
        _adp.Dispose();
        return _xml.ToString();
    }//End getHtmlDdlProgram

    /// <summary>
    /// Method Name :searchByStdInfor
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:ใช้แสดงข้อมูลใบคำร้องจากข้อมูลของนักศึกษา searchByStdInfor tab-2
    /// </summary>
    /// <param name="_quarter">ภาคการศึกษา</param>
    /// <param name="_stdInfor">ชื่อ-สกุล/รหัสนักศึกษา</param>
    /// <returns></returns>
    public static string searchByStdInfor(string _quarter, string _stdInfor)
    {
        string _searchQuarter = "";
        StringBuilder _xml = new StringBuilder();
        _xml.Append("<br/><table id='tblStdReqFormByInfor' border='1' cellpadding='0' cellspacing='0' style='align:center;' >" +
           "<tr style='height:30px;'><th colspan='9' class='ui-state-hover'>รายการใบคำร้องของนักศึกษา</th></tr>" +
           "<tr>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ลำดับ</th>" +
            "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>ภาคการศึกษา</th>" +
            "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสนักศึกษา</th>" +
           "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='250' align='center' style='font-family:Tahoma;font-size:12px;'>ประเภทใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>เหตุผลที่ไม่อนุมัติใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>เปิด</th>" +
            //"<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ยกเลิก</th>" +
           "<th class='ui-widget-header' width='200' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%'border='1' cellpadding='0' cellspacing='0'><tr><td colspan='2'  class='ui-widget-header'>สถานะการอนุมัติ</td></tr><tr><td  class='ui-widget-header' width='50%'>เจ้าหน้าที่คณะ</td><td  class='ui-widget-header' width='50%'>กบศ.</td></tr></table></th>" +
           "</tr>");
        if (_quarter != "0")
        {
            _searchQuarter = " and F.Quarter='" + _quarter + "'";
        }

        string _query = "select *" +
                        " from infinity..RequestForm F" +
                        " left join infinity..vw_refstdStudent S" +
                        " on F.StudentID = S.studentCode" +
                        " left join infinity..ReqFormType T" +
                        " on F.ReqFormType = T.ReqFormType" +
                        " where S.studentCode + S.firstName + S.lastName like '%" + _stdInfor + "%'" + _searchQuarter +
                        " and F.ReqFormStatus = '0' "+
                        " order by F.ReqFormNo";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _queryQuarter, _studentID, _reqFormNo, _reqFormType, _remark, _facApprove, _eduApprove, _facIcon = "", _eduIcon = "", _cancelStatus = "";

        if (_row != 0)
        {
            for (int i = 0; i < _row; i++)
            {
                _facIcon = "";
                _eduIcon = "";
                _cancelStatus = "<span style='cursor:pointer' class='ui-icon ui-icon-alert' ></span>";

                if (_quarter == "0")
                {
                    _queryQuarter = _ds.Tables[0].Rows[i]["Quarter"].ToString();
                }
                else
                {
                    _queryQuarter = _quarter;
                }
                _studentID = _ds.Tables[0].Rows[i]["StudentID"].ToString();
                _reqFormNo = _ds.Tables[0].Rows[i]["ReqFormNo"].ToString();
                _reqFormType = _ds.Tables[0].Rows[i]["Description"].ToString();
                _remark = _ds.Tables[0].Rows[i]["Remark"].ToString();
                _facApprove = _ds.Tables[0].Rows[i]["FacApprove"].ToString();
                _eduApprove = _ds.Tables[0].Rows[i]["EduApprove"].ToString();

                if (_facApprove == null || _facApprove == "")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/clock-select-remain-icon.png' width='20'/></span>";
                    _cancelStatus = "<span id='spCancel' title='ยกเลิก' style='cursor:pointer' class='ui-icon ui-icon-trash'></span>";//_show.cancelStudentReqform(" + _studentID + "," + _quarter + "," + _reqFormNo + ");
                }
                else if (_facApprove == "0")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_facApprove == "1")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }
                else
                {

                }

                if (_eduApprove == null || _eduApprove == "")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/clock-select-remain-icon.png' width='20'/></span>";
                }
                else if (_eduApprove == "0")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_eduApprove == "1")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }

                _xml.Append("<tr>" +
                    "</td><td height='30' width='50' align='center' class='ui-widget-content'>" + (i + 1) + "</td>" +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _queryQuarter + "</td>" +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _studentID + "</td>" +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _reqFormNo + "</td>" +
                    "<td height='30' width='250' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>&nbsp;" + _reqFormType + "</td>" + //_getData +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;color:Red;'>&nbsp;" + _remark + "</td>" +
                    "<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><span title='เปิด' style='cursor:pointer'  class='ui-icon ui-icon-document' onclick='showStudentReqform(" + _studentID + "," + _queryQuarter + "," + _reqFormNo + ");'></span> </td>" +
                    //"<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _cancelStatus + "</td>" +
                    "<td height='30' width='200' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%' ><tr><td  class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' " + _facIcon + "</td></tr></table></td>" +
                    "<td class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' align='center' " + _eduIcon + "</td></tr></table></td></tr></table></td>" +
                    "</tr>");
            }
        }
        else
        {
            _xml.Append("<tr bgColor='#F5FAFE' style='font-family:Tahoma;font-size:16px;'>" +
                        "<td height='30' align='center' colspan='9' class='ui-widget-content' style='color:Red'>ไม่พบข้อมูลใบคำร้องของนักศึกษา</td>" +
                    "</tr>");
        }
        _xml.Append("</table>");
        _xml.Append("<br><br>");

        _ds.Dispose();
        _adp.Dispose();

        return _xml.ToString();
    }//End searchByStdInfor

    /// <summary>
    /// Method Name :SearchMultiStdInfor
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:ค้นหาข้อมูลนักศึกษาตามรายชื่อ หรือ รหัส
    /// </summary>
    /// <param name="_quarter">ภาคการศึกษา</param>
    /// <param name="_reqStatus">สถานะใบคำร้อง</param>
    /// <param name="_facCode">รหัสคณะ</param>
    /// <param name="_prog">รหัสหลักสูตร</param>
    /// <param name="_major">รหัสสาขา</param>
    /// <param name="_groupNum">กลุ่ม</param>
    /// <returns></returns>
    public static string SearchMultiStdInfor(string _quarter, string _reqStatus, string _facCode, string _prog, string _major, string _groupNum)
    {
        StringBuilder _xml = new StringBuilder();
        string _displayStatus = "";

        //if (_facCode != "" && _facCode != "0")
        //{
        //    _displayStatus = " and S.ProgramCode like '" + _facCode + "%'";
        //}


        //if (_prog != "0" && _major != "" && _groupNum != "")
        //{
        //    _displayStatus = " and S.ProgramCode='" + _prog + "' and S.MajorCode='" + _major + "' and S.GroupNum='" + _groupNum + "'";
        //}



        //if (_reqStatus == "1")
        //{
        //    _displayStatus += "and ReqFormStatus <> '0'";
        //}
        //else if (_reqStatus == "2")
        //{
        //    _displayStatus += "and ((F.FacApprove is null) or (F.EduApprove is null)) and F.ReqFormStatus='0'";
        //}
        //else if (_reqStatus == "3")
        //{
        //    _displayStatus += "and ((F.FacApprove = '0') or (F.EduApprove = '0')) and F.ReqFormStatus='0'";
        //}
        //else if (_reqStatus == "4")
        //{
        //    _displayStatus += "and ((F.FacApprove = '1') or (F.EduApprove = '1')) and F.ReqFormStatus='0'";
        //}

        _xml.Append("<br/><table id='tblStdReqFormList' border='1' cellpadding='0' cellspacing='0' >" +
           "<tr style='height:30px;'><th colspan='9' class='ui-state-hover'>รายการใบคำร้องของนักศึกษา</th></tr>" +
           "<tr>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ลำดับ</th>" +
            "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสนักศึกษา</th>" +
           "<th class='ui-widget-header' height='30' width='100' align='center' style='font-family:Tahoma;font-size:12px;'>รหัสใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='300' align='center' style='font-family:Tahoma;font-size:12px;'>ประเภทใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='200' align='center' style='font-family:Tahoma;font-size:12px;'>เหตุผลที่ไม่อนุมัติใบคำร้อง</th>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>เปิด</th>" +
            //"<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ยกเลิก</th>" +
           "<th class='ui-widget-header' width='200' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%'border='1' cellpadding='0' cellspacing='0'><tr><td colspan='2'  class='ui-widget-header'>สถานะการอนุมัติ</td></tr><tr><td  class='ui-widget-header' width='50%'>เจ้าหน้าที่คณะ</td><td  class='ui-widget-header' width='50%'>กบศ.</td></tr></table></th>" +
           "</tr>");
        //string _sql = "select *" +
        //                " from MUEIS..RequestForm F" +
        //                " left join MUEIS..ReqFormType T" +
        //                " on F.ReqFormType=T.ReqFormType" +
        //                " left join MUStudent..Student S" +
        //                " on F.StudentID = S.StudentID" +
        //                " where F.Quarter='" + _quarter + "'" + _displayStatus +
        //                " order by F.StudentID";
        string _sql = "infinity..sp_expGetListMultiSearchReq '" + _quarter + "','" + _reqStatus + "','" + _facCode + "','" + _prog + "','" + _major + "','" + _groupNum + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _studentID, _reqFormNo, _reqFormType, _remark, _facApprove, _eduApprove, _facIcon = "", _eduIcon = "", _cancelStatus = "";

        if (_row != 0)
        {
            for (int i = 0; i < _row; i++)
            {
                _facIcon = "";
                _eduIcon = "";
                _cancelStatus = "<span style='cursor:pointer' class='ui-icon ui-icon-alert' ></span>";

                _studentID = _ds.Tables[0].Rows[i]["StudentID"].ToString();
                _reqFormNo = _ds.Tables[0].Rows[i]["ReqFormNo"].ToString();
                _reqFormType = _ds.Tables[0].Rows[i]["Description"].ToString();
                _remark = _ds.Tables[0].Rows[i]["Remark"].ToString();
                _facApprove = _ds.Tables[0].Rows[i]["FacApprove"].ToString();
                _eduApprove = _ds.Tables[0].Rows[i]["EduApprove"].ToString();

                if (_facApprove == null || _facApprove == "")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/clock-select-remain-icon.png' width='20'/></span>";
                    _cancelStatus = "<span title='ยกเลิก' style='cursor:pointer' class='ui-icon ui-icon-trash' ></span>";//onclick='_show.cancelStudentReqform(" + _studentID + "," + _quarter + "," + _reqFormNo + ");'
                }
                else if (_facApprove == "0")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_facApprove == "1")
                {
                    _facIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }
                else
                {

                }

                if (_eduApprove == null || _eduApprove == "")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/clock-select-remain-icon.png' width='20'/></span>";
                }
                else if (_eduApprove == "0")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/pass.png' width='20'/></span>";
                }
                else if (_eduApprove == "1")
                {
                    _eduIcon = "class='ui-widget-content'><span  height='30' ><img alt='' src='../images/icon/exclamation-icon.png' width='20'/></span>";
                }

                _xml.Append("<tr>" +
                    "<td height='30' width='50' align='center' class='ui-widget-content'>" + (i + 1) + "</td>" +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _studentID + "</td>" +
                    "<td height='30' width='100' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _reqFormNo + "</td>" +
                    "<td height='30' width='300' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>&nbsp;" + _reqFormType + "</td>" +
                    "<td height='30' width='200' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;color:Red;'>" + _remark + "</td>" +
                    "<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><span title='เปิด' style='cursor:pointer'  class='ui-icon ui-icon-document' onclick='showStudentReqform(" + _studentID + "," + _quarter + "," + _reqFormNo + ");'></span> </td>" +
                    //"<td height='30' width='50' align='center' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _cancelStatus + "</td>" +
                    "<td height='30' width='200' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'><table height='30' width='100%' ><tr><td  class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' " + _facIcon + "</td></tr></table></td>" +
                    "<td class='ui-widget-content' width='50%' align='center'><table><tr><td width='30' align='center' " + _eduIcon + "</td></tr></table></td></tr></table></td>" +
                    "</tr>");
            }
        }
        else
        {
            _xml.Append("<tr bgColor='#F5FAFE' style='font-family:Tahoma;font-size:16px;'>" +
                        "<td height='30' align='center' colspan='9' class='ui-widget-content' style='color:Red'>ไม่พบข้อมูลใบคำร้องของนักศึกษา</td>" +
                    "</tr>");
        }
        _xml.Append("</table>");
        _xml.Append("<br><br>");

        _ds.Dispose();
        _adp.Dispose();

        return _xml.ToString();
    }//End SearchMultiStdInfor

    /// <summary>
    /// Method Name :getDialogStudentReqFormDetail
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description:panel สำหรับอนุมัติใบคำร้องสำหรับเจ้าหน้าที่
    /// </summary>
    /// <param name="_studentID">รหัสนักศึกษา</param>
    /// <param name="_quarter">ภาคการศึกษา</param>
    /// <param name="_reqFormNo">รหัสใบคำร้อง</param>
    /// <returns></returns>
    public static string getDialogStudentReqFormDetail(string _studentID, string _quarter, string _reqFormNo)
    {
        //14 march 2013 thanett.kls create for handler get reqform information to show to admin
        StringBuilder _xml = new StringBuilder();
        _xml.Append("<br/><table id='tblStdReqFormDetail' border='1' cellpadding='0' cellspacing='0' width='750' >" +
           "<tr style='height:30px;'><th colspan='11' class='ui-state-hover'>รายละเอียดใบคำร้องของนักศึกษา</th></tr>" +
           "<tr>" +
           "<th class='ui-widget-header' height='30' width='50' align='center' style='font-family:Tahoma;font-size:12px;'>ลำดับ</th>" +
            "<th class='ui-widget-header' height='30' width='200' align='center' style='font-family:Tahoma;font-size:12px;'>ประเภท</th>" +
            "<th class='ui-widget-header' height='30' width='250' align='center' style='font-family:Tahoma;font-size:12px;'>ข้อมูลเดิม</th>" +
           "<th class='ui-widget-header' height='30' width='250' align='center' style='font-family:Tahoma;font-size:12px;'>ข้อมูลใหม่</th>" +
           "</tr>");
        string _query = "select *" +
                        " from infinity..ReqFormExpectGrad" +
                        " where Quarter='" + _quarter + "'" +
                        " and StudentID='" + _studentID + "'" +
                        " and ReqFormNo='" + _reqFormNo + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        int _row = _ds.Tables[0].Rows.Count;
        string _changeType;
        _changeType = _ds.Tables[0].Rows[0]["ChangeType"].ToString();

        string[] _arrChangeType = _changeType.Split('#');
        string _changeDesc = "", _oldData = "", _newData = "";

        if (_row != 0)
        {
            for (int i = 0; i < _arrChangeType.Length; i++)
            {
                _changeDesc = "";
                _oldData = "";
                _newData = "";
                if (_arrChangeType[i] == "1")
                {
                    _changeDesc = "เปลี่ยนชื่อ-สกุล";
                    _oldData = @"" + _ds.Tables[0].Rows[0]["OldTName"].ToString() + " - " + _ds.Tables[0].Rows[0]["OldTLastname"].ToString()
                                 + " , " + _ds.Tables[0].Rows[0]["OldEName"].ToString() + " - " + _ds.Tables[0].Rows[0]["OldELastname"].ToString();
                    _newData = @"" + _ds.Tables[0].Rows[0]["ChangeTName"].ToString() + " - " + _ds.Tables[0].Rows[0]["ChangeTLastname"].ToString()
                                   + " , " + _ds.Tables[0].Rows[0]["ChangeEName"].ToString() + " - " + _ds.Tables[0].Rows[0]["ChangeELastname"].ToString();
                }
                else if (_arrChangeType[i] == "2")
                {
                    _changeDesc = "แก้ไขตัวสะกดชื่อ-สกุล";
                    _oldData = @"" + _ds.Tables[0].Rows[0]["OldTName"].ToString() + " - " + _ds.Tables[0].Rows[0]["OldTLastname"].ToString()
                                + " , " + _ds.Tables[0].Rows[0]["OldEName"].ToString() + " - " + _ds.Tables[0].Rows[0]["OldELastname"].ToString();
                    _newData = @"" + _ds.Tables[0].Rows[0]["EditTName"].ToString() + " - " + _ds.Tables[0].Rows[0]["EditTLastname"].ToString()
                                + " , " + _ds.Tables[0].Rows[0]["EditEName"].ToString() + " - " + _ds.Tables[0].Rows[0]["EditELastame"].ToString();
                }
                else if (_arrChangeType[i] == "3")
                {
                    _changeDesc = "แก้ไขเลขประจำตัวประชาชน";
                    _oldData = _ds.Tables[0].Rows[0]["OldID"].ToString();
                    _newData = _ds.Tables[0].Rows[0]["NewID"].ToString();
                }
                else if (_arrChangeType[i] == "4")
                {
                    _changeDesc = "แก้ไขคำนำหน้าชื่อ";
                    _oldData = _ds.Tables[0].Rows[0]["OldTitle"].ToString();
                    _newData = _ds.Tables[0].Rows[0]["NewTitle"].ToString();
                }
                else if (_arrChangeType[i] == "5")
                {
                    _changeDesc = "แก้ไขวัน/เดือน/ปีเกิด";
                    _oldData = _ds.Tables[0].Rows[0]["OldBirthDate"].ToString();
                    _newData = _ds.Tables[0].Rows[0]["NewBirthDate"].ToString();
                }
                else if (_arrChangeType[i] == "6")
                {
                    _changeDesc = "แก้ไขสัญชาติ";
                    _oldData = _ds.Tables[0].Rows[0]["OldNationality"].ToString();
                    _newData = _ds.Tables[0].Rows[0]["NewNationality"].ToString();
                }
                else if (_arrChangeType[i] == "7")
                {
                    _changeDesc = "แก้ไขเพศ";
                    _oldData = _ds.Tables[0].Rows[0]["OldGender"].ToString();
                    _newData = _ds.Tables[0].Rows[0]["NewGender"].ToString();
                }
                else if (_arrChangeType[i] == "8")
                {
                    _changeDesc = "แก้ไขที่อยู่ตามทะเบียนบ้าน";
                    _oldData = "บ้านเลขที่ " + _ds.Tables[0].Rows[0]["OldHHomeNo"].ToString() + " หมู่ " + _ds.Tables[0].Rows[0]["OldHMoo"].ToString()
                        + " ชื่อหมู่บ้าน/อื่นๆ " + _ds.Tables[0].Rows[0]["OldHVillage"].ToString() + " ซอย " + _ds.Tables[0].Rows[0]["OldHSoi"].ToString() + " ถนน" + _ds.Tables[0].Rows[0]["OldHRoad"].ToString()
                        + " แขวง/ตำบล " + _ds.Tables[0].Rows[0]["OldHDistrict"].ToString() + " เขต/อำเภอ " + _ds.Tables[0].Rows[0]["OldHCanton"].ToString() + " จังหวัด " + _ds.Tables[0].Rows[0]["OldHProvinceID"].ToString()
                        + " รหัสไปรษณีย์ " + _ds.Tables[0].Rows[0]["OldHPostCode"].ToString() + " โทรศัพท์บ้าน/มือถือ " + _ds.Tables[0].Rows[0]["OldHPhone"].ToString();
                    _newData = "บ้านเลขที่ " + _ds.Tables[0].Rows[0]["NewHHomeNo"].ToString() + " หมู่ " + _ds.Tables[0].Rows[0]["NewHMoo"].ToString()
                        + " ชื่อหมู่บ้าน/อื่นๆ " + _ds.Tables[0].Rows[0]["NewHVillage"].ToString() + " ซอย " + _ds.Tables[0].Rows[0]["NewHSoi"].ToString() + " ถนน" + _ds.Tables[0].Rows[0]["NewHRoad"].ToString()
                        + " แขวง/ตำบล " + _ds.Tables[0].Rows[0]["NewHDistrict"].ToString() + " เขต/อำเภอ " + _ds.Tables[0].Rows[0]["NewHCanton"].ToString() + " จังหวัด " + _ds.Tables[0].Rows[0]["NewHProvinceID"].ToString()
                         + " รหัสไปรษณีย์ " + _ds.Tables[0].Rows[0]["NewHPostCode"].ToString() + " โทรศัพท์บ้าน/มือถือ " + _ds.Tables[0].Rows[0]["NewHPhone"].ToString();
                }
                else if (_arrChangeType[i] == "9")
                {
                    _changeDesc = "แก้ไขที่อยู่ปัจจุบัน";
                    _oldData = "บ้านเลขที่ " + _ds.Tables[0].Rows[0]["OldCHomeNo"].ToString() + " หมู่ " + _ds.Tables[0].Rows[0]["OldCMoo"].ToString()
                        + " ชื่อหมู่บ้าน/อื่นๆ " + _ds.Tables[0].Rows[0]["OldCVillage"].ToString() + " ซอย " + _ds.Tables[0].Rows[0]["OldCSoi"].ToString() + " ถนน" + _ds.Tables[0].Rows[0]["OldCRoad"].ToString()
                        + " แขวง/ตำบล " + _ds.Tables[0].Rows[0]["OldCDistrict"].ToString() + " เขต/อำเภอ " + _ds.Tables[0].Rows[0]["OldCCanton"].ToString() + " จังหวัด " + _ds.Tables[0].Rows[0]["OldCProvinceID"].ToString()
                         + " รหัสไปรษณีย์ " + _ds.Tables[0].Rows[0]["OldCPostCode"].ToString() + " โทรศัพท์บ้าน/มือถือ " + _ds.Tables[0].Rows[0]["OldCPhone"].ToString();
                    _newData = "บ้านเลขที่ " + _ds.Tables[0].Rows[0]["NewCHomeNo"].ToString() + " หมู่ " + _ds.Tables[0].Rows[0]["NewCMoo"].ToString()
                        + " ชื่อหมู่บ้าน/อื่นๆ " + _ds.Tables[0].Rows[0]["NewCVillage"].ToString() + " ซอย " + _ds.Tables[0].Rows[0]["NewCSoi"].ToString() + " ถนน" + _ds.Tables[0].Rows[0]["NewCRoad"].ToString()
                        + " แขวง/ตำบล " + _ds.Tables[0].Rows[0]["NewCDistrict"].ToString() + " เขต/อำเภอ " + _ds.Tables[0].Rows[0]["NewCCanton"].ToString() + " จังหวัด " + _ds.Tables[0].Rows[0]["NewCProvinceID"].ToString()
                        + " รหัสไปรษณีย์ " + _ds.Tables[0].Rows[0]["NewCPostCode"].ToString() + " โทรศัพท์บ้าน/มือถือ " + _ds.Tables[0].Rows[0]["NewCPhone"].ToString();
                }


                _changeType = _ds.Tables[0].Rows[0]["ChangeType"].ToString();

                _xml.Append("<tr></td><td height='30' width='50' align='center' class='ui-widget-content'>" + (i + 1) + "</td>" +
                    "<td height='30' width='200' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _changeDesc + "</td>" +
                    "<td height='30' width='250' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _oldData + "</td>" +
                    "<td height='30' width='250' align='left' class='ui-widget-content' style='font-family:Tahoma;font-size:12px;'>" + _newData + "</td>" +
                    "</tr>");
            }
        }
        else
        {
            _xml.Append("<tr>" +
                        "<td height='30' align='center' colspan='10' class='ui-state-hover' style='font-family:Tahoma;font-size:16px;'>ไม่พบข้อมูลใบคำร้องที่อยู่ระหว่างรอการอนุมัติ</td>" +
                    "</tr>");
        }
        _xml.Append("</table>");
        _xml.Append("<br><br>");

        _ds.Dispose();
        _adp.Dispose();

        return _xml.ToString();
    }//End getDialogStudentReqFormDetail

    /// <summary>
    /// Method Name :cancelStdReqForm
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description: ยกเลิกใบคำร้องสำหรับเจ้าหน้าที่
    /// </summary>
    /// <param name="_cancelStdID">รหัสนักศึกษา</param>
    /// <param name="_cancelQuarter">ภาคการศึกษา</param>
    /// <param name="_cancelReqFormNo">รหัสใบคำร้อง</param>
    /// <returns></returns>
    public static string cancelStdReqForm(string _cancelStdID, string _cancelQuarter, string _cancelReqFormNo)
    {
        //ยกเลิกใบคำร้องของนักศึกษาโดยเจ้าหน้าที่คณะ cancelStdReqForm
        string _xml;
        SqlConnection _Conn = MyConfig.GetConnect();
        _Conn.Open();
        string _sql = "update infinity..RequestForm" +
                        " set ReqFormStatus = '1'" +
                        " where Quarter = '" + _cancelQuarter + "' and StudentID = '" + _cancelStdID + "'" +
                        " and ReqFormNo = '" + _cancelReqFormNo + "'";
        SqlCommand _cmd = new SqlCommand(_sql, _Conn);
        _cmd.ExecuteNonQuery();

        _xml = "ยกเลิกใบคำร้องเรียบร้อยแล้ว";
        return _xml.ToString();
    }//End cancelStdReqForm

    /// <summary>
    /// Method Name :setActualReqForm
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description: สำหรับบันทึกการอนุมัติใบคำร้องของเจ้าหน้าที่
    /// </summary>
    /// <param name="_actualStdID">รหัสนักศึกษา</param>
    /// <param name="_actualQuarter">ภาคการศึกษา</param>
    /// <param name="_actualReqFormNo">รหัสใบคำร้อง</param>
    /// <param name="_actualStatus">สถานะ</param>
    /// <param name="_remark">เหตุผลที่ไม่อนุมัติ</param>
    /// <param name="_staffID">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string setActualReqForm(string _actualStdID, string _actualQuarter, string _actualReqFormNo, string _actualStatus, string _remark, string _staffID)
    {
        StringBuilder _xml = new StringBuilder();
        string _checkStatus = "";
        string _StaffType = "", _FacultyCode = "", _FacultyCode1 = "";
        //ตรวจสอบสิทธ์เจ้าหน้าที่ ถ้าเป็น 1 ไม่มีสิทธ์เข้าใช้งานระบบนี้
        _checkStatus = checkUserPermision(_staffID);
        //if (_checkStatus.IndexOf("#") != -1)
        //{
        string[] _array = _checkStatus.Split('#');
        if (_array.Length == 3)
        {
            _FacultyCode = _array[0];
            _StaffType = _array[1];
            _FacultyCode1 = _array[2];
        }
        string _query = "update infinity..RequestForm";

        if (_StaffType == "StaffFaculty")
        {
            _query += " set FacApprove = '" + _actualStatus + "',FacApproveBy = '" + _staffID + "',FacApproveDate =getdate()";
        }
        if (_StaffType == "StaffEducation")
        {
            _query += " set EduApprove = '" + _actualStatus + "',EduApproveBy = '" + _staffID + "',EduApproveDate =getdate()";
        }

        if (_actualStatus != "0")
        {
            _query += ", Remark = '" + _remark + "'";
        }
        else
        {
            _query += ", Remark = '-'";
        }

        _query += " where StudentID = '" + _actualStdID + "' and Quarter = '" + _actualQuarter + "' and ReqFormNo = '" + _actualReqFormNo + "'";
        SqlConnection _Conn = MyConfig.GetConnect();

        _Conn.Open();

        SqlCommand _cmd = new SqlCommand(_query, _Conn);
        _cmd.ExecuteNonQuery();
        if (_actualStatus == "0")
        {
            _xml.Append("บันทึกข้อมูลการอนุมัติใบคำร้องเรียบร้อยแล้ว");
        }
        else
        {
            _xml.Append("ใบคำร้องนี้ยังไม่ถูกอนุมัติ บันทึกสถานะไม่อนุมัติ");
        }
        return _xml.ToString();
    }

    /// <summary>
    /// Method Name :SearchStdPreGraduateStatus
    /// Author: Anussara Wanwang
    /// Create date: 20-10-2013
    /// Description: ค้นหารายชื่อนักศึกษาเพื่อดูสถานะการดำเนินการ
    /// </summary>
    /// <param name="_search">สถานะการค้นหา</param>
    /// <param name="_program">หลักสูตร</param>
    /// <param name="_staffId">รหัสเจ้าหน้าที่</param>
    /// <returns></returns>
    public static string SearchStdPreGraduateStatus(string _search, string _program, string _staffId)
    {
        string _checkStatus = "";
        string _StaffType = "", _FacultyCode = "", _FacultyCode1 = "";
        //ตรวจสอบสิทธ์เจ้าหน้าที่ ถ้าเป็น 1 ไม่มีสิทธ์เข้าใช้งานระบบนี้
        _checkStatus = checkUserPermision(_staffId);
        // if (_checkStatus.IndexOf("#") != -1)
        // {
        string[] _array = _checkStatus.Split('#');
        if (_array.Length == 3)
        {
            _FacultyCode = _array[0];
            _StaffType = _array[1];
            _FacultyCode1 = _array[2];
        }
        StringBuilder _xml = new StringBuilder();
        string _sql;
        string _GetStudentId, _Name, _Class, _GetProgram, _preStatus, _preGraduateStatus;
        string _classStatus;
        _sql = @"infinity..sp_expGetListPreGraduateStatus '" + _search + "','" + _program + "','" + _FacultyCode + "'";
        SqlDataAdapter _adp = new SqlDataAdapter(_sql, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        if (_ds.Tables[0].Rows.Count != 0)
        {
            _xml.Append("<table width='98%' cellpadding='0' cellspacing='1' style='border: 1px solid #c5dbec;'>");
            _xml.Append("<tr class='ui-widget-header title4TD' align='center' style='border: 1px solid #c5dbec;'>");
            _xml.Append("<td class='title5TD' width='8%'>ลำดับ</td>");
            _xml.Append("<td class='title5TD' width='10%'>รหัสนักศึกษา</td>");
            _xml.Append("<td class='title5TD' width='25%'>ชื่อ - สกุล</td>");
            _xml.Append("<td class='title5TD' width='10%'>ชั้นปี</td>");
            _xml.Append("<td class='title5TD' width='10%'>หลักสูตร</td>");
            _xml.Append("<td class='title5TD' width='35%'>สถานะ</td>");
            _xml.Append("</tr>");
            for (int i = 0; i < _ds.Tables[0].Rows.Count; i++)
            {
                _GetStudentId = _ds.Tables[0].Rows[i]["StudentID"].ToString();
                _Name = _ds.Tables[0].Rows[i]["Name"].ToString();
                _Class = _ds.Tables[0].Rows[i]["CurrentYear"].ToString();
                _GetProgram = _ds.Tables[0].Rows[i]["program"].ToString();
                _preStatus = _ds.Tables[0].Rows[i]["pre_status"].ToString();
                _preGraduateStatus = _ds.Tables[0].Rows[i]["PreGraduateStatus"].ToString();
                if (_preGraduateStatus == "1")
                {
                    _classStatus = "ui-state-highlight-complete ui-corner-all";
                }
                else if (_preGraduateStatus == "2")
                {
                    _classStatus = "ui-state-highlight-wait ui-corner-all";
                }
                else if (_preGraduateStatus == "3")
                {
                    _classStatus = "ui-state-highlight-waitComplete ui-corner-all";
                }
                else
                {
                    _classStatus = "ui-state-highlight-error ui-corner-all";
                }
                _xml.Append("<tr>");
                _xml.Append("<td class='ui-StdST47-detail' width='8%'>" + (i + 1) + "</td>");
                _xml.Append("<td class='ui-StdST47-detail' width='10%'>" + _GetStudentId + "</td>");
                _xml.Append("<td class='ui-StdST47-detail' width='25%' style='text-align:left'>&nbsp;" + _Name + "</td>");
                _xml.Append("<td class='ui-StdST47-detail' width='10%'>" + _Class + "</td>");
                _xml.Append("<td class='ui-StdST47-detail' width='10%'>" + _GetProgram + "</td>");
                _xml.Append("<td class='ui-StdST47-detail " + _classStatus + "' width='35%'>" + _preStatus + "</td>");
                _xml.Append("</tr>");
            }
            _xml.Append("</table>");

            _ds.Dispose();
            _adp.Dispose();
        }
        else
        {
            _xml.Append("<table width='100%' cellpadding='0' cellspacing='1' style='border: 1px solid #c5dbec;'>");
            _xml.Append("<tr>");
            _xml.Append("<td class='ui-StdST47-detail'>ไม่พบข้อมูลนักศึกษาที่ต้องการค้นหา</td>");
            _xml.Append("</tr>");
            _xml.Append("</table>");
        }
        return _xml.ToString();
    }

}//End clsRequestFormManageData