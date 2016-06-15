using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;



public class addtoTemp
{
    public string status_msg{get;set;}
    public void addtoSalesTemp(int groupId,int stockId,double qty,double rate,double amt,double vatp,double vatamt,double extra,double discount,double total)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into tempSales (group_id,stock_id,qty,rate,amount,vatp,vatamt,extra,discount,total) values("+groupId+","+stockId+","+qty+","+rate+","+amt+","+vatp+","+vatamt+","+extra+","+discount+","+total+")";
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
            status_msg = "Something Went Wrong!";
        }
    }
    public void addtoPurchaseTemp(int groupId, int stockId, double qty, double rate, double amt, double vatp, double vatamt, double extra, double discount, double total)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into tempPurchase (group_id,stock_id,qty,rate,amount,vatp,vatamt,extra,discount,total) values(" + groupId + "," + stockId + "," + qty + "," + rate + "," + amt + "," + vatp + "," + vatamt + "," + extra + "," + discount + "," + total + ")";
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
            status_msg = "Something Went Wrong";
        }
    }
}