using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manageusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadduser_Click(object sender, EventArgs e)
    {
        users regobj = new users();
        regobj.name = txtName.Text;
        regobj.username = txtUseranme.Text;
        regobj.password = txtPassword.Text;
        regobj.user_level = Convert.ToInt32(listUserlevel.SelectedItem.Value);
        regobj.Register();
        if (regobj.status_msg != "")
        {
            msgLabel.Text = "<label class='label-success'>" + regobj.status_msg + "</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label-success'>" + "Connection error or User already exits!" + "</label>";
        }
    }
}