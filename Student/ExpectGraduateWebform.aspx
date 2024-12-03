<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExpectGraduateWebform.aspx.cs" Inherits="Student_ExpectGraduateWebform" %>

<!DOCTYPE html>


<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MyStyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/web.css" rel="stylesheet" type="text/css" />
    <script src="../js/web.js" type="text/javascript"></script>
    <link rel="icon" href="../images/logo1.png" sizes="32x32" />
    <style type="text/css">
        .setTblBorder
        {
            border:1px solid white;
        }
        .style1
        {
            height: 16px;
        }
    </style>
</head>
<%--Author Thanett.kls Date 10/12/2012
    ExpectGraduateWebform.aspx สำหรับนักศึกษาตรวจสอบข้อมูล เพื่อทำการยืนยันการขึ้นทะเบียนบัณฑิตหรือยื่นใบคำร้องเพื่อขอแก้ไขข้อมูล
    --Function--
    getStdInfo                  ใช้แสดงข้อมูลเพื่อให้นักศึกษาใช้ตรวจสอบความถูกต้อง
    getStdMoreInfo              ใช้แสดงข้อมูลพิ่มเติมเพื่อให้นักศึกษาใช้ตรวจสอบความถูกต้อง
    checkStdPermission          ใช้ในการตรวจสอบสิทธิ์การเข้าใช้งานระบบ(อนุญาตให้นักศึกษาชั้นปีสุดท้ายของแต่ละหลักสูตรเข้าใช้งานเท่านั้น)
    setExpectGraduateStatus     ใช้กำหนดสถานะของนักศึกษาเป็นขึ้นทะเบียนบัณฑิตเรียบร้อยแล้ว
    setEditInformationStatus    ใช้กำหนดสถานะของนักศึกษาเป็นอยู่ระหว่างการยื่นใบคำร้อง
