using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI.HtmlControls;

/*
 * Site master. Contains menu, logo, etc...
 * 
 */
public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Nothing to load
    }

    /*
     * Triggered when the "Admin Tools" link is selected. Takes user to Admin Tools
     */ 
    protected void onAdminToolsSelected(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/admin/AdminTool.aspx");
    }
}
