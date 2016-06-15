using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class locations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DatabaseFunctions locobj = new DatabaseFunctions();
        locobj.location_name = newLocationName.Text;
        locobj.location_type = locType.SelectedItem.Text;
        locobj.AddNewLocation();
        if (locobj.status_msg != "Something Went Wrong!")
        {
            msgLabel.Text = "<label class='label label-success'>" + locobj.status_msg + "</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label label-danger'>" + locobj.status_msg + "</label>";
        }
    }
}