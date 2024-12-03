<%--Author : Anussara Wanwang 
    Create Date : 06/10/2013
    Description :สำหรับเจ้าหน้าที่คณะ/เจ้าหน้าที่กองบริหาร ใช้ดำเนินการอนุมัติ/ไม่อนุมัติใบคำร้องของนักศึกษา
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestFormAdminWebform.aspx.cs" Inherits="RequestFormSystem_EditRequestFormWebform" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title></title>
    <link href="../css/MyStyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/web.css" rel="stylesheet" type="text/css" />
    <script src="../js/web.js" type="text/javascript"></script>
    <link rel="icon" href="../images/logo1.png" sizes="32x32" />
</head>

<body>
 <form id="editReqForm" runat="server" target='ifmDoc' enctype="multipart/form-data">
    <table id="tbHome" style='border: 1px solid steelBlue;' cellpadding='1' cellspacing='0' width="1024px">
        <tr>
            <td>
                 <table style="background-color:#10069f" width="1024" height="120">
                    <tbody>
                        <tr>
                            <td>
                                <img src="../images/logo.png" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td class='ui-widget-header' height='18px'>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="6%" align="right">
                            <span class="ui-icon ui-icon-person" />
                        </td>
                        <td width="6%" class="ui-priority-primary" style='color:White;font-size: 11px;'>
                            ผู้เข้าใช้ :
                        </td>
                        <td width="44%" class="ui-priority-primary">
                            <div id='divUserStaff' runat='server' style='color:White;font-size: 11px;' />
                        </td>
                        <td width="34%" align="right">
                            <span class="ui-icon ui-icon-locked" />
                        </td>
                        <td width="10%" align="left">
                            <a href="https://smartedu.mahidol.ac.th/Authen/stafflogin.aspx"
                                target="_self" style='color:White;font-size: 11px;' />Log out
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class='ui-state-default' align='right'>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class='ui-icon ui-icon-note' width='50'>
                        </td>
                        <td width='*' align="center">
                            <div id='divhelp' />
                            <a href="UserManualExpectRequestFormAdminSystem.pdf" target='help' style='color: red;'>Help</a>
                        </td>
                        <td width='10px'>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><%--Start From Body--%>
                    <div class="EditRequestFormMenu" style="font-family: Tahoma; font-size: 13px;">
                        <div id="tabs">
                            <ul>
                                <li><a href="#tabs-1">อนุมัติใบคำร้อง</a></li>
                                <li><a href="#tabs-2">ค้นหาใบคำร้อง</a></li>
                                <li><a href="#tabs-3">ข้อมูลนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</a></li>
                            </ul>
                            <div id="tabs-1">                                                               
                            </div><%--End div tabs1--%>
                            <div id="tabs-2">
                            </div><%--End div tabs2--%>
                            <div id="tabs-3">
                            </div><%--End div tabs3--%>
                        </div><%--End div tabs--%>
                    </div><%--End div EditRequestFormMenu--%>
            </td>
        </tr>
        <%--End tr body--%>
        <tr>
            <td>
 <table bgcolor="#10069f" width="100%">
                    <tr>
                        <td height='100px' align='center' style='font-family:Verdana, Arial, Helvetica, sans-serif;font-size: 11px;color:white'>
                Copyright © 2013 Mahidol University. All rights reserved. Developed By: Division
                of Information Technology
                            </td>
                        </tr>
                </table>
            </td>
        </tr>
    </table>
     </form> 
</body>
</html>

