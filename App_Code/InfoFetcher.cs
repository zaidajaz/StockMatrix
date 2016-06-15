using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Fetches reqiured homepage info
/// </summary>
public class InfoFetcher
{
    public double getTotalSales()
    {
        double amount = 0;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "select sum(trans_amount) from transDetails where trans_type = 'sales' and Convert(date,trans_date) = Convert(date,GETDATE())";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            amount = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();
            return amount;
        }
        catch
        {
            return 0;
        }
    }
    public double getTotalPurchase()
    {
        double amount = 0;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "select sum(trans_amount) from transDetails where trans_type = 'purchase' and Convert(date,trans_date) = Convert(date,GETDATE())";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            amount = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();
            return amount;
        }
        catch
        {
            return 0;
        }
    }
    public double getTotalLiabilities()
    {
        double amount = 0;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "select sum(td.trans_amount) from transDetails td join purchase p on td.trans_id = p.trans_id where p.purchase_type = 'Credit';";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            amount = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();
            return amount;
        }
        catch
        {
            return 0;
        }
    }
    public double getTotalDebts()
    {
        double amount = 0;
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "select sum(td.trans_amount) from transDetails td join sales p on td.trans_id = p.trans_id where p.sales_type = 'Credit';";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            amount = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();
            return amount;
        }
        catch
        {
            return 0;
        }
    }
}