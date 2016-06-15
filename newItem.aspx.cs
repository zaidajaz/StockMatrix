using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddnewGroup_Click(object sender, EventArgs e)
    {
        DatabaseFunctions groupobj = new DatabaseFunctions();
        groupobj.group_name = newGroupName.Text;
        groupobj.AddNewGroup();
        if (groupobj.status_msg != "Something Went Wrong!")
        {
            msgLabel.Text = "<label class='label label-success'>"+groupobj.status_msg+"</label>";
        }
        else
        {
            msgLabel.Text = "<label class='label label-danger'>" + groupobj.status_msg + "</label>";
        }
    }
    protected void btnAddNewItem_Click(object sender, EventArgs e)
    {
        DatabaseFunctions itemobj = new DatabaseFunctions();
        itemobj.group_id = Convert.ToInt32(listGroup.SelectedItem.Value);
        itemobj.unit_id = Convert.ToInt32(listUnits.SelectedItem.Value);
        itemobj.item_name = txtItemName.Text;
        itemobj.AddNewItem();
        if (itemobj.status_msg != "Something Went Wrong!")
        {
            msgLabel2.Text = "<label class='label label-success'>" + itemobj.status_msg + "</label>";
        }
        else
        {
            msgLabel2.Text = "<label class='label label-danger'>" + itemobj.status_msg + "</label>";
        }
    }
}