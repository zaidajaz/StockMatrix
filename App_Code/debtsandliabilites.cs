using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Summary description for debtsandliabilites
/// </summary>
public class debtsandliabilites
{
    public void clearDebt(int id)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "update sales set sales_type='Cash' where trans_id = " + id ;
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

    public void clearLiability(int id)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "update purchase set purchase_type ='Cash' where trans_id = " + id;
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch
        {
        }
    }

}