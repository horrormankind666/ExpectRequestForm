using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_EditRequestFormWebform : System.Web.UI.Page
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
            divUserStaff.InnerHtml = _studentCode;
            hddStudentID.Value = _studentCode;

        }//End Authen
        else
        {
            Response.Redirect("https://smartedu.mahidol.ac.th/authen/login.aspx");
        }//End No Authen
    }
}