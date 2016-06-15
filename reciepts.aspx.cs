using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reciepts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvdebts_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(gvdebts.SelectedRow.Cells[3].Text);
        debtsandliabilites debt = new debtsandliabilites();
        debt.clearDebt(id);
        Response.Redirect("reciepts.aspx");
    }
}