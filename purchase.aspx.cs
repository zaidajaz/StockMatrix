using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAnotherItem_Click(object sender, EventArgs e)
    {
        int groupID = Convert.ToInt32(lstItemGroup.SelectedItem.Value);
        int stockID = Convert.ToInt32(lstItemName.SelectedItem.Value);
        double qty = Convert.ToDouble(txtsaleQty.Text);
        double rate = Convert.ToDouble(txtsaleRate.Text);
        double amount = Convert.ToDouble(txtsaleAmount.Text);
        double vatp = Convert.ToDouble(txtsaleVatpercent.Text);
        double vatamt = Convert.ToDouble(txtsaleVatamount.Text);
        double extra = Convert.ToDouble(txtsaleExtra.Text);
        double discount = Convert.ToDouble(txtsaleDiscount.Text);
        double total = Convert.ToDouble(txtsaleTotal.Text);

        addtoTemp tempobj = new addtoTemp();
        tempobj.addtoPurchaseTemp(groupID, stockID, qty, rate, amount, vatp, vatamt, extra, discount, total);
        if (tempobj.status_msg != null)
        {
            msgLabel.Text = "<label class='label label-danger'>" + tempobj.status_msg + "</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label label-success'> Item added to bill </label>";
        }
    }
}