<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewEditProfilesWebform.aspx.cs" Inherits="Student_NewEditProfilesWebform" %>

<!DOCTYPE html>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/MyStyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/web.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../images/logo1.png" sizes="32x32" />
        <style type="text/css">
        .underline
        {
            border-bottom: 1px dotted;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:900px;" class="font14px" align='center' border='0'>
            <tr>
                <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;สำหรับนักศึกษาที่คาดว่าจะสำเร็จการศึกษา</td>
                <td align="center"><img alt="" height="80" src="../images/MU-Logo.jpg" width="80" /></td>
                <td style="font-size:20px;color:Red;"><strong><asp:Label ID="lbalert" runat="server"></asp:Label></strong></td>
            </tr>
            <tr style="height:25px">
                <td></td>
                <td></td>
                <td style="font-size:18px;" align="center">ใบคำร้อง</td>
                <td></td>
            </tr>
            <tr style="height:25px">
                <td style="width:100px;"></td>
                <td style="width:200px;"></td>
                <td style="width:250px;"></td>
                <td style="width:250px;">
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:15%;">วันที่</td>
                            <td class="ui-Underline-Html" style="width:15%;">
                                <asp:Label ID="lbDay" runat="server" ></asp:Label>
                            </td>
                            <td style="width:15%;">เดือน</td>
                            <td class="ui-Underline-Html" style="width:20%;">
                                <asp:Label ID="lbMonth" runat="server"></asp:Label>
                            </td>
                            <td style="width:15%;">พ.ศ.</td>
                            <td class="ui-Underline-Html" style="width:20%;">
                                <asp:Label ID="lbYear" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;เรียน
                </td>
                <td>
                    ผู้อำนวยการกองบริหารการศึกษา
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr style="height:25px">
                <td>
                </td>
                <td>
                    ข้าพเจ้า (นาย/นาง/นางสาว)
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbStdName" runat="server"></asp:Label>
                    &nbsp;</td>
                <td align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:40%" align="left">
                                รหัสประจำตัว
                            </td>
                            <td style="width:60%" class="ui-Underline-Html">
                                <asp:Label ID="lbStdID" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;คณะ
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbFaculty" runat="server"></asp:Label>
                    &nbsp;</td>
                <td>
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:25%;">
                                สาขาวิชา
                            </td>
                            <td style="width:75%;" class="ui-Underline-Html">
                                <asp:Label ID="lbProgram" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr style="height:25px">
                            <td style="width:20%;">
                                ชั้นปีที่
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbClass" runat="server"></asp:Label>
                            </td>
                            <td style="width:15%;">
                                โทรศัพท์
                            </td>
                            <td style="width:50%;" class="ui-Underline-Html">
                                <asp:Label ID="lbPhone" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td colspan="2">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:80%;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;และคาดว่าจะสำเร็จการศึกษาในปีการศึกษา
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html"> 
                                &nbsp;<asp:Label ID="lbGradeYear" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table> 
                </td>
                <td colspan="2">
                    มีความประสงค์ขอแก้ไขประวัตินักศึกษา เพื่อใช้เป็นข้อมูลในการจัดทำเอกสารสำคัญทางการศึกษา
                </td>
            </tr>
            <tr style="height:25px">
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;และคลังข้อมูลศิษย์เก่าของมหาวิทยาลัยที่ถูกต้อง ดังนี้
                </td>
            </tr>
            <tr style="height:25px">
                <td align="right">
                    <input id="chkChangeName" runat="server" type="checkbox" disabled="disabled" />
                </td>
                <td colspan="3">
                    1. ขอเปลี่ยนชื่อ - ชื่อสกุล โดยแก้ไข ดังนี้(ตามสำเนาหลักฐานการเปลี่ยนชื่อ/ชื่อสกุลที่แนบมาพร้อมนี้)
                </td>
            </tr>
            <tr style="height:25px">
                <td>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ/สกุลภาษาไทย จากเดิม
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbOldCThaiName" runat="server"></asp:Label>
                    &nbsp;</td>
                <td align="left">
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:10%;">
                                เป็น
                            </td>
                            <td class="ui-Underline-Html" style="width:90%;">
                                <asp:Label ID="lbNewCThaiName" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                
            </tr>
            <tr style="height:25px">
                <td>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ/สกุลภาษาอังกฤษ จากเดิม
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbOldCEngName" runat="server"></asp:Label>
                    &nbsp;</td>
                <td align="left">
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:10%;">
                                เป็น
                            </td>
                            <td class="ui-Underline-Html" style="width:90%;">
                                <asp:Label ID="lbNewCEngName" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td align="right">
                    <input id="chkEditName" runat="server" type="checkbox" disabled="disabled" />
                </td>
                <td colspan="3">
                    2. ขอแก้ไขตัวสะกด ชื่อ - ชื่อสกุล ภาษาไทย/ภาษาอังกฤษ โดยแก้ไข ดังนี้
                </td>
            </tr>
            <tr style="height:25px">
                <td>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ/สกุลภาษาไทย จากเดิม
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbOldEThaiName" runat="server"></asp:Label>
                    &nbsp;</td>
                <td>
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:10%;">
                                เป็น
                            </td>
                            <td class="ui-Underline-Html" style="width:90%;">
                                <asp:Label ID="lbNewEThaiName" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อ/สกุลภาษาอังกฤษ จากเดิม
                </td>
                <td class="ui-Underline-Html">
                    <asp:Label ID="lbOldEEngName" runat="server"></asp:Label>
                    &nbsp;</td>
                <td>
                    <table width="100%">
                        <tr style="height:25px">
                            <td style="width:10%;">
                                เป็น
                            </td>
                            <td class="ui-Underline-Html" style="width:90%;">
                                <asp:Label ID="lbNewEEngName" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px">
                <td align="right">
                    <input id="chkOther" runat="server" type="checkbox" disabled="disabled" />
                </td>
                <td colspan="2">
                    3. ขอแก้ไขตัวเลขที่บัตรประชาชน/คำนำหน้านาม/วันเดือนปีเกิด/สัญชาติ/เพศ
                </td>
                <td>
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:20%;">
                                จากเดิม
                            </td>
                            <td style="width:80%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldEditOther" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="2" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                เป็น
                            </td>
                            <td class="ui-Underline-Html" style="width:95%;">
                                <asp:Label ID="lbNewEditOther" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>
                    (ตามสำเนาบัตรประชาชน/หลักฐานของทางราชการที่แนบมาพร้อมนี้)
                </td>
            </tr>
            <tr style="height:25px;">
                <td align="right">
                    <input id="chkHomeAddr" runat="server" type="checkbox" disabled="disabled" />
                </td>
                <td>
                    4. ขอแก้ไขที่อยู่ตามทะเบียนบ้าน
                </td>
                <td colspan="2">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:20%;">
                                จากเดิม บ้านเลขที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHHomeNo" runat="server"></asp:Label> 
                                &nbsp;</td>
                            <td style="width:10%;">
                                หมู่ที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHMoo" runat="server"></asp:Label>
                                <span id="spOldMoo">&nbsp;</span></td>
                            <td style="width:20%;">
                                ชื่อหมู่บ้าน/อื่นๆ
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHVillage" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                ซอย
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHAlley" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                ถนน
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHRoad" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                แขวง/ตำบล
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHDistrict" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                เขต/อำเภอ
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHCanton" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                จังหวัด
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHProvince" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                รหัสไปรษณีย์
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHPostCode" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:15%;">
                                โทรศัพท์บ้าน/มือถือ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldHPhone" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:15%;">
                                เป็น บ้านเลขที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHHomeNo" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                หมู่ที่
                            </td>
                            <td style="width:5%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHMoo" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:15%;">
                                ชื่อหมู่บ้าน/อื่นๆ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHVillage" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                ซอย
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHAlley" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;"> 
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                ถนน
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHRoad" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                แขวง/ตำบล
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHDistrict" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                เขต/อำเภอ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHCanton" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                จังหวัด
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHProvince" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                รหัสไปรษณีย์
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHPostCode" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:15%;">
                                โทรศัพท์บ้าน/มือถือ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewHPhone" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td align="right">
                    <input id="chkCurrAddr" runat="server" type="checkbox" disabled="disabled" />
                </td>
                <td>
                    5. ขอแก้ไขที่อยู่ปัจจุบัน
                </td>
                <td colspan="2">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:20%;">
                                จากเดิม บ้านเลขที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCHomeNo" runat="server"></asp:Label> 
                                &nbsp;</td>
                            <td style="width:10%;">
                                หมู่ที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCMoo" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:20%;">
                                ชื่อหมู่บ้าน/อื่นๆ
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCVillage" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                ซอย
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCAlley" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                ถนน
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCRoad" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                แขวง/ตำบล
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCDistrict" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                เขต/อำเภอ
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCCanton" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                จังหวัด
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCProvince" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                รหัสไปรษณีย์
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCPostCode" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:15%;">
                                โทรศัพท์บ้าน/มือถือ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbOldCPhone" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:15%;">
                                เป็น บ้านเลขที่
                            </td>
                            <td style="width:10%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCHomeNo" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                หมู่ที่
                            </td>
                            <td style="width:5%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCMoo" runat="server"></asp:Label>
                                <span id="spNewCMoo">&nbsp;</span></td>
                            <td style="width:15%;">
                                ชื่อหมู่บ้าน/อื่นๆ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCVillage" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:5%;">
                                ซอย
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCAlley" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;"> 
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                ถนน
                            </td>
                            <td style="width:20%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCRoad" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                แขวง/ตำบล
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCDistrict" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                เขต/อำเภอ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCCanton" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="3" align="left">
                    <table width="100%">
                        <tr style="height:25px;">
                            <td style="width:5%;">
                                จังหวัด
                            </td>
                            <td style="width:30%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCProvince" runat="server"></asp:Label>
                                &nbsp;</td>
                            <td style="width:10%;">
                                รหัสไปรษณีย์
                            </td>
                            <td style="width:15%;" class="ui-Underline-Html">
                                &nbsp;<asp:Label ID="lbNewCPostCode" runat="server"></asp:Label>
                            </td>
                            <td style="width:15%;">
                                โทรศัพท์บ้าน/มือถือ
                            </td>
                            <td style="width:25%;" class="ui-Underline-Html">
                                <asp:Label ID="lbNewCPhone" runat="server"></asp:Label>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height:25px;">
                <td>
                </td>
                <td colspan="2" align="left">
                    <table>
                        <tr style="height:25px;">
                            <td>
                                ข้าพเจ้ายินดีชำระค่าธรรมเนียม จำนวน
                            </td>
                            <td class="ui-Underline-Html" style="width:50px;">
                                <span id="spFeeAmount">&nbsp;&nbsp;20</span></td>
                            <td style="width:10px;">
                                บาท
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                                ลงชื่อ
                            </td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                                &nbsp;</td>
                            <td width='18%' align='left'>
                                (นักศึกษาผู้ยื่นคำร้อง)
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                                &nbsp;</td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                             <span id='spStdName' runat='server' >&nbsp;</span></td>
                            <td width='18%' align='center'>
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                                ลงชื่อ
                            </td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                                &nbsp;</td>
                            <td width='18%' align='left'>
                                (เจ้าหน้าที่ส่วนงานผู้รับเรื่อง)
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                            </td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                                &nbsp;</td>
                            <td width='18%' align='center'>
    
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                                ลงชื่อ
                            </td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                                &nbsp;</td>
                            <td width='18%' align='left'>
                                (เจ้าหน้าที่กองบริหารการศึกษา)
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td colspan='4'>
                    <table width='100%'>
                        <tr>
                            <td width='60%' align='right'>
                            </td>
                            <td width='22%' align='center' class='ui-Underline-Html'>
                                &nbsp;</td>
                            <td width='18%' align='center'>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
    <table border="0" cellpadding="0" cellspacing="0"  align=center>
    <tr><td style="font-size:40px;color:Red;"><strong><asp:Label ID="lbalert1" runat="server"></strong></asp:Label></td></tr>
    </table>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //getReqFormDetail();
    });

    //Author: Anussara Wanwang
    //Method Name:getReqFormDetail 
    //Create Date :10/11/2013
    //Description : แสดงใบคำร้องสำหรับพิมพ์
    //Parameter : n/a
    function getReqFormDetail() {
        alert($("#hddReqFormNo").val());
    }

</script>
