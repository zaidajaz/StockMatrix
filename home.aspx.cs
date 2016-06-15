using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string msg = (string)Application["msg"];
        chatLabel.Text = msg;
        InfoFetcher infoObj = new InfoFetcher();
        lblTotalSale.Text = toolsandfilters.convertToK(infoObj.getTotalSales());
        lbltotalPurchase.Text = toolsandfilters.convertToK(infoObj.getTotalPurchase());
        lblTotalLiabilities.Text = toolsandfilters.convertToK(infoObj.getTotalLiabilities());
        lblTotalDebts.Text = toolsandfilters.convertToK(infoObj.getTotalDebts());

    }
    protected void btnChat_Click(object sender, EventArgs e)
    {
        users user = new users();
        user = (users)Session["login"];
        string name = user.name; 
        string message = btn_input.Text;
        string my = "<li><b>" +name +"</b>" + "::" + message+"</li>";

       Application["msg"] = Application["msg"] + my + Environment.NewLine;

        chatLabel.Text = Application["msg"].ToString();
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        Response.Redirect("#chat");
    }
}