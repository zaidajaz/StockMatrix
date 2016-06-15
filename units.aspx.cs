using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class units : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void unitAdd_Click(object sender, EventArgs e)
    {
        DatabaseFunctions unitsobj = new DatabaseFunctions();
        unitsobj.unit_name = newUnitname.Text;
        unitsobj.AddNewUnit();
        if (unitsobj.status_msg != "Something Went Wrong!")
        {
            msgLabel.Text = "<label class='label label-success'>" + unitsobj.status_msg + "</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label label-danger'>" + unitsobj.status_msg + "</label>";
        }
    }
}