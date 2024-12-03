<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestMainWebform.aspx.cs" Inherits="Student_RequestMainWebform" %>

<%--<!DOCTYPE html>--%>

<%--Author : Anussara  Wanwang 
    Create Date : 10/10/2013
    Description :สำหรับนักศึกษาใช้สร้างใบคำร้องเพื่อแก้ไขข้อมูลที่ไม่ถูกต้อง ก่อนทำการขึ้นทะเบียนบัณฑิต 
--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestMainWebform.aspx.cs" Inherits="RequestMainWebform" 
EnableViewStateMac="false" ViewStateEncryptionMode="Never"
%>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MyStyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/web.js" type="text/javascript"></script>
    <link rel="icon" href="../images/logo1.png" sizes="32x32" />
    <style type="text/css">
        .setTblBorder
        {
            border:1px solid white;
        }
        </style>
</head>
<body>  
<form id="reqForm" runat="server" method="post" target='ifmDoc'>
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
                        <td width="44%" class="ui-priority-primary" style='align:Left;'>
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
                        <td width='400px'>
                          <a href='https://smartedu.mahidol.ac.th/expectRequestForm/Student/ExpectGraduateWebform.aspx' target='Check Request Form' style='color: green;'>กลับสู่เมนู ตรวจสอบข้อมูลนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</a>
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
  
        <div class="RequestFormMenu" style="font-family:Tahoma;font-size:13px;width:1000px;">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">ใบคำร้องสำหรับนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</a></li>
                </ul>
                <div id="tabs-1">
                    <table width="100%">
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
                    <table width="100%">
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
                    <div id="divSelectMenu" style="font-family:Tahoma;font-size:13px;">
                        <table id="tblSelectMenu" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <th class="ui-widget-header" align="left" style="height:30px;padding-left:20px;">
                                    กรุณาเลือกข้อมูลที่ต้องการแก้ไข
                                </th>
                                <th class="ui-widget-header" >
                                    <%--<table width="100%">
                                        <tr style="height:30px;">
                                            <td align="right">
                                                ภาคการศึกษา
                                            </td>
                                            <td align="left">
                                                <select id="ddlQuarter" runat="server" style="width:200px;"></select>
                                            </td>
                                        </tr>
                                    </table>--%>
                                </th>
                            </tr>
                            <tr>
                                <td colspan="2" class="setTblBorder" height="30" style="font-weight:bold;width:100%;padding-left:20px;" bgcolor="#99ccff" align="left">
                                    <input type="checkbox" id="chkChangeName" onclick="displayDialogChangeNameMenu();" />แก้ไขชื่อ-นามสกุล
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <fieldset id="fsChangeNameMenu">
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >เลือกประเภทของการแก้ไข</legend>
                                        <table id="tblChangeNameMenu" width="100%">
                                            <tr>
                                                <td style="font-weight:bold;width:50%;">
                                                    <input id="rdChangeName" name="rdName" runat="server" type="radio" onclick="displayDialogChangeName();"/>ขอเปลี่ยน ชื่อ-ชื่อสกุล
                                                </td>
                                                <td style="font-weight:bold;width:50%;">
                                                    <input id="rdEditName" name="rdName" runat="server" type="radio" onclick="displayDialogChangeName();"/>ขอแก้ไขตัวสะกด ชื่อ-ชื่อสกุล                
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeName" >
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดระบุชื่อ-นามสกุลที่ต้องการแก้ไข</legend>
                                        <table id="tblChangeName" width="50%">
                                            <tr>
                                                <td>
                                                ชื่อ
                                                </td>
                                                <td>
                                                    <input type="text" id="txtThaiName" runat="server" maxlength="50"/>
                                                </td>
                                                <td>
                                                นามสกุล
                                                </td>
                                                <td>
                                                    <input type="text" id="txtThaiLastname" runat="server" maxlength="50"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                Name
                                                </td>
                                                <td>
                                                    <input type="text" id="txtEName" runat="server" maxlength="50"/>
                                                </td>
                                                <td>
                                                LastName
                                                </td>
                                                <td>
                                                    <input type="text" id="txtELastname" runat="server" maxlength="50"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>

                            </tr>
                            <tr>
                                <td class="setTblBorder" height="30" style="font-weight:bold;width:50%;padding-left:20px;" bgcolor="#99ccff" align="left" colspan="2">
                                    <input id="chkChangeOther" type="checkbox"  onclick="displayDialogChangeOtherMenu();"/>ขอแก้ไขเลขที่บัตรประชาชน/คำนำหน้านาม/วันเดือนปีเกิด/สัญชาติ/เพศ
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <fieldset id="fsChangeOtherMenu">
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >เลือกประเภทของการแก้ไข</legend>
                                        <table id="tblChangeOtherMenu" width="100%">
                                            <tr>
                                                <td style="font-weight:bold;width:20%;">
                                                    <input id="rdChangeID" name="rdOther" runat="server" type="radio" onclick="displayDialogChangeID();"/>แก้ไขเลขที่บัตรประชาชน
                                                </td>
                                                <td style="font-weight:bold;width:20%;">
                                                    <input id="rdChangeTitle" name="rdOther" runat="server" type="radio" onclick="displayDialogChangeTitle();"/>แก้ไขคำนำหน้านาม               
                                                </td>
                                                <td style="font-weight:bold;width:20%;">
                                                    <input id="rdChangeBirthDate" name="rdOther" runat="server" type="radio" onclick="displayDialogChangeBirthDate();"/>แก้ไขวันเดือนปีเกิด               
                                                </td>
                                                <td style="font-weight:bold;width:20%;">
                                                    <input id="rdChangeNationality" name="rdOther" runat="server" type="radio" onclick="displayDialogChangeNationality();"/>แก้ไขสัญชาติ               
                                                </td>
                                                <td style="font-weight:bold;width:20%;">
                                                    <input id="rdChangeGender" name="rdOther" runat="server" type="radio" onclick="displayDialogChangeGender();"/>แก้ไขเพศ
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                             <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeID" >
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดระบุเลขที่บัตรประชาชนที่ต้องการแก้ไข</legend>
                                        <table id="tblChangeID" width="50%">
                                            <tr>
                                                <td>
                                                เลขที่บัตรประชาชน
                                                </td>
                                                <td>
                                                    <input type="text" id="txtID" runat="server" style="width:200px;" maxlength="13"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeTitle" >
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดเลือกคำนำหน้านามที่ต้องการแก้ไข</legend>
                                            <table id="tblChangeTitle" width="50%">
                                            <tr>
                                                <td>
                                                คำนำหน้านาม
                                                </td>
                                                <td>
                                                    <select id='ddlTitle' runat='server' style='width:200px;' onclick="return ddlTitle_onclick()"></select>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeBirthDate" >
                                    <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดเลือกวันเดือนปีเกิดที่ต้องการแก้ไข</legend>
                                        <input id="txtDate" runat="server" readonly="readonly" />
                                    </fieldset>
                                </td>
                            </tr>
                            <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeNationality" >
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดเลือกสัญชาติที่ต้องการแก้ไข</legend>
                                            <table id="tblChangeNationality" width="50%">
                                            <tr>
                                                <td>
                                                สัญชาติ
                                                </td>
                                                <td>
                                                    <select id='ddlNationality' runat='server' style='width:200px;'></select>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr style="height:0px;">
                                <td colspan="2">
                                    <fieldset id="fsChangeGender" >
                                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดเลือกเพศที่ต้องการแก้ไข</legend>
                                            <table id="tblChangeGender" width="50%">
                                            <tr>
                                                <td>
                                                เพศ
                                                </td>
                                                <td>
                                                    <select id="ddlGender" style="width:150px;" runat="server"><option value="0">-- กรุณาเลือกเพศ --</option><option value="M">Male</option><option value="F">Female</option></select>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td class="setTblBorder" height="30" style="font-weight:bold;width:50%;padding-left:20px;" bgcolor="#99ccff" align="left">
                                    <input id="chkChangeHomeAddr" runat="server" type="checkbox" onclick="displayDialogChangeHomeAddr();"/>ขอแก้ไขที่อยู่ตามทะเบียนบ้าน
                                </td>
                                <td class="setTblBorder" height="30" style="font-weight:bold;width:50%;padding-left:20px;" bgcolor="#99ccff" align="left">
                                    <input id="chkChangeCurrAddr" runat="server" type="checkbox" onclick="displayDialogChangeCurrAddr();"/>ขอแก้ไขที่อยู่ปัจจุบัน
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    <fieldset id="fsHomeAddr">
                        <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดระบุที่อยู่ตามทะเบียนบ้าน</legend>
                        <table id="tblHomeAddr">
                            <tr>
                                <td>
                                    บ้านเลขที่
                                </td>
                                <td>
                                    <input id="txtHHomeNo" type="text" runat="server" maxlength="40"/>
                                </td>
                                <td>
                                    หมู่
                                </td>
                                <td>
                                    <input id="txtHMoo" type="text" runat="server" maxlength="40"/>
                                </td>
                                <td>
                                    ชื่อหมู่บ้าน/อื่นๆ
                                </td>
                                <td>
                                    <input id="txtHVillageName" type="text" runat="server" maxlength="200"/>
                                </td>
                                <td>
                                    ซอย
                                </td>
                                <td>
                                    <input id="txtHAlley" type="text" runat="server" maxlength="200"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ถนน
                                </td>
                                <td>
                                    <input id="txtHRoad" type="text" runat="server" maxlength="200"/>
                                </td>
                                <td>
                                    แขวง/ตำบล
                                </td>
                                <td>
                                    <input id="txtHDistrict" type="text" runat="server" maxlength="200"/>
                                </td>
                                <td>
                                    เขต/อำเภอ
                                </td>
                                <td>
                                    <input id="txtHCanton" type="text" runat="server" maxlength="200"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    จังหวัด
                                </td>
                                <td>
                                    <select id='ddlHProvince' runat='server' style='width:150px;'></select>
                                </td>
                                <td>
                                                รหัสไปรษณีย์
                                                </td>
                                                <td>
                                                    <input id="txtHPostCode" type="text" runat="server" maxlength="40"/>
                                                </td>
                                                <td>
                                                โทรศัพท์บ้าน/มือถือ
                                                </td>
                                                <td>
                                                    <input id="txtHPhone" type="text" runat="server" maxlength="40"/>
                                                </td>
                                            </tr>
                                        </table>
                    </fieldset>

                                    <fieldset id="fsCurrAddr">
                                            <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >โปรดระบุที่อยู่ปัจจุบัน</legend>
                                            
                                            <table id="tblCurrAddr">
                                                <tr>
                                                    <td align="right">
                                                        <input id="chkUseHomeAddr" type="checkbox" runat="server" onclick="useHomeAddr();"/>        
                                                    </td>
                                                    <td style="height:30px;">
                                                        ใช้ที่อยู่ตามทะเบียนบ้าน
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    บ้านเลขที่
                                                    </td>
                                                    <td>
                                                        <input id="txtCHomeNo" runat="server" type="text" maxlength="40" />
                                                    </td>
                                                    <td>
                                                    หมู่
                                                    </td>
                                                    <td>
                                                        <input id="txtCMoo" type="text" runat="server" maxlength="40"/>
                                                    </td>
                                                    <td>
                                                    ชื่อหมู่บ้าน/อื่นๆ
                                                    </td>
                                                    <td>
                                                        <input id="txtCVillageName" type="text" runat="server" maxlength="200"/>
                                                    </td>
                                                    <td>
                                                    ซอย
                                                    </td>
                                                    <td>
                                                        <input id="txtCAlley" type="text" runat="server" maxlength="200"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    ถนน
                                                    </td>
                                                    <td>
                                                        <input id="txtCRoad" type="text" runat="server" maxlength="200"/>
                                                    </td>
                                                    <td>
                                                    แขวง/ตำบล
                                                    </td>
                                                    <td>
                                                        <input id="txtCDistrict" type="text" runat="server" maxlength="200"/>
                                                    </td>
                                                    <td>
                                                    เขต/อำเภอ
                                                    </td>
                                                    <td>
                                                        <input id="txtCCanton" type="text" runat="server" maxlength="200"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    จังหวัด
                                                    </td>
                                                    <td>
                                                        <select id='ddlCProvince' runat='server' style='width:150px;'></select>
                                                    </td>
                                                    <td>
                                                    รหัสไปรษณีย์
                                                    </td>
                                                    <td>
                                                        <input id="txtCPostCode" type="text" runat="server" maxlength="40"/>
                                                    </td>
                                                    <td>
                                                    โทรศัพท์บ้าน/มือถือ
                                                    </td>
                                                    <td>
                                                        <input id="txtCPhone" type="text" runat="server" maxlength="40"/>
                                                    </td>
                                                </tr>
                                            </table>
                                    </fieldset>

                                    <fieldset id="fsAddDocument">
                                            <legend style="font-family:Tahoma;font-size:13px;font-weight:bold;height:30px;padding-left:20px;" >แนบเอกสารประกอบ</legend>
                                            
                                                
                                    </fieldset>

                                    <table id="tblWarning" width="100%">
                                        <tr>
                                            <td width="20" class="ui-icon ui-icon-alert" style="height: 16px" align="right">
                                            </td>
                                            <td style="font-size:16px;color:Red;font-style:inherit;" >
                                                คุณยังไม่สามารถใช้งานระบบนี้ได้</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table width='100%'>
                                        <tr>
                                            <td align="right" onclick="setEditInformationStatus()">
                                                
                                                <table id="tblBtnSave" class="clsBtn">
                                                    <tr>
                                                        <td width="20" class="ui-icon ui-icon-disk">
                                                        </td>
                                                        <td width="120">
                                                            <b>บันทึกข้อมูลใบคำร้อง</b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                    <iframe id="Iframe1" runat="server"  name='ifmDoc' height="0px" width="0px">
                    </iframe>
                    



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
                </div>
            </div>
        </div>
        <input  type="hidden" id="hddStudentID"/>
        <input  type="hidden" id="hddQuarter"/>
        <input  type="hidden" id="hddReqFormNo"/>
             </td>
        </tr>
        <%--End tr body class='ui-widget-header' height='100px' align='center' style='font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;'--%>
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

        $("#divOpenDoc").dialog({
            autoOpen: false,
            width: 750,
            height: 400,
            title: "เพิ่มเอกสารประกอบใบคำร้อง",
            modal: false,
            show: "drop",
            hide: "slide",
            buttons: {
                "close": function () {
                    if (window.confirm("คุณต้องการปิดหน้าต่างนี้ใช่หรือไม่?")) {
                        $(this).dialog("close");
                        showStudentReqform();
                    }
                    else {
                        //alert("ปิดหน้าจอแนบเอกสาร");
                    }

                }
            }
        });
        // $(".ui-dialog-titlebar-close").click(function () {
        //        alert(555);
        //            });
        $(".ui-dialog-titlebar-close").hide();
        $("#divOpenDoc").parent().appendTo($("#reqForm"));
        $("#fsChangeOtherMenu").hide();
        $("#fsChangeID").hide();
        $("#fsChangeTitle").hide();
        $("#fsChangeBirthDate").hide();
        $("#fsChangeNationality").hide();
        $("#fsChangeGender").hide();
        $("#fsChangeNameMenu").hide();
        $("#fsChangeName").hide();
        $("#fsHomeAddr").hide();
        $("#fsCurrAddr").hide();
        $("#fsAddDocument").hide();
        $("#tblSelectMenu").hide();
        $("#tblBtnSave").hide();
        $("#tblWarning").hide();
        $("#tabs").tabs();
        getStdInfo();
        getStdMoreInfo();
        setButton();
        getDatePicker();
        showDocumentList("0");
        checkStdPermission();
        //displayDialogAttachFile();

    });

    //Author: Anussara Wanwang
    //Method Name:checkStdPermission 
    //Create Date :10/10/2013
    //Description : ใช้ในการตรวจสอบสิทธิ์การเข้าใช้งานระบบ(อนุญาตให้นักศึกษาชั้นปีสุดท้ายของแต่ละหลักสูตรเข้าใช้งานเท่านั้น)
    //Parameter : n/a
    function checkStdPermission() {
        var _Post = "action=checkStdPermission";
        $.ajax({
            url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                if (data == "0") {
                    $("#tblSelectMenu").show("blind");
                    $("#tblBtnSave").show();
                }
                else {
                    $("#tblWarning").show("blind");
                }
            }
        });
    } //End checkStdPermission

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
    }

    //Author: Anussara Wanwang
    //Method Name:setTableBorder 
    //Create Date :10/10/2013
    //Description : 
    //Parameter : n/a
    function setTableBorder() {
        var _tbl = $(".clstblBorder");
        _btn.css("border", "1px solid white");
    }

    //Author: Anussara Wanwang
    //Method Name:getStdInfo
    //Create Date :10/10/2013
    //Description :get Student information for display to check before select menu
    //Parameter : n/a
    function getStdInfo() {

        var _Post = "action=getStudentInfo";
        $.ajax({
            url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                $("#spStdInfo").html(data);
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:getStdMoreInfo
    //Create Date :10/10/2013
    //Description :ใช้แสดงข้อมูลพิ่มเติมเพื่อให้นักศึกษาใช้ตรวจสอบความถูกต้อง
    //Parameter : n/a
    function getStdMoreInfo() {
        var _Post = "action=getStudentMoreInfo";
        $.ajax({
            url: 'ExpectGraduateHandler.ashx',
            type: 'Post',
            data: _Post,
            charset: 'tis-620',
            success: function (data) {
                //alert(data)
                $("#spStdMoreInfo").html(data);
            }
        });
    }

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeName
    //Create Date :10/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขชื่อ-นามสกุล
    //Parameter : n/a
    function displayDialogChangeName() {
        if ($("#rdChangeName").prop("checked") || $("#rdEditName").prop("checked")) {
            $("#txtThaiName").val("");
            $("#txtThaiLastname").val("");
            $("#txtEName").val("");
            $("#txtELastname").val("");
            $("#fsChangeName").show("blind");
        }
        else {
            $("#txtThaiName").val("");
            $("#txtThaiLastname").val("");
            $("#txtEName").val("");
            $("#txtELastname").val("");
            $("#fsChangeName").hide("blind");
        }

    } //End displayDialogChangeName

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeHomeAddr
    //Create Date :10/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขที่อยู่ตามทะเบียนบ้าน
    //Parameter : n/a
    function displayDialogChangeHomeAddr() {
        if ($("#chkChangeHomeAddr").prop("checked")) {
            $("#fsHomeAddr").show("blind");
        }
        else {
            $("#fsHomeAddr").hide("blind");
        }

    } //End displayDialogChangeHomeAddr

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeCurrAddr
    //Create Date :10/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขที่อยู่ปัจจุบัน
    //Parameter : n/a
    function displayDialogChangeCurrAddr() {
        if ($("#chkChangeCurrAddr").prop("checked")) {
            $("#fsCurrAddr").show("blind");
        }
        else {
            $("#fsCurrAddr").hide("blind");
        }

    } //End displayDialogChangeCurrAddr

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeNameMenu
    //Create Date :10/10/2013
    //Description :ใช้แสดง/ซ่อน Menu การแก้ไขข้อมูลชื่อ-นามสกุล
    //Parameter : n/a
    function displayDialogChangeNameMenu() {
        if ($("#chkChangeName").prop("checked")) {
            $("#fsChangeNameMenu").show();
        }
        else {
            $("#fsChangeNameMenu").hide();
            $("#fsChangeName").hide();
            $("#rdChangeName").removeAttr("checked", "checked");
            $("#rdEditName").removeAttr("checked", "checked");
        }

    }

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeOtherMenu
    //Create Date :10/10/2013
    //Description :ใช้แสดง/ซ่อน Menu การขอแก้ไขข้อมูลอื่นๆ
    //Parameter : n/a
    function displayDialogChangeOtherMenu() {
        if ($("#chkChangeOther").prop("checked")) {
            $("#fsChangeOtherMenu").show("blind");
        }
        else {
            $("#fsChangeOtherMenu").hide("blind");
            $("#fsChangeOther").hide("blind");
            $("#fsChangeID").hide("blind");
            $("#fsChangeTitle").hide("blind");
            $("#fsChangeBirthDate").hide("blind");
            $("#fsChangeNationality").hide("blind");
            $("#fsChangeGender").hide("blind");
            $("#rdChangeID").removeAttr("checked", "checked");
            $("#rdChangeTitle").removeAttr("checked", "checked");
            $("#rdChangeBirthDate").removeAttr("checked", "checked");
            $("#rdChangeNationality").removeAttr("checked", "checked");
            $("#rdChangeGender").removeAttr("checked", "checked");
        }
    }

    //เปลี่ยนบัตรประชาชน
    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeID
    //Create Date :15/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขเลขประจำตัวประชาชน
    //Parameter : n/a
    function displayDialogChangeID() {
        if ($("#rdChangeID").prop("checked")) {
            $("#fsChangeID").show("blind");
            $("#fsChangeTitle").hide("blind");
            $("#fsChangeBirthDate").hide("blind");
            $("#fsChangeNationality").hide("blind");
            $("#fsChangeGender").hide("blind");
        }
        else {
            $("#txtID").val("");
            $("#fsChangeID").hide("blind");
        }
    } //End displayDialogChangeID

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeTitle
    //Create Date :15/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขคำนำหน้าชื่อ
    //Parameter : n/a
    function displayDialogChangeTitle() {
        if ($("#rdChangeTitle").prop("checked")) {
            $("#fsChangeTitle").show("blind");
            $("#fsChangeID").hide("blind");
            $("#fsChangeBirthDate").hide("blind");
            $("#fsChangeNationality").hide("blind");
            $("#fsChangeGender").hide("blind");
        }
        else {
            $("#fsChangeTitle").hide("blind");
        }
    } //End displayDialogChangeTitle

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeBirthDate
    //Create Date :15/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไข วัน/เดือน/ปีเกิด
    //Parameter : n/a
    function displayDialogChangeBirthDate() {
        if ($("#rdChangeBirthDate").prop("checked")) {
            $("#fsChangeBirthDate").show("blind");
            $("#fsChangeID").hide("blind");
            $("#fsChangeTitle").hide("blind");
            $("#fsChangeNationality").hide("blind");
            $("#fsChangeGender").hide("blind");
        }
        else {
            $("#txtDate").val("");
            $("#fsChangeBirthDate").hide("blind");
        }
    } //End displayDialogChangeBirthDate

    //Author: Anussara Wanwang
    //Method Name:getDatePicker
    //Create Date :15/10/2013
    //Description :ใช้แสดงปฏิทินเพื่อเลือกข้อมูล
    //Parameter : n/a
    function getDatePicker() {
        $("#txtDate").datepicker({
            showOn: "button",
            buttonImage: "../images/calendar.gif",
            dateFormat: "mm/dd/yy",
            buttonImageOnly: true,
            showAnim: "fold",
            changeYear: true,
            changeMonth: true,
            isBuddhist: true,
            //yearRange: '1980:' + new Date().getYear, //กำหนด scollbar ปีในปฎิทิน

            yearRange: '1900:' + new Date().getYear, //กำหนด scollbar ปีในปฎิทิน
            monthNamesShort: ['มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม']
        });

    } //End getDatePicker

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeNationality
    //Create Date :15/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขสัญชาติ
    //Parameter : n/a
    function displayDialogChangeNationality() {
        if ($("#rdChangeNationality").prop("checked")) {
            $("#fsChangeNationality").show("blind");
            $("#fsChangeTitle").hide("blind");
            $("#fsChangeID").hide("blind");
            $("#fsChangeBirthDate").hide("blind");
            $("#fsChangeGender").hide("blind");
        }
        else {
            $("#fsChangeNationality").hide("blind");
        }
    } //End displayDialogChangeNationality

    //Author: Anussara Wanwang
    //Method Name:displayDialogChangeGender
    //Create Date :15/10/2013
    //Description :ใช้แสดง/ซ่อน Dialog การขอแก้ไขเพศ
    //Parameter : n/a
    function displayDialogChangeGender() {
        if ($("#rdChangeGender").prop("checked")) {
            $("#fsChangeGender").show("blind");
            $("#fsChangeNationality").hide("blind");
            $("#fsChangeTitle").hide("blind");
            $("#fsChangeID").hide("blind");
            $("#fsChangeBirthDate").hide("blind");
        }
        else {
            $("#fsChangeGender").hide("blind");
        }
    } //End displayDialogChangeGender

    //Author: Anussara Wanwang
    //Method Name:displayDialogAddDocument
    //Create Date :15/10/2013
    //Description :
    //Parameter : n/a
    function displayDialogAddDocument() {
        if ($("#chkAddDocument").prop("checked")) {
            $("#fsAddDocument").show("blind");
        }
        else {
            $("#fsAddDocument").hide("blind");
            $("#txtDocName").val("");
            $("#divUploadFile").val("");
            showDocumentList("0");
        }

    }

    //Author: Anussara Wanwang
    //Method Name:saveRequestForm_old
    //Create Date :15/10/2013
    //Description :
    //Parameter : n/a
    function saveRequestForm_old() {
        if ($("#chkChangeName").prop("checked") || $("#chkChangeOther").prop("checked") || $("#chkChangeHomeAddr").prop("checked") || $("#chkChangeCurrAddr").prop("checked")) {

        }
        else {
            alert("กรุณาเลือกประเภทของใบคำร้อง");
            return;
        }

        if ($("#chkChangeName").prop("checked")) {
            if ($("#rdChangeName").prop("checked") || $("#rdEditName").prop("checked")) {
                if (($("#txtThaiName").val() == "") || ($("#txtThaiLastname").val() == "") || ($("#txtEName").val() == "") || ($("#txtELastname").val() == "")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
                else {
                    if ($("#rdChangeName").prop("checked")) {
                        $("#hddChangeName").val("1;" + $("#txtThaiName").val() + "|" + $("#txtThaiLastname").val() + "|" + $("#txtEName").val() + "|" + $("#txtELastname").val() + "#")
                    }
                    else {
                        $("#hddChangeName").val("2;" + $("#txtThaiName").val() + "|" + $("#txtThaiLastname").val() + "|" + $("#txtEName").val() + "|" + $("#txtELastname").val() + "#")
                    }
                }
            }
            else {
                alert("กรุณาเลือกประเภทของการแก้ไข");
                return;
            }
        }


        if (window.confirm("คุณต้องการยืนยันการยื่นใบคำร้องใช่หรือไม่?")) {
            var _Post = "action=saveRequestForm&changeName=" + $("#hddChangeName").val();
            alert(_Post);
            $.ajax({
                url: 'ExpectGraduateHandler.ashx',
                type: 'Post',
                data: _Post,
                charset: 'tis-620',
                success: function (data) {
                    //                    window.open("NewEditProfilesWebform.aspx","RequestForm");
                }
            });
        }
        else {
            alert("ใบคำร้องยังไม่ถูกบันทึก");
        }
    }

    //Author: Anussara Wanwang
    //Method Name:saveRequestForm
    //Create Date :15/10/2013
    //Description :ใช้บันทึกข้อมูลใบคำร้อง
    //Parameter : n/a
    function saveRequestForm() {

        //        if ($("#ddlQuarter").val() == "0" || $("#ddlQuarter").val() == "1") {
        //            alert("กรุณาเลือกภาคการศึกษา");
        //            return;
        //        }
        if ($("#chkChangeName").prop("checked") || $("#chkChangeOther").prop("checked") || $("#chkChangeHomeAddr").prop("checked") || $("#chkChangeCurrAddr").prop("checked")) {

        }
        else {
            alert("กรุณาเลือกประเภทของใบคำร้อง");
            return;
        }

        if ($("#chkChangeName").prop("checked")) {
            if ($("#rdChangeName").prop("checked") || $("#rdEditName").prop("checked")) {
                if (($("#txtThaiName").val() == "") || ($("#txtThaiLastname").val() == "") || ($("#txtEName").val() == "") || ($("#txtELastname").val() == "")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else {
                alert("กรุณาเลือกประเภทของการแก้ไข");
                return;
            }
        }
        if ($("#chkChangeOther").prop("checked")) {
            if ($("#rdChangeID").prop("checked")) {
                if (($("#txtID").val() == "")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else if ($("#rdChangeTitle").prop("checked")) {
                if (($("#ddlTitle").val() == "0") || ($("#ddlTitle").val() == "1")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else if ($("#rdChangeBirthDate").prop("checked")) {
                if (($("#txtDate").val() == "")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else if ($("#rdChangeNationality").prop("checked")) {
                if (($("#ddlNationality").val() == "0") || ($("#ddlNationality").val() == "1")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else if ($("#rdChangeGender").prop("checked")) {
                if (($("#ddlGender").val() == "0")) {
                    alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                    return;
                }
            }
            else {
                alert("กรุณาเลือกประเภทของการแก้ไข");
                return;
            }
        }
        if ($("#chkChangeHomeAddr").prop("checked")) {
            if (($("#txtHHomeNo").val() == "") || ($("#txtHRoad").val() == "") || ($("#txtHDistrict").val() == "") || ($("#txtHCanton").val() == "") || ($("#txtHProvince").val() == "") || ($("#txtHPostCode").val() == "") || ($("#txtHPhone").val() == "")) {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return;
            }
        }
        if ($("#chkChangeCurrAddr").prop("checked")) {
            if (($("#txtCHomeNo").val() == "") || ($("#txtCRoad").val() == "") || ($("#txtCDistrict").val() == "") || ($("#txtCCanton").val() == "") || ($("#txtCProvince").val() == "") || ($("#txtCPostCode").val() == "") || ($("#txtCPhone").val() == "")) {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return;
            }
        }

        if (window.confirm("คุณต้องการยืนยันการยื่นใบคำร้องใช่หรือไม่ ?")) {
            
            var _action = "RequestMainWebform.aspx?action=saveReqForm";
            $("#reqForm").prop("action", _action);
            $("#reqForm").submit();
        }
        else {
            alert("ใบคำร้องยังไม่ถูกบันทึก");
        }
    } //End saveRequestForm

    //Author: Anussara Wanwang
    //Method Name:useHomeAddr
    //Create Date :20/10/2013
    //Description :ใช้กำหนดค่าที่อยู่ปัจจุบันให้ตรงกับที่อยู่ตามทะเบียนบ้าน
    //Parameter : n/a
    function useHomeAddr() {
        if ($("#chkUseHomeAddr").prop("checked")) {
            if ($("#chkChangeHomeAddr").prop("checked")) {
                if (($("#txtHHomeNo").val() == "") || ($("#txtHRoad").val() == "") || ($("#txtHDistrict").val() == "") || ($("#txtHCanton").val() == "") || ($("#ddlHProvince").val() == "") || ($("#txtHPostCode").val() == "") || ($("#txtHPhone").val() == "")) {
                    alert("กรุณากรอกข้อมูลที่อยู่ตามทะเบียนบ้านให้ครบถ้วน");
                    $("#chkUseHomeAddr").removeAttr("checked", "checked");
                    return;
                }
                else {
                    $("#txtCHomeNo").val($("#txtHHomeNo").val());
                    $("#txtCMoo").val($("#txtHMoo").val());
                    $("#txtCVillageName").val($("#txtHVillageName").val());
                    $("#txtCAlley").val($("#txtHAlley").val());
                    $("#txtCRoad").val($("#txtHRoad").val());
                    $("#txtCDistrict").val($("#txtHDistrict").val());
                    $("#txtCCanton").val($("#txtHCanton").val());
                    $("#ddlCProvince").val($("#ddlHProvince").val());
                    $("#txtCPostCode").val($("#txtHPostCode").val());
                    $("#txtCPhone").val($("#txtHPhone").val());
                }
            }
            else {

            }
        }
        else {
            $("#txtCHomeNo").val("");
            $("#txtCMoo").val("");
            $("#txtCVillageName").val("");
            $("#txtCAlley").val("");
            $("#txtCRoad").val("");
            $("#txtCDistrict").val("");
            $("#txtCCanton").val("");
            $("#txtCProvince").val("");
            $("#txtCPostCode").val("");
            $("#txtCPhone").val("");
        }
    }

    //Author: Anussara Wanwang
    //Method Name:showDocumentList
    //Create Date :20/10/2013
    //Description :ใช้แสดงรายการเอกสารแนบประกอบใบคำร้องทั้งหมด
    //Parameter : n/a
    function showDocumentList(_reqFormNo) {
        var _quarter = $("#hddQuarter").val();
        var _StudentID = $("#hddStudentID").val();
        var _url = "ExpectGraduateHandler.ashx";
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
    //Create Date :20/10/2013
    //Description :ใช้บันทึกเอกสารแนบประกอบใบคำร้องไปยัง server
    //Parameter : n/a
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
                $("#reqForm").prop("action", "ExpectGraduateHandler.ashx?action=SaveProjectDocument&docName=" + _docName + "&quarter=" + _quarter + "&student=" + _studentID + "&reqFormNo=" + _reqFormNo);
                $("#reqForm").submit();
                $("#txtDocName").val("");
                document.getElementById('divUploadFile').innerHTML = document.getElementById('divUploadFile').innerHTML;
            }

        }
    } //End SaveNewDoc


    //Author: Anussara Wanwang
    //Method Name:ResponseBeforeUpload
    //Create Date :20/10/2013
    //Description : ใช้ตรวจสอบเอกสารก่อนทำการ upload
    //Parameter : n/a
    function ResponseBeforeUpload(_data, _genReqFormNo) {
        alert(_data);
        setTimeout("showDocumentList('" + _genReqFormNo + "')", 1200);
    }

    //Author: Anussara Wanwang
    //Method Name:OpenFile
    //Create Date :20/10/2013
    //Description :ใช้เปิดเอกสารแนบประกอบใบคำร้องเพื่อทำการตรวจสอบ
    //Parameter : n/a
    function OpenFile(_documentLink) {
        window.open(_documentLink);
    } //End OpenFile

    //Author: Anussara Wanwang
    //Method Name:delDocument
    //Create Date :20/10/2013
    //Description :ใช้เพื่อทำการลบเอกสารแนบประกอบใบคำร้อง
    //Parameter : n/a
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
    //Method Name:displayDialogAttachFile
    //Create Date :20/10/2013
    //Description :ใช้แสดง Dialog การแนบเอกสารประกอบใบคำร้อง
    //Parameter : n/a
    function displayDialogAttachFile(_studentId, _quarter, _reqFormNo) {
        $("#hddStudentID").val(_studentId);
        $("#hddQuarter").val(_quarter);
        $("#hddReqFormNo").val(_reqFormNo);
        $("#divOpenDoc").dialog("open")
    }

    //Author: Anussara Wanwang
    //Method Name:showStudentReqform
    //Create Date :20/10/2013
    //Description :ใช้แสดงใบคำร้องของนักศึกษา
    //Parameter : n/a
    function showStudentReqform() {
        var _studentID = $("#hddStudentID").val();
        var _quarter = $("#hddQuarter").val();
        var _reqFormNo = $("#hddReqFormNo").val();
        window.location = "NewEditProfilesWebform.aspx?studentid=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo;
        //             window.open("NewEditProfilesWebform.aspx?studentid=" + _studentID + "&quarter=" + _quarter + "&reqFormNo=" + _reqFormNo);
        //             window.open("", "_self"); 
        //             window.close();
    }

    //Author: Anussara Wanwang
    //Method Name:showAlertErrorReqform
    //Create Date :20/10/2013
    //Description :
    //Parameter : n/a
    function showAlertErrorReqform() {
        alert("บันทึกข้อมูลใบคำร้องไม่สำเร็จ กรุณากรอกข้อมูลใหม่อีกครั้ง")
        return false;
    }

    //Author: Anussara Wanwang
    //Method Name:setEditInformationStatus
    //Create Date :20/10/2013
    //Description :
    //Parameter : n/a
    function setEditInformationStatus() {
        var _url = "ExpectGraduateHandler.ashx";
        var _data = {
            action: "setEditInformation"
        }
        var _success = function (data) {
            if (data == 0) {
                saveRequestForm();
            } else {
                alert("นักศึกษามีใบคำร้องอยู่อยู่ในระบบแล้ว ดำเนินการยกเลิกใบคำร้อง");
                window.location = "EditRequestFormWebform.aspx";
            }

        }
        webAjax(_url, _data, _success);

    }

    function ddlTitle_onclick() {

    }

</script>
