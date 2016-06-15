using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class salesvoucher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        int i=0;
        double grandTotal = 0;
        while (i < GridView1.Rows.Count)
        {
          grandTotal = grandTotal + Convert.ToDouble(GridView1.Rows[i].Cells[8].Text);
          i++;
        }
         lblgrandTotal.Text = grandTotal.ToString();

    }
    protected void btnsaveSales_Click(object sender, EventArgs e)
    {
        transactons sales = new transactons();

        sales.logsales(Convert.ToDouble(lblgrandTotal.Text), Convert.ToInt32(listSaleslocation.SelectedItem.Value), txtparticulars.Text,listSalestype.SelectedItem.Value);
        if (sales.statusMsg != "")
        {
            Response.Write("<script>"+sales.statusMsg+"</script>");
        }
        else
        {
            Response.Write("<script>" + "Something went wrong!" + "</script>");
        }

    }
}