--%>
<body>
    <form id="reqForm" name="reqFrom" runat="server">
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
                            <a href="https://smartedu.mahidol.ac.th/Authen/login.aspx"
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
                        <td width='300px'>
                          <a href='https://smartedu.mahidol.ac.th/expectRequestForm/Student/EditRequestFormWebform.aspx' target='Check Request Form' style='color: green;'>เข้าสู่เมนู ตรวจสอบสถานะใบคำร้องของนักศึกษา</a>
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
 
 <%--   <div style="font-family:Tahoma;font-size:13px;width:1000px;">--%>
    
        <div class="RequestFormMenu" style="font-family:Tahoma;font-size:13px;width:1000px;">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">ระบบตรวจสอบข้อมูลนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</a></li>
                </ul>
                <div id="tabs-1">
                    <div id='divShowStatus'></div>
                    <table id="tblStdInfor" width="100%">
                        <tr>
                            <th class="ui-widget-header" align="left" style="height:30px;padding-left:20px;width:80%;">
                                ข้อมูลการศึกษาของนักศึกษา
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span id="spStdInfo">
                                </span>
                            </td>
                        </tr>
                    </table>

                    <br />
                    <table id="tblStdMoreInfor" width="100%">
                        <tr>
                            <th class="ui-widget-header" align="left" style="height:30px;padding-left:20px;">
                                ข้อมูลประวัตินักศึกษาเพิ่มเติม
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <span id="spStdMoreInfo" >
                                </span>
                            </td>
                        </tr>
                    </table>

                    <br /><br />

                                    <table id="tblStdActual" width="100%">
                                        <tr>
                                            <td width="20" class="ui-icon ui-icon-alert" style="height: 16px">
                                            </td>
                                            <td style="font-size:16px;color:Red;font-style:inherit;" >
                                                หากตรวจสอบแล้วข้อมูลถูกต้องกรุณายืนยันข้อมูลโดยคลิกที่ปุ่ม <b>"ยืนยันข้อมูลถูกต้อง"</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="20" class="ui-icon ui-icon-alert" style="height: 16px">
                                            </td>
                                            <td style="font-size:16px;color:Red;font-style:inherit;">
                                                หากข้อมูลไม่ถูกต้อง โปรดดำเนินการแก้ไขข้อมูลโดยคลิกที่ปุ่ม <b>"แก้ไขข้อมูล"</b> เพื่อเข้าสู่ระบบใบคำร้อง
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="right" onclick="setExpectGraduateStatus();">
                                                
                                                <table id="tblConfirmData"  class="clsBtn">
                                                    <tr>
                                                        <td width="20" class="ui-icon ui-icon-circle-check">
                                                        </td>
                                                        <td width="120" align="center">
                                                            <b>ยืนยันข้อมูลถูกต้อง</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" onclick="setEditInformationStatus();">
                                                <table id="tblEditData" class="clsBtn" >
                                                    <tr>
                                                        <td width="20" class="ui-icon ui-icon-circle-close">
                                                        </td>
                                                        <td width="80" align="center">
                                                            <b>ขอแก้ไขข้อมูล</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>

                                    <table id="tblWarning" width="100%">
                                        <tr>
                                            <td width="20" class="ui-icon ui-icon-alert" style="height: 16px">
                                            </td>
                                            <td style="font-size:16px;color:Red;font-style:inherit;" >
                                                คุณยังไม่สามารถใช้งานระบบนี้ได้ เนื่องจากยังไม่ใช่นักศึกษาปีสุดท้าย กรุณาติดต่อแก้ไขข้อมูลที่ One Stop Service กองบริหารการศึกษา
                                            </td>
                                        </tr>
                                    </table>
                    
                </div>
            </div>
        </div>
 <%--   </div>--%>

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


    $(function () {
        $("#tabs").tabs();
        $("#tblStdActual").hide();
        $("#tblWarning").hide();
        $("#tblStdInfor").hide();
        $("#tblStdMoreInfor").hide();
        //ตรวจสอบว่านักศึกษาสามารถเข้ามาตรวจสอบข้อมูลของตนเองได้หรือไม่ (ต้องเป็น ปี4 หรือ ปี6) 
        checkStdPermission();
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
    //Method Name:checkStdPermission 
    //Create Date :10/10/2013
    //Description :for check student current year (only last year can used this system)
    //Parameter : n/a
    function checkStdPermission() {
        var _Post = "action=checkStdPermission";
        $.ajax({ url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                if (data == "0") {
                    checkStudentConfirm();
                    getStdInfo();
                }
                else {
                    $("#tblWarning").show("blind");
                }
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:checkStudentConfirm 
    //Create Date :10/10/2013
    //Description :ตรวจสอบการยืนยันความถูกต้องของข้อมูล
    //Parameter : n/a
    function checkStudentConfirm() {
        var _url = "ExpectGraduateHandler.ashx";
        var _data = {
            action: "checkStudentConfirm"
        }
        var _success = function (data) {
            $("#divShowStatus").html(data);
        }
        webAjax(_url, _data, _success);  
    }

    //Author: Anussara Wanwang
    //Method Name:getStdInfo 
    //Create Date :10/10/2013
    //Description :get Student information for display to check before select menu
    //Parameter : n/a
    function getStdInfo() {
        var _Post = "action=getStudentInfo";
        $.ajax({ url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                $("#tblStdInfor").show();
                $("#spStdInfo").html(data);
                getStdMoreInfo();
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:getStdMoreInfo 
    //Create Date :13/10/2013
    //Description :display student more information for check data
    //Parameter : n/a
    function getStdMoreInfo() {
        var _Post = "action=getStudentMoreInfo";
        $.ajax({ url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                $("#tblStdMoreInfor").show();
                $("#spStdMoreInfo").html(data);
                $("#tblStdActual").show("blind");
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:setExpectGraduateStatus 
    //Create Date :13/10/2013
    //Description :confirm information to set StudentStatus to ExpectToGraduate
    //Parameter : n/a
    function setExpectGraduateStatus() {
       
        if (confirm("ยืนยันการตรวจสอบข้อมูลนักศึกษาที่คาดว่าจะสำเร็จการศึกษา")) {

            var _url = "ExpectGraduateHandler.ashx";
            var _data = {
                action: "setExpectGraduateStatus"
            }
            var _success = function (data) {
                alert(data);
                checkStudentConfirm();
            }
            webAjax(_url, _data, _success);
        }
    }

    //Author: Anussara Wanwang
    //Method Name:setEditInformationStatus 
    //Create Date :13/10/2013
    //Description :set edit flag and go to reqform system
    //Parameter : n/a
    function setEditInformationStatus() {
//        var _Post = "action=setEditInformation";
//        if (confirm("ข้อมูลไม่ถูกต้อง เข้าสู่ระบบใบคำร้อง")) {
//            $.ajax({ url: 'ExpectGraduateHandler.ashx',
//                type: 'Post',
//                data: _Post,
//                charset: 'tis-620',
//                success: function (data) {
//                    window.open("RequestMainWebform.aspx","ExpectGradReqForm");
//                    window.open("", "_self");
//                    window.close();
//                }
//            });
        //        }
        var _url = "ExpectGraduateHandler.ashx";
        var _data = {
            action: "setEditInformation"
        }
        var _success = function (data) {
            if (data == '0') {
                if (confirm("ข้อมูลไม่ถูกต้อง เข้าสู่ระบบใบคำร้อง")) {
                    //                    window.open("RequestMainWebform.aspx", "ExpectGradReqForm");
                    //                    window.open("", "_self");
                    //                    window.close();
                    //window.location = "RequestMainWebform.aspx";
                    //alert("ok");
                    //$("#reqForm").attr("action", "RequestMainWebform.aspx");
                    //$("#reqForm").attr("target", "ExpectGradReqForm");
                    //$("#reqForm").submit();
                    window.location = "RequestMainWebform.aspx";
                }

            } else {
                alert("นักศึกษามีใบคำร้องอยู่ในระบบแล้ว ดำเนินการยกเลิกใบคำร้อง");
                //                window.open("EditRequestFormWebform.aspx", "ExpectGradReqForm");
                //                window.open("", "_self");
                //                window.close();
                window.location = "EditRequestFormWebform.aspx";
            }
        }
        webAjax(_url, _data, _success);

    }

</script>
