using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for erfExpectReqDB
/// </summary>
public class erfExpectReqDB
{
    public erfExpectReqDB()
    {
       
    }
    public static DataSet Sp_expStudentInfo(string _studentId)
    {
        SqlParameter[] _params = new SqlParameter[1];
        _params[0] = new SqlParameter("@studentId", _studentId);
        string _query = "infinity..sp_expStudentInfo @studentId";
        return MyConfig.ExecuteSqlParam(_query, CommandType.Text, _params);

    }
}