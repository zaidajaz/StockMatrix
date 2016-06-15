using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Manage Sales, purchases and transfers
/// </summary>
public class transactons
{
    public string statusMsg { get; set; }
    public void logsales(double amt, int locID, string particulars,string salesType)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;
        cmd.CommandText = "logSales";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@amount",amt);
        cmd.Parameters.Add("@locId",locID);
        cmd.Parameters.Add("@particulars",particulars);
        cmd.Parameters.Add("@sales_type",salesType);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            statusMsg = "Sales logged successfully!";
            con.Close();
        }
        catch
        {
            statusMsg = "";
        }
    }

    public void logPurchase(double amt, int locID, string particulars, string purchaseType)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;
        cmd.CommandText = "logPurchase";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@amount", amt);
        cmd.Parameters.Add("@locId", locID);
        cmd.Parameters.Add("@particulars", particulars);
        cmd.Parameters.Add("@purchase_type", purchaseType);

            con.Open();
            cmd.ExecuteNonQuery();
            statusMsg = "Purchase logged successfully!";
            con.Close();
    }
    public void logTransfer(int stockId, int fromLoc, int toLoc, float qty)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = con;
        cmd.CommandText = "tranferStock";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@stockId", stockId);
        cmd.Parameters.Add("@fromLoc", fromLoc);
        cmd.Parameters.Add("@toLoc", toLoc);
        cmd.Parameters.Add("@qty", qty);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            statusMsg = "Transfer Successful";
            con.Close();
        }
        catch(Exception e)
        {
            statusMsg = e.Message;
        }
    }
}