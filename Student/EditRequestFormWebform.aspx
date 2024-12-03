<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditRequestFormWebform.aspx.cs" Inherits="Student_EditRequestFormWebform" %>

<!DOCTYPE html>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MyStyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/web.js" type="text/javascript"></script>
    <link rel="icon" href="../images/logo1.png" sizes="32x32" />
    <style type="text/css">
        .ui-dialog-title
        {
            font-size:smaller;    
        }
    </style>
</head>
<body>
    <form id="editReqForm" runat="server"  target='ifmDoc' enctype="multipart/form-data">
    <table id="tbHome" style='border: 1px solid steelBlue;' cellpadding='1' cellspacing='0' width="1000px">
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
                        <td width="44%" class="ui-priority-primary" align='Left'>
                            <div id='divUserStaff' runat='server' style='color:White;font-size: 11px;' />
                        </td>
                        <td width="34%" align="right">
                            <span class="ui-icon ui-icon-locked" />
                        </td>
                        <td width="10%" align="left" >
                            <a href="https://smartedu.mahidol.ac.th/authen/login.aspx"
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
                        <td width='400px'>
                          <a href='https://smartedu.mahidol.ac.th/expectRequestForm/Student/ExpectGraduateWebform.aspx' target='Expect Request Form' style='color: green;'>กลับสู่เมนู ตรวจสอบข้อมูลนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</a>
                        </td>
                        <td class='ui-icon ui-icon-note' width='50'>
                            
                        </td>
                        <td width='*' align="center">
                            <div id='divhelp' />
                            <a href="UserManualExpectRequestFormSystem.pdf" target='help' style='color: red;'>Help</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><%--Start From Body--%>
        <div class="EditRequestFormMenu" style="font-family:Tahoma;font-size:13px;">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">ตรวจสอบสถานะใบคำร้อง</a></li>
                </ul>
                <div id="tabs-1">
                  <span id="spStdInfo"></span>

                    <br />

                    <div id="divReqFormList"></div>

                    <div id='divOpenDoc'>
                        <table  id="tblAddDocument" border="0" cellpadding="0" cellspacing="0" width="100%" class="styleTbl" >
                                                    <tr>
                                                        <td class="ui-widget-content" align="center" style="width:40%;">
                                                            <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">                        
                                                                <tr  style="height: 200px;">
                                                                    <td class="ui-widget-content">

                                                                             <table cellpadding='0' cellspacing='0' width='100%'>
                                                                                <tr style="height: 28px;">
                                                                                    <td align="left">
                                                                                        &nbsp;&nbsp;ชื่อเอกสาร : <input id="txtDocName" type="text" style="width:180px;font-size:11px;" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="height: 28px;">
                                                                                    <td align="left">
                                                                                        <div id='divUploadFile'>&nbsp;&nbsp;ชื่อไฟล์ : <asp:FileUpload ID="fileUpload" name="fileUpload" runat="server" style="width:202px;" class="clsBtn"/></div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="height: 25px;" >
                                                                                    <td onclick="SaveNewDoc();" align="center">
                                                                                        <table id="tblAttachFiles"  class="clsBtn">
                                                                                                <tr>
                                                                                                    <td width="20" class="ui-icon ui-icon-document" >
                                                                                                    </td>
                                                                                                    <td width="70">
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
                                                        <td class="ui-widget-content" style="width:60%;vertical-align:top;" >
                                                            <div id='divDocumentList'>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 42px;" class='sizeFont'>
                                                        <td  align="center" colspan='3' >
                                                        </td>
                                                    </tr>
                                               </table>
                    </div>
                    <iframe id="Iframe1" runat="server"  name='ifmDoc' height="0px" width="0px">
                    </iframe>
                    <input  type="hidden" id="hddStudentID" runat='server'/>
                    <input  type="hidden" id="hddQuarter"/>
                    <input  type="hidden" id="hddReqFormNo"/>
                </div>
            </div>
        </div>

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
    displayStdReqForm();
    getStdInfo();
    $(function () {
        $("#divOpenDoc").dialog({
            autoOpen: false,
            width: 750,
            height: 400,
            title:"เพิ่มเอกสารประกอบใบคำร้อง",
            modal: false,
            show: "blind",
            hide: "slide",
//            show: {
//                effect:"blind",
//                duration : 1000
//            }, 
//            hide: {
//                effect:"slide",
//                duration : 1000
//            },
            buttons: {
                "close": function () {
                    if (window.confirm("คุณต้องการปิดหน้าต่างนี้ใช่หรือไม่?")) {
                        $(this).dialog("close");
                    }
                    else {
                        //alert("ปิดหน้าจอแนบเอกสาร");
                    }

                }
            }
        });
        $(".ui-dialog-titlebar-close").hide();
        $("#divOpenDoc").parent().appendTo($("#editReqForm"));
        showDocumentList("0");
        $("#divMeaningOfIcon").hide();
        $("#tabs").tabs();
        setButton();
    });

    //Author: Anussara Wanwang
    //Method Name:setButton 
    //Create Date :10/10/2013
    //Description :css ปุ่มกด
    //Parameter : n/a
    function setButton() {
        var _btn = $(".clsBtn");
        _btn.css("cursor", "pointer");
        _btn.css("border", "1px solid steelBlue");

        _btn.mouseover(function () { $(this).css("background-color", "#f1f7fa") });

        _btn.mouseout(function () { $(this).css("background-color", "") });
    }

    //Author: Anussara Wanwang
    //Method Name:getStdInfo 
    //Create Date :10/10/2013
    //Description :แสดงข้อมูลนักศึกษา
    //Parameter : n/a
    function getStdInfo() {
        var _Post = "action=getStudentInfo";
        $.ajax({ url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                $("#spStdInfo").html(data);
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:displayStdReqForm 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    function displayStdReqForm() {
        //var _quarter = $("#ddlQuarter").val();
        var _StudentID = $("#hddStudentID").val();


        var _url = "ExpectGraduateHandler.ashx";
        var _data = {
            action: "getStdReqFormList",
            studentID: _StudentID
            //quarter: _quarter,
            
        }
        var _success = function (data) {
            $("#divReqFormList").html(data);
            setButton();
            $("#divMeaningOfIcon").show();
        }
        webAjax(_url, _data, _success);
    }

    //Author: Anussara Wanwang
    //Method Name:showStudentReqform 
    //Create Date :10/10/2013
    //Description :
    //Parameter : n/a
    function showStudentReqform(_studentID, _quarter, _reqFormNo) {
        //alert(_studentID + " " + _quarter + " " + _reqFormNo);
        window.open("NewEditProfilesWebform.aspx?studentid=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo, "StudentReqForm");
        //window.location = "RequestMainWebform.aspx";
    }

    //Author: Anussara Wanwang
    //Method Name:cancelStudentReqform 
    //Create Date :10/10/2013
    //Description :ยกเลิกใบคำร้อง
    //Parameter : n/a
    function cancelStudentReqform(_studentID, _quarter, _reqFormNo, _reqFormType) {
        if (confirm("ต้องการยกเลิกการยื่นใบคำร้องนี้ใช่หรือไม่")) {
            var _url = "ExpectGraduateHandler.ashx";
            var _data = {
                action: "cancelStudentReqform",
                studentID: _studentID,
                quarter: _quarter,
                reqFormNo: _reqFormNo,
                reqFormType: _reqFormType
            }
            var _success = function (data) {
                alert(data);
                displayStdReqForm();
            }
            webAjax(_url, _data, _success);
        }

//            if (confirm("ต้องการยกเลิกการยื่นใบคำร้องนี้ใช่หรือไม่")) {
//                $.ajax({
//                    url: "ExpectGraduateHandler.ashx?action=cancelStdReqForm&studentID=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo,
//                    type: "Post",
//                    charset: "Tis-620",
//                    success: function (data) {
//                        alert("ยกเลิกใบคำร้องเรียบร้อยแล้ว");
//                        displayStdReqForm();
//                    }
//                })
//            }
        }

        //Author: Anussara Wanwang
        //Method Name:displayDialogAttachFile 
        //Create Date :12/10/2013
        //Description :upload เอกสารแนบ
        //Parameter : _studentId=รหัสนักศึกษา, _quarter=ภาคการศึกษา, _reqFormNo=รหัสใบคำร้อง
        function displayDialogAttachFile(_studentId, _quarter, _reqFormNo) {
            //alert(_studentId + " and " + _quarter + " and " + _reqFormNo);
            $("#hddStudentID").val(_studentId);
            $("#hddQuarter").val(_quarter);
            $("#hddReqFormNo").val(_reqFormNo);
            showDocumentList(_reqFormNo);
            $("#divOpenDoc").dialog("open")
            //$("#divOpenDoc").show();
        }

        //Author: Anussara Wanwang
        //Method Name:showDocumentList 
        //Create Date :28/10/2013
        //Description :แสดงเอกสารแนบ
        //Parameter : _reqFormNo=รหัสใบคำร้อง
        function showDocumentList(_reqFormNo) {
            var _quarter = $("#hddQuarter").val();
            var _stdID = $("#hddStudentID").val();
            //var _reqFromNo = $("#hddReqFormNo").val();

            //alert(_reqFormNo);

            $.ajax({
                url: "ExpectGraduateHandler.ashx?action=listReqFormDocument&quarter=" + _quarter + "&student=" + _stdID + "&reqFormNo=" + _reqFormNo,
                type: "Post",
                charset: "Tis-620",
                success: function (data) {
                    //alert(data);
                    $("#divDocumentList").html(data);
                    //$("#divListDocument").show("slide", 1000);

                }
            })

        }

        //Author: Anussara Wanwang
        //Method Name:OpenFile 
        //Create Date :28/10/2013
        //Description :เปิดเอกสาร
        //Parameter : _documentLink=path เอกสาร
        function OpenFile(_documentLink) {
            //alert(_DocProjectfilename);
            window.open(_documentLink);
        }

        //Author: Anussara Wanwang
        //Method Name:delDocument 
        //Create Date :29/10/2013
        //Description :ลบเอกสาร
        //Parameter : _delReqFormNo=รหัสใบคำร้อง, _delDocID=รหัสเอกสาร, _StudentID=รหัสนักศึกษา, _Quarter=ภาคการศึกษา
        function delDocument(_delReqFormNo, _delDocID, _StudentID, _Quarter) {
            if (confirm("ต้องการลบเอกสารนี้หรือไม่")) {

                var _url = "ExpectGraduateHandler.ashx";
                var _data = {
                    action: "deleteDocument",
                    reqFormNo: _delReqFormNo,
                    docID: _delDocID,
                    studentID: _StudentID,
                    quarter: _Quarter
                }
                var _success = function (data) {
                    showDocumentList(_delReqFormNo);
                }
                webAjax(_url, _data, _success);
            }
        } //End delDocument

        //Author: Anussara Wanwang
        //Method Name:SaveNewDoc 
        //Create Date :30/10/2013
        //Description :บันทึกเอกสาร
        //Parameter : N/A
       function SaveNewDoc() {
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
                    $("#editReqForm").attr("action", "ExpectGraduateHandler.ashx?action=SaveProjectDocument&docName=" + _docName + "&quarter=" + _quarter + "&student=" + _studentID + "&reqFormNo=" + _reqFormNo);
                    $("#editReqForm").submit();
                    $("#txtDocName").val("");
                    document.getElementById('divUploadFile').innerHTML = document.getElementById('divUploadFile').innerHTML;
                }

            }
        } //End SaveNewDoc

        //Author: Anussara Wanwang
        //Method Name:ResponseBeforeUpload 
        //Create Date :30/10/2013
        //Description :
        //Parameter : N/A
        function ResponseBeforeUpload(_data, _genReqFormNo) {
            alert(_data);
            setTimeout("showDocumentList('" + _genReqFormNo + "')", 1200);
        }

</script>
