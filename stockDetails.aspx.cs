using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stockDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnQueryStock_Click(object sender, EventArgs e)
    {
        Double totalQty = 0;
        DatabaseFunctions queryobj = new DatabaseFunctions();
        queryobj.stock_id = Convert.ToInt32(itemName.SelectedItem.Value);
        System.Data.SqlClient.SqlDataReader dr = queryobj.QueryStock();
        if (dr != null)
        {
            dataTable.Text = "<table class='table table-responsive'>";
            dataTable.Text += "<tr><td>Location Name</td><td>Quantity</tr></th>";
            while (dr.Read())
            {
                dataTable.Text += "<tr><td>" + dr["location_name"] + "</td>";
                dataTable.Text += "<td>" + dr["qty"] + "</td></tr>";
                totalQty += Convert.ToDouble(dr["qty"]);
            }
            dataTable.Text += "</table><b>Total Quantity: </b>" + totalQty.ToString();
        }
        if (queryobj.status_msg != "Something Went Wrong!")
        {
            msgLabel.Text = "<label class='label label-success'>" + queryobj.status_msg + "</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label label-danger'>" + queryobj.status_msg + "</label>";
        }
    }
}