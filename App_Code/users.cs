using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Manages login and registeration of users to the application
/// </summary>
public class users
{
    public int user_id {get;set;}
    public String username { get; set; }
    public String password { get; set; }
    public String name { get; set; }
    public int user_level { get; set; }
    public int location_id{get;set;}
    public String status_msg;

    public void login()
    {
        if (username != "")
        {
            if (password != "")
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
                SqlCommand cmd = new SqlCommand();

                String command = "select * from users where username = '" + username + "'";
                cmd.CommandText = command;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            if (this.password == dr["pass"].ToString())
                            {
                                this.user_id = Convert.ToInt32(dr["id"]);
                                this.name = dr["name"].ToString();
                                this.user_level = Convert.ToInt32(dr["user_level"]);
                                status_msg = "login successful";
                            }
                            else
                            {
                                status_msg = "Incorrect Password!";
                            }
                        }
                    }
                    else
                    {
                        status_msg = "User does not exist";
                    }
                    con.Close();
                }
                catch
                {
                    status_msg = "Something Went Wrong!";
                }
            }
            else
            {
                status_msg = "Please enter password";
            }
        }
        else
        {
            status_msg = "Please enter username";
        }
    }

    public void Register()
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conSM"].ToString());
        SqlCommand cmd = new SqlCommand();

        String command = "insert into users (username,name,pass,user_level) values('"+username+"','"+name+"','"+password+"',"+user_level+")";
        cmd.CommandText = command;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            status_msg = "User Successfully Registered";
        }
        catch
        {
            status_msg = "";
        }
    }
}