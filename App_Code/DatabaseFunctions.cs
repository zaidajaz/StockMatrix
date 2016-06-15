using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


/// <summary>
/// Includes all the funtions for database connections and queries for StockMatrix
/// </summary>
public class DatabaseFunctions
{
	public DatabaseFunctions()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public String location_name { get; set; }
    public String location_type { get; set; }
    public String status_msg { get; set; }
    public String unit_name { get; set; }
    public String group_name { get; set; }
    public int group_id { get; set; }
    public int unit_id { get; set; }
    public String item_name { get; set; }
    public int stock_id { get; set; }
    public int qty { get; set; }


    public void AddNewLocation()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into location (location_name,location_type) values('"+location_name+"','"+location_type+"')";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            status_msg = "Location Added Successfully";
        }
        catch
        {
            status_msg = "Something Went Wrong!";
        }
    }

    public void AddNewUnit()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into units (unit_name) values('" + unit_name + "')";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            status_msg = "Unit Added Successfully";
        }
        catch
        {
            status_msg = "Something Went Wrong!";
        }
    }
    public void AddNewGroup()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into stock_group (group_name) values('" + group_name + "')";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            status_msg = "Group Added Successfully";
        }
        catch
        {
            status_msg = "Something Went Wrong!";
        }
    }
    public void AddNewItem()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into stock (item_name,group_id,unit_id) values('" + item_name + "',"+group_id+", "+unit_id+")";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            cmd.CommandText = "fillstDiv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            con.Close();
            status_msg = "Item Added Successfully";
        }
        catch
        {
            status_msg = "Something Went Wrong!";
        }
    }

    public SqlDataReader QueryStock()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        String command = "select s.qty, l.location_name from stock_div s join location l on s.loc_id = l.location_id where s.stock_id = "+stock_id +";";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return dr;
            }
            else
            {
                status_msg = "No purchase made yet!";
                con.Close();
                return null;
            }
        }
        catch
        {
            con.Close();
            status_msg = "Something Went Wrong!";
            return null;
        }
    }

}