<script type="text/javascript">
    //onload
    $("#tabs").tabs();
    loadFromApprovReqAdmin();
    loadFromSearchReqAdmin();

    //Author: Anussara Wanwang
    //Method Name:loadFromApprovReqAdmin 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    function loadFromApprovReqAdmin() {
        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "loadFromApprovReqAdmin"
        }
        var _success = function (data) {
            $("#tabs-1").html(data);
            onloadFromApprovReqAdmin();
            _show.getNonApprReqFormList();
        }
        webAjax(_url, _data, _success);
    } //End loadFromApprovReqAdmin

    //Author: Anussara Wanwang
    //Method Name:loadFromSearchReqAdmin 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    function loadFromSearchReqAdmin() {
        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "loadFromSearchReqAdmin"
        }
        var _success = function (data) {
            $("#tabs-2").html(data);
            _show.getHtmlDdlProgram();
            $('#tabs-2 input').keypress(function (e) {
                code = e.keyCode ? e.keyCode : e.which;
                if (code.toString() == 13) {
                    if ($('#txtSearchStudent').val() != '') {
                        _show.searchByStdInfor();
                    }
                }
            });
        }
        webAjax(_url, _data, _success);
    } //End loadFromSearchReqAdmin

    //Author: Anussara Wanwang
    //Method Name:onloadFromApprovReqAdmin 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    function onloadFromApprovReqAdmin() {
        $(function () {
            $("#divApprReqForm").dialog({
                autoOpen: false,
                width: 800,
                height: 800,
                modal: false,
                title: "อนุมัติใบคำร้อง",
                show: "drop", 
                hide: "slide",     
                buttons: {
                    "ไม่บันทึก": function () {
                        $("#rdApprove").removeAttr("checked", "checked");
                        $("#rdDisApprove").removeAttr("checked", "checked");
                        $("#fsDisApprReason").hide();
                        $(this).dialog("close");
                    },
                    "บันทึก": function () {
                        var _actualReqStatus = "1";
                        if ($("#rdApprove").prop("checked")) {
                            _actualReqStatus = "0"; 
                        }
                        else if ($("#rdDisApprove").prop("checked")) {
                            if ($("#txtDisApprReason").val() == "") {
                                alert("กรุณาระบุเหตุผลที่ใบคำร้องไม่ผ่านการอนุมัติ");
                                return;
                            }
                            else {
                                _actualReqStatus = "1"; //ส่งตัวแปรไปบันทึกว่าไม่อนุมัติ 
                            }
                        }
                        else {
                            alert("โปรดเลือกประเภทของการดำเนินการ");
                            return;
                        }

                        if (window.confirm("คุณต้องการบันทึกการดำเนินการใช่หรือไม่?")) {
                            actualReqForm(_actualReqStatus);
                        }
                    }
                }
            });
            $("#divApprReqForm").parent().appendTo($("#editReqForm"));
            $("#fsDisApprReason").hide();
            $("#divMeaningOfIcon").hide();
            setButton();
        });
    } //End onloadFromApprovReqAdmin

    var ShowClass = function () { }

    //Author: Anussara Wanwang
    //Method Name:getHtmlDdlProgram 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    ShowClass.prototype.getHtmlDdlProgram = function () {
        var _facCode = $("#tabs-2 #ddlFaculty").val();
        //alert("tabs2" + _facCode);
        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "getHtmlDdlProgram",
            facCode: _facCode
        }
        var _success = function (data) {
            $("#tabs-2 #spProgram").html(data);

        }
        webAjax(_url, _data, _success);
    }  //End getHtmlDdlProgram

    //Author: Anussara Wanwang
    //Method Name:searchByStdInfor 
    //Create Date :10/10/2013
    //Description :ใช้ค้นหาข้อมูลใบคำร้องจากข้อมูลของนักศึกษา
    //Parameter : n/a
    ShowClass.prototype.searchByStdInfor = function () {
        var _stdInfor = $("#txtSearchStudent").val();
        var _quarter = $("#ddlQuarter").val();
        if (_stdInfor == "") {
            alert("กรุณาระบุข้อมูลนักศึกษาที่ต้องการค้นหา");
            return;
        }

        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "searchByStdInfor",
            quarter: _quarter,
            stdInfor: _stdInfor
        }
        var _success = function (data) {
            $("#divDisplayReqFormByFilter").html(data);
            $("#divDisplayReqFormByFilter").show("slide");
            $("#spCancel").click(function () {
                _show.cancelStudentReqform();
            });
        }
        webAjax(_url, _data, _success);
    }    //End searchByStdInfor 

    //Author: Anussara Wanwang
    //Method Name:SearchMultiStdInfor 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    ShowClass.prototype.SearchMultiStdInfor = function () {
        var _facCode = $("#tabs-2 #ddlFaculty").val();
        var _quarter = $("#ddlQuarter").val();
        var _reqStatus = $("#ddlReqStatus").val();
        var _progDetail = $("#ddlProgram").val();
        var _arrProg = _progDetail.split("#");
        var _prog = "";
        var _major = "";
        var _groupNum = "";
        if (_arrProg.length == 3) {
            _prog = _arrProg[0];
            _major = _arrProg[1];
            _groupNum = _arrProg[2];
        }
        $.ajax({
            url: "RequestFormHandler.ashx?action=SearchMultiStdInfor&quarter=" + _quarter + "&reqStatus=" + _reqStatus
                    + "&facCode=" + _facCode + "&prog=" + _prog + "&major=" + _major + "&groupNum=" + _groupNum,
            type: "Post",
            charset: "Tis-620",
            success: function (data) {
                $("#divDisplayReqFormByFilter").html(data);
            }
        });
    }  //End SearchMultiStdInfor

    //Author: Anussara Wanwang
    //Method Name:getNonApprReqFormList 
    //Create Date :10/10/2013
    //Description :ใช้แสดงข้อมูลใบคำร้องที่ยังไม่ถูกดำเนินการ (tab-1)
    //Parameter : n/a
    ShowClass.prototype.getNonApprReqFormList = function () {
        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "getNonApprReqFormList"
        }
        var _success = function (data) {
            $("#tabs-1 #divNonApprReqFormList").html(data);
            $("#tabs-1 #divNonApprReqFormList").show("slide");
            setButton();
            $("#divMeaningOfIcon").show();
            $("#ifmDoc").hide();
        }
        webAjax(_url, _data, _success);
    }//End getNonApprReqFormList

    //Author: Anussara Wanwang
    //Method Name:displayDialogApprReqForm 
    //Create Date :10/10/2013
    //Description :displayDialogApprReqForm
    //Parameter : _studentID=รหัสนักศึกษา, _quarter=ภาคการศึกษา, _reqFormNo=รหัสใบคำร้อง
    ShowClass.prototype.displayDialogApprReqForm = function (_studentID, _quarter, _reqFormNo) {
        $("#hddStudentID").val(_studentID);
        $("#hddQuarter").val(_quarter);
        $("#hddReqFormNo").val(_reqFormNo);
        _show.showDocumentList(_reqFormNo);
        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "getDialogStudentReqFormDetail",
            studentId: _studentID,
            quarter: _quarter,
            reqFormNo: _reqFormNo
        }
        var _success = function (data) {
            $("#divReqFormDetail").html(data);
            $("#fsDisApprReason").hide();
            $("#divApprReqForm").dialog("open");
        }
        webAjax(_url, _data, _success);
    }//End displayDialogApprReqForm

    //Author: Anussara Wanwang
    //Method Name:cancelStudentReqform 
    //Create Date :10/10/2013
    //Description :ใช้ยกเลิกใบคำร้องของนักศึกษา
    //Parameter : _studentID=รหัสนักศึกษา, _quarter=ภาคการศึกษา, _reqFormNo=รหัสใบคำร้อง
    ShowClass.prototype.cancelStudentReqform = function (_studentID, _quarter, _reqFormNo) {
        if (confirm("ต้องการยกเลิกการยื่นใบคำร้องนี้ใช่หรือไม่")) {
            var _url = "RequestFormHandler.ashx";
            var _data = {
                action: "cancelStdReqForm",
                studentID: _studentID,
                quarter: _quarter,
                reqFormNo: _reqFormNo
            }
            var _success = function (data) {
                alert(data);
                _show.getNonApprReqFormList();
            }
            webAjax(_url, _data, _success);
        }
    } //End cancelStudentReqform

    //Author: Anussara Wanwang
    //Method Name:showDocumentList 
    //Create Date :10/10/2013
    //Description :ใช้แสดงรายการเอกสารแนบประกอบใบคำร้องทั้งหมด
    //Parameter : _reqFormNo=รหัสใบคำร้อง
    ShowClass.prototype.showDocumentList = function (_reqFormNo) { 
         var _quarter = $("#hddQuarter").val();
         var _StudentID = $("#hddStudentID").val();
         var _url = "RequestFormHandler.ashx";
         var _data = {
            action: "listReqFormDocument",
            quarter: _quarter,
            student: _StudentID,
            reqFormNo: _reqFormNo
        }
        var _success = function (data) {
            $("#divDocumentList").html(data);
        }
        webAjax(_url, _data, _success);
    } //End showDocumentList

    //Author: Anussara Wanwang
    //Method Name:SaveNewDoc 
    //Create Date :10/10/2013
    //Description :ใช้บันทึกเอกสารแนบประกอบใบคำร้องไปยัง server
    //Parameter : n/a
     ShowClass.prototype.SaveNewDoc=function() {
        var _docName = $("#txtDocName").val();
        var _quarter = $("#hddQuarter").val();
        var _reqFormNo = $("#hddReqFormNo").val();
        var _studentID = $("#hddStudentID").val();
        if (_docName == "") {
            alert("กรุณาระบุชื่อเอกสาร");
            $("#txtDocName").focus();
            return;
        }
        else {
            if (confirm("ต้องการบันทึกข้อมูลหรือไม่?")) {
                $("#editReqForm").prop("action", "RequestFormHandler.ashx?action=SaveProjectDocument&docName=" + _docName + "&quarter=" + _quarter + "&student=" + _studentID + "&reqFormNo=" + _reqFormNo);
                $("#editReqForm").submit();
                $("#txtDocName").val("");
                document.getElementById('divUploadFile').innerHTML = document.getElementById('divUploadFile').innerHTML;
            }
        }
    } //End SaveNewDoc

    //Author: Anussara Wanwang
    //Method Name:OpenFile 
    //Create Date :10/10/2013
    //Description : ใช้เปิดเอกสารแนบประกอบใบคำร้องเพื่อทำการตรวจสอบ
    //Parameter : _documentLink =path สำหรับเข้าภึง File
    function OpenFile(_documentLink) {
        window.open(_documentLink);
    } //End OpenFile

    //Author: Anussara Wanwang
    //Method Name:OpenFile 
    //Create Date :10/10/2013
    //Description : เปิด file ใบคำร้อง
    //Parameter : _documentLink =path สำหรับเข้าภึง File
    function delDocument(_delReqFormNo, _delDocID,_StudentID,_Quarter) {
        if (confirm("ต้องการลบเอกสารนี้หรือไม่")) {

            var _url = "RequestFormHandler.ashx";
            var _data = {
                action: "deleteDocument",
                reqFormNo: _delReqFormNo,
                docID: _delDocID,
                studentID: _StudentID,
                quarter: _Quarter
            }
            var _success = function (data) {
                _show.showDocumentList(_delReqFormNo);
            }
            webAjax(_url, _data, _success);
        }
    } //End delDocument

    //Author: Anussara Wanwang
    //Method Name:actualReqForm 
    //Create Date :10/10/2013
    //Description : ใช้ดำเนินการอนุมัติ/ไม่อนุมัติใบคำร้อง
    //Parameter : _actualStatus =รหัสนักศึกษาที่อนุมัติ
    function actualReqForm(_actualStatus) {
        var _actualStdID = $("#hddStudentID").val();
        var _actualQuarter = $("#hddQuarter").val();
        var _actualReqFormNo = $("#hddReqFormNo").val();
        var _remark = $("#txtDisApprReason").val();
       // alert("เหตุผลที่ไม่อนุมัติ : " + _remark);

        var _url = "RequestFormHandler.ashx";
        var _data = {
            action: "actualReqForm",
            studentID: _actualStdID,
            quarter: _actualQuarter,
            reqFormNo: _actualReqFormNo,
            actualStatus: _actualStatus,
            remark: _remark
        }
        var _success = function (data) {
                    alert(data);
                    $("#rdApprove").removeAttr("checked", "checked");
                    $("#rdDisApprove").removeAttr("checked", "checked");
                    $("#divApprReqForm").dialog("close");
                    _show.getNonApprReqFormList();
        }
        webAjax(_url, _data, _success);
    } //End actualReqForm

    //Author: Anussara Wanwang
    //Method Name:setButton 
    //Create Date :10/10/2013
    //Description : css ปุ่ม
    //Parameter : n/a
    function setButton() {
        var _btn = $(".clsBtn");
        _btn.css("cursor", "pointer");
        _btn.css("border", "1px solid steelBlue");

        _btn.mouseover(function () { $(this).css("background-color", "#f1f7fa") });

        _btn.mouseout(function () { $(this).css("background-color", "") });
    } //End setButton

    //Author: Anussara Wanwang
    //Method Name:showStudentReqform 
    //Create Date :18/10/2013
    //Description : ใช้แสดงใบคำร้องของนักศึกษา
    //Parameter : _studentID=รหัสนักศึกษา, _quarter=ภาคการศึกษา, _reqFormNo=รหัสใบคำร้อง
    function showStudentReqform(_studentID, _quarter, _reqFormNo) {
            window.open("../student/NewEditProfilesWebform.aspx?studentid=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo,"StudentReqForm");
        }

    //Author: Anussara Wanwang
    //Method Name:disApprReqForm 
    //Create Date :18/10/2013
    //Description : ยืนยันการอนุมัติใบคำร้อง
    //Parameter : _studentID=รหัสนักศึกษา, _quarter=ภาคการศึกษา, _reqFormNo=รหัสใบคำร้อง
    function disApprReqForm(_studentID, _quarter, _reqFormNo) {
        //alert("DisApprove");
        if (confirm("ต้องการอนุมัติใบคำร้องนี้ใช่หรือไม่")) {
            $.ajax({
                url: "RequestFormHandler.ashx?action=disApprReqForm&studentID=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo,
                type: "Post",
                charset: "Tis-620",
                success: function (data) {
                    alert("ดำเนินการเรียบร้อยแล้ว");
                    getNonApprReqFormList();
                }
            });
        }
    }

    //Author: Anussara Wanwang
    //Method Name:displayDialogDisApprReason 
    //Create Date :19/10/2013
    //Description : ใช้แสดง Dialog เหตุผลในการไม่อนุมัติใบคำร้อง
    //Parameter : n/a
    function displayDialogDisApprReason() {
        if ($("#rdDisApprove").prop("checked")) {
            $("#txtDisApprReason").val("");
            $("#fsDisApprReason").show("blind");
        }
        else {
            $("#fsDisApprReason").hide();
        }

    }

    //Author: Anussara Wanwang
    //Method Name:ResponseBeforeUpload 
    //Create Date :19/10/2013
    //Description : upload file
    //Parameter : _data=File เอกสาร, _genReqFormNo=ใบคำร้อง
    function ResponseBeforeUpload(_data, _genReqFormNo) {
        alert(_data);
        setTimeout("_show.showDocumentList('" + _genReqFormNo + "')", 1200);
    }

//----------------------------------Tabs-3-------------------------------------

    var Tabs3Class = function () { }
        //Author: Anussara Wanwang
        //Method Name:LoadFromTab3 
        //Create Date :10/11/2013
        //Description : load Form ตั้งต้น HTML
        //Parameter : n/a
        Tabs3Class.prototype.LoadFromTab3 = function () {
            var _url = "RequestFormHandler.ashx";
            var _data = {
                action: "loadFromTabs3"
            }
            var _success = function (data) {
                $("#tabs-3").html(data);
//                $("#btnSearch").button({
//                    icons: {
//                        primary: "ui-icon-search"
//                    }
//                });

//                $("#btnSearchMulti").button({
//                    icons: {
//                        primary: "ui-icon-search"
//                    }
//                });
                _showTabs3.onloadFromTab3();
                _showTabs3.getHtmlDdlProgram1();
            }
            webAjax(_url, _data, _success);
        }

        //Author: Anussara Wanwang
        //Method Name:onloadFromTab3 
        //Create Date :10/11/2013
        //Description : load script ที่เกี่ยวข้อง
        //Parameter : n/a
        Tabs3Class.prototype.onloadFromTab3 = function () {
            $('#tabs-3 input').keypress(function (e) {
                code = e.keyCode ? e.keyCode : e.which;
                if (code.toString() == 13) {
                    if ($('#tabs-3 #txtSearch').val() != '') {
                        _showTabs3.SearchStdPreGraduateStatus(1);
                    } else {
                        alert("กรุณากรอกข้อมูลรหัสนักศึกษา / ชื่อ - นามสกุล ที่ต้องการค้นหา");
                        return false;
                    }
                }
            });
            $("#btnSearch").button({
                icons: {
                    primary: "ui-icon-search"
                }
            });

            $("#btnSearchMulti").button({
                icons: {
                    primary: "ui-icon-document"
                }
            });

        }

        //Author: Anussara Wanwang
        //Method Name:getHtmlDdlProgram1 
        //Create Date :10/11/2013
        //Description : ตัวเลือกหลักสูตร
        //Parameter : n/a
        Tabs3Class.prototype.getHtmlDdlProgram1 = function () {
            var _facCode = $("#tabs-3 #ddlFaculty").val();
            var _url = "RequestFormHandler.ashx";
            var _data = {
                action: "getHtmlDdlProgram",
                facCode: _facCode
            };
            var _function = function (data) {
                $("#tabs-3 #spProgram1").html(data);
            }
            webAjax(_url, _data, _function);
        }

        //Author: Anussara Wanwang
        //Method Name:SearchStdPreGraduateStatus 
        //Create Date :10/11/2013
        //Description : ค้นหาข้อมูลนักศึกษา
        //Parameter : _event=mode การทำงาน
        Tabs3Class.prototype.SearchStdPreGraduateStatus = function (_event) {
            var _program, _search;
            if (_event == '1') {
                $("#tabs-3 #ddlFaculty").val('');
                $("#tabs-3 #ddlProgram").val('');
                $("#divshowStdPregrad").html('');

                if ($("#txtSearch").val() == '') {
                    alert("กรุณากรอกข้อมูลรหัสนักศึกษา / ชื่อ - นามสกุล ที่ต้องการค้นหา");
                    return false;
                } else {
                    _program = "";
                    _search = $("#txtSearch").val();

                }
            } else if (_event == '2') {
                $("#txtSearch").val('');
                $("#divshowStdPregrad").html('');
                if ($("#tabs-3 #ddlFaculty").val() == '0') {
                    alert("กรุณาเลือกข้อมูล คณะ และ หลักสูตร ที่ต้องการค้นหา");
                    return false;
                } else {
                    _program = $("#tabs-3 #ddlProgram").val();
                    _search = "";
                }
            }
            var _url = "RequestFormHandler.ashx";
            var _data = {
                action: "SearchStdPreGraduateStatus",
                search: _search,
                program: _program
            };
            var _BeforeSend = function (BeforeSend) {
                $("#divshowStdPregrad").html("<div align='center'><img src='../images/ajax-loader.gif' /><br /><br />กำลังโหลดข้อมูล...</div>");
            }
            var _function = function (data) {
                $("#divshowStdPregrad").html(data);
            }
            webAjax(_url, _data, _function, _BeforeSend);
        }




        //#############################################use
        var _show = new ShowClass();
        var _showTabs3 = new Tabs3Class();
        _showTabs3.LoadFromTab3();




  

</script>
