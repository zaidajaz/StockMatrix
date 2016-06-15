using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
          Response.Redirect("default.aspx");
        }
        if (Convert.ToInt32(Request.QueryString["logout"]) == 1)
        {
            if (Session["login"] != null)
            {
                Session["login"] = null;
                Response.Redirect("default.aspx");
            }
        }
    }
}
