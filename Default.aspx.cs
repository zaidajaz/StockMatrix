using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != null)
        {
            Response.Redirect("home.aspx");
        }
    }
    protected void loginButton_Click(object sender, EventArgs e)
    {
        users userobj = new users();
        userobj.username = txtUsername.Text;
        userobj.password = txtPassword.Text;
        userobj.login();
        if (userobj.status_msg == "login successful")
        {
            Session["login"] = userobj;
            Response.Redirect("home.aspx");
        }
        status_msg.Text = userobj.status_msg;
    }
}