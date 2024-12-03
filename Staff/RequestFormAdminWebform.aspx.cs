using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//using DBConnection;
//using MUEIS;
using System.IO;
/// <summary>
/// Class name:RequestFormSystem_EditRequestFormWebform
/// Author: Anussara Wanwang
/// Create date: 06-10-2013
/// Description:สำหรับเรียกใช้ function ที่ใช้กับ HTML
/// </summary>
public partial class RequestFormSystem_EditRequestFormWebform : System.Web.UI.Page
{
    string _StaffID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //เรียกใช้ class Header
        PanelRequestStaff.AddJQuery(Page);
        Login _login = new Login("staff");
        _StaffID = _login.Username;
        string _authen = _login.Authen;

        if (_authen == "true")
        {
            divUserStaff.InnerHtml = _StaffID;
        }
        else
        {
            Response.Redirect("http://www.student.mahidol.ac.th/studentauthen/stafflogin.aspx");
        }

    }

    /// <summary>
    /// Method Name :getDdlQuarter
    /// Author: Anussara Wanwang
    /// Create date: 10-10-2013
    /// Description:แสดงภาคการศึกษาใน ddl
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public string getDdlQuarter()
    {
        string _query = "select distinct Quarter" +
                        " from MUEIS..RequestForm" +
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
    /// Description:แสดงคณะใน ddl
    /// Parameter : n/a
    /// </summary>
    /// <returns></returns>
    public string getDdlFaculty()
    {
        //string _stdID = "5324046";
        string _query = "select *" +
                        " from MUStudent..BFaculty" +
                        " where CancelStatus = '0'";
        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);

        System.Web.UI.HtmlControls.HtmlSelect ddlFaculty = new System.Web.UI.HtmlControls.HtmlSelect();
        ddlFaculty.Attributes["id"] = "ddlFaculty";
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
            ddlFaculty.Items.Add(new ListItem("--ไม่พบข้อมูลคณะ--", "1"));
        }

        _ds.Dispose();
        _adp.Dispose();

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        System.IO.StringWriter stWriter = new System.IO.StringWriter(sb);
        System.Web.UI.HtmlTextWriter htmlWriter = new System.Web.UI.HtmlTextWriter(stWriter);
        ddlFaculty.RenderControl(htmlWriter);

        return sb.ToString();
    }

}