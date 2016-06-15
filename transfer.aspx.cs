using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class transfer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTransferStock_Click(object sender, EventArgs e)
    {
        transactons transfer = new transactons();
        try
        {
            transfer.logTransfer(Convert.ToInt32(itemName.SelectedItem.Value), Convert.ToInt32(listFrom.SelectedItem.Value), Convert.ToInt32(listTo.SelectedItem.Value), Convert.ToInt32(txtTransferQty.Text));
            if (transfer.statusMsg != "")
            {
                msgLabel.Text = "<label class='label label-success'>"+transfer.statusMsg+"</label>";
            }
            else
            {
                msgLabel.Text = "<label class='label label-danger'>"+msgLabel.Text+"</label>";
            }
        }
        catch
        {
            msgLabel.Text = "Invalid Input";
        }
    }
}