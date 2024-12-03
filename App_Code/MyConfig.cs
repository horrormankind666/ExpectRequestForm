using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MyConfig
/// </summary>
public class MyConfig
{
    public MyConfig()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-02-12
    /// Method : ExecuteDb()
    /// Param : string _query=คำสั่ง SQL Command
    /// Description : เชื่อมต่อฐานข้อมูลเพื่อ Run Query 
    /// </summary>
    public static DataSet ExecuteDb(string _query)
    {

        SqlDataAdapter _adp = new SqlDataAdapter(_query, MyConfig.GetConnect());
        DataSet _ds = new DataSet();
        _adp.Fill(_ds);
        return _ds;

    }

    /// <summary>
    /// Author : Thanakrit.tae
    /// Create Date : 2014-02-12
    /// Method : GetConnect()
    /// Param : n/a
    /// Description : ใช้สำหรับเชื่อมต่อกับฐานข้อมูล
    /// </summary>
    /// <returns></returns>
    public static SqlConnection GetConnect()
    {
        SqlConnection _con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());
        return _con;
    }

    //ExecuteSqlParam DataSet 
    public static DataSet ExecuteSqlParam(string _query, CommandType _cmdType, params SqlParameter[] _parameters)
    {
        DataSet _ds = new DataSet();

        using (SqlConnection _conn = GetConnect())
        {
            SqlCommand _cmd = new SqlCommand(_query);
            _cmd.Connection = _conn;
            _cmd.CommandType = _cmdType;
            _cmd.CommandText = _query;

            foreach (var _parameter in _parameters)
            {
                if (_parameter.Value == null)
                    _parameter.SqlValue = "";

                _cmd.Parameters.Add(_parameter);
            }

            SqlDataAdapter _da = new SqlDataAdapter(_cmd);
            _da.Fill(_ds);
            _cmd.Dispose();
            _conn.Dispose();
        }

        return _ds;
    }
}